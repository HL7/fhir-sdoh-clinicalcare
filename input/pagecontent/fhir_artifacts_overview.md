###  Artifact Lists

Complying with this implementation guide means complying with a number of resources, profiles, code systems, and value sets. This page provides an overview of where the relevant information can be found.

The FHIR artifacts used by the SDOH ClinicalCare IG are hyperlinked in this section to the base resource, US Core profile (if used), the specific profiles defined in this implementation guide (if used), and the use.

| [Resource (R4)  ](http://hl7.org/fhir/)   | [US Core Profile  ](http://hl7.org/fhir/us/core/)   | [SDOH Clinical Care Profile  ](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/artifacts.html)   | Used to exchange |
| -------- | -------- | -------- | -------- |
| [Consent]( http://hl7.org/fhir/consent.html) | No  | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Consent.html)   | patient consent to share information|
| [Condition]( http://hl7.org/fhir/condition.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html)   | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Condition.html)   |health concerns, problems, diagnoses|
| [Goal](http://hl7.org/fhir/goal.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html)   | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Goal.html)   | goal and attainment specified for or by the patient |
| [Group]( http://hl7.org/fhir/group.html) | No  | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Group.html)   | a cohort of patients with a common characteristic |
| [Location]( http://hl7.org/fhir/location.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-location.html)   | No | location of an organization |
| [Observation]( http://hl7.org/fhir/Observation.html) | No | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationAssessment.html)   | an SDOH assessment based on a provider and patient interaction |
| [Observation]( http://hl7.org/fhir/Observation.html) | No | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationScreeningResponse.html)   | an assessment tool question and answer |
| [Organization]( http://hl7.org/fhir/organization.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-organization.html)   | No | organization demographics |
| [Patient]( http://hl7.org/fhir/patient.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html)   | No | patient demographics |
| [Practitioner]( http://hl7.org/fhir/practitioner.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-practitioner.html)   | No | provider demographics |
| [PractitionerRole]( http://hl7.org/fhir/PractitionerRole.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-PractitionerRole.html)   | No | provider role |
| [Procedure]( http://hl7.org/fhir/procedure.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)   | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Procedure.html)   | service/intervention delivered to a patient |
| [ServiceRequest]( http://hl7.org/fhir/ServiceRequest.html) | No | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ServiceRequest.html)   |request an intervention or referral |
| [Task]( http://hl7.org/fhir/Task.html) | No  | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Task.html)   |coordination of an intervention or referral|


Additional information about the use of these artifacts can be found in the relevant specification.

**The artifacts are of three types**:

* 	**[Profiles](http://www.hl7.org/fhir/profiling.html)** that constrain FHIR resources to reflect SDOH requirements.
* 	**[Code Systems](http://www.hl7.org/fhir/terminologies-systems.html)** that define SDOH-specific terminologies to be used in one or more of the profiles.
* 	**[Value Sets](http://www.hl7.org/fhir/terminologies-valuesets.html)** that define the specific subsets of both SDOH-defined and other code systems that can be (or are recommended to be) used within one or more profile elements.

