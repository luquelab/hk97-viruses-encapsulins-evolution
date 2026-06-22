#!/usr/bin/env Rscript

packages <- c(
  "shiny", "dplyr", "ggplot2", "mgcv", "scales", "hexbin",
  "tidyverse", "viridis", "plotly", "rlang", "rstatix", "FSA",
  "gridExtra"
)

missing <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]

if (length(missing) == 0) {
  message("All required R packages are installed.")
} else {
  message("Installing missing R packages: ", paste(missing, collapse = ", "))
  install.packages(missing, repos = "https://cloud.r-project.org")
}
