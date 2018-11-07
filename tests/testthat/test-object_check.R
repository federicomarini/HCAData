context("test-object_check")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


# context("sce objects are correct")
#
# test_that("cord blood data is correct", {
#   sce_cordblood <- HCAData("ica_cord_blood")
#   expect_is(sce_cordblood, "SingleCellExperiment")
#   expect_equal(nrow(sce_cordblood), 33694)
#   expect_equal(ncol(sce_cordblood), 384000)
#   expect_equal(colnames(rowData(sce_cordblood)), c("ID", "Symbol"))
#   expect_equal(assayNames(sce_cordblood), "counts")
#   expect_equal(length(grep("^ERCC-", rownames(sce_cordblood))), 0)
# })
#
# test_that("bone marrow data is correct", {
#   sce_bonemarrow <- HCAData("ica_bone_marrow")
#   expect_is(sce_bonemarrow, "SingleCellExperiment")
#   expect_equal(nrow(sce_bonemarrow), 33694)
#   expect_equal(ncol(sce_bonemarrow), 378000)
#   expect_equal(colnames(rowData(sce_bonemarrow)), c("ID", "Symbol"))
#   expect_equal(assayNames(sce_bonemarrow), "counts")
#   expect_equal(length(grep("^ERCC-", rownames(sce_bonemarrow))), 0)
# })
