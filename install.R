# set default repo
options(repos=structure(c(CRAN="https://cloud.r-project.org/")))

# create local user library path (not present by default)
# see https://stackoverflow.com/a/43283085
dir.create(path = Sys.getenv("R_LIBS_USER"), showWarnings = FALSE, recursive = TRUE)

# update everything and install to local user library path
update.packages(ask = FALSE, instlib = Sys.getenv("R_LIBS_USER"))

#install.packages('/home/jovyan/gganimate-0.1.1.tar.gz', repos = NULL, type = "source")
#install.packages('/home/jovyan/ggraph-d15fd149babe9ad32316474b9a178e019f376ba6.zip', repos = NULL, type = "source")
install.packages(c('RColorBrewer', 'igraph', 'ggplot2', 'devtools', 'magick', 'ellipsis', 'vctrs'))

devtools::install_local('/home/jovyan/gganimate-0.1.1.tar.gz')
devtools::install_local('/home/jovyan/ggraph-d15fd149babe9ad32316474b9a178e019f376ba6.zip')

#curl, magrittr, Rcpp, digest, utf8, glue, vctrs, rlang, pillar, lifecycle, fansi, ellipsis, crayon, cli, colorspace, viridisLite, R6, labeling, farver, ps, processx, callr, rstudioapi, rprojroot, pkgbuild, desc, withr, pkgload, testthat, tibble, isoband, htmltools, ggplot2
#assertthat, backports, magick, animation, plyr
#colorspace, Rcpp, rlang, magrittr, farver, ps, processx, callr, rstudioapi, rprojroot, pkgbuild, desc, pkgload, utf8, vctrs, pillar, fansi, ellipsis, crayon, cli, viridisLite, R6, lifecycle, labeling, testthat, withr, tibble, isoband, glue, digest, ggplot2, igraph
#RcppEigen, tidyselect, polyclip, tweenr, generics, ggforce, dplyr

#install.packages('stats')
#install.packages('graphics')
#install.packages('grDevices')
#install.packages('utils')
#install.packages('datasets')
#install.packages('methods')
#install.packages('base')