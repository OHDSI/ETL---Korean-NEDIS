# Observation severity 

observation_ETL <- function() {
  
  tz = Sys.timezone()
  
  KTAS_observation <- EMIHPTMI %>% select(EMIHPTMI_seq, ptmiidno, ptmiktdt, ptmikttm, ptmikts1, ptmikidn) %>% filter(!is.na(as.numeric(ptmikts1)))
  
  observation <- data.frame()
  
  KTAS_observation <-      data.frame (# observation_id = ,
                                  person_id = KTAS_observation$ptmiidno,
                                  observation_concept_id = 37019008, # Emergency Severity Index: 37019008
                                  observation_date = KTAS_observation$ptmiktdt, # ptmiktdt
                                  observation_datetime = as.POSIXct(paste(KTAS_observation$ptmiktdt, KTAS_observation$ptmikttm), format ='%Y-%m-%d %H%M', tz = tz), # ptmiktdt + ptmikttm
                                  observation_type_concept_id = 38000280, #Observation recorded from EHR: 38000280
                                  value_as_number = KTAS_observation$ptmikts1, # ptmikts1
                                  value_as_string = NA ,
                                  value_as_concept_id = 0,
                                  qualifier_concept_id = NA,
                                  unit_concept_id = 0,
                                  provider_id = KTAS_observation$ptmikidn, ## ptmikidn
                                  visit_occurrence_id = KTAS_observation$EMIHPTMI_seq,
                                  visit_detail_id = 0, ## 0 
                                  observation_source_value = KTAS_observation$ptmikts1, # ptmikts1
                                  observation_source_concept_id = 0, # 0
                                  unit_soure_value = 0, #0 severity has not unit
                                  qualifier_source_value = NA ## 
    
  )
  observation<-rbind(observation,KTAS_observation)

  observation_id <- seq(nrow(observation))
  
  observation <- data.frame(observation_id, observation)
  
  return(observation)
}

