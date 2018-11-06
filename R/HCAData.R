
#' @title Download data from the HCA via ExperimentHub
#'
#' @description Download HDF5 (dense assay) and RDS (row and column annotations)
#' files from the HCA via ExperimentHub, composing them together as a
#' SingleCellExperiment object
#'
#' @details This current release includes the following datasets:
#' \describe{
#'   \item{Census of Immune Cells - Umbilical cord blood}{UMI counts from the 10x
#'   (droplet) single-cell RNA-seq data. The object contains counts for 33694 genes
#'   in 384000 cells.}
#'   \item{Census of Immune Cells - Bone marrow}{UMI counts from the 10x
#'   (droplet) single-cell RNA-seq data. The object contains counts for 33694 genes
#'   in 378000 cells.}
#' }
#'
#' @param dataset A character string: which dataset should be retrieved?
#'
#' @return A SingleCellExperiment object with a HDF5Matrix in the \code{counts}
#' assay, containing the UMI counts for each gene in each cell. Row- and column-level
#' metadata are also provided.
#'
#' @importFrom utils read.csv
#' @importFrom ExperimentHub createHubAccessors ExperimentHub
#' @importFrom AnnotationHub query
#' @importFrom HDF5Array HDF5Array
#' @importFrom SingleCellExperiment SingleCellExperiment
#'
#' @export
#'
#' @examples
#' \dontrun{
#' sce_bonemarrow <- HCAData()
#' sce_cordblood <- HCAData("ica_cord_blood")
#' }
HCAData <- function(dataset =
                      c("ica_bone_marrow", "ica_cord_blood" )) {
  dataset <- match.arg(dataset)
  hub <- ExperimentHub()
  version <- "v1.0.0"
  base <- paste0("TENxPBMCData/", version, "/")

  ## row and column data
  rdatapath <- paste0(base, dataset, "_rowData.rds")
  rowData <- query(hub, rdatapath)[[1]]

  suppressMessages({
    rdatapath <- paste0(base, dataset, "_colData.rds")
    colData <- query(hub, rdatapath)[[1]]

    ## HDF5, from ExperimentHub:
    rdatapath <- paste0(base, dataset, "_rectangular.h5")
    h5file <- query(hub, rdatapath)[[1]]
  })
  h5array <- HDF5Array(h5file, "counts")

  SingleCellExperiment(
    list(counts = h5array), rowData = rowData, colData = colData
  )
}




.onLoad <- function(libname, pkgname) {
  fl <- system.file("extdata", "metadata.csv", package="HCAData")
  titles <- read.csv(fl, stringsAsFactors=FALSE)$Title
  # createHubAccessors(pkgname, titles)
}
