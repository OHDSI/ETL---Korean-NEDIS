
IF OBJECT_ID ('NEDIS_CDM.dbo.person_mapping_table', 'U') IS NULL 
CREATE TABLE NEDIS_CDM.dbo.person_mapping_table
 (person_id						        INTEGER	  	NOT NULL ,
  ptmiidno						    VARCHAR(50) NOT NULL
  );

IF OBJECT_ID ('NEDIS_CDM.dbo.condition_mapping_table', 'U') IS NULL 
CREATE TABLE NEDIS_CDM.dbo.condition_mapping_table
 (source_code						        VARCHAR(50)	  	NOT NULL ,
  concept_id					    INTEGER NOT NULL
  );


IF OBJECT_ID ('NEDIS_CDM.dbo.person', 'U') IS NULL 
CREATE TABLE NEDIS_CDM.dbo.person
 (person_id						        INTEGER	  	NOT NULL ,
  gender_concept_id				    INTEGER	  	NOT NULL ,
  year_of_birth					      INTEGER	  	NOT NULL ,
  month_of_birth				      INTEGER	  	NULL,
  day_of_birth					      INTEGER	  	NULL,
  birth_datetime				      DATETIME	  NULL,
  race_concept_id				      INTEGER		  NOT NULL,
  ethnicity_concept_id			  INTEGER	  	NOT NULL,
  location_id					        INTEGER		  NULL,
  provider_id					        INTEGER		  NULL,
  care_site_id					      INTEGER		  NULL,
  person_source_value			    VARCHAR(50) NULL,
  gender_source_value			    VARCHAR(50) NULL,
  gender_source_concept_id	  INTEGER		  NULL,
  race_source_value				    VARCHAR(50) NULL,
  race_source_concept_id		  INTEGER		  NULL,
  ethnicity_source_value		  VARCHAR(50) NULL,
  ethnicity_source_concept_id	INTEGER		  NULL
);

IF OBJECT_ID ('NEDIS_CDM.dbo.death', 'U') IS NULL 
CREATE TABLE  NEDIS_CDM.dbo.death
 (person_id							  INTEGER			NOT NULL ,
  death_date							DATE			  NOT NULL ,
  death_datetime					DATETIME		NULL ,
  death_type_concept_id   INTEGER			NOT NULL ,
  cause_concept_id			  INTEGER			NULL ,
  cause_source_value			VARCHAR(50)	NULL,
  cause_source_concept_id INTEGER			NULL
);

IF OBJECT_ID ('NEDIS_CDM.dbo.visit_occurrence', 'U') IS NULL
CREATE TABLE  NEDIS_CDM.dbo.visit_occurrence
 (visit_occurrence_id			      INTEGER			NOT NULL ,
  person_id						          INTEGER			NOT NULL ,
  visit_concept_id				      INTEGER			NOT NULL ,
  visit_start_date				      DATE			  NOT NULL ,
  visit_start_datetime				  DATETIME		NULL ,
  visit_end_date					   DATE			  NULL ,   --DATE			  NOT NULL ,
  visit_end_datetime					  DATETIME		NULL ,
  visit_type_concept_id			    INTEGER			NOT NULL ,
  provider_id					          INTEGER			NULL,
  care_site_id					        INTEGER			NULL,
  visit_source_value				    VARCHAR(50)	NULL,
  visit_source_concept_id		    INTEGER			NULL ,
  admitting_source_concept_id	  INTEGER			NULL ,
  admitting_source_value		    VARCHAR(50)	NULL ,
  discharge_to_concept_id		    INTEGER   	NULL ,
  discharge_to_source_value		  VARCHAR(50)	NULL ,
  preceding_visit_occurrence_id	INTEGER			NULL
);

IF OBJECT_ID ('NEDIS_CDM.dbo.condition_occurrence', 'U') IS NULL
CREATE TABLE  NEDIS_CDM.dbo.condition_occurrence
 (condition_occurrence_id		    INTEGER			NOT NULL ,
  person_id						          INTEGER			NOT NULL ,
  condition_concept_id			    INTEGER			NOT NULL ,
  condition_start_date			    DATE			  NOT NULL ,
  condition_start_datetime		  DATETIME		NULL ,
  condition_end_date			      DATE			  NULL ,
  condition_end_datetime		    DATETIME		NULL ,
  condition_type_concept_id		  INTEGER			NOT NULL ,
  stop_reason					          VARCHAR(20)	NULL ,
  provider_id					          INTEGER			NULL ,
  visit_occurrence_id			      INTEGER			NULL ,
  visit_detail_id               INTEGER     NULL ,
  condition_source_value		    VARCHAR(50)	NULL ,
  condition_source_concept_id	  INTEGER			NULL ,
  condition_status_source_value	VARCHAR(50)	NULL ,
  condition_status_concept_id	  INTEGER			NULL
);

