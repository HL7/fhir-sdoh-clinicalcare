Profile: SDOHCCGoal
Parent: USCoreGoalProfile
Id: SDOHCC-Goal
Title: "SDOHCC Goal"
Description: "Profile for goals that address Social Determinants of Health (SDOH)."
* ^status = #draft
* . ^short = "Describes the intended SDOH-related objective(s) for a patient."
* . ^definition = "For representation of SDOH goals."
* . ^comment = "Many of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* achievementStatus MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains SDOH 0..* MS
* category[SDOH] from SDOHCCValueSetSDOHCategory (required)
* category[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOH] ^definition = "An SDOH category assigned to the goal."
* category[SDOH] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to a goal. It is recommended that SDOH category codes be used to facilitate searching for SDOH-related goals."
* category[SDOH] ^binding.description = "Codes for high-level SDOH categories."
* description from SDOHCCValueSetLOINCSNOMEDCT (preferred)
* description ^comment = "If no code is available, use CodeableConcept.text.\r\n\r"
* description ^binding.description = "Codes providing the details of a particular goal.  In many systems, only the text element will be used."
* subject ^definition = "Identifies the patient for whom the goal is being established."
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
* outcomeCode from SDOHCCValueSetLOINCSNOMEDCT (preferred)
* outcomeCode ^comment = "Note that this should not duplicate the goal status.\r\n\r\nInformation represented by Goal.outcomeCode may overlap significantly with information represented by Goal.outcomeReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is significant overlap in information provided by Goal.outcomeCode and Goal.outcomeReference, it is recommended that Goal.outcomeReference should be used to provide details of goal outcomes.\r\n\r"
* outcomeCode ^binding.description = "The result of the goal; e.g., \"Food security\", \"Has access to a car \"."
* outcomeReference ^slicing.discriminator.type = #profile
* outcomeReference ^slicing.discriminator.path = "resolve()"
* outcomeReference ^slicing.rules = #open
* outcomeReference ^comment = "The goal outcome is independent of the outcome of the related activities.  For example, if the Goal is to achieve a target body weight of 150 lb and a care plan activity is defined to diet, then the care plan’s activity outcome could be calories consumed whereas goal outcome is an observation for the actual body weight measured.\r\n\r\nAdditionally, see comments for Goal.outcomeCode."
* outcomeReference contains SupportedOutcomeReference 0..* MS
* outcomeReference[SupportedOutcomeReference] only Reference(SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
* outcomeReference[SupportedOutcomeReference] ^requirements = "When a goal outcome can be represented by SDOH screening response observations or SDOH assessment observations, Goal.outcome should reference instances that comply with the SDOHCC Observation Screening Response or SDOHCC Observation Assessment profiles. However, references to other instance types are also possible."