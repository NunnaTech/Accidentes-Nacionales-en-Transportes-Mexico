# Set work directory on Windows
setwd("C://Accidentes-Nacionales-en-Transportes-Mexico")

# Set work directory on Linux
setwd("~//Accidentes-Nacionales-en-Transportes-Mexico")

dir()

## Libraries
install.packages("mice")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")
install.packages("paletteer")
install.packages("prismatic")
install.packages("factoextra")
install.packages("stringr")
install.packages("Rtools")
if (!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("diegovalle/mxmaps")
install.packages("compareDF")


library(mice)
library(readr)
library(dplyr)
library(ggplot2)
library(paletteer)
library(prismatic)
library(factoextra)
library(mxmaps)
library(compareDF)