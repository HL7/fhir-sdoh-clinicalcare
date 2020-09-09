[Previous Page - Gravity Background](gravity_background.html)

###  SDOH Clinical Care Scope

The Gravity Project focus is on defining structure and coded content exchange to support multiplel social domains. The initial focus is on three domains: food insecurity, housing instability and homelessness, and transportation access.

<table><tr><td><img src="InitialDomains.jpg" /></td></tr></table>


<br>
####  Out of Scope

This project will not validate or provide incentives for implementation of the identified SDOH data elements.

<br>
### Conceptual Framework

Coded SDOH content is captured across core health care activities: screening/assessment, establishing health concerns, goal setting, care planning, interventions, outcomes and reporting. The conceptual framework illustrated below shows how these activities form a cycle of care. Over time, a patient's progress toward care goals can be tracked and measured.


<table><tr><td><img src="ConceptualFramework2.jpg" /></td></tr></table>


<br>
### Data Modeling Framework
The figure below was derived from the HL7 Patient Care WG Domain Analysis model for Care Plan information. It informs the design of the  FHIR Resources used in this IG.

<table><tr><td><img src="DataModelingFrameword.jpg" /></td></tr></table>

The relationships between the various types of information are supported by the designs developed for the resources. The diagram below shows the data model for the assessment observation, condition (diagnosis), and goal (patient centered goal). The semantics designed for the profiled resources support the envisioned cycles of assessment, diagnosis, and goal setting. The mind map illustration represents profiles developed in this IG for the FHIR Observation, Condition, and Goal Resources. It shows instances of profiled Resources that would be used over time as part of an iterative care process. 

<table><tr><td><img src="FHIR_Resource_Reference_MiMind_2.png" /></td></tr></table>



| Profile                                                         | Additional Constraints                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Observation Base Profile | Base observation profile that is the result of an assessment based on information collected in the screening questionnaire. The Observation specifies the LOINC coded question asked and LOINC coded answer selected. |
| Observation Summary Base Profile| Base observation summary profile that links all of the observations that are part of a single Questionnaire/QuestionnaireResponse.  |
| Condition Base Profile | Defines a health concern that is the direct product of administering a specific SDOH assessment (Questionnaire / QuestionnaireResponse)  |
| Goal Base Profile | Patient-centered goal documenting the desired outcome  of planned interventions.   |
| ServiceRequest Base Profile | Request for an intervention, typically from a community based organization.|



[Next Page - Personas and Patient Stories](personas_and_patient_stories.html)