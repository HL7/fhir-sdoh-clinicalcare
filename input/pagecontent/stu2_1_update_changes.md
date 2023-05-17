### Jira Tickets – all applied -- see changes below

* [FHIR-40447](https://jira.hl7.org/browse/FHIR-40447) Document the use of Gravity VS in the multi-domain profiles
* [FHIR-40449](https://jira.hl7.org/browse/FHIR-40449) Improve rendering of Capability Statements
* [FHIR-40450](https://jira.hl7.org/browse/FHIR-40450) Glossary
* [FHIR-40460](https://jira.hl7.org/browse/FHIR-40460) SDOHCC Observation Assessment is not abstract
* [FHIR-40586](https://jira.hl7.org/browse/FHIR-40586) Referral Task outputs bound appropriately
* [FHIR-40611](https://jira.hl7.org/browse/FHIR-40611) Added slice to to ObservationScreeningResponse.member to reference all observations that are members of the group
* [FHIR-40771](https://jira.hl7.org/browse/FHIR-40771) Constrained TaskForReferralManagement.status to exclude requested value.
* [FHIR-41278](https://jira.hl7.org/browse/FHIR-41278) Fixed cardinality of extension to HealthcareService.telecom so that there would be one boolean flag per telecom
* [FHIR-41310](https://jira.hl7.org/browse/FHIR-FHIR-41310)  ObservationScreeningResponse.hasMember[SupportedHasMember] can only reference an ObservationScreeningResponse.  Previously it could also reference a QuestionnaireResponse.


This update is focused on improving the readability of the IG narrative content.

### StructureDefinitions

* Included value set references in narrative for the multi-domain profiles (Condition, Goal, ServiceRequest, Procedure, and Observation)
* Improved narrative in all Profiles
* Abstract flag in [SDOHCCObservationAssessment] is now false - [FHIR-40460 ](https://jira.hl7.org/browse/FHIR-40460)
* Corrected bindings for output procedures in [SDOHCCTaskForReferralManagement]   - [FHIR-40586](https://jira.hl7.org/browse/FHIR-40586)
* Added slice to to ObservationScreeningResponse.member to reference all observations that are members of the group [FHIR-40611](https://jira.hl7.org/browse/FHIR-40611)
* Updated valuesets and state transition diagrams for  [SDOHCCTaskForReferralManagement].status and [SDOHCCTaskForPatient].status [FHIR-41199](https://jira.hl7.org/browse/FHIR-41199)
* Remove abstract from [SDOHCCGroup] Profile. [FHIR-41198](https://jira.hl7.org/browse/FHIR-41198)


### CapabilityStatements

* Improved Rendering of all Capability Statements using [tools](https://github.com/caspears/CapStatement) and additional [scripts](https://github.com/HL7/fhir-sdoh-clinicalcare/tree/master/capstmt). [FHIR-40449](https://jira.hl7.org/browse/FHIR-40449)

### Narrative
* The narrative has been restructured and edited and all of the figures redrawn to improve overall readability
* [Glossary](glossary.html) – Added glossary [FHIR-40450](https://jira.hl7.org/browse/FHIR-40450)

### FHIR Shorthand
* The IG is now being maintained in [FHIR Shorthand syntax](http://hl7.org/fhir/uv/shorthand/)

{% include markdown-link-references.md %}