### Jira Tickets – all applied -- see changes below

1. [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237) -- Replace Task with a Task for Referrals and one for the Patient, and add documentation
   - Patient task should support surveys, documentation, and contact information
2. [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238) -- Add Draft observations for race and ethnicity that support the identification of “source” and “method” of collection and add documentation – need US core exceptions from CPWG for observations – submitted variance request to CPG and was approved (see profiles)
3. [FHIR-34242](https://jira.hl7.org/browse/FHIR-34241) -- Change ServiceRequest and Procedure profiles to use US core value set for .code
4. [FHIR-34243](https://jira.hl7.org/browse/FHIR-34243) -- Change Condition profile to use US Core .code value set and provide guidance on the use of both SNOMED-CT and ICD-10 (as codings)
5. [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244) -- Add profile for HealthcareService and Location to use in the Patient Task to indicate contact information
6. [FHIR-34246](https://jira.hl7.org/browse/FHIR-34246) -- Add Service order detail in the ServiceRequest to indicate that the service organization is not to call the patient/client
7. [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255) -- Define workflow with patient involvement
8. [FHIR-34256](https://jira.hl7.org/browse/FHIR-34256) -- Define workflow with multiple services organization
9. [FHIR-34257](https://jira.hl7.org/browse/FHIR-34257) -- Add additional examples for each of the new / changed profiles /requirements
10. [FHIR-34236](https://jira.hl7.org/browse/FHIR-34236) -- Update profiles must support and element definitions based on feedback from implementers
11. [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233) -- Add support for external terminologies as part of ServiceRequest and Procedure.
12. [FHIR-34339](https://jira.hl7.org/browse/FHIR-34239) -- Add Guidance on relationship between new Race and Ethnicity Observation with US Core

This ballot is focused on a number of additions and corrections based on feedback from  addresses several additions, modifications, technical corrections, errata, clarifications listed below.



### CodeSystems

Added values and notes [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237), [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238), [FHIR-34246](https://jira.hl7.org/browse/FHIR-34246)

* [SDOHCC CodeSystem Temporary Codes](CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html)



### Value Sets

Adopted US Core Value Sets [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

*  [FHIR-34243](https://jira.hl7.org/browse/FHIR-34243)

*  Condition: from [Condition/Problem/Diagnosis Codes]({{site.data.fhir.path}}valueset-condition-code.html) to [US Core Condition Code](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)
*  ServiceRequest: from [Procedure Codes (SNOMED CT)]({{site.data.fhir.path}}valueset-procedure-code.html) to [US Core Procedure Codes](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)
*  Procedure: from SDOHCC ValueSet SNOMEDCT CPT LOINC HCPCSII to [US Core Procedure Codes](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)



Removed Values Sets (no longer required) [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

* [SDOHCC ValueSet HCPCSII](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetHCPCSII.html)
* [SDOHCC ValueSet ICD10CM](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetICD10CM.html)
* [SDOHCC ValueSet SNOMEDCT CPT LOINC HCPCSII](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetSNOMEDCTCPTLOINCHCPCSII.html)



Added Value Sets for Race/Ethnicity Observation Profile [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238)

* [SDOHCC ValueSet Observation DataAbsentReason](ValueSet-SDOHCC-ValueSetObservationDataAbsentReason.html)
* [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238) [SDOHCC ValueSet Observation Method](ValueSet-SDOHCC-ValueSetObservationMethod.html)



Added Value Sets for Patient Task [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)


* [SDOHCC ValueSet SDOH Questionnaire Category](ValueSet-SDOHCC-ValueSetSDOHQuestionnaireCategory.html)
* [SDOHCC ValueSet Task Code](ValueSet-SDOHCC-ValueSetTaskCode.html)
* [SDOHCC ValueSet Task Priority](ValueSet-SDOHCC-ValueSetTaskPriority.html)
* [SDOHCC ValueSet Task Status](ValueSet-SDOHCC-ValueSetTaskStatus.html)



Added values and notes [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

* [SDOHCC ValueSet Observation Status](ValueSet-SDOHCC-ValueSetObservationStatus.html)
* [SDOHCC ValueSet SDOH Category](ValueSet-SDOHCC-ValueSetSDOHCategory.html)



### StructureDefinitions

US Core [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

* Updated from 3.1.1 to 4.0.0



Updated Profiles [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

* [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html) [FHIR-34243](https://jira.hl7.org/browse/FHIR-34243)

- - Changed `Condition.code` value set to use [US Core Condition Code](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html) value set.

- - Added guidance on use of SDOH value sets



* [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html) [FHIR 34233](https://jira.hl7.org/browse/FHIR-34233)

* * Added guidance on use of SDOH value sets in VSAC

- - Make `Goal.value` due date MS




* [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html) [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233), [FHIR-34242](https://jira.hl7.org/browse/FHIR-34242)

- - `Procedure.code` -- added reference to [US Core Condition Code](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html) value set [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

- - `Procedure.code.coding` -- added slice for example of social services taxonomy (e.g. 211 LA) as Must Support



* [SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html) [FHIR-34246](https://jira.hl7.org/browse/FHIR-34246), [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233), [FHIR-34242](https://jira.hl7.org/browse/FHIR-34242)

* * `ServiceRequest.status` –- updated guidance

* * `ServiceRequest.code` -- removed slices and added reference to US Core Procedure value set

* * `ServiceRequest.code.coding` -- added slice for example of social services taxonomy (e.g. 211 LA) as Must Support

* * `ServiceRequest.reasonReference` – added guidance
* * `ServiceRequest.orderDetail` -- added order detail to indicate that the service organization is not to call the patient/client


Added new profiles


* [SDOHCC Healthcare Service](StructureDefinition-SDOHCC-HealthcareService.html) [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244), [FHIR-34237](https://jira.hl7.org/browse/FHIR-3437)
* * Extension: [SDOHCC Extension HealthcareService Telecom Appointment](StructureDefinition-SDOHCC-ExtensionHealthcareServiceTelecomAppointment.html) [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244), [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)


* [SDOHCC Location](StructureDefinition-SDOHCC-Location.html) [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244), [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)
* [SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html)  [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244), [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)
* [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html) [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)

New Draft Observation Profiles for Race and Ethnicity

* [SDOHCC Observation Ethnicity OMB](StructureDefinition-SDOHCC-ObservationEthnicityOMB.html) [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238), [FHIR-34339](https://jira.hl7.org/browse/FHIR-34239)
* [SDOHCC Observation Race OMB](StructureDefinition-SDOHCC-ObservationRaceOMB.html) [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238), [FHIR-34339](https://jira.hl7.org/browse/FHIR-34239)

Removed

* [SDOHCC Task](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/StructureDefinition-SDOHCC-Task.html) [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)

### CapabilityStatements

Changed name and updated content

* From [SDOH Clinical Care Coordination Platform](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareCoordinationPlatform.html) to [SDOHCC Coordination Platform Capability Statement](CapabilityStatement-SDOHCC-CoordinationPlatform.html)
* From [SDOH Clinical Care Referral Recipient - Light](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralRecipientLight.html) to [SDOHCC Referral Recipient - Light](CapabilityStatement-SDOHCC-ReferralRecipientLight.html)
* From [SDOH Clinical Care Referral Recipient](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralRecipient.html) to [SDOHCC Referral Recipient](CapabilityStatement-SDOHCC-ReferralRecipient.html)
* From [SDOH Clinical Care Referral Source](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralSource.html) to  [SDOHCC Referral Source](CapabilityStatement-SDOHCC-ReferralSource.html)

Added CapabilityStatement

* [SDOHCC Patient Application](CapabilityStatement-SDOHCC-PatientApp.html) [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255)

### Documentation

* [Home Page](index.html) – added reference to new content
* [STU2 Ballot Changes](stu2_ballot_changes.html) – this page
* Functional Use Cases – added Patient/Client use case [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255)
* Support for Multiple Domains – added support for VSAC group value sets [FHIR-34236](https://jira.hl7.org/browse/FHIR-34236)
* Exchange Workflow – added new workflow for Patient/Client and CBO applications [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255), [FHIR-34256](https://jira.hl7.org/browse/FHIR-34256)
* [Connecting Applications with API Data Sources](connecting_applications_with_api_data_sources.html) -- new [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255)
* [FHIR Artifacts Overview](artifacts.html) – updated to refer to new or changed artifacts
* [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)-- new [FHIR-34339](https://jira.hl7.org/browse/FHIR-34239)



### Examples

* Many of the examples have been renamed, updated, or added to appropriately provide examples of the changes noted above [FHIR-34257](https://jira.hl7.org/browse/FHIR-34257)

{% include markdown-link-references.md %}