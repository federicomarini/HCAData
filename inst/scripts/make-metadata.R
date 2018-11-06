## validate with `ExperimentHubData::makeExperimentHubMetadata()`
## (above pkg directory)

df_hca_cordblood <- data.frame(
  Title = "HCAcordblood",
  Description = "10x data from the HCA project, Census of Immune Cells - Umbilical cord blood",
  BiocVersion = "3.9",
  Genome = "GRCh38",
  SourceType = "HDF5",
  SourceUrl = "https://s3.amazonaws.com/preview-ica-expression-data/ica_cord_blood_h5.h5",
  SourceVersion = "b5dd8ec9c9ff2d142986aaee014b9098",
  Species = "Homo sapiens",
  TaxonomyId = 9606,
  Coordinate_1_based = TRUE,
  DataProvider = "Human Cell Atlas",
  Maintainer = "Federico Marini <marinif@uni-mainz.de>",
  RDataClass = "SingleCellExperiment",
  DispatchClass = "Rds",
  RDataPath = "HCAData/sce_HCA_cordblood.rds",
  stringsAsFactors = FALSE
)

df_hca_bonemarrow <- data.frame(
  Title = "HCA_bonemarrow",
  Description = "10x data from the HCA project, Census of Immune Cells - Bone marrow",
  BiocVersion = "3.9",
  Genome = "GRCh38",
  SourceType = "HDF5",
  SourceUrl = "https://s3.amazonaws.com/preview-ica-expression-data/ica_bone_marrow_h5.h5",
  SourceVersion = "9d10973b7c178ee6886ae12d004d4d23",
  Species = "Homo sapiens",
  TaxonomyId = 9606,
  Coordinate_1_based = TRUE,
  DataProvider = "Human Cell Atlas",
  Maintainer = "Federico Marini <marinif@uni-mainz.de>",
  RDataClass = "SingleCellExperiment",
  DispatchClass = "Rds",
  RDataPath = "HCAData/sce_HCA_bonemarrow.rds",
  stringsAsFactors = FALSE
)

# when there's going to be many more, it might be practical to have it automated

## Combined meta-data
df_all <- do.call(rbind,lapply(ls(pattern = "^df_hca"),get))

## Save .csv file
write.csv(df_all, file = "../extdata/metadata.csv", row.names = FALSE)

