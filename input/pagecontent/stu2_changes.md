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

* [SDOHCC ValueSet Observation DataAbsentReason](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetObservationDataAbsentReason.html)

* [SDOHCC ValueSet Observation Method](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetObservationMethod.html)

Added Value Sets for Patient Task

* [SDOHCC ValueSet SDOH Questionnaire Category](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetSDOHQuestionnaireCategory.html)

* [SDOHCC ValueSet Task Code](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetTaskCode.html)

* SDOHCC ValueSet Task Priority](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetTaskPriority.html)

* [SDOHCC ValueSet Task Status](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetTaskStatus.html)

Added values and notes to 

* [SDOHCC ValueSet Observation Status](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetObservationStatus.html)

* [SDOHCC ValueSet SDOH Category](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetSDOHCategory.html)

#### StructureDefinitions

US Core

* Updated from 3.1.1 to 4.0.0

Updated Profiles

* [SDOHCC Condition](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-Condition.html)

- - Changed Condition.code value set to use US Core Condition value set.

Added guidance on use of SDOH value sets

* [SDOHCC Goal](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-Goal.html)

* * Changed Goal.description value set to use US Core Condition value set.

- - Added guidance on use of SDOH value sets

- - Make Value due date MS


* [SDOHCC Procedure](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-Procedure.html)

- - Procedure.code and added reference to US Core Procedure value set

- - Procedure.code.coding Added slice for example of social services taxonomy (e.g. 211 LA) as Must Support
- 

* [SDOHCC ServiceRequest](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-ServiceRequest.html)

* * ServiceRequest.status – updated guidance

* * ServiceReqeust.code removed slices and added reference to US Core Procedure value set

* * ServiceREquest.code.coding Added slice for example of social services taxonomy (e.g. 211 LA) as Must Support

* * ServiceRequest.reasonReference – added guidance


* [SDOHCC Healthcare Service](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-HealthcareService.html)

* * Extension: [SDOHCC Extension HealthcareService Telecom Appointment](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-ExtensionHealthcareServiceTelecomAppointment.html)


* [SDOHCC Location](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-Location.html)

* [SDOHCC Task For Patient](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-TaskForPatient.html)

* [SDOHCC Task For Referral Management](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-TaskForReferralManagement.html)

New Draft Observation Profiles for Race and Ethnicity

* [SDOHCC Observation Ethnicity](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-ObservationEthnicity.html)

* [SDOHCC Observation Race](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/StructureDefinition-SDOHCC-ObservationRace.html)

Removed

* [SDOHCC Task](http://hl7.org/fhir/us/sdoh-clinicalcare/STU1/StructureDefinition-SDOHCC-Task.html)

#### CapabilityStatements

Changed name and updated content

* From [SDOH Clinical Care Coordination Platform](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/CapabilityStatement-SDOH-ClinicalCareCoordinationPlatform.html) to [SDOHCC Coordination Platform Capability Statement](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/CapabilityStatement-SDOHCC-CoordinationPlatform.html)

* From [SDOH Clinical Care Referral Recipient - Light](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/CapabilityStatement-SDOH-ClinicalCareReferralRecipientLight.html) to [SDOHCC Referral Recipient - Light](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/CapabilityStatement-SDOHCC-ReferralRecipientLight.html)

* From [SDOH Clinical Care Referral Recipient](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/CapabilityStatement-SDOH-ClinicalCareReferralRecipient.html) to [SDOHCC Referral Recipient](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/CapabilityStatement-SDOHCC-ReferralRecipient.html)

* From [SDOH Clinical Care Referral Source](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/sdoh-clinicalcare/CapabilityStatement-SDOH-ClinicalCareReferralSource.html) to  [SDOHCC Referral Source](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/CapabilityStatement-SDOHCC-ReferralSource.html)

Added CapabilityStatement

* [SDOHCC Patient Application](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/RCD/CapabilityStatement-SDOHCC-PatientApp.html)

#### Documentation

* [Home Page](Home – added reference to new content

* [STU2 Changes] – this page

* [Functional Use Cases](functional_use_cases.html) – added 

* [Support for Multiple Domains] – added support for VSAC group value sets

* [Exchange Workflow] – added new workflow for Patient/client and CBO applications

* [Synchronizing Applications with API Data Sources] -- new

* [FHIR Artifacts Overview] – updated to refer to new or changed artifacts

* [Draft Specifications for Race and Ethnicity] -- new

#### Examples

* Many of the examples have been renamed, updated, or added to appropriately provide examples of the changes noted above.