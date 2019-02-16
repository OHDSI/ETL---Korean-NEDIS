#setwd("C:/Users/Danny/Documents/NEDIS") # PATH this files exists

# Person
source(file.path(scriptFolder, 'script_person.R'), encoding='UTF-8')
person <- person_ETL()

# death
source(file.path(scriptFolder, 'script_death.R'), encoding='UTF-8')
death <- death_ETL()

# visit_occurrence
source(file.path(scriptFolder, 'script_visit_occurrence.R'), encoding='UTF-8')
visit_occurrence <- visit_occurrence_ETL()

# condition_occurrence
source(file.path(scriptFolder, 'script_condition_occurrence.R'), encoding='UTF-8')
condition_occurrence <- condition_occurrence_ETL()

# observation
source(file.path(scriptFolder, 'script_observation.R'), encoding='UTF-8')
observation <- observation_ETL()

# measurement
source(file.path(scriptFolder, 'script_measurement.R'), encoding='UTF-8')
measurement <- measurement_ETL()
