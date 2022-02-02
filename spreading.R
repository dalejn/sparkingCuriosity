library(ggraph)
library(gganimate)
library(igraph)
library(RColorBrewer)

# Data from http://konect.uni-koblenz.de/networks/sociopatterns-infectious
#infect <- read.table('/Users/dalezhou/Downloads/sociopatterns-infectious/out.sociopatterns-infectious', skip = 2, sep = ' ', stringsAsFactors = FALSE)

# Code from https://gist.github.com/thomasp85/eee48b065ff454e390e1
# https://gist.github.com/jalapic/612036977d9f9c773107681bc4a46d58

infect <- read.table('/home/jovyan/networkDynamics.txt', skip = 0, sep = ' ', stringsAsFactors = FALSE)
infect <- read.table('/home/jovyan/networkDynamicsLabels.txt', skip = 0, sep = ' ', stringsAsFactors = FALSE)
infect$V3 <- NULL 
#infect$words <- words$V2
names(infect) <- c('from', 'to', 'time')
infect$timebins <- as.numeric(cut(infect$time, breaks = 500))

# We want that nice fading effect so we need to add extra data for the trailing
infectAnim <- lapply(1:10, function(i) {infect$timebins  <- infect$timebins + i; infect$delay <- i; infect})
infect$delay <- 0
infectAnim <- rbind(infect, do.call(rbind, infectAnim))

infectGraph <- graph_from_data_frame(infectAnim, directed = F)

# We use only original data for the layout
subGr <- subgraph.edges(infectGraph, which(E(infectGraph)$delay == 0))
V(subGr)$degree <- degree(subGr)
V(subGr)$group <- cluster_louvain(subGr)$membership
lay <- createLayout(subGr, 'igraph', algorithm = 'fr')

# Then we reassign the full graph with edge trails
attr(lay, 'graph') <- infectGraph

# Now we create the graph with timebins as frame
p <- ggraph(data = lay, layout = 'fr', aes(frame = timebins)) + 
  geom_node_point(size = .1, col = "white") +
  geom_node_point(aes(alpha=0.6), size = .1, colour = factor(lay$group), show.legend = FALSE) + 
  # geom_edge_link0(aes(frame = timebins, alpha = delay, width = delay), edge_colour = '#dccf9f') + 
  geom_edge_link0(aes(frame = timebins, alpha = delay, width = delay, colour = factor(node1.group)), data = gEdges(nodePar = 'group'), show.legend = FALSE) +
  # geom_edge_link0(aes(frame = timebins, alpha = delay, width = delay, colour = node1.degree), data = gEdges(nodePar = 'degree'), show.legend = FALSE) +
  scale_edge_alpha(range = c(1, 0), guide = 'none') + 
  scale_edge_width(range = c(0.5, 1.5), trans = 'exp', guide = 'none') + 
  scale_size(guide = 'none') + 
  expand_limits(x = c(min(lay$x), max(lay$x)), y = c(min(lay$y), max(lay$y))) +
  ggforce::theme_no_axes() + 
  theme(plot.background = element_rect(fill = '#103fe8'), 
        panel.background = element_blank(), 
        panel.border = element_blank(), 
        plot.title = element_text(color = '#cecece'))

# And then we animate
animation::ani.options(interval=0.1)
# gganimate(p, '/Users/dalezhou/Desktop/Dropbox/service/kamenArt/animation_louvainNodes_coloredSparks_500.gif', title_frame = FALSE)
gganim <- gganimate(p, '/home/jovyan/sparkingCuriosity_1600x1600_darkBlue.gif', title_frame = FALSE,
         ani.width = 1600, ani.height = 1600, res=300)

# to do
# add changing text