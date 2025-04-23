Profile: SDOHCCProcedure
Parent: Procedure
Id: SDOHCC-Procedure
Title: "SDOHCC Procedure"
Description: "Profile for interventions that address Social Determinants of Health."

* obeys us-core-7
// SDOH CC
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $resource-pertainsToGoal named pertainsToGoal 0..* MS
* extension[pertainsToGoal] ^short = "Pertains to SDOH goal"
* extension[pertainsToGoal] ^definition = "Indicates that the resource is related to either the measurement, achievement or progress towards the referenced goal.  For example, a Procedure to provide food vouchers pertainsToGoal of achieving food security."
* extension[pertainsToGoal] ^requirements = "Indicates that the procedure is related to the referenced SDOHCC Goal."
* extension[pertainsToGoal].value[x] only Reference(SDOHCCGoal)
* extension[pertainsToGoal].value[x] MS
* extension[pertainsToGoal].value[x] ^definition = "Value of extension must reference a Goal resource."
* extension[pertainsToGoal].value[x] ^requirements = "Indicates that the procedure is related to the referenced SDOHCC Goal."

// US Core 7.0.0
//* basedOn only Reference($us-core-careplan or $us-core-servicerequest)
//* basedOn ^extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* basedOn ^extension[=].valueBoolean = true
//* basedOn ^short = "𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: A request for this procedure"
//* basedOn ^mustSupport = false

// SDOH CC (with US Core Care Plan added)
* basedOn MS
* basedOn ^slicing.discriminator.type = #profile
* basedOn ^slicing.discriminator.path = "resolve()"
* basedOn ^slicing.rules = #open
* basedOn contains SupportedBasedOn 0..* MS
* basedOn[SupportedBasedOn] only Reference(SDOHCCServiceRequest or USCoreCarePlanProfile|7.0.0)
* basedOn[SupportedBasedOn] ^short = "An SDOH service request or US Core Care Plan for this procedure"
* basedOn[SupportedBasedOn] ^definition = "A reference to an SDOHCC service request or US Core Care Plan that contains details of the request for this procedure."
* basedOn[SupportedBasedOn] ^requirements = "When a procedure is based on an SDOH ServiceRequest, Procedure.basedOn should reference instances that comply with the SDOHCC ServiceRequest profile and when a procedure is based on a SDOH Care Plan, Procedure.basedOn should reference instances that comply with the US Core Care Plan profile. However, references to other instance types are also possible."
// For STU3 consideration
// * basedOn[SupportedBasedOn] ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * basedOn[SupportedBasedOn] ^type[=].targetProfile[=].extension.valueBoolean = true
// * basedOn[SupportedBasedOn] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * basedOn[SupportedBasedOn] ^type[=].targetProfile[=].extension.valueBoolean = false



// US Core 7.0.0
* status MS
* status from EventStatus (required)
* status ^condition = "us-core-7"



// SDOH CC
* category ^definition = "A code that classifies the procedure for searching, sorting and display purposes (e.g. \"Social service procedure\")."
* category.coding MS
* category.coding ^slicing.discriminator.type = #value
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains SDOHCC 0..1 MS
* category.coding[SDOHCC] from SDOHCCValueSetSDOHCategory (required)
* category.coding[SDOHCC] ^short = "e.g., food-insecurity | transportation-insecurity"
* category.coding[SDOHCC] ^definition = "An SDOH category assigned to the procedure."
* category.coding[SDOHCC] ^requirements = "Allows for alternative encodings within a code system, and translations to other code systems.  \r\nCodes from this value set can be used to assign an SDOH category (e.g., food-insecurity, transportation-insecurity, etc.) to a procedure. It is recommended that SDOH category codes be used to facilitate searching for SDOH procedures that address SDOH conditions, observations, service requests, or goals."
* category.coding[SDOHCC] ^binding.description = "Codes for high-level SDOH categories."


// US Core 7.0.0
* code 1.. MS
* code from USCoreProcedureCodes|7.0.0 (required) // code from $us-core-procedure-code (preferred)
* code ^binding.extension.extension[0].url = "purpose"
* code ^binding.extension.extension[=].valueCode = #current
* code ^binding.extension.extension[+].url = "valueSet"
* code ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code|7.0.0"
* code ^binding.extension.extension[+].url = "documentation"
* code ^binding.extension.extension[=].valueMarkdown = "US Core uses the current additional binding from FHIR R5 for this coded element for more flexibility when exchanging legacy and text-only data."
* code ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.description = "Codes describing the type of  Procedure"

/*
// SDOH CC
* code from USCoreProcedureCodes (required)
*/
* code ^definition = "The specific procedure that is performed. Use text if the exact nature of the procedure cannot be coded."

* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.235, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, digital-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.226, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.56, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.67, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.59, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.32, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.7, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.125, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.20, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.44, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.52, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, incarceration-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.260, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.97, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, language-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.268, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.39, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.122, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.118, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.94, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.87, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.27, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.247, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.90, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, sdoh-category-unspecified, http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code|7.0.0, required)


// US Core 7.0.0
* subject only Reference(USCorePatientProfile|7.0.0)
* subject MS
// For STU3 consideration
// * subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * subject ^type.targetProfile[=].extension.valueBoolean = true
* encounter only Reference(USCoreEncounterProfile|7.0.0)
* encounter MS
* encounter ^short = "Encounter associated with the procedure"
* performed[x] only dateTime or Period or string or Age or Range
* performed[x] MS
* performed[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performed[x] ^type[=].extension.valueBoolean = true
* performed[x] ^condition = "us-core-7"


// SDOH CC
//* performed[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* performed[x] ^type[=].extension.valueBoolean = true
// TODO - Need to get the occurence dateTime as MS
//* performed[x] ^requirements = "NOTE: dateTime should be Must Support, but currenlty tooling does not support this."
* reasonCode ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used. Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure.\r\n\r\nInformation represented by Procedure.reasonCode may overlap significantly with information represented by Procedure.reasonReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where similar information could be provided by either Procedure.reasonCode or Procedure.reasonReference, it is recommended that Procedure.reasonReference be used to provide a reason for why a procedure was performed."

* reasonCode from USCoreConditionCodes|7.0.0 (extensible)
//* reasonCode ^extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* reasonCode ^extension[=].valueBoolean = true
//* reasonCode ^short = "𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: Coded reason procedure performed"
//* reasonReference ^extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* reasonReference ^extension[=].valueBoolean = true
//* reasonReference ^short = "𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: US Core Profile justifying the reason procedure performed"


// SDOH CC
* reasonReference ^slicing.discriminator.type = #profile
* reasonReference ^slicing.discriminator.path = "resolve()"
* reasonReference ^slicing.rules = #open
* reasonReference ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used.  Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure.\r\n\r\nAdditionally, see Comments for reasonCode."
* reasonReference contains SupportedReasonReference 0..* MS
* reasonReference[SupportedReasonReference] only Reference(SDOHCCCondition or SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
* reasonReference[SupportedReasonReference] ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used.  Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure."
* reasonReference[SupportedReasonReference] ^requirements = "When a procedure is justified by one or more SDOH conditions or observations, Procedure.reasonReference should reference instances that comply with the SDOHCC Condition profile, or one of the SDOHCC Observation profiles. However, references to other instance types are also possible."
// For STU3 consideration
// * reasonReference[SupportedReasonReference] ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[=].extension.valueBoolean = true
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[=].extension.valueBoolean = true
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[=].extension.valueBoolean = true


// US Core 7.0.0
Invariant: us-core-7
Description: "Performed SHALL be present if the status is 'completed' or 'in-progress'"
* severity = #error
* expression = "(status='completed' or status='in-progress') implies performed.exists()"



/* Original STU3
* obeys us-core-7
* . ^mustSupport = false
* ^status = #active
* . ^short = "An action that addresses an SDOH condition, observation, or goal."
* . ^definition = "For procedures that address SDOH conditions, SDOH observations, or SDOH goals."
* . ^comment = "Many of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* insert OwningCommitteeExtension
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $resource-pertainsToGoal named pertainsToGoal 0..* MS
* extension[pertainsToGoal] ^short = "Pertains to SDOH goal"
* extension[pertainsToGoal] ^definition = "Indicates that the resource is related to either the measurement, achievement or progress towards the referenced goal.  For example, a Procedure to provide food vouchers pertainsToGoal of achieving food security."
* extension[pertainsToGoal] ^requirements = "Indicates that the procedure is related to the referenced SDOHCC Goal."
* extension[pertainsToGoal].value[x] only Reference(SDOHCCGoal)
* extension[pertainsToGoal].value[x] MS
* extension[pertainsToGoal].value[x] ^definition = "Value of extension must reference a Goal resource."
* extension[pertainsToGoal].value[x] ^requirements = "Indicates that the procedure is related to the referenced SDOHCC Goal."
* basedOn MS
* basedOn ^slicing.discriminator.type = #profile
* basedOn ^slicing.discriminator.path = "resolve()"
* basedOn ^slicing.rules = #open
* basedOn ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* basedOn ^extension.valueBoolean = true
* basedOn ^short = "ADDITIONAL USCDI: A request for this procedure"
* basedOn ^mustSupport = false
* basedOn contains SupportedBasedOn 0..* MS
* basedOn[SupportedBasedOn] only Reference(SDOHCCServiceRequest)
* basedOn[SupportedBasedOn] ^short = "An SDOH service request for this procedure"
* basedOn[SupportedBasedOn] ^definition = "A reference to an SDOHCC service request that contains details of the request for this procedure."
* basedOn[SupportedBasedOn] ^requirements = "When a procedure is based on an SDOH ServiceRequest, Procedure.basedOn should reference instances that comply with the SDOHCC ServiceRequest profile. However, references to other instance types are also possible."
* status MS
* status from EventStatus (required)
* status ^condition = "us-core-7"
* category ^definition = "A code that classifies the procedure for searching, sorting and display purposes (e.g. \"Social service procedure\")."
* category.coding MS
* category.coding ^slicing.discriminator.type = #value
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains SDOH 0..1 MS
* category.coding[SDOH] from SDOHCCValueSetSDOHCategory (required)
* category.coding[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
* category.coding[SDOH] ^definition = "An SDOH category assigned to the procedure."
* category.coding[SDOH] ^requirements = "Allows for alternative encodings within a code system, and translations to other code systems.  \r\nCodes from this value set can be used to assign an SDOH category (e.g., food-insecurity, transportation-insecurity, etc.) to a procedure. It is recommended that SDOH category codes be used to facilitate searching for SDOH procedures that address SDOH conditions, observations, service requests, or goals."
* category.coding[SDOH] ^binding.description = "Codes for high-level SDOH categories."
* code from USCoreProcedureCodes (required)
* code ^definition = "The specific procedure that is performed. Use text if the exact nature of the procedure cannot be coded."
* code ^binding.description = "Codes describing the type of Procedure"
* code 1.. MS
* code from USCoreProcedureCodes (required)
* code ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.extension.extension[0].url = "purpose"
* code ^binding.extension.extension[=].valueCode = #current
* code ^binding.extension.extension[+].url = "valueSet"
* code ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code"
* code ^binding.extension.extension[+].url = "documentation"
* code ^binding.extension.extension[=].valueMarkdown = "US Core uses the current additional binding from FHIR R5 for this coded element for more flexibility when exchanging legacy and text-only data."
* code ^binding.description = "Codes describing the type of Procedure"


* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.235, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, digital-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.226, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.56, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.67, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.59, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.32, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.7, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.125, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.20, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.44, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.52, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.97, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.39, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.122, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.118, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.94, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.87, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.27, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.247, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.90, extensible)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, sdoh-category-unspecified, http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code, required)


* subject only Reference(USCorePatientProfile or Group)
* subject MS
* subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = true
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false
* encounter only Reference(USCoreEncounterProfile)
* encounter MS
* encounter ^short = "Encounter associated with the procedure"
* performed[x] ^requirements = "NOTE: dateTime should be Must Support, but currenlty tooling does not support this."
* performed[x] only dateTime or Period or string or Age or Range
* performed[x] MS
* performed[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performed[x] ^type.extension.valueBoolean = true
* performed[x] ^condition = "us-core-7"
* reasonCode ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used. Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure.\r\n\r\nInformation represented by Procedure.reasonCode may overlap significantly with information represented by Procedure.reasonReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where similar information could be provided by either Procedure.reasonCode or Procedure.reasonReference, it is recommended that Procedure.reasonReference be used to provide a reason for why a procedure was performed."
* reasonCode from USCoreConditionCodes (extensible)
* reasonCode ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* reasonCode ^extension.valueBoolean = true
* reasonCode ^short = "ADDITIONAL USCDI: Coded reason procedure performed"
* reasonReference ^slicing.discriminator.type = #profile
* reasonReference ^slicing.discriminator.path = "resolve()"
* reasonReference ^slicing.rules = #open
* reasonReference ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used.  Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure.\r\n\r\nAdditionally, see Comments for reasonCode."
* reasonReference ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* reasonReference ^extension.valueBoolean = true
* reasonReference ^short = "ADDITIONAL USCDI: US Core Profile justifying the reason procedure performed"
* reasonReference contains SupportedReasonReference 0..* MS
* reasonReference[SupportedReasonReference] only Reference(SDOHCCCondition or SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
* reasonReference[SupportedReasonReference] ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used.  Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure."
* reasonReference[SupportedReasonReference] ^requirements = "When a procedure is justified by one or more SDOH conditions or observations, Procedure.reasonReference should reference instances that comply with the SDOHCC Condition profile, or one of the SDOHCC Observation profiles. However, references to other instance types are also possible."


Invariant: us-core-7
Description: "Performed SHALL be present if the status is 'completed' or 'in-progress'"
* severity = #error
* expression = "(status='completed' or status='in-progress') implies performed.exists()"


*/