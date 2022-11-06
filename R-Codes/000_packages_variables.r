# 000_packages_variables.r


# Pakete laden ------------------------------------------------------------

library(shiny)
library(shinyjs)
library(shinybusy)
library(tidyverse)
library(readxl)
library(readtext)
library(knitr)


mkr.formatnumeric <- function(val,digits=3){
  fval<-rep(NA,length(val))
  for(i in (1:length(val))){
    fval[i]<-formatC(val[i],digits=digits,format="f")
  }
  return(fval)
}


# Glaobale Variablen definieren -----------------------------------------


# Sort the input dataframe into random order (and add an "answered" flag)
vocdf <- read_excel("EnglischVokabelnacess1.xlsx") %>% 
  mutate(Random=runif(nrow(.)),
         CorrectlyAnswered=FALSE
         ) %>% 
      arrange(Random)
names(vocdf)
   
# Take a copy for delayed updates
analysed <- vocdf

