# condition_occurrence

condition_occurrence_ETL <- function() {
  
  PTMI_m_DGOT <- merge(EMIHPTMI, EMIHDGOT, by.x = c("ptmiidno", "ptmiindt", "ptmiintm"),  by.y = c("dgotidno", "dgotindt", "dgotintm"))
  
  PTMI_m_DGOT <-  PTMI_m_DGOT %>% 
                  select(EMIHPTMI_seq, ptmiidno, ptmiindt, ptmiintm, ptmiotdt, ptmiottm, ptmidcrt, dgotdiag, dgotdggb)
    
  PTMI_m_DGOT_c <- merge(PTMI_m_DGOT, condition_mapping_table, by.x = "dgotdiag", by.y = "source_code", all.x = TRUE)

  PTMI_m_DGOT_c$concept_id[is.na(PTMI_m_DGOT_c$concept_id)] <-0

  head(PTMI_m_DGOT_c,100)
  
  tz = Sys.timezone()
  
  condition_occurrence <- data.frame (person_id = PTMI_m_DGOT_c$ptmiidno,
                                     condition_concept_id = PTMI_m_DGOT_c$concept_id,
                                     condition_start_date = PTMI_m_DGOT_c$ptmiindt, 
                                     condition_start_datetime =as.POSIXct(paste(PTMI_m_DGOT_c$ptmiindt, PTMI_m_DGOT_c$ptmiintm), format ='%Y-%m-%d %H%M', tz = tz), 
                                     condition_end_date = PTMI_m_DGOT_c$ptmiotdt,
                                     condition_end_datetime = as.POSIXct(paste(PTMI_m_DGOT_c$ptmiotdt, PTMI_m_DGOT_c$ptmiottm), format ='%Y-%m-%d %H%M', tz = tz),
                                     condition_type_concept_id = ifelse(PTMI_m_DGOT_c$dgotdggb==1, 44786627, ifelse(PTMI_m_DGOT_c$dgotdggb==2,44786629,0)),
                                     stop_reason = PTMI_m_DGOT_c$ptmidcrt,
                                     provider_id = NA,
                                     visit_occurrence_id = PTMI_m_DGOT_c$EMIHPTMI_seq, 
                                     visit_detail_id = NA,
                                     condition_source_value = PTMI_m_DGOT_c$dgotdiag,
                                     condition_source_concept_id = 0,
                                     condition_status_source_value = 'FINAL',
                                     condition_status_concept_id = 4230359
  )
  
  condition_occurrence_id <- seq(nrow(condition_occurrence))
  
  condition_occurrence <- data.frame(condition_occurrence_id, condition_occurrence)
  
  colnames(condition_occurrence) <- c('condition_occurrence_id','person_id','condition_concept_id','condition_start_date','condition_start_datetime','condition_end_date','condition_end_datetime','condition_type_concept_id','stop_reason','provider_id','visit_occurrence_id','visit_detail_id','condition_source_value','condition_source_concept_id','condition_status_source_value','condition_status_concept_id')
  
  return(condition_occurrence)
}
