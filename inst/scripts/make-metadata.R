## validate with `ExperimentHubData::makeExperimentHubMetadata()`
## (above pkg directory)

df_HCA_cordblood <- data.frame(
  Title = rep("Human Cell Atlas - Census of Immune Cells, Umbilical cord blood", 3),
  Description = rep("Census of Immune Cells, Umbilical cord blood - 10x data from the Human Cell Atlas project, profiling of immunocytes by single cell RNA-seq for understanding human health and disease. Represented as HDF5 count matrix and serialized rowData and colData objects, derived from the raw counts matrix on https://preview.data.humancellatlas.org", 3),
  BiocVersion = rep("3.9", 3),
  Genome = rep("GRCh38", 3),
  SourceType = rep("HDF5", 3),
  SourceUrl = rep("https://s3.amazonaws.com/preview-ica-expression-data/ica_cord_blood_h5.h5", 3),
  SourceVersion = rep("b5dd8ec9c9ff2d142986aaee014b9098", 3),
  Species = rep("Homo sapiens", 3),
  TaxonomyId = rep(9606, 3),
  Coordinate_1_based = rep(TRUE, 3),
  DataProvider = rep("Human Cell Atlas", 3),
  Maintainer = rep("Federico Marini <marinif@uni-mainz.de>", 3),
  RDataClass = rep("character", 3),
  DispatchClass = c("H5File","Rds","Rds"),
  RDataPath = paste0("HCAData/ica_cord_blood",c("_rectangular.h5", "_colData.rds", "_rowData.rds")),
  stringsAsFactors = FALSE
)

df_HCA_bonemarrow <- data.frame(
  Title = rep("Human Cell Atlas - Census of Immune Cells, Bone marrow", 3),
  Description = rep(" Census of Immune Cells, Bone marrow - 10x data from the Human Cell Atlas project, profiling of immunocytes by single cell RNA-seq for understanding human health and disease.. Represented as HDF5 count matrix and serialized rowData and colData objects, derived from the raw counts matrix on https://preview.data.humancellatlas.org", 3),
  BiocVersion = rep("3.9", 3),
  Genome = rep("GRCh38", 3),
  SourceType = rep("HDF5", 3),
  SourceUrl = rep("https://s3.amazonaws.com/preview-ica-expression-data/ica_bone_marrow_h5.h5", 3),
  SourceVersion = rep("9d10973b7c178ee6886ae12d004d4d23", 3),
  Species = rep("Homo sapiens", 3),
  TaxonomyId = rep(9606, 3),
  Coordinate_1_based = rep(TRUE, 3),
  DataProvider = rep("Human Cell Atlas", 3),
  Maintainer = rep("Federico Marini <marinif@uni-mainz.de>", 3),
  RDataClass = rep("character", 3),
  DispatchClass = c("H5File","Rds","Rds"),
  RDataPath = paste0("HCAData/ica_bone_marrow",c("_rectangular.h5", "_colData.rds", "_rowData.rds")),
  stringsAsFactors = FALSE
)

# when there's going to be many more, it might be practical to have it automated

## Combined meta-data
df_all <- do.call(rbind,lapply(ls(pattern = "^df_HCA"),get))

## Save .csv file
write.csv(df_all, file = "../extdata/metadata.csv", row.names = FALSE)

