# insert to MSSQL
library(SqlRender)
library(DatabaseConnector)

source(file.path(scriptFolder, 'script_insertDB.R'), encoding='UTF-8')

# dbms = ""
# server = ""
# schema = ""
# user=""
# password=""

conn = connect_NEDIS_CDM(dbms, server, schema, user, password)

# dropTable_NEDIS_CDM(conn, schema)
# createTable_NEDIS_CDM(conn, schema)

# insert_PERSON
insert_NEDIS_CDM(data = person, 
                 conn = conn,
                 schema = schema,
                 CDMTable = "PERSON",
                 dropTableIfExists = FALSE,
                 createTable = TRUE
) 

# insert_DEATH
insert_NEDIS_CDM(data = death, 
                 conn = conn,
                 schema = schema,
                 CDMTable = "DEATH",
                 dropTableIfExists = FALSE,
                 createTable = TRUE
) 

# insert_VISIT_OCCURRENCE
insert_NEDIS_CDM(data = visit_occurrence, 
                 conn = conn,
                 schema = schema,
                 CDMTable = "VISIT_OCCURRENCE",
                 dropTableIfExists = FALSE,
                 createTable = TRUE
) 

# insert_CONDITION_OCCURRENCE
insert_NEDIS_CDM(data = condition_occurrence, 
                 conn = conn,
                 schema = schema,
                 CDMTable = "CONDITION_OCCURRENCE",
                 dropTableIfExists = FALSE,
                 createTable = TRUE
) 

# insert_OBSERVATION
insert_NEDIS_CDM(data = observation, 
                 conn = conn,
                 schema = schema,
                 CDMTable = "OBSERVATION",
                 dropTableIfExists = FALSE,
                 createTable = TRUE
) 

# insert_MEASUREMENT
insert_NEDIS_CDM(data = measurement, 
                 conn = conn,
                 schema = schema,
                 CDMTable = "MEASUREMENT",
                 dropTableIfExists = FALSE,
                 createTable = TRUE
) 

