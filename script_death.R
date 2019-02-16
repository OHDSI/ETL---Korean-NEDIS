# Death

death_ETL <- function() {

  EMIHPTMI_for_death <- EMIHPTMI %>%
                        filter(ptmiemrt >= 41 & ptmiemrt <= 48)
  
  tz = Sys.timezone()
  
  death <-data.frame (person_id = EMIHPTMI_for_death$ptmiidno,
                      death_date = EMIHPTMI_for_death$ptmiotdt,
                      death_datetime = as.POSIXct(paste(EMIHPTMI_for_death$ptmiotdt, EMIHPTMI_for_death$ptmiottm), format ='%Y-%m-%d %H%M', tz = tz),
                      death_type_concept_id = ifelse(EMIHPTMI_for_death$ptmiemrt==41, 242, 
                                                     ifelse(EMIHPTMI_for_death$ptmiemrt==42,38000280,
                                                            ifelse(EMIHPTMI_for_death$ptmiemrt==43,38000280,
                                                                   ifelse(EMIHPTMI_for_death$ptmiemrt==44,38000280,
                                                                          ifelse(EMIHPTMI_for_death$ptmiemrt==45,38000280,
                                                                                 ifelse(EMIHPTMI_for_death$ptmiemrt==48,38000280,0)))))),
                      # Observation recorded from EHR: 38000280
                      # Other government reported or identified death: 242
                      cause_concept_id = NA,
                      cause_source_value = NA,
                      cause_source_concept_id = NA
                     
  )

  return(death)
}