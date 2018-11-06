## validate with `ExperimentHubData::makeExperimentHubMetadata()`
## (above pkg directory)

df_hca_cordblood <- data.frame(
  Title = "HCAcordblood",
  Description = "10x data from the HCA project, Census of Immune Cells - Umbilical cord blood",
  BiocVersion = "3.9",
  Genome = "GRCh38",
  SourceType = "hdf5",
  SourceUrl = "https://s3.amazonaws.com/preview-ica-expression-data/ica_cord_blood_h5.h5",
  SourceVersion = NA,
  Species = "Homo sapiens",
  TaxonomyId = 9606,
  Coordinate_1_based = NA,
  DataProvider = "Human Cell Atlas",
  Maintainer = "Federico Marini <marinif@uni-mainz.de>",
  RDataClass = "SingleCellExperiment",
  DispatchClass = "Rds",
  RDataPath = "HCAData/.rds",
  stringsAsFactors = FALSE
)

df_hca_bonemarrow <- data.frame(
  Title = "HCA_bonemarrow",
  Description = "10x data from the HCA project, Census of Immune Cells - Bone marrow",
  BiocVersion = "3.9",
  Genome = "GRCh38",
  SourceType = "hdf5",
  SourceUrl = "https://s3.amazonaws.com/preview-ica-expression-data/ica_bone_marrow_h5.h5",
  SourceVersion = NA,
  Species = "Homo sapiens",
  TaxonomyId = 9606,
  Coordinate_1_based = NA,
  DataProvider = "Human Cell Atlas",
  Maintainer = "Federico Marini <marinif@uni-mainz.de>",
  RDataClass = "SingleCellExperiment",
  DispatchClass = "Rds",
  RDataPath = "HCAData/.rds",
  stringsAsFactors = FALSE
)

# when there's going to be many more, it might be practical to have it automated

## Combined meta-data
df_all <- do.call(rbind,lapply(ls(pattern = "^df_hca"),get))

## Save .csv file
write.csv(df_all, file = "../extdata/metadata.csv", row.names = FALSE)

