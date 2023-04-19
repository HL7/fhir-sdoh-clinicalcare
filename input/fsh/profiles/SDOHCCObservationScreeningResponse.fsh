Profile: SDOHCCObservationScreeningResponse
Parent: Observation
Id: SDOHCC-ObservationScreeningResponse
Title: "SDOHCC Observation Screening Response"
Description: "Profile for observations that represent question and answer pairs from Social Determinants of Health (SDOH) screening instruments."
* ^meta.versionId = "42"
* ^meta.lastUpdated = "2022-07-15T15:56:06.628+00:00"
* ^meta.source = "#QRz7uLOXJauimrhH"
* ^version = "0.1.0"
* ^status = #draft
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^short = "SDOH screening questionnaire observations"
* . ^definition = "For Observations derived from SDOH screening surveys/questionnaires."
* . ^comment = "Used for simple observations such as education status, food insecurity observations, etc.  \r\nThis profile allows the representation of SDOH observations based on SDOH screening questionnaire responses (which can also be represented using SDC QuestionnaireResponse). \r\n\r\nMany of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* status MS
* status from SDOHCCValueSetObservationStatus (required)
* status ^short = "final | corrected | entered-in-error | unknown"
* status ^definition = "The status of the observation value."
* status ^requirements = "Further constrained to values that are relevant for SDOH."
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^requirements = "To identify that an SDOH screening response observation is derived from an SDOH questionnaire, the “social-history” and “survey” codes are required."
* category contains
    SocialHistory 1..1 MS and
    Survey 1..1 MS and
    SDOH 0..* MS
