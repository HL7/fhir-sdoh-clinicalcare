Profile: SDOHCCGoal
Parent: USCoreGoalProfile
Id: SDOHCC-Goal
Title: "SDOHCC Goal"
Description: "Profile for goals that address Social Determinants of Health (SDOH)."
* ^meta.versionId = "10"
* ^meta.lastUpdated = "2022-07-15T15:56:06.624+00:00"
* ^meta.source = "#q51JsnZHYKCe1D8O"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2020-12-14T04:01:34+00:00"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^short = "Describes the intended SDOH-related objective(s) for a patient."
  * ^definition = "For representation of SDOH goals."
  * ^comment = "Many of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* achievementStatus MS
* category ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains SDOH 0..* MS
* category[SDOH] from SDOHCCValueSetSDOHCategory (required)
  * ^short = "e.g., food-insecurity | transportation-insecurity"
  * ^definition = "An SDOH category assigned to the goal."
  * ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to a goal. It is recommended that SDOH category codes be used to facilitate searching for SDOH-related goals."
  * ^binding.description = "Codes for high-level SDOH categories."
* description from SDOHCCValueSetLOINCSNOMEDCT (preferred)
  * ^comment = "If no code is available, use CodeableConcept.text.\r\n\r\nAs the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set will be refined to codes that pertain to SDOH categories. For further guidance on external value sets vetted by the Gravity Project see: [SDOH terminology guidance](support_for_multiple_domains.html#external-value-set-guidance)"
  * ^binding.description = "Codes providing the details of a particular goal.  In many systems, only the text element will be used."
* subject ^definition = "Identifies the patient for whom the goal is being established."
* target.measure ^binding.strength = #preferred
* statusDate ^comment = "To see the date for past statuses, query history.\r\n\r\nThe Goal Resource does not clearly specify whether Goal.statusDate applies to Goal.achievementStatus or to Goal.lifecycleStatus. For consistent use in the SDOH context, it is recommended that Goal.statusDate be synchronized with Goal.achievementStatus."
* addresses only Reference(Condition or Observation or RiskAssessment)
  * ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resolve()"
  * ^slicing.rules = #open
* addresses contains SupportedAddresses 0..* MS
* addresses[SupportedAddresses] only Reference(SDOHCCCondition or SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
  * ^requirements = "When a goal addresses SDOH screening response observations generated from a survey/questionnaire, SDOH assessment observations, or SDOH conditions, Goal.addresses should reference instances that comply with the SDOHCC Screening Response Observation, SDOHCC Condition, or SDOHCC Assessment Observation profiles. However, references to other instance types are also possible."
* outcomeCode from SDOHCCValueSetLOINCSNOMEDCT (preferred)
  * ^comment = "Note that this should not duplicate the goal status.\r\n\r\nInformation represented by Goal.outcomeCode may overlap significantly with information represented by Goal.outcomeReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is significant overlap in information provided by Goal.outcomeCode and Goal.outcomeReference, it is recommended that Goal.outcomeReference should be used to provide details of goal outcomes.\r\n\r\nAs the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set may be refined to codes that pertain to SDOH categories."
  * ^binding.description = "The result of the goal; e.g., \"Food security\", \"Has access to a car \"."
* outcomeReference ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resolve()"
  * ^slicing.rules = #open
  * ^comment = "The goal outcome is independent of the outcome of the related activities.  For example, if the Goal is to achieve a target body weight of 150 lb and a care plan activity is defined to diet, then the care plan’s activity outcome could be calories consumed whereas goal outcome is an observation for the actual body weight measured.\r\n\r\nAdditionally, see comments for Goal.outcomeCode."
* outcomeReference contains SupportedOutcomeReference 0..* MS
* outcomeReference[SupportedOutcomeReference] only Reference(SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
  * ^requirements = "When a goal outcome can be represented by SDOH screening response observations or SDOH assessment observations, Goal.outcome should reference instances that comply with the SDOHCC Screening Response Observation or SDOHCC Assessment Observation profiles. However, references to other instance types are also possible."