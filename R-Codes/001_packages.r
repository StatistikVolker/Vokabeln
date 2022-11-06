# 001_packages.r

## Daten einlesen
#if(!require(readtext)){
#  install.packages("readtext", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(readtext)
#}
#if(!require(readr)){
#  install.packages("readr", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(readr)
#}
#if(!require(readODS)){
#  install.packages('readODS', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(readODS)
#}
#if(!require(readxl)){
#  install.packages('readxl', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(readxl)
#}
#if(!require(rio)){ # Um alle Worksheets at once auszulesen
#  install.packages('rio', dependencies = TRUE)#, repos = "http://cran.us.r-project.org")
#  library(rio)
#}
#if(!require(hms)){  ## um durch EXCEL in POSIXct Elemente im Time elemente umzuwandeln
#  install.packages('hms', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(hms)
#}

# Verbindung zur Datenbank
# Datenbank anbindung
if(!require(RSQLite)){
  install.packages("RSQLite", dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(RSQLite)
}
if(!require(ids)){
  install.packages("ids", dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(ids)
}
#if(!require(odbc)){
#  install.packages("odbc", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(odbc)
#}
#if(!require(DBI)){
#  install.packages("DBI", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(DBI)
#}



# Datenmanipulation
if(!require(tidyverse)){
  install.packages("tidyverse", dependencies = TRUE,repos = "http://cran.us.r-project.org")
  library(tidyverse)
}
if(!require(stringr)){
  install.packages('stringr', dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(stringr)
}
if(!require(lubridate)){
  install.packages('lubridate', dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(lubridate)
}
#if(!require(htm2txt)){
#  install.packages('htm2txt', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(htm2txt)
#}


## fehlt angeblich
#if(!require(ISOweek)){
#  install.packages('ISOweek', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(ISOweek)
#}
#if(!require(zoo)){
#  install.packages('zoo', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(zoo) # um NA mit Wert aus vorheriger zeile zu überschreiebn
#}
#if(!require(runner)){
#  install.packages('runner', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(runner) # Running Operations for Vectors
#}


# Datenchecks
#if(!require(naniar)){
#  install.packages('naniar', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(naniar)
#}
#if(!require(Rdatacheck)){
#  install.packages('Rdatacheck', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(Rdatacheck)
#}

# Shinykomponenten
if(!require(shinybusy)){
  install.packages("shinybusy", dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(shinybusy)
}
if(!require(knitr)){
  install.packages("knitr", dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(knitr)
}
if(!require(rmarkdown)){
  install.packages('rmarkdown', dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(rmarkdown)
}
if(!require(flexdashboard)){
  install.packages('flexdashboard', dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(flexdashboard)
}

# Tabellen
if(!require(reactable)){
  install.packages('reactable', dependencies = TRUE, repos = "http://cran.us.r-project.org")
  library(reactable) # Heatmap style Tables
}
#if(!require(ztable)){
#  install.packages('ztable', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(ztable)
#}


# Grafiken
#if(!require(plotly)){
#  install.packages('plotly', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(plotly)
#}
#if(!require(scales)){
#  install.packages('scales', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(scales)
#}
#if(!require(grDevices)){
#  install.packages('grDevices', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(grDevices) # RGB Farben definition
#}

# Sonstiges
#if(!require(installr)){
#  install.packages('installr', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(installr) # Using R to Install Stuff on Windows OS (Such As: R, 'Rtools', 'RStudio', 'Git', and More!)
#}

#  install.packages('rio', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(rio) # Using R to Install Stuff on Windows OS (Such As: R, 'Rtools', 'RStudio', 'Git', and More!)
#}
#if(!require(rio)){
#  install.packages('rio', dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(rio) # Using R to Install Stuff on Windows OS (Such As: R, 'Rtools', 'RStudio', 'Git', and More!)
#}


## Dialogbox für Passwortabfrage
#if(!require(rstudioapi)){
#  install.packages("rstudioapi", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#  library(rstudioapi)
#}