* category[SocialHistory] = $observation-category#social-history
* category[SocialHistory] ^requirements = "Used for filtering social history observations."
* category[Survey] = $observation-category#survey
* category[Survey] ^requirements = "Used for filtering observations derived from a survey/questionnaire."
* category[SDOH] from SDOHCCValueSetSDOHCategory (required)
* category[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOH] ^definition = "An SDOH category assigned to the observation."
* category[SDOH] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to an observation. It is recommended that SDOH category codes be used to facilitate searching for SDOH observations."
* category[SDOH] ^binding.description = "Codes for high-level SDOH categories."
* code MS
* code from LOINCCodes (required)
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\nFor SDOH questions represented in LOINC that specify “check all that apply”, the LOINC question should be used for Observation.code and for Observation.component.code. For “check all that apply” questions, the answers (regardless of whether one or more are selected) should only be represented using Observation.component.value and Observation.value should be empty. \r\n\r\nAs the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set will be refined to codes that pertain to SDOH categories. "
* code ^requirements = "Knowing what kind of observation is being made is essential to understanding the observation.\r\n\r\nThe Gravity implemenation guide restricts questionnaire/survey observations to LOINC to move the industry to the use of LOINC panels/surveys (structures that are not available in other terminology systems) to standardize the coding of SDOH related risk assessment instruments. In addition, USCDI and US Core have standardized on the use of LOINC to represent Observations in general."
* code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension.valueString = "ObservationCode"
* code ^binding.description = "Codes identifying names of simple observations."
* subject 1.. MS
* subject only Reference(USCorePatientProfile)
* subject ^comment = "Cardinality is 1..1."
* effective[x] 1.. MS
* effective[x] only dateTime or Period
* effective[x] ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the \"physiologically relevant time\"."
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report."
* performer only Reference(RelatedPerson or USCorePatientProfile or USCorePractitionerProfile or USCorePractitionerRoleProfile or USCoreOrganizationProfile or USCoreCareTeam)
* performer MS
* performer ^requirements = "Some questions on an SDOH screening questionnaire are not answered directly (e.g., asserted) by the individual completing the questionnaire. Rather, the answer to some questions (e.g., the Hunger Vital Sign 88124-3 “Food insecurity risk”) may be derived from answers to one or more other questions. For a Screening Response Observation that is derived, as opposed to answered directly, Observation.performer should not be specified and Observation.derivedFrom should reference the relevant Screening Response Observation(s)."
* value[x] MS
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.rules = #open
* value[x] ^meaningWhenMissing = "Observation.value may be missing in two cases:\r\n1) For SDOH questions represented in LOINC that allow one answer, If the LOINC Normative Answer List for a LOINC code offers an adequate code for why an Observation.value may not be known, it should be used as the value for Observation.value. However, If the LOINC Normative Answer List for a LOINC code does not offer an adequate code for why an Observation.value may not be known, Observation.dataAbsentReason should be used in lieu of Observation.value.\r\n\r\n2) For SDOH questions represented in LOINC that specify “check all that apply”, the LOINC question should be used for Observation.code and for Observation.component.code. For “check all that apply” questions, the answers (regardless of whether one or more are selected) should only be represented using Observation.component.value and Observation.value should be empty."
* valueQuantity 0..1
* valueQuantity only Quantity
* valueQuantity from $v3-UnitsOfMeasureCaseSensitive (required)
* valueQuantity ^binding.description = "This is the entire UCUM code set."
* valueCodeableConcept 0..1
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from LOINCCodes (preferred)
* valueCodeableConcept ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](observation.html#notes) below.\r\n\r\nAs the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set will be refined to codes that pertain to SDOH categories."
* valueCodeableConcept ^binding.description = "This value set includes all LOINC codes"
* dataAbsentReason MS
* dataAbsentReason ^comment = "\"Null\" or exceptional values can be represented two ways in FHIR Observations.  One way is to simply include them in the value set and represent the exceptions in the value.  The alternate way is to use the value element for actual observations and use the explicit dataAbsentReason element to record exceptional values. For a given LOINC question, if the LOINC answer list includes concepts such as 'unknown' or 'not available', they should be used for Observation.value. Where these concepts are not part of the value set for Observation.value, the Observation.dataAbsentReason can be used if necessary and appropriate."
* bodySite ..0
* specimen ..0
* hasMember ^definition = "Used when an observation is a group observation (e.g., the LOINC 88121-9 Hunger Vital Sign [HVS] panel) that includes the target as a member of the group."
* derivedFrom only Reference(DocumentReference or QuestionnaireResponse or Observation)
* derivedFrom MS
* insert SliceReferenceOnProfile(derivedFrom)
* derivedFrom contains SupportedDerivedFrom 0..* MS
* derivedFrom[SupportedDerivedFrom] only Reference(SDOHCCObservationScreeningResponse or SDCQuestionnaireResponse)
* derivedFrom[SupportedDerivedFrom] ^short = "Related questionnaire responses or observations that the observation is made from"
* derivedFrom[SupportedDerivedFrom] ^definition = "Questionnaire responses or observations from which this observation value is derived."
* derivedFrom[SupportedDerivedFrom] ^requirements = "When an screening response observation is based on a survey question that is answered directly by the patient, Observation.derivedFrom should reference instances that comply with the SDC QuestionnaireResponse. When an observation is based on a survey question answer that is derived from one or more other survey question answers (as opposed to answered directly), Observation.derivedFrom should reference instances that comply with SDOHCC Screening Response Observation (e.g., observations generated from questions that were answered directly). However, references to other instance types are also possible."
* insert SliceReferenceOnProfile(hasMember)
* hasMember contains SupportedHasMember 0..* MS
* hasMember[SupportedHasMember] only Reference(SDOHCCObservationScreeningResponse or SDCQuestionnaireResponse )
* hasMember[SupportedHasMember] ^short = "For an Observation Grouping, the Observations generated from an assessment instrument"
* hasMember[SupportedHasMember] ^definition = "For an Observation Grouping, the Observations generated from an assessment instrument"
* hasMember[SupportedHasMember] ^requirements = "When an screening response observation is based on a survey question that is answered directly by the patient, Observation.hasMember should reference instances that comply with the SDC QuestionnaireResponse. When an observation is based on a survey question answer that is derived from one or more other survey question answers (as opposed to answered directly), Observation.derivedFrom should reference the instance that complies with SDOHCC Screening Response Observation (e.g., the grouper for all of the observations generated from questions that were answered directly)."
