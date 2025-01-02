Profile: SDOHCCCondition
Parent: Condition
Id: SDOHCC-Condition
Title: "SDOHCC Condition"
Description: "Profile for Social Determinants of Health (SDOH) conditions."


// TODO Add narrative rehgarding the difference between the screening assessment category of SDOH (broader) and the SDOH Categories with SDOH unspecified. May need help from 
// TODO do a check with STU 2.2, making sure I didn'yt accidentally reduce the requirements like I did with types onset and abatement
// TODO do cross US Core version analysis with looking at invariants

// TODO Add ticket for MS on Condition.category:SDOH to make the change in this version
// TODO Add a ticket to consider adding Group as a possible Condition.subject

// SDOH CC
* obeys SDOH-Con-1
* . ^short = "Detailed information about SDOH conditions, problems or diagnoses"
* . ^definition = "For representation of SDOH conditions."
* . ^comment = "Many of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths (e.g., to arrive at SDOH Conditions) are also possible.\r\n\r\nOne specific use for this profile is to represent a Health Concern that is either; 1) directly asserted based on the patient’s answer to a specific question from an SDOH screening questionnaire or 2) computed/generated based on the patient’s answers to multiple questions. The questions and answers from the screening questionnaire are also represented using SDC Questionnaire, SDC QuestionnaireResponse and SDOHCC Screening Response Observation."
* insert OwningCommitteeExtension
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains SDOHCCExtensionConditionAsserter named asserterDevice 0..1 MS
//* extension[asserterDevice] ^requirements = "For a condition that is autogenerated based on a computation that uses the patient’s answers to multiple questions on a SDOH questionnaire, this extension should be used to specify the device used to compute the condition."
* extension[asserterDevice] ^condition = "SDOH-Con-1"
* extension[asserterDevice].value[x] only Reference(Device)


// US Core 7.0.0
* meta MS
* meta.lastUpdated MS
* meta.lastUpdated ^short = "When the resource last changed"
* extension contains ConditionAssertedDate named assertedDate 0..1 MS
* extension[assertedDate] ^short = "Date the condition was first asserted"
* clinicalStatus MS
* clinicalStatus from ConditionClinicalStatusCodes (required)
* verificationStatus MS
* verificationStatus from ConditionVerificationStatus (required)



// SDOH CC
* verificationStatus ^comment = "verificationStatus is not required.  For example, when a patient complains of stress during a provider encounter, there is not likely going to be a verification status. The data type is CodeableConcept because verificationStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity.\r\n\r\nFor SDOH conditions that are autogenerated based on a questionnaire response, the Condition.asserter is a “Device” AND Condition.Category should be \"health-concern\". In that case, Condition.verificationStatus should be \"unconfirmed\" and should be changed to “confirmed” only after review and concurrence by the provider and patient."



// US Core 7.0.0
* category MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^short = "category codes"
* category contains
    encounter-diagnosis 0..1 MS and
    problem-or-health-concern 0..* MS and
    screening-assessment 0..* MS and
    SDOH 0..*

// TODO need to supplort slicing that either encounter diagnosis or "healthconcern orproblem list item" is required (through an invariant)

* category[encounter-diagnosis] = ConditionCategoryCodes#encounter-diagnosis

//* category[encounter-diagnosis] ^binding.description = "Note that other codes are permitted"

// TODO Make sure the full sub element pattern shows up like in   https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-condition-encounter-diagnosis.html


* category[problem-or-health-concern] from USCoreProblemOrHealthConcern (required)
* category[problem-or-health-concern] ^short = "problem-list-item | health-concern"
//* category[problem-or-health-concern] ^binding.description = "Note that other codes are permitted"



* category[screening-assessment] from USCoreScreeningAssessmentConditionCategory (required)
* category[screening-assessment] ^short = "USCDI Health Status/Assessments Data Class"
* category[screening-assessment] ^definition = "Categories that a provider may use in their workflow to classify that this Condition is related to a USCDI Health Status/Assessments Data Class."
* category[screening-assessment] ^requirements = "Used for filtering condition"
//* category[screening-assessment] ^binding.description = "Note that other codes are permitted"



// SDOH CC
* category[SDOH] from SDOHCCValueSetSDOHCategory (required)
* category[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOH] ^definition = "An SDOH category assigned to the condition."
* category[SDOH] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to a condition. It is recommended that SDOH category codes be used to facilitate searching for SDOH conditions."
* category[SDOH] ^binding.description = "Codes for high-level SDOH categories."



// US Core 7.0.0
* code 1.. MS
* code from USCoreConditionCodes (required)
* code ^binding.extension.extension[0].url = "purpose"
* code ^binding.extension.extension[=].valueCode = #current
* code ^binding.extension.extension[+].url = "valueSet"
* code ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code"
// * code ^binding.extension.extension[+].url = "usage"
// * code ^binding.extension.extension[=].valueUsageContext = "* this is an artifact from US Core 7.0.0"
* code ^binding.extension.extension[+].url = "documentation"
* code ^binding.extension.extension[=].valueMarkdown = "US Core uses the current additional binding from FHIR R5 for this coded element for more flexibility when exchanging legacy and text-only data."
* code ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.description = "Valueset to describe the actual problem experienced by the patient"



