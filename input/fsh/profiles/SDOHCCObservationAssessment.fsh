Profile: SDOHCCObservationAssessment
Parent: USCoreSimpleObservationProfile
Id: SDOHCC-ObservationAssessment
Title: "SDOHCC Observation Assessment"
Description: "Profile for Social Determinants of Health (SDOH) observations that involve assessment (e.g., by a provider, payer, etc.) as opposed to being derived only from screening surveys (as is the case for the SDOHCC Screening Response Observation)."
* ^status = #active
* ^abstract = false
* . ^short = "SDOH assessment observation"
* . ^definition = "For SDOH observations derived from assessment of the individual."
* . ^comment = "For representation of SDOH observations that involve assessment (e.g., by a provider or payer) as opposed to being derived only from screening surveys (as is the case for the SDOHCC Observation Screening Response).\r\n\r\nMany of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* obeys us-core-2
* insert OwningCommitteeExtension

* status MS
* category 2.. MS
//* category ^slicing.discriminator.type = #pattern
//* category ^slicing.discriminator.path = "$this"
//* category ^slicing.rules = #open
* category contains
    // us-core 1..1 MS and
    // SocialHistory 1..1 MS and
    SDOHCC 0..* MS



* category[us-core] ^slicing.discriminator.type = #pattern
* category[us-core] ^slicing.discriminator.path = "$this"
* category[us-core] ^slicing.rules = #open
* category[us-core] ^short = "sdoh category code"
* category[us-core] contains 
    sdoh 1..1 MS



* category[us-core][sdoh] = USCoreCategory#sdoh
* category[us-core][sdoh] from USCoreSimpleObservationCategory (required)
* category[us-core][sdoh] ^short = "us-core code of 'sdoh' required and others allowed as part of 'us-core' slice."



// * category[SocialHistory] = $observation-category#social-history
// * category[SocialHistory] ^requirements = "Used for filtering that this is a social history observation."
* category[SDOHCC] from SDOHCCValueSetSDOHCategory (required)
* category[SDOHCC] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOHCC] ^definition = "An SDOH category assigned to the observation."
* category[SDOHCC] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to an observation. It is recommended that SDOH category codes be used to facilitate searching for SDOH observations."
* category[SDOHCC] ^binding.description = "Codes for high-level SDOH categories."
* code MS
* code from SDOHCCValueSetLOINCSNOMEDCT (preferred)
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\nAs the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set binding strength may change and may be refined to codes (including LOINC and SNOMED) that pertain to SDOH categories."
* subject 1.. MS
* subject only Reference(USCorePatientProfile or Group)
* effective[x] only dateTime or Period or Timing or instant
* effective[x] MS
* effective[x] ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g., human patients - this is usually called the \"physiologically relevant time\"."
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing] datatype which allow the measurement to be tied to regular life events. NOTE: dateTime is Must Support, but currently tooling does not support this."
* performer only Reference(USCoreRelatedPersonProfile or USCorePatientProfile or USCorePractitionerProfile or SDOHCCPractitionerRole or USCoreOrganizationProfile or USCoreCareTeam)
* performer MS
* performer ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository. NOTE: US Core Practitioner is Must Support, but currently tooling does not support this."
* value[x] only Quantity or CodeableConcept or string or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
* value[x] MS
* derivedFrom only Reference(Observation or USCoreDocumentReferenceProfile or USCoreQuestionnaireResponseProfile or ImagingStudy or Media or MolecularSequence)
* derivedFrom ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* derivedFrom ^extension.valueBoolean = true
* derivedFrom ^short = "ADDITIONAL USCDI: US Core Profiles or other resource the observation is made from"
* derivedFrom ^definition = "US Core Observations, DocumentReference, QuestionnaireResponse or other resource from which this observation value is derived."
* derivedFrom ^mustSupport = false

Invariant: us-core-2
Description: "If there is no component or hasMember element then either a value[x] or a data absent reason must be present"
* severity = #error
* expression = "(component.empty() and hasMember.empty()) implies (dataAbsentReason.exists() or value.exists())"
* xpath = "exists(f:component) or exists(f:hasMember) or exists(f:*[starts-with(local-name(.), 'value')]) or exists(f:dataAbsentReason)"

// US Core 7.0.0
// * status MS
// * category 1.. MS
// * category ^slicing.discriminator.type = #pattern
// * category ^slicing.discriminator.path = "$this"
// * category ^slicing.rules = #open
// * category contains 
//     us-core 0..* MS and
//     SocialHistory 1..1 MS and
//     SDOH 0..* MS

// * category[us-core] from USCoreSimpleObservationCategory (required)
// * category[us-core] ^min = 0
//* category[us-core] ^binding.description = "Note that other codes are permitted"



