# set default repo
options(repos=structure(c(CRAN="https://cloud.r-project.org/")))

# create local user library path (not present by default)
# see https://stackoverflow.com/a/43283085
dir.create(path = Sys.getenv("R_LIBS_USER"), showWarnings = FALSE, recursive = TRUE)

# update everything and install to local user library path
update.packages(ask = FALSE, instlib = Sys.getenv("R_LIBS_USER"))

install.packages('/home/jovyan/gganimate-0.1.1.tar.gz', repos = NULL, type = "source")
install.packages('/home/jovyan/ggraph-d15fd149babe9ad32316474b9a178e019f376ba6.zip', repos = NULL, type = "source")
install.packages(c('RColorBrewer', 'igraph', 'ggplot2'))

#install.packages('stats')
#install.packages('graphics')
#install.packages('grDevices')
#install.packages('utils')
#install.packages('datasets')
#install.packages('methods')
#install.packages('base')