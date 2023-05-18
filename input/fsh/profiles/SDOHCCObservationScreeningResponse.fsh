Profile: SDOHCCObservationScreeningResponse
Parent: Observation
Id: SDOHCC-ObservationScreeningResponse
Title: "SDOHCC Observation Screening Response"
Description: "Profile for observations that represent question and answer pairs from Social Determinants of Health (SDOH) screening instruments."
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
* category ^requirements = "To identify that an SDOH observation screening response  is derived from an SDOH questionnaire, the “social-history” and “survey” codes are required."
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
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation."
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
* performer ^requirements = "Some questions on an SDOH screening questionnaire are not answered directly (e.g., asserted) by the individual completing the questionnaire. Rather, the answer to some questions (e.g., the Hunger Vital Sign 88124-3 “Food insecurity risk”) may be derived from answers to one or more other questions. For an Observation Screening Response  that is derived, as opposed to answered directly, Observation.performer should not be specified and Observation.derivedFrom should reference the relevant Screening Response Observation(s)."
* value[x] MS
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.rules = #open
* value[x] ^meaningWhenMissing = "Observation.value may be missing if the LOINC Normative Answer List for a LOINC code does not offer an adequate code for why an Observation.value may not be known. In this case, Observation.dataAbsentReason should be used in lieu of Observation.value"
* value[x] ^requirements = "An observation exists to have a value, though it might not if it is in error, if it represents a group of observations, or if it a reason for its omission is captured by Observation.dataAbsentReason."
* valueQuantity 0..1
* valueQuantity only Quantity
* valueQuantity from $v3-UnitsOfMeasureCaseSensitive (required)
* valueQuantity ^binding.description = "This is the entire UCUM code set."
* valueCodeableConcept 0..1
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from LOINCCodes (preferred)
* valueCodeableConcept ^comment = "An observation may have; 1) a single value here, 2) both a value and a set of related or component values, 3) only a set of related or component values, or 4) no value or components and an Observation.dataAbsentReason instead. If a value is present, the datatype for this element should be determined by Observation.code.  Observation.dataAbsentReason SHALL only be used in place of Observation.value if the answer list corresponding to the Observation.code does not allow conveying the appropriate reason why a ‘normal’ Observation.value is not known or available. For additional guidance, see the [Notes section](observation.html#notes) below."
* valueCodeableConcept ^binding.description = "This value set includes all LOINC codes"
* dataAbsentReason MS
* dataAbsentReason ^comment = "\"Null\" or exceptional values can be represented two ways in FHIR Observations.  One way is to simply include them in the value set and represent the exceptions in the value.  The alternate way is to use the value element for actual observations and use the explicit dataAbsentReason element to record exceptional values. For a given LOINC question, if the LOINC answer list includes concepts such as 'unknown' or 'not available', they should be used for Observation.value. Where these concepts are not part of the value set for Observation.value, the Observation.dataAbsentReason can be used if necessary and appropriate."
* bodySite ..0
* specimen ..0
* hasMember ^definition = "References the child observations of a grouping observation."
* derivedFrom only Reference(DocumentReference or QuestionnaireResponse or Observation)
* derivedFrom ^definition = "The target resource represents a QuestionnaireResponse or other Observation from which the value of this Observation was inferred or calculated."
* derivedFrom MS
* insert SliceReferenceOnProfile(derivedFrom)
* derivedFrom contains SupportedDerivedFrom 0..* MS
* derivedFrom ^definition = "The target resource represents a QuestionnaireResponse or other Observation from which the value of this Observation was inferred or calculated."
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value."
* derivedFrom[SupportedDerivedFrom] only Reference(SDOHCCObservationScreeningResponse or SDCQuestionnaireResponse)
* derivedFrom[SupportedDerivedFrom] ^short = "Related questionnaire responses or observations that the observation is made from"
* derivedFrom[SupportedDerivedFrom] ^definition =  "The types of 'derivedFrom' resources that must be supported by implementations conforming to this IG"
* derivedFrom[SupportedDerivedFrom] ^requirements = "Allows traceability (and context) for Observations derived from a QuestionnaireResponse and also establishes links for observations that were calculated or inferred based on other Observations (e.g. for calculated scores)."
* derivedFrom[SupportedDerivedFrom] ^comment = "Additional derivation targets (as supported by the underlying Observation resource) are allowed, but there is no expectation that implementers of this IG will pay attention to them."
* insert SliceReferenceOnProfile(hasMember)
* hasMember contains SupportedHasMember 0..* MS
* hasMember ^short = "References the child observations of a grouping observation"
* hasMember[SupportedHasMember] only Reference(SDOHCCObservationScreeningResponse )
* hasMember[SupportedHasMember] ^short = "For an Observation Grouping, the Observations generated from an assessment instrument"
* hasMember[SupportedHasMember] ^definition = "This is the set of child observations that are expected to be supported by SDOH implementations."
* hasMember[SupportedHasMember] ^requirements = "Provides context to the child observations of \"in what instrument/panel was this information collected\", which is critical in situations where the child observations do not have derivedFrom relationships to a QuestionnaireResponse."
* hasMember[SupportedHasMember] ^comment = "Other types of observations or resources can still be sent, but SDOH systems aren't required to pay attention to them."