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


mkr.convtxt <- function(txt){
  #txt <- htmltxt
  convtxt <- str_replace_all(txt,"<br>","\n")
  convtxt <- str_replace_all(convtxt,"<p>","")
  convtxt <- str_replace_all(convtxt,"</p>","")
  return(convtxt)
}

mkr.convhtml <- function(txt,extend = TRUE){
  #txt <- htmltxt
  convtxt <- str_replace_all(txt,"\n","<br>")
  if (extend == FALSE){
    convtxt <- str_replace_all(convtxt,"\t\t","</p>")
    convtxt <- str_replace_all(convtxt,"\t","<p>")
  }
  if (extend == TRUE){
    convtxt <- paste0("<p>",convtxt,"</p>")
  }
  return(convtxt)
}





# immer Donnerstag
mkr.nextweekday <- function(date, wday = 5) {
     date <- as.Date(date)
     diff <- wday - wday(date)
     if( diff < 0 )
          diff <- diff + 7
     return(date + diff)
}



# KINDER FÄHRT MIT
mkr.KFM <- function(kind,data){
     
     #data = K_Emma
     
     KFMidx = FALSE
     
     if (dim(data)[1] == 0) {
          KFMstr = "nein"
     }
     else {
          KFMstr = data[kind]
     }
     
     if (KFMstr == "ja") {KFMidx = TRUE}
     return(KFMidx)
}

# KIND FÄHRT MIT Datenbank Eintrag
mkr.KFMdb <- function(checkbox){
     if (checkbox == TRUE){
          KFMdb <- 'ja'
     } else {
          KFMdb <- 'nein'
     }
     return(KFMdb)
}



# MUTTER FÄHRT KINDER
mkr.MFK <- function(data){
     
     #data = K_Emma
     
     MFKidx = FALSE
     
     if (dim(data)[1] == 0) {
          MFKstr = "Nein"
     }
     else {
          MFKstr = data$FAHRERIN
     }
     
     if (MFKstr == "ja") {MFKidx = TRUE}
     return(MFKidx)
}

# MUTTER hat PLTZE
mkr.NPLTZ <- function(mutti,data,fahrerin){
     if (fahrerin == TRUE) {
          NPLTZ <- pull(data %>% filter(SRM_NAME == mutti) %>% select(NPLAETZE))
     } else {
          NPLTZ <- 0
          }
     
     return(NPLTZ)
     
}

# MUTTER Fährt Kinder Datenbank

mkr.MFKdb<- function(mutti,zusatz,datum){
     if (is.null(zusatz)) {
          NPLTZ <- mkr.NPLTZ(mutti,SRM_MUTTIMETA,TRUE)
          } else {
               NPLTZ <- zusatz
               }
     update <- as.character()
     # [1] "SRM_NAME" 
     #print(mutti)
     update[1] <- mutti
     # [2] "NPLAETZE"        
     #print(NPLTZ)
     update[2] <- NPLTZ
     # # [3] "FAHRERIN"
     update[3] <- 'ja'
     # [4] "DATUM"
     update[4] <- datum
     # schreibe in Datenbank
     #print(update)
     dbExecute(con, "INSERT OR REPLACE INTO MUTTIS VALUES (?,?,?,?)", params = update)
     
     #return(update)
     
}


# add string
mkr.addstring <- function(string,geklickt,name){
#     string <- str_Kinder
 #    geklickt = input$cb_kilian
  #   name <- "Kilian"

if (geklickt == TRUE & string == "") {
     string <- name
     } else {
          if (geklickt == TRUE & string != "") {
               string <- paste0(string,", ",name)
          }
          }
return(string)
}
