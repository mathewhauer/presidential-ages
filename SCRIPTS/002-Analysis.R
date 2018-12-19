#----PREAMBLE-----
startup = function(){
  
  rm(list=ls())
  
  gc(reset = TRUE) # Garbage Collection
  
  #################### R Workspace Options ####################
  options(scipen = 12) # Scientific Notation
  options(digits = 6) # Specify Digits
  options(java.parameters = "-Xmx1000m") # Increase Java Heap Size
  
  ######################################## Functions, Libraries, & Parallel Computing ########################################
  
  #################### Functions ####################
  
  ########## Install and/or Load Packages ##########
  packages <- function(x){
    
    x <- deparse(substitute(x))
    installed_packages <- as.character(installed.packages()[,1])
    
    if (length(intersect(x, installed_packages)) == 0){
      install.packages(pkgs = x, dependencies = TRUE, repos = "http://cran.r-project.org")
    }
    
    library(x, character.only = TRUE)
    rm(installed_packages) # Remove From Workspace
  }
  
  ########## Specify Number of Digits (Forward) ##########
  numb_digits_F <- function(x,y){
    numb_digits_F <- do.call("paste0", list(paste0(rep(0, y - nchar(x)), collapse = ""), x))
    numb_digits_F <- ifelse(nchar(x) < y, numb_digits_F, x)
  }
  
  ########## Remove Double Space ##########
  numb_spaces <- function(x) gsub("[[:space:]]{2,}", " ", x)
  
  #################### Libraries ####################
  packages(data.table) # Data Management/Manipulation
  packages(doParallel) # Parallel Computing
  packages(foreach) # Parallel Computing
  packages(openxlsx) # Microsoft Excel Files
  packages(plyr) # Data Management/Manipulation
  packages(readxl) # Microsoft Excel Files
  packages(reshape2) # Data Management/Manipulation
  packages(stringi) # Character/String Editor
  packages(stringr) # Character/String Editor
  packages(zoo) # Time Series
  
  packages(parallelsugar)
  packages(tidyverse)
  packages(scales)
  packages(directlabels)
  packages(data.table)
  packages(tools)
  packages(tidycensus)
  packages(censusapi)
  packages(rucm)
  packages(pbmcapply)
  packages(pbapply)
  packages(RCurl)
  packages(mipfp)
  packages(rucm)
  
  rm(packages)
  #library(tidyverse)
  #library(devtools)
  # install_github('nathanvan/parallelsugar')
  
  #start_time <-Sys.time()
  
  set.seed(100)
}
startup()
rm(list=ls())
#----SCRIPT START ----
