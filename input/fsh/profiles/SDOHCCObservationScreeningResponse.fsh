Profile: SDOHCCObservationScreeningResponse
Parent: Observation
Id: SDOHCC-ObservationScreeningResponse
Title: "SDOHCC Observation Screening Response"
Description: "Profile for observations that represent question and answer pairs from Social Determinants of Health (SDOH) screening instruments."
* . ^short = "SDOH screening questionnaire observations"
* . ^definition = "For Observations derived from SDOH screening surveys/questionnaires."
* . ^comment = "Used for simple observations such as education status, food insecurity observations, etc.  \r\nThis profile allows the representation of SDOH observations based on SDOH screening questionnaire responses (which can also be represented using SDC QuestionnaireResponse). \r\n\r\nMany of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* obeys us-core-2
* . ^short = "Survey Observation"
* status MS
* status from SDOHCCValueSetObservationStatus (required)
* status ^short = "final | corrected | entered-in-error | unknown"
* status ^definition = "The status of the observation value."
* status ^requirements = "Further constrained to values that are relevant for SDOH."
* category MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^requirements = "To identify that an SDOH observation screening response  is derived from an SDOH questionnaire, the “social-history” and “survey” codes are required."
* category contains
    SocialHistory 1..1 MS and
    Survey 1..1 MS and
    screening-assessment 0..* MS and
    SDOH 0..* MS
* category[SocialHistory] = $observation-category#social-history
* category[SocialHistory] ^requirements = "Used for filtering social history observations."
* category[Survey] = $observation-category#survey
* category[Survey] ^requirements = "Used for filtering observations derived from a survey/questionnaire."
* category[screening-assessment] from USCoreScreeningAssessmentObservationCategory (required)
* category[screening-assessment] ^definition = "Categories that a provider may use in their workflow to classify that this Observation is related to a USCDI Health Status/Assessments Data Class."
* category[screening-assessment] ^requirements = "Used for filtering the type of screening or assessment observation."
* category[screening-assessment] ^binding.description = "Note that other codes are permitted, see [Required Bindings When Slicing by Value Sets](general-requirements.html#required-bindings-when-slicing-by-valuesets)"
* category[SDOH] from SDOHCCValueSetSDOHCategory (required)
* category[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOH] ^definition = "An SDOH category assigned to the observation."
* category[SDOH] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to an observation. It is recommended that SDOH category codes be used to facilitate searching for SDOH observations."
* category[SDOH] ^binding.description = "Codes for high-level SDOH categories."
* code MS
* code from USCoreSurveyCodes (required)
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation."
* code ^requirements = "Knowing what kind of observation is being made is essential to understanding the observation.\r\n\r\nThe Gravity implemenation guide restricts questionnaire/survey observations to LOINC to move the industry to the use of LOINC panels/surveys (structures that are not available in other terminology systems) to standardize the coding of SDOH related risk assessment instruments. In addition, USCDI and US Core have standardized on the use of LOINC to represent Observations in general."
* code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension.valueString = "ObservationCode"
* code ^binding.description = "Codes identifying names of simple observations."

* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.240, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, digital-literacy, http://hl7.org/fhir/ValueSet/observation-codes, required)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.199, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.191, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.205, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.193, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.194, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1196.3519, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.196, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.197, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1196.3520, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.198, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.200, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.201, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.195, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.202, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.203, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.204, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.251, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.192, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, code, Observation.category, sdoh-category-unspecified, http://hl7.org/fhir/ValueSet/observation-codes, required)



