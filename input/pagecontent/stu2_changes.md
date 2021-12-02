This ballot is focused on a number of additions and corrections based on feedback from  addresses several additions, modifications, technical corrections, errata, clarifications listed below.

#### CodeSystems 

Added values and notes to 

* [SDOHCC CodeSystem Temporary Codes](CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html)

#### Value Sets

Adopted US Core Value Sets for 

* Condition: from [Condition/Problem/Diagnosis Codes](http://hl7.org/fhir/R4/valueset-condition-code.html) to [US Core Condition Code](http://hl7.org/fhir/us/core/STU4/ValueSet-us-core-condition-code.html)

* ServiceRequest: from [Procedure Codes (SNOMED CT)](http://hl7.org/fhir/R4/valueset-procedure-code.html) to [US Core Procedure Codes](http://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)

* Procedure: from SDOHCC ValueSet SNOMEDCT CPT LOINC HCPCSII to [US Core Procedure Codes](http://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)

Removed values sets (no longer required)

* [SDOHCC ValueSet HCPCSII](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetHCPCSII.html)

* [SDOHCC ValueSet ICD10CM](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetICD10CM.html)

* [SDOHCC ValueSet SNOMEDCT CPT LOINC HCPCSII](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetSNOMEDCTCPTLOINCHCPCSII.html)

Added Value Sets for Race/Ethnicity Observation Profile

* [SDOHCC ValueSet Observation DataAbsentReason](ValueSet-SDOHCC-ValueSetObservationDataAbsentReason.html)

* [SDOHCC ValueSet Observation Method](ValueSet-SDOHCC-ValueSetObservationMethod.html)

Added Value Sets for Patient Task

* [SDOHCC ValueSet SDOH Questionnaire Category](ValueSet-SDOHCC-ValueSetSDOHQuestionnaireCategory.html)

* [SDOHCC ValueSet Task Code](ValueSet-SDOHCC-ValueSetTaskCode.html)

* SDOHCC ValueSet Task Priority](ValueSet-SDOHCC-ValueSetTaskPriority.html)

* [SDOHCC ValueSet Task Status](ValueSet-SDOHCC-ValueSetTaskStatus.html)

Added values and notes to 

* [SDOHCC ValueSet Observation Status](ValueSet-SDOHCC-ValueSetObservationStatus.html)

* [SDOHCC ValueSet SDOH Category](ValueSet-SDOHCC-ValueSetSDOHCategory.html)

#### StructureDefinitions

US Core

* Updated from 3.1.1 to 4.0.0

Updated Profiles

* [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html)

- - Changed Condition.code value set to use US Core Condition value set.

Added guidance on use of SDOH value sets

* [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html)

* * Changed Goal.description value set to use US Core Condition value set.

- - Added guidance on use of SDOH value sets

- - Make Value due date MS

    


* [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html)

- - Procedure.code and added reference to US Core Procedure value set

- - Procedure.code.coding Added slice for example of social services taxonomy (e.g. 211 LA) as Must Support

  

* [SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html)

* * ServiceRequest.status – updated guidance

* * ServiceReqeust.code removed slices and added reference to US Core Procedure value set

* * ServiceREquest.code.coding Added slice for example of social services taxonomy (e.g. 211 LA) as Must Support

* * ServiceRequest.reasonReference – added guidance

    


* [SDOHCC Healthcare Service](StructureDefinition-SDOHCC-HealthcareService.html)

* * Extension: [SDOHCC Extension HealthcareService Telecom Appointment](StructureDefinition-SDOHCC-ExtensionHealthcareServiceTelecomAppointment.html)

    


* [SDOHCC Location](StructureDefinition-SDOHCC-Location.html)

* [SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html)

* [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html)

New Draft Observation Profiles for Race and Ethnicity

* [SDOHCC Observation Ethnicity](StructureDefinition-SDOHCC-ObservationEthnicity.html)

* [SDOHCC Observation Race](StructureDefinition-SDOHCC-ObservationRace.html)

Removed

* [SDOHCC Task](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/StructureDefinition-SDOHCC-Task.html)

#### CapabilityStatements

Changed name and updated content

* From [SDOH Clinical Care Coordination Platform](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareCoordinationPlatform.html) to [SDOHCC Coordination Platform Capability Statement](CapabilityStatement-SDOHCC-CoordinationPlatform.html)

* From [SDOH Clinical Care Referral Recipient - Light](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralRecipientLight.html) to [SDOHCC Referral Recipient - Light](CapabilityStatement-SDOHCC-ReferralRecipientLight.html)

* From [SDOH Clinical Care Referral Recipient](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralRecipient.html) to [SDOHCC Referral Recipient](CapabilityStatement-SDOHCC-ReferralRecipient.html)

* From [SDOH Clinical Care Referral Source](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralSource.html) to  [SDOHCC Referral Source](CapabilityStatement-SDOHCC-ReferralSource.html)

Added CapabilityStatement

* [SDOHCC Patient Application](CapabilityStatement-SDOHCC-PatientApp.html)

#### Documentation

* [Home Page](index.html) – added reference to new content

* [STU2 Changes](stu2_changes.html) – this page

* [Functional Use Cases](functional_use_cases.html) – added 

* [Support for Multiple Domains](support_for_multiple_domains.html) – added support for VSAC group value sets

* [Exchange Workflow](exchange_workflow.html) – added new workflow for Patient/client and CBO applications

* [Synchronizing Applications with API Data Sources](synchronizing_applications_with_api_data_sources.html) -- new

* [FHIR Artifacts Overview](fhir_artifacts_overview.html) – updated to refer to new or changed artifacts

* [Draft Specifications for Race and Ethnicity](draft_specifications_for_race_and_ethnicity.html)-- new

#### Examples

* Many of the examples have been renamed, updated, or added to appropriately provide examples of the changes noted above.