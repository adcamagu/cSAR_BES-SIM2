#####################
## IPBES regions and sub-regions
## csv to shapefile
## Technical Support Unit on Data
## DOI: 10.5281/zenodo.3923633
## Prepared by Joy Kumagai (joy.kumagai@senckenberg.de)
## Contact: Aidin Niamir (niamir@gmail.com)
#####################

rm(list=ls())
##### Load Packages ######
library(sf) #spatial 
library(tidyverse)
library(graticule)
#### Load and Clean Data ####
gadm <- st_read("Data_Original/gadm36_0.shp") # Load Country Data (https://gadm.org/) - version 3.6
data <- read.csv("Results/ipbes_regions_subregions.csv") # Load IPBES Regions / Sub-regions dataset 

# We separate Hawaii from the USA as Hawaii is considered Pacific and not within the Americas. 
# Therefore this data is added separately 

gadm_USA <- st_read("Data_Original/gadm36_1.shp") %>% 
  filter(GID_0 == "USA", NAME_1 != "Hawaii") %>% 
  group_by(GID_0, NAME_0) %>% 
  summarise(geometry = st_union(geometry)) %>% # dissolving the features to by country 
  ungroup() 

gadm_Hawaii <- st_read("Data_Original/gadm36_1.shp") %>% 
  filter(NAME_1 == "Hawaii") # adding Hawaii separately

# We separate Navassa island from the United States Minor Outlying Islands as it is within the Caribbean and not the  Pacific.
gadm_UMI <- st_read("Data_Original/gadm36_1.shp") %>% 
  filter(GID_0 == "UMI", NAME_1 != "Navassa") %>% 
  group_by(GID_0, NAME_0) %>% 
  summarise(geometry = st_union(geometry)) %>% # dissolving the features to by country 
  ungroup() 

gadm_Navassa <- st_read("Data_Original/gadm36_1.shp") %>% 
  filter(NAME_1 == "Navassa")
# Add USA (without Hawaii) back to the gadm dataset
gadm <- rbind(gadm[-c(233,235),], gadm_USA, gadm_UMI)

gadm <- gadm %>% 
  filter(NAME_0 != "Caspian Sea") %>% # removes caspain sea as it is not land
  select(GID_0)

gadm$GID_0 <- as.character(gadm$GID_0)
data$GID_0 <- as.character(data$GID_0)

ipbes <- full_join(gadm, data, by = c("GID_0" = "GID_0")) 
ipbes[257,] <- ipbes[257, ] %>% st_set_geometry(gadm_Hawaii$geometry) # Adding Hawaii geometry to Hawaii 
ipbes[256,] <- ipbes[256, ]%>% st_set_geometry(gadm_Navassa$geometry) # Adding Navassa
ipbes <- ipbes %>% rename("Area" = "Country.Area", "ISO_3" = "ISO_3166_alpha_3")
st_write(ipbes, "Results/IPBES_Regions_Subregions2.shp")

## The assignment of countries or areas to specific groupings is for statistical convenience and does not imply any assumption regarding political or other affiliation of countries or territories by the United Nations and IPBES. For more details please consult the  United Nations publication "Standard Country or Area Codes for Statistical Use", commonly referred to as the M49 standard. https://unstats.un.org/unsd/methodology/m49/
#####################
#####################