// SDOH CC
// * category[SocialHistory] = $observation-category#social-history
// * category[SocialHistory] ^requirements = "Used for filtering that this is a social history observation."
// * category[SDOH] from SDOHCCValueSetSDOHCategory (required)
// * category[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
// * category[SDOH] ^definition = "An SDOH category assigned to the observation."
// * category[SDOH] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to an observation. It is recommended that SDOH category codes be used to facilitate searching for SDOH observations."
// * category[SDOH] ^binding.description = "Codes for high-level SDOH categories."



// US Core 7.0.0
// * code MS
//* code ^binding.strength = #preferred



// SDOH CC
// * code from SDOHCCValueSetLOINCSNOMEDCT (preferred)
// * code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\nAs the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set binding strength may change and may be refined to codes (including LOINC and SNOMED) that pertain to SDOH categories."



// US Core 7.0.0
// * subject 1.. MS
//* subject only Reference($us-core-patient or Group or Device or $us-core-location)



// SDOH CC
// * subject only Reference(USCorePatientProfile or Group)



// US Core 7.0.0
// * subject ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * subject ^type[=].targetProfile[=].extension.valueBoolean = true
// * subject ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * subject ^type[=].targetProfile[=].extension.valueBoolean = false
//* subject ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type[=].targetProfile[=].extension.valueBoolean = false
//* subject ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type[=].targetProfile[=].extension.valueBoolean = false



// * effective[x] only dateTime or Period or Timing or instant
// * effective[x] MS
// * effective[x] ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g., human patients - this is usually called the \"physiologically relevant time\"."
// //* effective[x] ^comment = "At least a date should be present unless this observation is a historical report."
// * effective[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * effective[x] ^type[=].extension.valueBoolean = true



// SDOH CC
// * effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing] datatype which allow the measurement to be tied to regular life events. NOTE: dateTime is Must Support, but currently tooling does not support this."



// US Core 7.0.0
//* performer only Reference($us-core-practitioner or $us-core-organization or $us-core-patient or PractitionerRole or $us-core-careteam or $us-core-relatedperson)
//* performer MS
//* performer ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* performer ^type[=].targetProfile[=].extension.valueBoolean = false
//* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* performer ^type[=].targetProfile[=].extension.valueBoolean = false
//* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* performer ^type[=].targetProfile[=].extension.valueBoolean = false
//* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* performer ^type[=].targetProfile[=].extension.valueBoolean = false
//* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* performer ^type[=].targetProfile[=].extension.valueBoolean = false
//* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* performer ^type[=].targetProfile[=].extension.valueBoolean = false



// SDOH CC
// * performer only Reference(USCoreRelatedPersonProfile or USCorePatientProfile or USCorePractitionerProfile or USCorePractitionerRoleProfile or USCoreOrganizationProfile or USCoreCareTeam)
// * performer MS
// * performer ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository. NOTE: US Core Practitioner is Must Support, but currently tooling does not support this."



// US Core 7.0.0
// * value[x] only Quantity or CodeableConcept or string or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
// * value[x] MS
// * value[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * value[x] ^type[=].extension.valueBoolean = true
// * value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * value[x] ^type[=].extension.valueBoolean = true
// * value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * value[x] ^type[=].extension.valueBoolean = true
// * value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * value[x] ^type[=].extension.valueBoolean = true



// US Core 7.0.0
//* derivedFrom only Reference(Observation or $us-core-documentreference or $us-core-questionnaireresponse or ImagingStudy or Media or MolecularSequence)
//* derivedFrom ^extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* derivedFrom ^extension[=].valueBoolean = true
//* derivedFrom ^short = "𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: US Core Profiles or other resource the observation is made from"
//* derivedFrom ^definition = "US Core Observations, DocumentReference, QuestionnaireResponse or other resource from which this observation value is derived."
//* derivedFrom ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* derivedFrom ^type[=].targetProfile[=].extension.valueBoolean = false
//* derivedFrom ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* derivedFrom ^type[=].targetProfile[=].extension.valueBoolean = false
//* derivedFrom ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* derivedFrom ^type[=].targetProfile[=].extension.valueBoolean = false
//* derivedFrom ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* derivedFrom ^type[=].targetProfile[=].extension.valueBoolean = false
//* derivedFrom ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* derivedFrom ^type[=].targetProfile[=].extension.valueBoolean = false
//* derivedFrom ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* derivedFrom ^type[=].targetProfile[=].extension.valueBoolean = false
//* derivedFrom ^mustSupport = false





// SDOH CC
// * derivedFrom only Reference(Observation or USCoreDocumentReferenceProfile or USCoreQuestionnaireResponseProfile or ImagingStudy or Media or MolecularSequence)
// * derivedFrom ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
// * derivedFrom ^extension.valueBoolean = true
//* derivedFrom ^short = "ADDITIONAL USCDI: US Core Profiles or other resource the observation is made from"
//* derivedFrom ^definition = "US Core Observations, DocumentReference, QuestionnaireResponse or other resource from which this observation value is derived."
// * derivedFrom ^mustSupport = false





