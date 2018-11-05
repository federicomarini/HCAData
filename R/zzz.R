#' @importFrom utils read.csv
#' @importFrom ExperimentHub createHubAccessors ExperimentHub
#' @importFrom AnnotationHub query
#' @importFrom HDF5Array HDF5Array
#' @importFrom SingleCellExperiment SingleCellExperiment
.onLoad <- function(libname, pkgname) {
  fl <- system.file("extdata", "metadata.csv", package="HCAData")
  titles <- read.csv(fl, stringsAsFactors=FALSE)$Title
  createHubAccessors(pkgname, titles)
}
