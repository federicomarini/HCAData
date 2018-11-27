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
#' @export
#'
#' @examples
#' HCAData()
#' sce_cordblood <- HCAData("ica_cord_blood")
HCAData <- function(dataset = NULL) {
  available_datasets <- c("ica_bone_marrow", "ica_cord_blood")
  if(!is.null(dataset)) {
    if(!(dataset %in% available_datasets)) {
      stop("No dataset found with the specified name, please choose one of the following: \n",
           paste(available_datasets,collapse = "\n"))
    }
  } else {
    message("No dataset name provided, please choose one of the following: \n",
            paste(available_datasets,collapse = "\n"))
    return(invisible(NULL))
  }

  message("Retrieving Human Cell Atlas dataset: ", dataset)
  hub <- ExperimentHub::ExperimentHub()
  base <- "HCAData/"

  ## row and column data
  rdatapath <- paste0(base, dataset, "_rowData.rds")
  rowData <- query(hub, rdatapath)[[1]]

  suppressMessages({
    cdatapath <- paste0(base, dataset, "_colData.rds")
    colData <- query(hub, cdatapath)[[1]]

    ## HDF5, from ExperimentHub:
    h5datapath <- paste0(base, dataset, "_rectangular.h5")
    h5file <- query(hub, h5datapath)[[1]]
  })
  h5array <- HDF5Array(h5file, "counts")

  sce <- SingleCellExperiment(
    list(counts = h5array),
    rowData = rowData,
    colData = colData
  )
  rownames(sce) <- rowData(sce)$ID
  colnames(sce) <- colData(sce)$Barcode
  return(sce)
}
