Profile: SDOHCCProcedure
Parent: USCoreProcedureProfile
Id: SDOHCC-Procedure
Title: "SDOHCC Procedure"
Description: "Profile for interventions that address Social Determinants of Health."

* ^status = #draft
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
* basedOn contains SupportedBasedOn 0..* MS
* basedOn[SupportedBasedOn] only Reference(SDOHCCServiceRequest)
* basedOn[SupportedBasedOn] ^short = "An SDOH service request for this procedure"
* basedOn[SupportedBasedOn] ^definition = "A reference to an SDOHCC service request that contains details of the request for this procedure."
* basedOn[SupportedBasedOn] ^requirements = "When a procedure is based on an SDOH ServiceRequest, Procedure.basedOn should reference instances that comply with the SDOHCC ServiceRequest profile. However, references to other instance types are also possible."
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




* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.56)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.67)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.59)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.32)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.7)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.125)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.118)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.20)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.44)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.52)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.97)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.39)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.122)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.94)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.87)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.27)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.90)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, digital-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.27)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.90)
* insert AdditionalBinding(SDOHCCProcedure, code, Procedure.category, sdoh-category-unspecified, http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code)



* performed[x] ^requirements = "NOTE: dateTime should be Must Support, but currenlty tooling does not support this."
* reasonCode ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used. Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure.\r\n\r\nInformation represented by Procedure.reasonCode may overlap significantly with information represented by Procedure.reasonReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where similar information could be provided by either Procedure.reasonCode or Procedure.reasonReference, it is recommended that Procedure.reasonReference be used to provide a reason for why a procedure was performed."
* reasonReference ^slicing.discriminator.type = #profile
* reasonReference ^slicing.discriminator.path = "resolve()"
* reasonReference ^slicing.rules = #open
* reasonReference ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used.  Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure.\r\n\r\nAdditionally, see Comments for reasonCode."
* reasonReference contains SupportedReasonReference 0..* MS
* reasonReference[SupportedReasonReference] only Reference(SDOHCCCondition or SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
* reasonReference[SupportedReasonReference] ^comment = "Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used.  Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure."
* reasonReference[SupportedReasonReference] ^requirements = "When a procedure is justified by one or more SDOH conditions or observations, Procedure.reasonReference should reference instances that comply with the SDOHCC Condition profile, or one of the SDOHCC Observation profiles. However, references to other instance types are also possible."