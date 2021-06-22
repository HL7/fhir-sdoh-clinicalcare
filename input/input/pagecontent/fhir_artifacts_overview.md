###  Artifact Lists

Complying with this implementation guide means complying with a number of profiles, code systems, and value sets. This page provides an overview of where the relevant information can be found.

The FHIR artifacts used by the SDOH Clinicalcare IG are organized, in this section, based on the origin of the content (e.g. part of the US Core implementation guide or specific to this implementation guide).

**SDOH Clinicalcare IG specific Artifacts that do not have [US Core R4](http://build.fhir.org/ig/HL7/US-Core-R4/) profiles**

* [Observation](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Observation-ScreeningResponseBase-1.html)
* [ServiceRequest](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ServiceRequest-Base-1.html)
* [Task](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Task-Base-1.html)
* [Consent](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Consent.html)
* [Group](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Group.html)

**SDOH Clinicalcare IG specific Artifacts based on [US Core R4](http://build.fhir.org/ig/HL7/US-Core-R4) profiles**

* [Condition](https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Condition-Base-1.html)
* [Goal](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Goal-Base-1.html)
* [Procedure](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Procedure-Base-1.html)

**[US Core R4](http://build.fhir.org/ig/HL7/US-Core-R4) profiles referenced by the above resources**

* [Patient](http://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-patient.html)
* [Practitioner](http://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-practitioner.html)
* [PractitionerRole](http://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-practitionerrole.html)
* [Organization](http://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-organization.html)
* [Location](http://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-location.html)

Additional information about the use of these artifacts can be found in the relevant specification.

**The artifacts are of three types**:

* 	**[Profiles](http://www.hl7.org/fhir/profiling.html)** that constrain FHIR resources to reflect SDOH requirements.
* 	**[Code Systems](http://www.hl7.org/fhir/terminologies-systems.html)** that define SDOH-specific terminologies to be used in one or more of the profiles.
* 	**[Value Sets](http://www.hl7.org/fhir/terminologies-valuesets.html)** that define the specific subsets of both SDOH-defined and other code systems that can be (or are recommended to be) used within one or more profile elements.

