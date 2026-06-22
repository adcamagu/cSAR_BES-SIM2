
EBV Data Portal Datasets (GLOBIO / BES-SIM2)
---------------------------------
This folder contains finalized EBV-Cube NetCDF datasets derived from GLOBIO (BES-SIM2) 
land-use and land-cover outputs and prepared for integration into the EBV Data Portal.


		Datasets 
---------------------------------

1) alkemade_ecostr_id98_20260223.nc
Dataset ID: 98 – Land Use Projections (GLOBIO BES-SIM2)

Global categorical land-use projections from BES-SIM2 (GLOBIO), derived from ESA-CCI 
land cover and processed through the IMAGE model and GLOBIO allocation module.
	- Spatial resolution: native GLOBIO resolution (original grid)
	- Temporal coverage: 2020, 2030, 2050, 2070
	- Scenarios: Nature for Nature, Nature as Culture, Nature for Society, SSP2-Baseline
	- Content: 12 terrestrial land-cover classes
	- EBV class: Ecosystem Structure

Each grid cell contains a single land-cover class value per time step and scenario.

2) alkemade_ecostr_id103_20260216.nc
Dataset ID: 103 – Upscaled Land Cover (0.5°)

Global upscaled version of the GLOBIO land-use projections aggregated to 0.5° spatial resolution.
	- Spatial resolution: 0.5° (~50 km at equator)
	- Temporal coverage: 2020, 2030, 2050, 2070
	- Scenarios: Nature for Nature, Nature as Culture, Nature for Society, SSP2-Baseline
	- Content: 12 terrestrial land-cover classes
	- Metric: percentage of grid cell occupied by each class
	- EBV class: Ecosystem Structure

Each 0.5° grid cell contains fractional land-cover proportions per class.

		Naming Convention
---------------------------------

EBV Data Cube format - naming convention:

    <first_author>_<ebv_class>_id<ID>_<YYYYMMDD>.nc
	
This ensures traceability, versioning, and compatibility with EBV Portal


Coordinate Reference System - CRS
---------------------------------
	- EPSG:4326 (WGS84)