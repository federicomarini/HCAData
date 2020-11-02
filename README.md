<!-- badges: start -->

[![R build
status](https://github.com/federicomarini/HCAData/workflows/R-CMD-check/badge.svg)](https://github.com/federicomarini/HCAData/actions)
<!-- badges: end -->

HCAData
=======

Available at <http://bioconductor.org/packages/HCAData/>.

This is an
R/[ExperimentHub](https://bioconductor.org/packages/release/bioc/html/ExperimentHub.html)
package for accessing data from the [Human Cell
Atlas](https://www.humancellatlas.org) as
[`SingleCellExperiment`](https://bioconductor.org/packages/release/bioc/html/SingleCellExperiment.html)
objects.

The datasets can otherwise be downloaded from the [Human Cell Atlas Data
Portal](https://preview.data.humancellatlas.org), where they are
available to the research community, either in raw format (with scripts
to download the primary data), or in hdf5-based format (for the sets
generated via the 10x method).

If you use the data, please refer to the original sources as well (plus
the related publications, which will be listed here when they will be
out), which are licensed under a Creative Commons Attribution 4.0
International License.

Some additional information
---------------------------

-   The
    [`cellranger`](https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger)-processed
    data files and metadata were downloaded from the links provided in
    [the Data Portal](https://preview.data.humancellatlas.org) on
    November 5, 2018

-   This current release includes the following datasets:

| dataset.ID             | subset               | species      | technology | cell.number | description                                                                                 |
|:-----------------------|:---------------------|:-------------|:-----------|------------:|:--------------------------------------------------------------------------------------------|
| Census of Immune Cells | Umbilical cord blood | Homo sapiens | 10x        |      384000 | Profiling of immunocytes by single cell RNA-seq for understanding human health and disease. |
| Census of Immune Cells | Bone marrow          | Homo sapiens | 10x        |      378000 | Profiling of immunocytes by single cell RNA-seq for understanding human health and disease. |

-   Since the hdf5 files are derived from the cellranger pipeline, some
    information on their specific format can be found
    [here](https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/advanced/h5_matrices)

Some new dataset has been released but it is not in this package!
-----------------------------------------------------------------

In this case, feel free to contact the author(s) of this package, and/or
to provide a complete pull request with the recipe to add the missing
dataset.

To get initial guidance for this, please refer to the excellent
vignettes of the
[ExperimentHub](https://bioconductor.org/packages/release/bioc/html/ExperimentHub.html)
package.
