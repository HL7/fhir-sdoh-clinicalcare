Profile: SDOHCCCondition
Parent: USCoreCondition
Id: SDOHCC-Condition
Title: "SDOHCC Condition"
Description: "Profile for Social Determinants of Health (SDOH) conditions."
* ^meta.versionId = "23"
* ^meta.lastUpdated = "2022-08-30T13:43:44.568+00:00"
* ^meta.source = "#w2NX9ggeoO7TtL08"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2020-12-14T04:01:34+00:00"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys SDOH-Con-1
* . ^short = "Detailed information about SDOH conditions, problems or diagnoses"
* . ^definition = "For representation of SDOH conditions."
* . ^comment = "Many of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths (e.g., to arrive at SDOH Conditions) are also possible.\r\n\r\nOne specific use for this profile is to represent a Health Concern that is either; 1) directly asserted based on the patient’s answer to a specific question from an SDOH screening questionnaire or 2) computed/generated based on the patient’s answers to multiple questions. The questions and answers from the screening questionnaire are also represented using SDC Questionnaire, SDC QuestionnaireResponse and SDOHCC Screening Response Observation."
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains SDOHCCExtensionConditionAsserter named asserterDevice 0..1 MS
* extension[asserterDevice] ^requirements = "For a condition that is autogenerated based on a computation that uses the patient’s answers to multiple questions on a SDOH questionnaire, this extension should be used to specify the device used to compute the condition."
* extension[asserterDevice] ^condition = "SDOH-Con-1"
* extension[asserterDevice].value[x] only Reference(Device)
* verificationStatus ^comment = "verificationStatus is not required.  For example, when a patient complains of stress during a provider encounter, there is not likely going to be a verification status. The data type is CodeableConcept because verificationStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity.\r\n\r\nFor SDOH conditions that are autogenerated based on a questionnaire response, the Condition.asserter is a “Device” AND Condition.Category should be \"health-concern\". In that case, Condition.verificationStatus should be \"unconfirmed\" and should be changed to “confirmed” only after review and concurrence by the provider and patient."
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^requirements = "For a condition that is autogenerated based only on an individual's responses to an SDOH questionnaire, category should be \"health-concern\"."
* category contains SDOH 0..*
* category[SDOH] from SDOHCCValueSetSDOHCategory (required)
* category[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOH] ^definition = "An SDOH category assigned to the condition."
* category[SDOH] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to a condition. It is recommended that SDOH category codes be used to facilitate searching for SDOH conditions."
* category[SDOH] ^binding.description = "Codes for high-level SDOH categories."
* code from USCoreConditionCode (required)
* code ^comment = "As the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set will be refined to codes that pertain to SDOH categories. For further guidance on external value sets vetted by the Gravity Project see: [SDOH terminology guidance](support_for_multiple_domains.html#external-value-set-guidance)"
* code ^requirements = "Code is required and must be selected from the bound value set."
* code ^binding.description = "Valueset to describe the actual problem experienced by the patient"
* bodySite ..0
* subject ^definition = "Indicates the patient who the condition record is associated with."
* subject ^requirements = "US Core Condition Profile restricts subject to patient."
* onset[x] only dateTime or Period
* onset[x] MS
* onset[x] ^short = "Estimated dateTime or Period"
* onset[x] ^definition = "Estimated or actual dateTime or Period the condition began."
* onset[x] ^comment = "For SDOH conditions that have their onset over an extended (or fuzzy) period (e.g., the past month), Condition.onset may use a lower precision representation (e.g., month/year or year) as opposed to a higher precision representation (e.g., year/month/date/hour/min)."
* abatement[x] only dateTime or Period
* abatement[x] MS
* abatement[x] ^definition = "The estimated or actual dateTime or Period that the condition resolved or went into remission. This is called \"abatement\" because of the many overloaded connotations associated with \"remission\" or \"resolution\"."
* abatement[x] ^comment = "There is no explicit distinction between resolution and remission because in many cases the distinction is not clear. If there is no abatement element, it is unknown whether the condition has resolved or entered remission; applications and users should generally assume that the condition is still valid.  When abatementString exists, it implies the condition is abated.\r\n\r\nFor SDOH Conditions that have a fuzzy abatement period, a lower precision representation (e.g., month/year or year) may be used. However, for SDOH Conditions that end at a specific point in time (e.g., food insecurity may abate upon acquiring a new job or gaining eligibility to a food program) a higher precision representation (e.g., year/month/date) may also be used."
* recorder only Reference(Practitioner or PractitionerRole)
* recorder ^requirements = "For a condition that is autogenerated based on a QuestionnaireResponse, the AsserterDevice extension should be used to specify the device used to compute the condition and recorder should be empty."
* asserter only Reference(RelatedPerson or USCorePatientProfile or USCorePractitionerProfile or USCorePractitionerRoleProfile)
* asserter MS
* asserter ^short = "Person or device that asserts this condition"
* asserter ^definition = "The individual or device making the condition statement."
* asserter ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\nFor a condition that is autogenerated based on the patient directly answering a specific question from an SDOH screening questionnaire, the Condition.asserter should be the patient. For a condition that is autogenerated based on a computation that uses the patient’s answers to multiple questions, Condition.asserter should reference “Device” (using the using AsserterDevice extension) to specify the device used to compute the condition."
* asserter ^condition = "SDOH-Con-1"
* stage ..0
* evidence MS
* evidence.code ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nInformation represented by Condition.evidence.code may overlap significantly with information represented by Condition.evidence.detail. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where similar infomation could be provided by either Condition.evidence.code or Condition.evidence.detail, it is recommended that Condition.evidence.detail should be used as supporting evidence for the condition.\r\n\r\nAs the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set may be refined to codes that pertain to SDOH categories."
* evidence.detail ^slicing.discriminator.type = #profile
* evidence.detail ^slicing.discriminator.path = "resolve()"
* evidence.detail ^slicing.rules = #open
* evidence.detail ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\nAdditionally, see Comment for Condition.evidence.code."
* evidence.detail contains SupportedDetail 0..* MS
* evidence.detail[SupportedDetail] only Reference(SDOHCCObservationScreeningResponse or SDOHCCCondition or SDOHCCObservationAssessment)
* evidence.detail[SupportedDetail] ^definition = "Links to other relevant information."
* evidence.detail[SupportedDetail] ^requirements = "When a condition is based on one or more SDOH observations that were generated from questionnaire responses, Condition.evidence.detail should reference instances that comply with the SDOHCC Screening Response Observation. However, references to other instance types are also possible."