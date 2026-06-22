
EBV Data Portal Datasets (PLUM / BES-SIM2)
---------------------------------
This folder contains finalized EBV-Cube NetCDF datasets derived from PLUM (BES-SIM2) 
land-use outputs and prepared for integration into the EBV Data Portal.


		Datasets 
---------------------------------

1) alexander_ecostr_id99_20260217
Dataset ID: 99 – Land Use projections (BES-SIM 2 PLUM)

Global categorical land-use projections from BES-SIM2 (PLUM), based on the Nature Futures 
Framework scenarios and derived from the Parsimonious Land Use Model (PLUM).

	- Spatial resolution: native PLUM grid (0.5°)
	- Temporal coverage: 2020, 2030, 2040, 2050, 2060, 2070
	- Scenarios: NfN, NfNl, NaC, NfS, BAU
	- Content: 10 land-cover classes (HILDA+ classification)
	- EBV class: Ecosystem Structure

Each grid cell contains a single land-cover class value per time step and scenario.

2) alexander_ecostr_id100_20260204
Dataset ID: 100 – Forest management (BES-SIM 2 PLUM) - 0.5°

Global forest management projections from BES-SIM2 (PLUM), based on the Nature Futures Framework scenarios and generated with the Parsimonious Land Use Model (PLUM) 

	- Spatial resolution: 0.5° (native PLUM grid)
	- Temporal coverage: 2020, 2030, 2050, 2060, 2070
	- Scenarios: NfN, NfNl, NaC, NfS, BAU
	- Content:
		• Rotation intensity (harvest frequency)
		• Timber forest area (area managed for wood production)
		• Yield (annualised wood production) 
	- EBV class: Cross-cutting (driver of biodiversity change) 
	- Entities:
		• Forestry (protected)
		• Forestry (unprotected)


Methodological Note from Bart Arednarczyk 16.03.2026:
Forest Rotation is calculated endogenously by the model using cost optimization, which is using various inputs including timber costs and yeilds.
		
		

3) alexander_croscut_id101_20260202
Dataset ID: 101 – Crop intensity (BES-SIM 2 PLUM) - 0.5°

Global projections of crop areas and management intensities from BES-SIM2
(PLUM), based on the Nature Futures Framework scenarios.

- Spatial resolution: 0.5° (native PLUM grid)
- Temporal coverage: 2020, 2030, 2040, 2050, 2060, 2070
- Scenarios: NfN, NfNl, NaC, NfS, BAU
- EBV class: Cross-cutting (driver of biodiversity change)

Entity type:
    Crop type (crop groups) × farming type
    (conventional / restricted / agrivoltaics)



4)alexander_ecostr_id102_20260204
Dataset ID: 102 – Land cover areas (BES-SIM 2 PLUM)

Global projections of land-cover area per class from BES-SIM2 (PLUM),
based on the Nature Futures Framework scenarios.

    - Spatial resolution: 0.5° (native PLUM grid)
    - Temporal coverage: 2020, 2030, 2040, 2050, 2060, 2070
    - Scenarios: NfN, NfNl, NaC, NfS, BAU
    - EBV class: Ecosystem Structure

    - Content:
        • Proportion of land cover type per grid cell (e.g. NfN, NfNl, NaC, NfS, BAU) for a given scenario at a given year (e.g. 2020, 2030, 2050, 2070)

    - Land cover classes:
        Cropland
        Pasture
        TimberForest
        CarbonForest
        UnmanagedForest
        OtherNatural
        Agrivoltaics
        Photovoltaics
        Barren
        Urban


		Naming Convention
---------------------------------

EBV Data Cube format - naming convention:

    <first_author>_<ebv_class>_id<ID>_<YYYYMMDD>.nc
	
This ensures traceability, versioning, and compatibility with EBV Portal


Coordinate Reference System - CRS
---------------------------------
	- EPSG:4326 (WGS84)