* subject 1.. MS
* subject only Reference(USCorePatientProfile or Group or USCoreLocationProfile)
* subject ^comment = "Cardinality is 1..1."
* effective[x] 1.. MS
* effective[x] only dateTime or Period
* effective[x] obeys us-core-1
* effective[x] ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the \"physiologically relevant time\"."
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report."
* effective[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* effective[x] ^type[=].extension.valueBoolean = true
* effective[x] ^condition[0] = "us-core-1"

* performer only Reference(USCoreRelatedPersonProfile or USCorePatientProfile or USCorePractitionerProfile or USCorePractitionerRoleProfile or USCoreOrganizationProfile or USCoreCareTeam)
* performer MS
* performer ^requirements = "Some questions on an SDOH screening questionnaire are not answered directly (e.g., asserted) by the individual completing the questionnaire. Rather, the answer to some questions (e.g., the Hunger Vital Sign 88124-3 “Food insecurity risk”) may be derived from answers to one or more other questions. For an Observation Screening Response  that is derived, as opposed to answered directly, Observation.performer should not be specified."
* performer ^comment = "Some questions on questionnaires are not answered directly (e.g., asserted) by the individual completing the questionnaire, but are derived from answers to one or more other questions. For types of answers, `Observation.performer` should not be specified and `Observation.derivedFrom` should reference the relevant Screening Response Observation(s)."
* value[x] MS
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.rules = #open
* value[x] ^comment = "An observation exists to have a value, though it might not if it is in error, if it represents a group of observations, or if a reason for its omission is captured by Observation.dataAbsentReason."
* value[x] ^requirements = "An observation exists to have a value, though it might not if it is in error, if it represents a group of observations, or if it a reason for its omission is captured by Observation.dataAbsentReason."
* valueQuantity 0..1
* valueQuantity only Quantity
* valueQuantity from $v3-UnitsOfMeasureCaseSensitive (required)
* valueQuantity ^binding.description = "This is the entire UCUM code set."
* valueCodeableConcept 0..1
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from LOINCCodes (preferred)
* valueCodeableConcept ^comment = "The allowed set of codes will be determined by Observation.code. A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value."
* valueCodeableConcept ^binding.description = "This value set includes all LOINC codes"
* value[x] obeys us-core-3
* value[x] ^condition[0] = "us-core-2"
* value[x] ^condition[+] = "us-core-3"

* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.239, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, digital-literacy, http://hl7.org/fhir/ValueSet/observation-codes, preferred)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.179, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.190, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.183, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.173, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.174, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.185, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.176, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.177, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.178, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.209, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.180, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.187, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.175, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.210, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.181, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.182, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.250, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.184, extensible)
* insert AdditionalBinding(SDOHCCObservationScreeningResponse, valueCodeableConcept, Observation.category, sdoh-category-unspecified, http://hl7.org/fhir/ValueSet/observation-codes, preferred)


* dataAbsentReason MS
* dataAbsentReason ^comment = "\"Null\" or exceptional values can be represented two ways in FHIR Observations.  One way is to simply include them in the value set and represent the exceptions in the value.  The alternate way is to use the value element for actual observations and use the explicit dataAbsentReason element to record exceptional values. For a given LOINC question, if the LOINC answer list includes concepts such as 'unknown' or 'not available', they should be used for Observation.value. Where these concepts are not part of the value set for Observation.value, the Observation.dataAbsentReason can be used if necessary and appropriate."
* dataAbsentReason ^condition[0] = "us-core-2"
* bodySite ..0
* specimen ..0
* hasMember ^definition = "References the child observations of a grouping observation."
* derivedFrom only Reference(USCoreDocumentReferenceProfile or USCoreQuestionnaireResponseProfile or Observation)
* derivedFrom ^definition = "The target resource represents a QuestionnaireResponse or other Observation from which the value of this Observation was inferred or calculated."
* derivedFrom MS
* insert SliceReferenceOnProfile(derivedFrom)
* derivedFrom contains SupportedDerivedFrom 0..* MS
* derivedFrom ^definition = "The target resource represents a QuestionnaireResponse or other Observation from which the value of this Observation was inferred or calculated."
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value."
* derivedFrom ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* derivedFrom ^extension.valueBoolean = true
* derivedFrom ^short = "ADDITIONAL USCDI: Related Observation(s) or other resource the observation is made from"
* derivedFrom[SupportedDerivedFrom] only Reference(Observation or USCoreQuestionnaireResponseProfile)
* derivedFrom[SupportedDerivedFrom] ^short = "Related questionnaire responses or observations that the observation is made from"
* derivedFrom[SupportedDerivedFrom] ^definition =  "The types of 'derivedFrom' resources that must be supported by implementations conforming to this IG"
* derivedFrom[SupportedDerivedFrom] ^requirements = "Allows traceability (and context) for Observations derived from a QuestionnaireResponse and also establishes links for observations that were calculated or inferred based on other Observations (e.g. for calculated scores)."
* derivedFrom[SupportedDerivedFrom] ^comment = "Additional derivation targets (as supported by the underlying Observation resource) are allowed, but there is no expectation that implementers of this IG will pay attention to them."
* insert SliceReferenceOnProfile(hasMember)
* hasMember only Reference(Observation or QuestionnaireResponse or MolecularSequence)
* hasMember contains SupportedHasMember 0..* MS
* hasMember ^short = "References the child observations of a grouping observation"
* hasMember ^definition = "Aggregate set of Observations that represent question answer pairs for both multi-question surveys, screenings, and assessments and multi-select questions."
* hasMember ^comment = "This grouping element is used to represent surveys, screenings, and assessments that group several questions together or individual questions with  “check all that apply” responses. For example in the simplest case a flat multi-question survey where the \"panel\" observation is the survey instrument itself and instead of an `Observation.value` the `hasMember` element references other Observation that represent the individual questions answer pairs. When there is a heirarchical grouping of questions, the observation \"panels\" can be nested. Because surveys, screenings, and assessments can be arbitrarily complex structurally, not all structures can be represented using this Observation grouping pattern."
* hasMember[SupportedHasMember] only Reference(SDOHCCObservationScreeningResponse)
* hasMember[SupportedHasMember] ^short = "For an Observation Grouping, the Observations generated from an assessment instrument"
* hasMember[SupportedHasMember] ^definition = "This is the set of child observations that are expected to be supported by SDOH implementations."
* hasMember[SupportedHasMember] ^requirements = "Provides context to the child observations of \"in what instrument/panel was this information collected\", which is critical in situations where the child observations do not have derivedFrom relationships to a QuestionnaireResponse."
* hasMember[SupportedHasMember] ^comment = "Other types of observations or resources can still be sent, but SDOH systems aren't required to pay attention to them."

Invariant: us-core-2
Description: "If there is no component or hasMember element then either a value[x] or a data absent reason must be present"
* severity = #error
* expression = "(component.empty() and hasMember.empty()) implies (dataAbsentReason.exists() or value.exists())"
* xpath = "exists(f:component) or exists(f:hasMember) or exists(f:*[starts-with(local-name(.), 'value')]) or exists(f:dataAbsentReason)"

Invariant: us-core-1
Description: "Datetime must be at least to day."
* severity = #error
* expression = "$this is dateTime implies $this.toString().length() >= 10"
* xpath = "f:matches(effectiveDateTime,/\\d{4}\\d{2}\\d{2}(T\\d{2}:\\d{2}:\\d{2}(\\.\\d{3})?(Z|[-+]\\d{2}:\\d{2})?)?$/)"

Invariant: us-core-3
Description: "SHALL use UCUM for coded quantity units."
* severity = #error
* expression = "ofType(Quantity).system.empty() or ofType(Quantity).system = 'http://unitsofmeasure.org'"
* xpath = "not(exists(f:valueQuantity/f:system) ) or f:valueQuantity/f:system[@value='http://unitsofmeasure.org']"