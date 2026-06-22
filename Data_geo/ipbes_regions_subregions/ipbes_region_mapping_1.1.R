#####################
## IPBES regions and sub-regions
## ploting maps
## Technical Support Unit on Data
## DOI: 10.5281/zenodo.3923633
## Prepared by Joy Kumagai (joy.kumagai@senckenberg.de)
## Contact: Aidin Niamir (niamir@gmail.com)
#####################

rm(list=ls())
##### Load Packages ######
library(sf) #spatial 
library(graticule)

ipbes <- st_read("Results/IPBES_Regions_Subregions2.shp") # Shapefile produced from R code joining csv to gadm dataset
#### Mapping ####
# Projection 
crs_robin <-  "+proj=robin +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"
ipbes_robin <- st_transform(ipbes, crs_robin)


# add graticules
lat <- c(-90, -60, -30, 0, 30, 60, 90)
lon <- c(-180, -120, -60, 0, 60, 120, 180)
xl <- range(lon)
yl <- range(lat)
grat <- graticule(lon, lat, proj = crs_robin, xlim = xl, ylim = yl)
labs <- graticule_labels(lon, lat, xline = min(xl), yline = min(yl), proj = crs_robin)

# Regions Map 
palette_r <- c("#da511f","#669437", "grey", "#0c7573", "#891635") # colors
plot(grat, lty = 3, col = "grey", main = "\n \n \n \n IPBES Regions") # Plot graticules 
plot(ipbes_robin[,-c(1,2,3,5)], lwd = .5, pal = palette_r, add= TRUE) # Plot Countries
text(subset(labs, labs$islon), lab = parse(text = labs$lab[labs$islon]), pos = 1) # Degree labels 
text(subset(labs, !labs$islon), lab = parse(text = labs$lab[!labs$islon]), pos = 2) # Degree Labels 
legend("bottomleft", # legend
       legend = sort(as.character(unique(ipbes$Region))),
       title = "", 
       fill = c(palette_r),
       cex = 0.9,
       bty = "n")

# Sub Regions Map
palette_s <- c("grey49", "#5D3A9B", "#009e73", "#fae442", "#0072b2", "#E66100", "#D35FB7", "#e69d00", "#994F00", "#E1BE6A", "#56b4e9", "#4B0092", "#669437", "pink", "grey","#0c7573", "#891635", "aliceblue") 
plot(grat, lty = 3, col = "grey", main = "\n \n \n \n IPBES Sub-Regions")
plot(ipbes_robin[,-c(1,2,3,4)], lwd = .5, pal = palette_s, add=TRUE)
text(subset(labs, labs$islon), lab = parse(text = labs$lab[labs$islon]), pos = 1)
text(subset(labs, !labs$islon), lab = parse(text = labs$lab[!labs$islon]), pos = 2)
legend("bottom", 
       legend =  sort(as.character(unique(ipbes_robin$Sub_Region))),
       title = "",
       fill = palette_s,
       cex = 0.75,
       bty = "n",
       ncol = 4)

## The assignment of countries or areas to specific groupings is for statistical convenience and does not imply any assumption regarding political or other affiliation of countries or territories by the United Nations and IPBES. For more details please consult the United Nations publication "Standard Country or Area Codes for Statistical Use", commonly referred to as the M49 standard.https://unstats.un.org/unsd/methodology/m49/
#######################
#####################