IF OBJECT_ID ('NEDIS_CDM.dbo.observation', 'U') IS NULL
CREATE TABLE  NEDIS_CDM.dbo.observation
 (observation_id					      INTEGER			NOT NULL ,
  person_id						          INTEGER			NOT NULL ,
  observation_concept_id			  INTEGER			NOT NULL ,
  observation_date				      DATE			  NOT NULL ,
  observation_datetime				  DATETIME		NULL ,
  observation_type_concept_id	  INTEGER			NOT NULL ,
  value_as_number				        FLOAT			  NULL ,
  value_as_string				        VARCHAR(60)	NULL ,
  value_as_concept_id			      INTEGER			NULL ,
  qualifier_concept_id			    INTEGER			NULL ,
  unit_concept_id				        INTEGER			NULL ,
  provider_id					          INTEGER			NULL ,
  visit_occurrence_id			      INTEGER			NULL ,
  visit_detail_id               INTEGER     NULL ,
  observation_source_value		  VARCHAR(50)	NULL ,
  observation_source_concept_id	INTEGER			NULL ,
  unit_source_value				      VARCHAR(50)	NULL ,
  qualifier_source_value			  VARCHAR(50)	NULL
)

IF OBJECT_ID ('NEDIS_CDM.dbo.measurement', 'U') IS NULL
CREATE TABLE  NEDIS_CDM.dbo.measurement
 (measurement_id				        INTEGER			NOT NULL ,
  person_id						          INTEGER			NOT NULL ,
  measurement_concept_id		    INTEGER			NOT NULL ,
  measurement_date				      DATE			  NOT NULL ,
  measurement_datetime			    DATETIME  	NULL ,
  measurement_time              VARCHAR(10) NULL ,
  measurement_type_concept_id	  INTEGER			NOT NULL ,
  operator_concept_id			      INTEGER			NULL ,
  value_as_number				        FLOAT			  NULL ,
  value_as_concept_id			      INTEGER			NULL ,
  unit_concept_id				        INTEGER			NULL ,
  range_low					          	FLOAT			  NULL ,
  range_high					          FLOAT			  NULL ,
  provider_id					          INTEGER			NULL ,
  visit_occurrence_id			      INTEGER			NULL ,
  visit_detail_id               INTEGER     NULL ,
  measurement_source_value		  VARCHAR(50)	NULL ,
  measurement_source_concept_id	INTEGER			NULL ,
  unit_source_value				      VARCHAR(50)	NULL ,
  value_source_value			      VARCHAR(50)	NULL
);

/*
CREATE TABLE  provider
 (provider_id					        INTEGER			  NOT NULL ,
  provider_name					      VARCHAR(255)	NULL ,
  NPI							            VARCHAR(20)		NULL ,
  DEA							            VARCHAR(20)		NULL ,
  specialty_concept_id			  INTEGER			  NULL ,
  care_site_id					      INTEGER			  NULL ,
  year_of_birth					      INTEGER			  NULL ,
  gender_concept_id				    INTEGER			  NULL ,
  provider_source_value			  VARCHAR(50)		NULL ,
  specialty_source_value			VARCHAR(50)		NULL ,
  specialty_source_concept_id	INTEGER			  NULL ,
  gender_source_value			    VARCHAR(50)		NULL ,
  gender_source_concept_id		INTEGER			  NULL
)

CREATE TABLE  care_site
 (care_site_id						      INTEGER			  NOT NULL ,
  care_site_name						    VARCHAR(255)  NULL ,
  place_of_service_concept_id	  INTEGER			  NULL ,
  location_id						        INTEGER			  NULL ,
  care_site_source_value			  VARCHAR(50)		NULL ,
  place_of_service_source_value VARCHAR(50)		NULL
)
*/

