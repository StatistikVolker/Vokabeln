
# 000_packages_variables.r


# Pakete laden ------------------------------------------------------------

source("R-Codes/001_packages.r")
#verzeichnis <- "testdaten"  # Test lokal
# # Benutzerdefinierte Funktionen -----------------------------------------


mkr.formatnumeric <- function(val,digits=3){
  fval<-rep(NA,length(val))
  for(i in (seq_along(val))){
    fval[i]<-formatC(val[i],digits=digits,format="f")
  }
  return(fval)
}


get_lastmeld <- function() {
  result <- read_csv(lastmeldfile, col_types = coltslast)
  return(result)
}


