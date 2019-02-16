# paackage loading
  library(dplyr)
  library(lubridate)
  library(SqlRender)
  library(DatabaseConnector)
  
  dataFolder<-  ""  ##"<set your data folder where your NEDIS file exists >"
  scriptFolder <- "" ##"<set your script folder for ETL where your script file exists>"
  EMIHPTMI_file <- "" ## "insert your csv file name for EMIPHTMI"
  EMIHDGOT_file <- "" ## "insert your csv file name for EMIHDGOT"
  condition_mapping_file <- "" ## "insert your file name for mapping_condition"
  
# data load
  EMIHPTMI <- read.csv(file.path(dataFolder, EMIHPTMI_file), 
                       stringsAsFactors=FALSE, 
                       quote = "\"'", 
                       colClasses = c("ptmiidno" = "character",
                                      "ptmiintm" = "character", 
                                      "ptmiaktm" = "character", 
                                      "ptmiottm" = "character", 
                                      "ptmihstm" = "character", 
                                      "ptmidctm" = "character"))

# column name change to lower case 
  EMIHPTMI <- setNames(EMIHPTMI, tolower(names(EMIHPTMI)))
  EMIHPTMI_seq <- seq(nrow(EMIHPTMI))
  EMIHPTMI <- data.frame(EMIHPTMI_seq, EMIHPTMI)
  
  EMIHDGOT <- read.csv(file.path(dataFolder,EMIHDGOT_file),
                       stringsAsFactors=FALSE,
                       quote = "\"'",
                       colClasses = c("dgotidno" = "character",
                                      "dgotintm" = "character")
                       )
  
  condition_mapping_table <-read.csv(file.path(dataFolder,condition_mapping_file),
                               stringsAsFactors=FALSE, 
                               quote = "\"'"
  )

  # connection
  dbms = "" ##"<set your dbms ex) "sql server" >
  server = "" ##"<set your server IP" >
  schema = "" ##"<set your schema" >
  user= "" ##"<set your username" >
  password="" ##"<set your password" >
  
  
  