###  Artifact Lists

Complying with this implementation guide means complying with a number of resources, profiles, code systems, and value sets. This page provides an overview of where the relevant information can be found.

**The artifacts are of three types**:

* 	**[Profiles](http://www.hl7.org/fhir/profiling.html)** that constrain FHIR resources to reflect SDOH requirements.
* 	**[Code Systems](http://www.hl7.org/fhir/terminologies-systems.html)** that define SDOH-specific terminologies to be used in one or more of the profiles.
* 	**[Value Sets](http://www.hl7.org/fhir/terminologies-valuesets.html)** that define the specific subsets of both SDOH-defined and other code systems that can be (or are recommended to be) used within one or more profile elements.

The FHIR resources and profiles used by the SDOH ClinicalCare IG are hyperlinked from this section to the base resource, US Core profile (if used), the specific profiles defined in this implementation guide (if used), and the purpose of use.

| [Resource (R4)  ](http://hl7.org/fhir/)                      | [US Core Profile  ](http://{{site.data.fhir.ver.uscore}}/index.html) | [SDOH  Profile](artifacts.html)                              | Used to exchange                                             |
| ------------------- | ------------------- | ----------------- | ------------------------------------------------------------------------- |
| =========== | =========== | ========== | +.................................................................................................................................+ |
| [Consent]( http://hl7.org/fhir/consent.html)                 | No                                                           | [Yes](StructureDefinition-SDOHCC-Consent.html)               | patient consent to share information                         |
| [Condition]( http://hl7.org/fhir/condition.html)             | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html) | [Yes](StructureDefinition-SDOHCC-Condition.html)             | health concerns, problems, diagnoses                         |
| [Goal](http://hl7.org/fhir/goal.html)                        | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-goal.html) | [Yes](StructureDefinition-SDOHCC-Goal.html)                  | goal and attainment specified for or by the patient          |
| [Group]( http://hl7.org/fhir/group.html)                     | No                                                           | [Yes](StructureDefinition-SDOHCC-Group.html)                 | a cohort of patients with a common characteristic            |
| [HealthcareService]( http://hl7.org/fhir/healthcareservice.html)               | No                                                           | [Yes](StructureDefinition-SDOHCC-HealthcareService.html)                 | details of a healthcare service available at a location and the telecom for making an appointment                  |
| [Location]( http://hl7.org/fhir/location.html)               | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-location.html) | [Yes](StructureDefinition-SDOHCC-Location.html)           | location of an organization                                  |
| [Observation]( http://hl7.org/fhir/Observation.html)         | No                                                           | [Yes](StructureDefinition-SDOHCC-ObservationAssessment.html) | an SDOH assessment based on a provider and patient interaction |
| [Observation]( http://hl7.org/fhir/Observation.html)         | No                                                           | [Yes](StructureDefinition-SDOHCC-ObservationScreeningResponse.html) | an assessment tool question and answer                       |
| [Observation]( http://hl7.org/fhir/Observation.html)         | No                                                           | [Yes](StructureDefinition-SDOHCC-ObservationEthnicityOMB.html) | a patient ethnicity observation                |
| [Observation]( http://hl7.org/fhir/Observation.html)         | No                                                           | [Yes](StructureDefinition-SDOHCC-ObservationRaceOMB.html) | a patient race observation                    |
| [Organization]( http://hl7.org/fhir/organization.html)       | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-organization.html) | No                                                           | organization demographics                                    |
| [Patient]( http://hl7.org/fhir/patient.html)                 | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html) | No                                                           | patient demographics                                         |
| [Practitioner]( http://hl7.org/fhir/practitioner.html)       | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-practitioner.html) | No                                                           | provider demographics                                        |
| [PractitionerRole]( http://hl7.org/fhir/PractitionerRole.html) | [Yes](http://{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitionerrole.html) | No                                                           | provider role                                                |
| [Procedure]( http://hl7.org/fhir/procedure.html)             | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html) | [Yes](StructureDefinition-SDOHCC-Procedure.html)             | service/intervention delivered to a patient                  |
| [ServiceRequest]( http://hl7.org/fhir/ServiceRequest.html)   | No                                                           | [Yes](StructureDefinition-SDOHCC-ServiceRequest.html)        | request an intervention or referral                          |
| [Task]( http://hl7.org/fhir/Task.html)                       | No                                                           | [Yes](StructureDefinition-SDOHCC-TaskForReferralManagement.html)                | a task for referral management                             |
| [Task]( http://hl7.org/fhir/Task.html)                       | No                                                           | [Yes](StructureDefinition-SDOHCC-TaskForPatient.html)                  |  a task for a patient                    |




The FHIR Value Sets defined by the SDOH ClinicalCare IG are hyperlinked from this section to the definition used in this guide and profiles in which each is used.



| [Value Set  ]( http://www.hl7.org/fhir/terminologies-valuesets.html/) | Includes                                                     | Used By                                                      |
| -------------------------------------- | ---------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| ====================== | =========================== | +............................................................................................................................................................................+ |
| [SDOHCC ValueSet SDOH Category]( ValueSet-SDOHCC-ValueSetSDOHCategory.html) | specific codes from [SDOHCC CodeSystem Temporary Codes ](CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html) | [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html), [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html), [SDOHCC Observation Assessment](StructureDefinition-SDOHCC-ObservationAssessment.html), [SDOHCC Observation Screening Response](StructureDefinition-SDOHCC-ObservationScreeningResponse.html), [SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html), and [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html) |
| [SDOHCC ValueSet LOINC SNOMEDCT]( ValueSet-SDOHCC-ValueSetLOINCSNOMEDCT.html) | all of [LOINC](http://loinc.org/) and [SNOMED CT](http://www.snomed.org/) | [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html) and [SDOHCC Observation Assessment](StructureDefinition-SDOHCC-ObservationAssessment.html) |
| [SDOHCC ValueSet Observation Status]( ValueSet-SDOHCC-ValueSetObservationStatus.html) | specific codes from the [HL7 ObservationStatus](http://hl7.org/fhir/R4/codesystem-observation-status.html) value set | [SDOHCC Observation Ethnicity OMB](StructureDefinition-SDOHCC-ObservationEthnicityOMB.html), [SDOHCC Observation Gender Identity](StructureDefinition-SDOHCC-ObservationGenderIdentity.html), [SDOHCC Observation Personal Characteristic](StructureDefinition-SDOHCC-ObservationPersonalCharacteristic.html), [SDOHCC Observation Personal Pronouns](StructureDefinition-SDOHCC-ObservationPersonalPronouns.html), [SDOHCC Observation Race OMB](StructureDefinition-SDOHCC-ObservationRaceOMB.html), [SDOHCC Observation Recorded Sex Gender](StructureDefinition-SDOHCC-ObservationRecordedSexGender.html), [SDOHCC Observation Screening Response](StructureDefinition-SDOHCC-ObservationScreeningResponse.html), [SDOHCC Observation Sexual Orientation](StructureDefinition-SDOHCC-ObservationSexualOrientation.html) |
| [SDOHCC ValueSet Task Status]( ValueSet-SDOHCC-ValueSetTaskStatus.html) | specific codes from the [HL7 TaskStatus](http://hl7.org/fhir/R4/codesystem-task-status.html) value set | [ SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html) |
| [SDOHCC ValueSet Task Priority]( ValueSet-SDOHCC-ValueSetTaskPriority.html) | specific codes from the [HL7 RequestPriority](http://hl7.org/fhir/R4/codesystem-request-priority.html) value set | [ SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html) |
| [SDOHCC ValueSet Task Code]( ValueSet-SDOHCC-ValueSetTaskCode.html) | specific codes from [SDOHCC CodeSystem Temporary Codes ](CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html) and [SDC TaskCode]( http://hl7.org/fhir/uv/sdc/CodeSystem/temp) code system | [ SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html) |
| [SDOHCC ValueSet SDOH Questionnaire Category]( ValueSet-SDOHCC-ValueSetSDOHQuestionnaireCategory.html) | specific codes from [SDOHCC CodeSystem Temporary Codes ](CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html) | [ SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html) |
| [SDOHCC ValueSet Observation DataAbsentReason]( ValueSet-SDOHCC-ValueSetObservationDataAbsentReason.html) | specific codes from the [HL7 DataAbsentReason](http://hl7.org/fhir/R4/codesystem-data-absent-reason.html) value set | [ SDOHCC Observation Ethnicity OMB](StructureDefinition-SDOHCC-ObservationEthnicityOMB.html) and [ SDOHCC Observation Race OMB](StructureDefinition-SDOHCC-ObservationRaceOMB.html) |



The FHIR Code System defined by the SDOH ClinicalCare IG is hyperlinked from this section to the definition used in this guide and includes the purpose of use.



| [Code System  ]( http://www.hl7.org/fhir/terminologies-systems.html/) | Code System Use                                              |
| ------------------------------------------- | --------------------------------------------------------------- |
| ========================= | +..............................................................................................................+ |
| [SDOHCC CodeSystem Temporary Codes]( CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html) | local code system defined in the context of this IG          |



Additional information about the use of these artifacts can be found in the relevant specification and on the [artifacts](artifacts.html) page

 {% include markdown-link-references.md %}