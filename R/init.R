#

# initialisation ----
training_dir <- "training_set/_train/_train_classif8/"
fs::dir_exists(training_dir)


# Functions -----
plot_vignettes <- function(paths, group = NULL, nx = 3, ny = 3, main = NULL, seed = 43, ...) {

  if(!is.null(group)) {
    #paths <- grep(pattern = group,x = paths, value = TRUE)
    paths <- stringr::str_subset(string = paths, pattern = group)
  }
  vigs_max <- length(paths)

  if(vigs_max < (nx*ny)) {
    stop("The number of images is too low")
  }

  set.seed(seed)
  vigs <- sample(paths, size = (nx*ny), replace = FALSE)

  zooimage::zidbPlotNew(main = main)
  for (i in 1:(nx*ny))
    zooimage::zidbDrawVignette(vigs[i], item = i, nx = nx, ny = ny,...)
}
