## Dog Control in Auckland

A project to analyse and visualise data on dogs in Auckland using data compiled by Auckland Council's Animal Management division.

### Data Sources

Data is drawn from:

1. [{akldogs}](https://tesaunders.github.io/akldogs/): An R package containing raw datasets relating to registrations, impounds, and requests for service obtained from Auckland Council's Animal Management division via an official information request.
2. Data compiled from summary statistics provided in Auckland Council's [Animal Management annual reports](https://www.aucklandcouncil.govt.nz/en/plans-policies-bylaws-reports-projects/our-policies/policy-on-dogs.html) which goes back further than the data in {akldogs}. This is within the `/data` folder, and prefixed with `am-reports`.
3. Territorial Authority Local Board shapefiles provided by [Stats NZ](https://datafinder.stats.govt.nz/layer/120947-territorial-authority-local-board-2025-clipped/). 
4. Auckland population data taken from the 2023 Census provided by [Stats NZ](https://figure.nz/chart/bSr6yQmn9V9BFrXK).

### Project Organisation

This project is set up as a Quarto manuscript with project settings defined in [quarto.yml](quarto.yml). Data cleaning and analysis happens within [notebooks/data-analysis.qmd](notebooks/data-analysis.qmd) while geospatial analyses happen in [notebooks/mapping.qmd](notebooks/mapping.qmd). The [R](R) directory contains [functions.R](R/functions.R) and [theme.R](R/theme.R), holding custom functions and theming information which is used by the notebooks. Outputs from the notebooks are embedded into the manuscript file [index.qmd](index.qmd). 