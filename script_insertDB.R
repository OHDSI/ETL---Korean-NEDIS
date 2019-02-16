# Conn

connect_NEDIS_CDM <- function(dbms, server, schema, user, password)
{
  tryCatch({
    connectionDetails<-createConnectionDetails(dbms=dbms,
                                               server=server,
                                               schema=schema,
                                               user=user,
                                               password=password)
    connection<-connect(connectionDetails)}
    , error = function(e) {
      stop(e)
    }
    
  )
  
  print("DB connected!")
  
  return (list(connection, connectionDetails))
}



dropTable_NEDIS_CDM <- function (conn, schema)
{
  connection = conn[[1]]
  connectionDetails = conn[[2]]
  
  sql <- "IF OBJECT_ID ('@schema.person', 'U') IS NOT NULL DROP TABLE @schema.person;"
  sql <- paste0(sql, "IF OBJECT_ID ('@schema.person_mapping_table', 'U') IS NOT NULL DROP TABLE @schema.person_mapping_table;")
  sql <- paste0(sql, "IF OBJECT_ID ('@schema.condition_mapping_table', 'U') IS NOT NULL DROP TABLE @schema.condition_mapping_table;")
  sql <- paste0(sql, "IF OBJECT_ID ('@schema.death', 'U') IS NOT NULL DROP TABLE @schema.death;")
  sql <- paste0(sql, "IF OBJECT_ID ('@schema.visit_occurrence', 'U') IS NOT NULL DROP TABLE @schema.visit_occurrence;")
  sql <- paste0(sql, "IF OBJECT_ID ('@schema.condition_occurrence', 'U') IS NOT NULL DROP TABLE @schema.condition_occurrence;")
  sql <- paste0(sql, "IF OBJECT_ID ('@schema.observation', 'U') IS NOT NULL DROP TABLE @schema.observation;")
  sql <- paste0(sql, "IF OBJECT_ID ('@schema.measurement', 'U') IS NOT NULL DROP TABLE @schema.measurement;")

  sql <- renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  executeSql(connection, sql)
  
  print("DROP NEDIS_CDM TABLEs succeded!")
} 

createTable_NEDIS_CDM <- function (conn, schema)
{
  connection = conn[[1]]
  connectionDetails = conn[[2]]
  
  sql <- suppressWarnings(readSql("sql/NEDIS_DDL_SQLSERVER_20180531.sql"))
  sql <- renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  executeSql(connection, sql)
  
  print("CREATE NEDIS_CDM TABLEs succeded!")
}  
'@CDMTable: Name of target CDM table (This name will be the name of table in the database) eg. "person", "condition_occurrence",
"visit_occurrence", "observation", "death", "measurement"
'
insert_NEDIS_CDM <- function(data,
                             conn, 
                             schema, 
                             CDMTable = "PERSON",
                             dropTableIfExists = FALSE,
                             createTable = TRUE,
                             tempTable = FALSE, 
                             oracleTempSchema=NULL)
  {
    connection = conn[[1]]
    connectionDetails = conn[[2]]
    insertTable(connection, paste0(schema,".",CDMTable), data,           
    dropTableIfExists = dropTableIfExists,
    createTable = createTable,
    tempTable = tempTable,
    oracleTempSchema = oracleTempSchema)
  }

