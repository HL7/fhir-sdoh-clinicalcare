###  Enabling Survey Instruments

There is work in process with both Regenstrief and National Libararies of Medicine  (NLM) to utilize their capabilities to standardize the coding and output of SDOH risk surveys..

The following diagram depicts the suggested approch to incorporting risk surveys into the overall information flow for SDOH.

1. Establish complete survey as LOINC Components with LOINC Answer Lists.  
2. Establish calculation logic for Questionnaire (e.g. where two questions determine the answer to another "question")
3. Conversion of the LOINC survey to FHIR Questionnaire (currently using open source NLM LHC-Forms Widget) with logic to create LOINC-LOINC Observations and SNOMED-CT/ICD10-CM coded Health Concerns
5. Execute FHIR Questionnaire (currently using open source NLM SDC Questionnaire App)
6. Create QuestionnaireResponse, Observations (survey question-answer pair), Condition (Health Concern) as output of execution of the SDC Questionnaire


<table><tr><td><img src="Enabling Survy Instruments.jpg" /></td></tr></table>