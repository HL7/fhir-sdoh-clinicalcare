###  SDOH Clinical Care Scope

The Gravity Project focus is on defining structure and coded content exchange to support multiple social domains. The initial focus is on three domains: food insecurity, housing instability and homelessness, and transportation access.

<table><tr><td><img src="InitialDomains.jpg" /></td></tr></table>


<br>
####  Out of Scope

This project will not validate or provide incentives for implementation of the identified SDOH data elements.
Providing guidance on the frequency of administering assessment (this is left up to the responsible organizations based on their standards of practice).
Standards for reporting quality measures to payers or quality organizations -- this is left to the Data Exchange for Quality Measures Implementation Guide that was co-authored by NCQA.

<br>
### Conceptual Framework

Coded SDOH content is captured across core health care activities: screening/assessment, establishing health concerns, goal setting, care planning, interventions, outcomes and reporting. The conceptual framework, illustrated below, shows how these activities form a cycle of care. Over time, a patient's progress toward care goals can be tracked and measured.


<table><tr><td><img src="ConceptualFramework2.jpg" /></td></tr></table>


<br>
### Data Modeling Framework
The figure below was derived from the HL7 Patient Care WG Domain Analysis model for Care Plan information. It informs the design of the FHIR Resources used in this IG.

<table><tr><td><img src="DataModelingFrameword.jpg" /></td></tr></table>

The relationships between the various types of information are supported by the designs developed for the resources. The diagram below shows the data model for the screening response observation, condition (health concern), goal (patient-centered goal), service request and procedure/intervention. The mind map illustration represents profiles developed in this IG for the FHIR Observation, Condition, Goal, ServiceRequest and Procedure Resources. 

<table><tr><td><img src="FHIR_Resource_Reference_MiMind_3.png" /></td></tr></table>



