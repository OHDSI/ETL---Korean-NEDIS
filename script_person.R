# Person

person_ETL <- function(person_mapping_table = NULL){
    
    if (nrow(EMIHPTMI) != length(unique(EMIHPTMI$ptmiidno))) {
      unique_EMIHPTMI <- EMIHPTMI %>% 
        group_by(ptmiidno) %>% 
        select(ptmiidno, ptmiindt, ptmibrtd, ptmizipc, ptmisexx) %>% 
        slice(which.max(ptmiindt))
    } else {
      unique_EMIHPTMI <- EMIHPTMI
    }    
    
    unique_EMIHPTMI$gender_concept_id <- ifelse(unique_EMIHPTMI$ptmisexx == "[mM]" | unique_EMIHPTMI$ptmisexx == "[1357]", 8507, ifelse(unique_EMIHPTMI$ptmisexx == "[fF]" | unique_EMIHPTMI$ptmisexx == "[02468]", 8532, 0))

    person <- data.frame(person_id = unique_EMIHPTMI$ptmiidno,
                         gender_concept_id = unique_EMIHPTMI$gender_concept_id, 
                        year_of_birth = format(unique_EMIHPTMI$ptmibrtd,"%Y"),
                        month_of_birth = format(unique_EMIHPTMI$ptmibrtd,"%m"),
                        day_of_birth = format(unique_EMIHPTMI$ptmibrtd,"%d"),
                        birth_datetime = NA,
                        race_concept_id = 0,
                        ethnicity_concept_id = 0,
                        location_id = substr(unique_EMIHPTMI$ptmizipc,1,3),
                        provider_id = NA,
                        care_site_id = 0,
                        person_source_value = NA,
                        gender_source_value = unique_EMIHPTMI$ptmisexx,
                        gender_source_concept_id = 0,
                        race_source_value = NA,
                        race_source_concept_id = NA,
                        ethnicity_source_value = NA, 
                        ethnicity_source_concept_id = NA,
                        stringsAsFactors=FALSE)
    return(person)
  }
