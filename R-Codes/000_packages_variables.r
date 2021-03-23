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

vocdf <- read_excel("EnglischVokabelnacess1.xlsx")
names(vocdf)

#seldf <- vocdf %>% filter(Unit == "Unit2") %>% mutate(select = 0)
#testdf <- sample_n(seldf,1) %>% mutate(select = 1)

#seldf <- seldf %>% filter(!deutsch %in% testdf$deutsch)
