context("sce objects are correct")

test_that("empty call", {
  library(HCAData)
  library(SingleCellExperiment)
  expect_message(HCAData())
})

test_that("wrong call to the dataset", {
  library(HCAData)
  library(SingleCellExperiment)
  expect_error(HCAData("cordblood"))
})

test_that("cord blood data is correct", {
  library(HCAData)
  library(SingleCellExperiment)
  sce_cordblood <- HCAData("ica_cord_blood")
  expect_is(sce_cordblood, "SingleCellExperiment")
  expect_equal(nrow(sce_cordblood), 33694)
  expect_equal(ncol(sce_cordblood), 384000)
  expect_equal(colnames(rowData(sce_cordblood)), c("ID", "Symbol"))
  expect_equal(assayNames(sce_cordblood), "counts")
  expect_equal(length(grep("^ERCC-", rownames(sce_cordblood))), 0)
})

test_that("bone marrow data is correct", {
  library(HCAData)
  library(SingleCellExperiment)
  sce_bonemarrow <- HCAData("ica_bone_marrow")
  expect_is(sce_bonemarrow, "SingleCellExperiment")
  expect_equal(nrow(sce_bonemarrow), 33694)
  expect_equal(ncol(sce_bonemarrow), 378000)
  expect_equal(colnames(rowData(sce_bonemarrow)), c("ID", "Symbol"))
  expect_equal(assayNames(sce_bonemarrow), "counts")
  expect_equal(length(grep("^ERCC-", rownames(sce_bonemarrow))), 0)
})
