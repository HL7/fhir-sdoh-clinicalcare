###  Artifact Lists

Complying with this implementation guide means complying with a number of resources, profiles, code systems, and value sets. This page provides an overview of where the relevant information can be found.

**The artifacts are of three types**:

* 	**[Profiles](http://www.hl7.org/fhir/profiling.html)** that constrain FHIR resources to reflect SDOH requirements.
* 	**[Code Systems](http://www.hl7.org/fhir/terminologies-systems.html)** that define SDOH-specific terminologies to be used in one or more of the profiles.
* 	**[Value Sets](http://www.hl7.org/fhir/terminologies-valuesets.html)** that define the specific subsets of both SDOH-defined and other code systems that can be (or are recommended to be) used within one or more profile elements.

The FHIR resources and profiles used by the SDOH ClinicalCare IG are hyperlinked in this section to the base resource, US Core profile (if used), the specific profiles defined in this implementation guide (if used), and the purpose of use.

| [Resource (R4)  ](http://hl7.org/fhir/)   | [US Core Profile  ](http://hl7.org/fhir/us/core/STU3.1.1/index.html)   | [SDOH ClinicalCare Profile  ](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/artifacts.html)   | Used to exchange |
| ----------------- | ---------------------- | ---------------------------- | -------- |
| [Consent]( http://hl7.org/fhir/consent.html) | No  | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Consent.html)   | patient consent to share information|
| [Condition]( http://hl7.org/fhir/condition.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html)   | [Yes](http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Condition)   |health concerns, problems, diagnoses|
| [Goal](http://hl7.org/fhir/goal.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html)   | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Goal.html)   | goal and attainment specified for or by the patient |
| [Group]( http://hl7.org/fhir/group.html) | No  | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Group.html)   | a cohort of patients with a common characteristic |
| [Location]( http://hl7.org/fhir/location.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-location.html)   | No | location of an organization |
| [Observation]( http://hl7.org/fhir/Observation.html) | No | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationAssessment.html)   | an SDOH assessment based on a provider and patient interaction |
| [Observation]( http://hl7.org/fhir/Observation.html) | No | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationScreeningResponse.html)   | an assessment tool question and answer |
| [Organization]( http://hl7.org/fhir/organization.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-organization.html)   | No | organization demographics |
| [Patient]( http://hl7.org/fhir/patient.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html)   | No | patient demographics |
| [Practitioner]( http://hl7.org/fhir/practitioner.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-practitioner.html)   | No | provider demographics |
| [PractitionerRole]( http://hl7.org/fhir/PractitionerRole.html) | [Yes](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-practitionerrole.html)   | No | provider role |
| [Procedure]( http://hl7.org/fhir/procedure.html) | [Yes](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)   | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Procedure.html)   | service/intervention delivered to a patient |
| [ServiceRequest]( http://hl7.org/fhir/ServiceRequest.html) | No | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ServiceRequest.html)   |request an intervention or referral |
| [Task]( http://hl7.org/fhir/Task.html) | No  | [Yes](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Task.html)   |coordination of an intervention or referral|



The FHIR Value Sets defined by the SDOH ClinicalCare IG are hyperlinked in this section to the definition used in this guide and profiles in which each is used.



| [Value Set  ]( http://www.hl7.org/fhir/terminologies-valuesets.html/)   | Includes | Used By |
| ----------------- | ---------------------- | ------------------- |
| [SDOH VaueSet IDC10CM]( http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetICD10CM.html) | includes all [ICD-10-CM](http://terminology.hl7.org/2.1.0/CodeSystem-icd10CM.html) codes |used by [SDOHCC Condition](http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Condition) profile |
| [SDOH ValueSet HCPCSII]( http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetHCPCSII.html) | includes all [HCPCS Level II](urn:oid:2.16.840.1.113883.6.285) codes | used by [SDOHCC Procedure](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Procedure.html) |
| [SDOH VaueSet LOINC SNOMEDCT]( http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetLOINCSNOMEDCT.html) | includes all of [LOINC](http://loinc.org/) and [SNOMED CT](http://www.snomed.org/) | used by [SDOHCC Goal](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Goal.html) and [SDOHCC Observation Assessment](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationAssessment.html) |
| [SDOH VaueSet Observation Status]( http://hl7.org/fhir/consent.html) | includes specific codes from the [HL7 ObservationStatus](http://hl7.org/fhir/R4/codesystem-observation-status.html) value set | used by[ SDOHCC Observation Screening Response](http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationScreeningResponse) |
| [SDOH VaueSet SDOH Category]( http://hl7.org/fhir/consent.html) | includes codes to represet Social Determinant of Health domains| used by SDOHCC Condition, SDOHCC Goal , SDOHCC Observation Assessment, SDOHCC Observation Screening Response, and SDOHCC ServiceRequest |
| [SDOH VaueSet SNOMED CPT LOINC HCPCSII]( http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetSNOMEDCTCPTLOINCHCPCSII.html) | Includes all of [SNOMED CT Procedure Codes](http://www.snomed.org/), and all of [CPT](http://terminology.hl7.org/2.1.0/CodeSystem-v3-cpt-4.html), [LOINC](http://loinc.org/), and [HCPCS II](urn:oid:2.16.840.1.113883.6.285) | used by SDOHCC ServiceRequest |



The FHIR Code System defined by the SDOH ClinicalCare IG is hyperlinked in this section to the definition used in this guide and includes the purpose of use.



| [Code System  ]( http://www.hl7.org/fhir/terminologies-systems.html/)   | Code System Use |
| ----------------- | ---------------------- | 
| [SDOH CodeSystem Temporary Codes]( http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetSNOMEDCTCPTLOINCHCPCSII.html/) | local codes system defined in the context of this IG|



Additional information about the use of these artifacts can be found in the relevant specification.
