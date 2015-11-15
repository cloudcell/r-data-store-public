
# Description: downloads & unzips the full dataset for demo 8
#              (luxor.8.walk.forward) of quantstrat
# Note: you may need to change 'luxor.getSymbols.R' to take
#       data from the folder /extdata_full/ instead of /extdata/
# Author: cloudcello
# Date: 2015-11-15


DATAURL <- "http://github.com/cloudcello/r-data-store-public/blob/master/data-luxor/GBPUSD_full.zip?raw=true"
datapath <- paste0(path.package("quantstrat"),"/extdata_full/GBPUSD")

# check if all data present (by checking the first & last files only)
if(
  file.exists(paste0(datapath,"/","2002.10.21.GBPUSD.rda")) &&
  file.exists(paste0(datapath,"/","2012.01.06.GBPUSD.rda"))
) {
  datamissing <- FALSE
} else {
  datamissing <- TRUE
}

if(datamissing){
  download.file(url=DATAURL,
                destfile = "GBPUSD_full.zip",
                mode="wb")
  #list files to be extracted
  # unzip(zipfile = "GBPUSD_full.zip", list=TRUE)
  if(!dir.exists(datapath)){
    dir.create(datapath, recursive = TRUE, mode = "0777")
  }
  # unzip
  unzip(zipfile = "GBPUSD_full.zip", exdir = datapath, junkpaths = TRUE)
}

