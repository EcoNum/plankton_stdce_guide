# Génération des dossiers du training set
SciViews::R

tr <- read(here::here("data", "mesoplankton.csv"))

# Génération des dossiers et des sous dossiers --------------------------------

#tr %>.%
# stringr::str_c(.$N1, .$N2, .$N3, .$N4, .$N5, .$N6, sep = "/")
## str_c() n'est pas tout à fait l'équivalent de paste()
tr %>.%
  paste(.$N1, .$N2, .$N3, .$N4, .$N5, .$N6, sep = "/") %>.%
  stringr::str_remove_all(., "/NA") -> tr_dir

fs::dir_create(paste0(training_dir, tr_dir), recurse = TRUE)
