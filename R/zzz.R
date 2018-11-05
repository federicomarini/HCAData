#' @importFrom utils read.csv
#' @importFrom ExperimentHub createHubAccessors
.onLoad <- function(libname, pkgname) {
  fl <- system.file("extdata", "metadata.csv", package="HCAData")
  titles <- read.csv(fl, stringsAsFactors=FALSE)$Title
  createHubAccessors(pkgname, titles)
}
