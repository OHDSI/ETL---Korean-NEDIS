# Visit_occurrence

visit_occurrence_ETL <- function (){

  	tz = Sys.timezone()

	visit_occurrence <- data.frame(visit_occurrence_id <- EMIHPTMI$EMIHPTMI_seq,
                  							 person_id = EMIHPTMI$ptmiidno,
                  							 visit_concept_id = 9203, # ED
                  							 visit_start_date = EMIHPTMI$ptmiindt,  
                  							 visit_start_datetime = as.POSIXct(paste(EMIHPTMI$ptmiindt, EMIHPTMI$ptmiintm), format ='%Y-%m-%d %H%M', tz = tz), 
                  							 visit_end_date = EMIHPTMI$ptmiotdt, 
                  							 visit_end_datetime = as.POSIXct(paste(EMIHPTMI$ptmiotdt, EMIHPTMI$ptmiottm), format ='%Y-%m-%d %H%M', tz = tz),
                  							 visit_type_concept_id = 44818518,
                  							 provider_id = NA,
                  							 care_site_id = NA,
                  							 visit_source_value = NA,
                  							 visit_source_concept_id = NA,
                  							 admitting_source_concept_id = ifelse(EMIHPTMI$ptmiinrt==1,8717,ifelse(EMIHPTMI$ptmiinrt==2,0,ifelse(EMIHPTMI$ptmiinrt==3,8756,0))), 
                  							 admitting_source_value = EMIHPTMI$ptmiinrt,
                  							 discharge_to_concept_id = ifelse(EMIHPTMI$ptmiemrt<=18,8536,ifelse(EMIHPTMI$ptmiemrt<=28,0,ifelse(EMIHPTMI$ptmiemrt<=38,8717,ifelse(EMIHPTMI$ptmiemrt<=48,NA,0)))),
                  							 discharge_to_source_value = EMIHPTMI$ptmiemrt,
                  							 preceding_visit_occurrence_id = NA
)

	colnames(visit_occurrence) <- c('visit_occurrence_id','person_id','visit_concept_id','visit_start_date','visit_start_datetime','visit_end_date','visit_end_datetime','visit_type_concept_id','provider_id','care_site_id','visit_source_value','visit_source_concept_id','admitting_source_concept_id','admitting_source_value','discharge_to_concept_id','discharge_to_source_value','preceding_visit_occurrence_id')
	return(visit_occurrence)
}