// SDOH CC
* code ^requirements = "Code is required and must be selected from the bound value set."
* code ^binding.description = "Valueset to describe the actual problem experienced by the patient"

* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.231, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, digital-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.224, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.103, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.63, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.42, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.108, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.17, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.148, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.18, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.24, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.48, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, incarceration-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.258, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.84, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, language-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.262, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.35, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.153, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.116, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.81, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.75, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.26, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.243, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.78, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, sdoh-category-unspecified, http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code, required)



2.16.840.1.113762.1.4.1247.258




* bodySite ..0

* subject MS
* subject only Reference(USCorePatientProfile)
* encounter MS
* encounter only Reference(USCoreEncounterProfile)

// US Core 7.0.0
//* subject MS
//* subject only Reference(USCorePatientProfile or Group)

//* subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = true
//* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = false



* onset[x] only dateTime or Period
* onset[x] MS
* onset[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* onset[x] ^type.extension.valueBoolean = true
* abatement[x] only dateTime or Period
* abatement[x] MS
* abatement[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* abatement[x] ^type.extension.valueBoolean = true



/*
// US Core 7.0.0
* subject only Reference(USCorePatientProfile)
* subject MS
* subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = true
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false

* encounter MS
* encounter only Reference(USCoreEncounterProfile)

* onset[x] only dateTime or Period
* onset[x] MS
* onset[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* onset[x] ^type.extension.valueBoolean = true
* abatement[x] only dateTime or Period
* abatement[x] MS
* abatement[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* abatement[x] ^type.extension.valueBoolean = true

*/

// SDOH CC
* abatement[x] ^definition = "The estimated or actual dateTime or Period that the condition resolved or went into remission. This is called \"abatement\" because of the many overloaded connotations associated with \"remission\" or \"resolution\"."
* abatement[x] ^comment = "There is no explicit distinction between resolution and remission because in many cases the distinction is not clear. If there is no abatement element, it is unknown whether the condition has resolved or entered remission; applications and users should generally assume that the condition is still valid.  When abatementString exists, it implies the condition is abated.\r\n\r\nFor SDOH Conditions that have a fuzzy abatement period, a lower precision representation (e.g., month/year or year) may be used. However, for SDOH Conditions that end at a specific point in time (e.g., food insecurity may abate upon acquiring a new job or gaining eligibility to a food program) a higher precision representation (e.g., year/month/date) may also be used."

* recorder only Reference(Practitioner or PractitionerRole)
//* recorder ^requirements = "For a condition that is autogenerated based on a QuestionnaireResponse, the AsserterDevice extension should be used to specify the device used to compute the condition and recorder should be empty."
* asserter only Reference(RelatedPerson or USCorePatientProfile or USCorePractitionerProfile or SDOHCCPractitionerRole)
* asserter MS
* asserter ^short = "Person or device that asserts this condition"
* asserter ^definition = "The individual or device making the condition statement."
* asserter ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\nFor a condition that is autogenerated based on the patient directly answering a specific question from an SDOH screening questionnaire, the Condition.asserter should be the patient. For a condition that is autogenerated based on a computation that uses the patient’s answers to multiple questions, Condition.asserter should reference “Device” (using the using AsserterDevice extension) to specify the device used to compute the condition."
* asserter ^condition = "SDOH-Con-1"
* stage ..0
* evidence MS
* evidence.code ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nInformation represented by Condition.evidence.code may overlap significantly with information represented by Condition.evidence.detail. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where similar infomation could be provided by either Condition.evidence.code or Condition.evidence.detail, it is recommended that Condition.evidence.detail should be used as supporting evidence for the condition.\r\n\r"
* evidence.detail ^slicing.discriminator.type = #profile
* evidence.detail ^slicing.discriminator.path = "resolve()"
* evidence.detail ^slicing.rules = #open
* evidence.detail ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\nAdditionally, see Comment for Condition.evidence.code."
* evidence.detail contains SupportedDetail 0..* MS
* evidence.detail[SupportedDetail] only Reference(SDOHCCObservationScreeningResponse or SDOHCCCondition or SDOHCCObservationAssessment or SDCQuestionnaireResponse)
* evidence.detail[SupportedDetail] ^definition = "Links to other relevant information."
//* evidence.detail[SupportedDetail] ^requirements = "When a condition is based on one or more SDOH observations that were generated from questionnaire responses, Condition.evidence.detail should reference instances that comply with the SDOHCC Screening Response Observation. However, references to other instance types are also possible."
* evidence.detail[SupportedDetail] ^requirements = "When a condition is based on one or more SDOH observations that were generated from questionnaire responses, Condition.evidence.detail should reference instances that comply with the SDOHCC Observation Screening Response or SDC Questionnaire Response. However, references to other instance types are also possible."



// US Core 7.0.0
* recordedDate MS



/*
* ^status = #active
* obeys SDOH-Con-1
* . ^short = "Detailed information about SDOH conditions, problems or diagnoses"
* . ^definition = "For representation of SDOH conditions."
* . ^comment = "Many of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths (e.g., to arrive at SDOH Conditions) are also possible.\r\n\r\nOne specific use for this profile is to represent a Health Concern that is either; 1) directly asserted based on the patient’s answer to a specific question from an SDOH screening questionnaire or 2) computed/generated based on the patient’s answers to multiple questions. The questions and answers from the screening questionnaire are also represented using SDC Questionnaire, SDC QuestionnaireResponse and SDOHCC Screening Response Observation."
* insert OwningCommitteeExtension
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains SDOHCCExtensionConditionAsserter named asserterDevice 0..1 MS
//* extension[asserterDevice] ^requirements = "For a condition that is autogenerated based on a computation that uses the patient’s answers to multiple questions on a SDOH questionnaire, this extension should be used to specify the device used to compute the condition."
* extension[asserterDevice] ^condition = "SDOH-Con-1"
* extension[asserterDevice].value[x] only Reference(Device)
* verificationStatus ^comment = "verificationStatus is not required.  For example, when a patient complains of stress during a provider encounter, there is not likely going to be a verification status. The data type is CodeableConcept because verificationStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity.\r\n\r\nFor SDOH conditions that are autogenerated based on a questionnaire response, the Condition.asserter is a “Device” AND Condition.Category should be \"health-concern\". In that case, Condition.verificationStatus should be \"unconfirmed\" and should be changed to “confirmed” only after review and concurrence by the provider and patient."
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^requirements = "For a condition that is autogenerated based only on an individual's responses to an SDOH questionnaire, category should be \"health-concern\"."
* category contains SDOH 0..*
* category[SDOH] from SDOHCCValueSetSDOHCategory (required)
* category[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOH] ^definition = "An SDOH category assigned to the condition."
* category[SDOH] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to a condition. It is recommended that SDOH category codes be used to facilitate searching for SDOH conditions."
* category[SDOH] ^binding.description = "Codes for high-level SDOH categories."
* code from USCoreConditionCodes (required)
* code ^requirements = "Code is required and must be selected from the bound value set."
* code ^binding.description = "Valueset to describe the actual problem experienced by the patient"


* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.231, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, digital-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.224, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.103, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.63, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.42, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.108, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.17, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.148, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.18, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.24, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.48, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.84, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.35, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.153, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.116, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.81, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.75, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.26, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.243, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.78, extensible)
* insert AdditionalBinding(SDOHCCCondition, code, Condition.category, sdoh-category-unspecified, http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code, required)


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
//* recorder ^requirements = "For a condition that is autogenerated based on a QuestionnaireResponse, the AsserterDevice extension should be used to specify the device used to compute the condition and recorder should be empty."
* asserter only Reference(RelatedPerson or USCorePatientProfile or USCorePractitionerProfile or USCorePractitionerRoleProfile)
* asserter MS
* asserter ^short = "Person or device that asserts this condition"
* asserter ^definition = "The individual or device making the condition statement."
* asserter ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\nFor a condition that is autogenerated based on the patient directly answering a specific question from an SDOH screening questionnaire, the Condition.asserter should be the patient. For a condition that is autogenerated based on a computation that uses the patient’s answers to multiple questions, Condition.asserter should reference “Device” (using the using AsserterDevice extension) to specify the device used to compute the condition."
* asserter ^condition = "SDOH-Con-1"
* stage ..0
* evidence MS
* evidence.code ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nInformation represented by Condition.evidence.code may overlap significantly with information represented by Condition.evidence.detail. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where similar infomation could be provided by either Condition.evidence.code or Condition.evidence.detail, it is recommended that Condition.evidence.detail should be used as supporting evidence for the condition.\r\n\r"
* evidence.detail ^slicing.discriminator.type = #profile
* evidence.detail ^slicing.discriminator.path = "resolve()"
* evidence.detail ^slicing.rules = #open
* evidence.detail ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\nAdditionally, see Comment for Condition.evidence.code."
* evidence.detail contains SupportedDetail 0..* MS
* evidence.detail[SupportedDetail] only Reference(SDOHCCObservationScreeningResponse or SDOHCCCondition or SDOHCCObservationAssessment or SDCQuestionnaireResponse)
* evidence.detail[SupportedDetail] ^definition = "Links to other relevant information."
//* evidence.detail[SupportedDetail] ^requirements = "When a condition is based on one or more SDOH observations that were generated from questionnaire responses, Condition.evidence.detail should reference instances that comply with the SDOHCC Screening Response Observation. However, references to other instance types are also possible."
* evidence.detail[SupportedDetail] ^requirements = "When a condition is based on one or more SDOH observations that were generated from questionnaire responses, Condition.evidence.detail should reference instances that comply with the SDOHCC Observation Screening Response or SDC Questionnaire Response. However, references to other instance types are also possible."

*/