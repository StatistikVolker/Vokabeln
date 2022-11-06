# 011_loadDTS.r


#----------------------------------------------------------------------------------------------------------------------------------------------------------
# Create a connection to DTS database, dtsdb.db
#host_db <- 'C:/Users/HolzendV/ownCloud/Shared/Smart City Projekt Jena/01 AG DigInfra und Datenpol/öff/WISSENsAllmende/Projektmanagement/UseCases/UC-07 JenOnLex/061_Daten_DtS/dtsdb.db' #i.e. # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'  
host_db <- 'Datenbank/Vokabeln.db' #i.e. # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'  
con <- dbConnect(RSQLite::SQLite(), host_db)

# List all the tables available in the database
#dbListTables(con)

#----------------------------------------------------------------------------------------------------------------------------------------------------------
# Lade Lemma Daten aus Datenbank
dbENGLISCH<-dbGetQuery(con, 'SELECT Distinct * FROM ENGLISCH')
#SRM_MUTTIS<-dbGetQuery(con, 'SELECT Distinct * FROM MUTTIS')
#SRM_MUTTIMETA<-dbGetQuery(con, 'SELECT Distinct SRM_NAME, NPLAETZE FROM MUTTIS')






#----------------------------------------------------------------------------------------------------------------------------------------------------------
# Schließe Verbindung
#close(con)
