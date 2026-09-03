# cSAR for BES-SIM 2 - modelling biodiversity change under the Nature Futures Scenarios

## Author:

Andrés Mármol Guijarro, Emmanuel Oceguera & Henrique Pereira. 
Author list is not definitive yet, and inclusions may occur over the development of the repository.

## Description
This repository containg data and code fore the modelling of land-use impacts on biodiversity for the BES-SIM2 project, using the cSAR-iDiv model to estimate relative change in Species Richness (SS) change under different NFF land-use scenarios (GLOBIO, PLUM and MAgPIE), compared across and IPBES region/subregion classifications.


## Version history

Version 1.0. 18.06.2026. Repository creation.

Version 1.1. 03.09.2026. Repository curation: Reorganization of folders, addition of readme files and update of notebook analyses.

## Repository structure

```
cSAR_BES-SIM_2/
├── analyses/                                 modeling pipeline: numbered .Rmd scripts
├── BES_results/
│   └── results_biodiversity/
│       └── cSAR_iDiv/                        interpretation csv/xlsx outputs
├── config/                                    category mapping
├── Cube checks/                               QA scripts for the land-use data cubes
└── Data_geo/
    ├── affinities/                            species/functional-group affinity data
    └── land_use/
        ├── GLOBIO/
        │   └── cubes/                         GLOBIO land-use data cubes
        └── PLUM/
            ├── code/                          PLUM/ extraction & coarsening scripts
            └── cubes/                         PLUM/ land-use data cubes
```

NOTE: Large or regenerable files (`.nc` data cubes, `.shp` shapefiles, rendered `.html` notebook
outputs, preprocessed rasters, scratch caches) are excluded from version control — see
[Data availability](#data-availability).

## Pipeline order

1. `01_estimating_LU_change.Rmd` — estimate land-use change from the input cubes
2. `02_exploratory_code_h_sigma.Rmd` — exploratory analysis of the h/sigma parameters
3. `03_Delta_species_richness_local_plot.Rmd` — local species-richness change plots
4. `04_land_use_changes_agnostic.Rmd` — land-use change analyses, config-driven across land-use datasets (GLOBIO EBV cubes, PLUM/HILDA+-harmonised GeoTIFFs)
5. `05_land_use_Biodiv_plots.Rmd` — biodiversity outcome plots
6. `06_rdelta_comparison_GLOBIO.Rmd` — comparison of results deltas across GLOBIO scenarios

## Requirements

```
R-packages:
        terra            sf     tidyterra     tidyverse       ebvcube     graticule rnaturalearth       ggplot2       stringr 
      "1.9.1"       "1.1.0"       "1.0.0"       "2.0.0"       "0.5.2"       "0.4.0"       "1.2.0"       "4.0.2"       "1.6.0" 
R-version:
[1] "R version 4.4.3 (2025-02-28)"
```

This repository uses [`renv`](https://rstudio.github.io/renv/) to pin exact package versions. After cloning, run:

```r
install.packages("renv")  # if not already installed
renv::restore()
```

to install the exact versions recorded in `renv.lock`.

## Data availability

Raw and intermediate geospatial data (land-use cubes, shapefiles) and rendered notebook outputs are not tracked in this repository due to size. Dataset availability is documented in the [BES-SIM2 repository](https://github.com/adcamagu/BES-SIM2). In the future they will be publicly accessible through the [GEO BON EBV Data Portal](https://portal.geobon.org/).

## License

cSAR-BES-SIM2
Copyright (C) 2026 BES-SIM2 project

This program is free software: you can redistribute it and/or modify
it under the terms of the [GNUv3.0](https://choosealicense.com/licenses/gpl-3.0/) General Public License as published by
the Free Software Foundation.

Data and results in this repository (excluding source code, which is
licensed separately — see LICENSE) are licensed under the Creative
Commons Attribution 4.0 International License ([CC BY 4.0](http://creativecommons.org/licenses/by/4.0/legalcode)).

Copyright (C) 2026 BES-SIM2 project

You are free to share and adapt this material for any purpose, even
commercially, as long as you give appropriate credit, provide a link
to the license, and indicate if changes were made.

All project data is hosted at iDiv and it is mirrored through NextCloud. NOTE: Continuous password update are needed when working teams are no longer part of BES-SIM 2 (email from Christopher Zimmerman via it-support@idiv.deon the 23.01.2026 to Andres Mármol).
