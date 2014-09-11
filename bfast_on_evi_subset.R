library(raster)
library(bfast)

file_dir <- "/home/sami/MODIS_ARC/MODIS/MOD13Q1.Subsets/MOD13Q1-3.043-71.53"
file_name <- "MOD13Q1.asc"
evi_full <- raster(file.path(file_dir,file_name)) 
evi_full <- read.table((file.path(file_dir,file_name)))

"Input and subset raster"