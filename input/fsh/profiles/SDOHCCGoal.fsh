Profile: SDOHCCGoal
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-goal|7.0.0
Id: SDOHCC-Goal
Title: "SDOHCC Goal"
Description: "Profile for goals that address Social Determinants of Health (SDOH)."
* ^status = #active
* . ^short = "Describes the intended SDOH-related objective(s) for a patient."
* . ^definition = "For representation of SDOH goals."
* . ^comment = "Many of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* insert OwningCommitteeExtension
* achievementStatus MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains SDOHCC 0..* MS
* category[SDOHCC] from SDOHCCValueSetSDOHCategory (required)
* category[SDOHCC] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOHCC] ^definition = "An SDOH category assigned to the goal."
* category[SDOHCC] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to a goal. It is recommended that SDOH category codes be used to facilitate searching for SDOH-related goals."
* category[SDOHCC] ^binding.description = "Codes for high-level SDOH categories."
* description from USCoreGoalCodes|7.0.0 (extensible)
* description ^comment = "If no code is available, use CodeableConcept.text.\r\n\r"
* description ^binding.description = "Codes providing the details of a particular goal.  In many systems, only the text element will be used."

* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.233, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, digital-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.225, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.55, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.65, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.70, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.30, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.16, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.121, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.159, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.161, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.50, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, incarceration-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.257, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.100, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, language-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.266, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.37, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.120, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.117, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.89, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.86, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.163, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.245, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.214, extensible)
* insert AdditionalBinding(SDOHCCGoal, description, Goal.category, sdoh-category-unspecified, http://hl7.org/fhir/us/core/ValueSet/us-core-goal-description|7.0.0, extensible)



* subject ^definition = "Identifies the patient for whom the goal is being established."
* subject only Reference(USCorePatientProfile|7.0.0)

* target.measure from LOINCCodes (preferred)
* target.measure ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* target.measure ^binding.extension.valueString = "GoalTargetMeasure"
* target.measure ^binding.description = "Codes to identify the value being tracked, e.g. body weight, blood pressure, or hemoglobin A1c level."
* statusDate ^comment = "To see the date for past statuses, query history.\r\n\r\nThe Goal Resource does not clearly specify whether Goal.statusDate applies to Goal.achievementStatus or to Goal.lifecycleStatus. For consistent use in the SDOH context, it is recommended that Goal.statusDate be synchronized with Goal.achievementStatus."
* addresses only Reference(Condition or Observation or RiskAssessment)
* addresses ^slicing.discriminator.type = #profile
* addresses ^slicing.discriminator.path = "resolve()"
* addresses ^slicing.rules = #open
* addresses contains SupportedAddresses 0..* MS
* addresses[SupportedAddresses] only Reference(SDOHCCCondition or SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
* addresses[SupportedAddresses] ^requirements = "When a goal addresses SDOH screening response observations generated from a survey/questionnaire, SDOH assessment observations, or SDOH conditions, Goal.addresses should reference instances that comply with the SDOHCC Observation Screening Response, SDOHCC Condition, or SDOHCC Observation Assessment profiles. However, references to other instance types are also possible."
// For STU3 consideration
// * addresses[SupportedAddresses] ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * addresses[SupportedAddresses] ^type[=].targetProfile[=].extension.valueBoolean = true
// * addresses[SupportedAddresses] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * addresses[SupportedAddresses] ^type[=].targetProfile[=].extension.valueBoolean = true
// * addresses[SupportedAddresses] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * addresses[SupportedAddresses] ^type[=].targetProfile[=].extension.valueBoolean = true
* outcomeCode from USCoreGoalCodes|7.0.0 (preferred)
* outcomeCode ^comment = "Note that this should not duplicate the goal status.\r\n\r\nInformation represented by Goal.outcomeCode may overlap significantly with information represented by Goal.outcomeReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is significant overlap in information provided by Goal.outcomeCode and Goal.outcomeReference, it is recommended that Goal.outcomeReference should be used to provide details of goal outcomes.\r\n\r"
* outcomeCode ^binding.description = "The result of the goal; e.g., \"Food security\", \"Has access to a car \"."
* outcomeReference ^slicing.discriminator.type = #profile
* outcomeReference ^slicing.discriminator.path = "resolve()"
* outcomeReference ^slicing.rules = #open
* outcomeReference ^comment = "The goal outcome is independent of the outcome of the related activities.  For example, if the Goal is to achieve a target body weight of 150 lb and a care plan activity is defined to diet, then the care plan’s activity outcome could be calories consumed whereas goal outcome is an observation for the actual body weight measured.\r\n\r\nAdditionally, see comments for Goal.outcomeCode."
* outcomeReference contains SupportedOutcomeReference 0..* MS
* outcomeReference[SupportedOutcomeReference] only Reference(SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
* outcomeReference[SupportedOutcomeReference] ^requirements = "When a goal outcome can be represented by SDOH screening response observations or SDOH assessment observations, Goal.outcome should reference instances that comply with the SDOHCC Observation Screening Response or SDOHCC Observation Assessment profiles. However, references to other instance types are also possible."
// For STU3 consideration
// * outcomeReference[SupportedOutcomeReference] ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * outcomeReference[SupportedOutcomeReference] ^type[=].targetProfile[=].extension.valueBoolean = true
// * outcomeReference[SupportedOutcomeReference] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * outcomeReference[SupportedOutcomeReference] ^type[=].targetProfile[=].extension.valueBoolean = true