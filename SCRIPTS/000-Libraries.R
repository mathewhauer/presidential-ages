###------LIBRARY SETUP-----
## @knitr libraries

# This is a generic preamble that will load a bunch of packages that might or might not 
# be necessary to run these scripts.

rm(list = ls()) # Remove Previous Workspace
gc(reset = TRUE) # Garbage Collection

# Install and load pacman for easier package loading and installation
if (!require("pacman", character.only = TRUE)){
  install.packages("pacman", dep = TRUE)
  if (!require("pacman", character.only = TRUE))
    stop("Package not found")
}


# Libraries
pkgs <- c(
  "tidyverse",     # Tidyverse
  "data.table",    # Data Management/Manipulation
  "openxlsx",      # Microsoft Excel Files
  "stringi",       #Character/String Editor
  "stringr",       # Character/String Editor
  "reshape2",      # Data Management/Manipulation
  "scales",        # Number formatting
  "cowplot",       # Plot Grids
  "IDPmisc",       # Quality na.rm
  "ggrepel",       # Repel Labels
  "lemon"          # Axis manipulation
)

# Install missing packages
# Will only run if at least one package is missing

if(!sum(!p_isinstalled(pkgs))==0){
  p_install(
    package = pkgs[!p_isinstalled(pkgs)], 
    character.only = TRUE
  )
}

# load the packages
p_load(pkgs, character.only = TRUE)
rm(pkgs)
