Profile: SDOHCCServiceRequest
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest|7.0.0
Id: SDOHCC-ServiceRequest
Title: "SDOHCC ServiceRequest"
Description: "Profile for service requests that address Social Determinants of Health."

* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest|7.0.0"
* . ^short = "A request for a service to address an SDOH condition, observation or goal."
* . ^definition = "For service requests that address SDOH conditions, observations or goals."
* . ^comment = "Many of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* insert OwningCommitteeExtension
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $resource-pertainsToGoal named pertainsToGoal 0..* MS
* extension[pertainsToGoal] ^short = "Pertains to SDOH goal"
* extension[pertainsToGoal] ^definition = "Indicates that the resource is related to either the measurement, achievement or progress towards the referenced goal.  For example, a ServiceRequest to provide food vouchers pertainsToGoal of achieving food security."
* extension[pertainsToGoal] ^requirements = "Indicates that the service request is related to the referenced SDOHCC Goal."
* extension[pertainsToGoal].value[x] only Reference(SDOHCCGoal)
* extension[pertainsToGoal].value[x] MS
* basedOn only Reference(CarePlan or ServiceRequest)
* basedOn ^slicing.discriminator.type = #profile
* basedOn ^slicing.discriminator.path = "resolve()"
* basedOn ^slicing.rules = #open
* basedOn contains SupportedBasedOn 0..* MS
* basedOn[SupportedBasedOn] only Reference(SDOHCCServiceRequest)
* basedOn[SupportedBasedOn] ^requirements = "Allows an organization (e.g., a Coordination Platform) to create a ServiceRequest for another organization (e.g., a Community Based Organization) based on a SDOHCC ServiceRequest from a referral source (e.g., a provider or a payor involved in care management)."
// For STU3 consideration
// * basedOn[SupportedBasedOn] ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * basedOn[SupportedBasedOn] ^type[=].targetProfile[=].extension.valueBoolean = true

//* status MS
* status ^comment = "The status is generally fully in the control of the requester - they determine whether the order is draft or active and, after it has been activated, competed, cancelled or suspended. States relating to the activities of the performer are reflected on either the corresponding event (see [Event Pattern](event.html) for general discussion) or using the [Task](task.html) resource.\r\n\r\nWhile all values are currently allowed, there may be a constraint on the values in future releases based on implementation feedback."
//* intent MS
* intent ^comment = "This element is labeled as a modifier because the intent alters when and how the resource is actually applicable. While all values are currently allowed, there may be a contraint on the values in future releases based on implementation feedback."
//* category MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^definition = "A code that classifies the service for searching, sorting and display purposes (e.g., Education)."
//* category contains us-core 0..* MS
//* category[us-core] ^binding.description = "Note that other codes are permitted"
* category contains SDOHCC 0..* MS
* category[SDOHCC] from SDOHCCValueSetSDOHCategory (required)
* category[SDOHCC] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOHCC] ^definition = "An SDOH category assigned to the requested service."
* category[SDOHCC] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to a service request. It is recommended that SDOH category codes be used to facilitate searching for service requests that address SDOH conditions, observations, or goals."
* category[SDOHCC] ^binding.description = "Codes for high-level SDOH categories."
* priority MS
//* code 1.. MS
* code from USCoreProcedureCodes|7.0.0 (required)
//* code ^short = "What is being requested/ordered."
//* code ^definition = "A code that identifies a particular service (e.g., procedure) that has been requested."
//* code ^binding.description = "Codes for tests or services that can be carried out by a designated individual, organization or healthcare service."


* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.236, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, digital-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.227, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.57, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.68, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.60, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.31, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.11, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.124, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.21, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.45, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.53, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, incarceration-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.261, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.98, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, language-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.269, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.38, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.123, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.119, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.95, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.92, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.28, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.252, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.91, extensible)
* insert AdditionalBinding(SDOHCCServiceRequest, code, ServiceRequest.category, sdoh-category-unspecified, http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code|7.0.0, required)


* orderDetail ^slicing.discriminator.type = #value
* orderDetail ^slicing.discriminator.path = "coding"
* orderDetail ^slicing.rules = #open
* orderDetail contains SubjectContactDetail 0..1 MS
* orderDetail[SubjectContactDetail] = $SDOHCC-CodeSystemTemporaryCodes#contacting-subject-prohibited
* orderDetail[SubjectContactDetail] ^requirements = "Allows flagging of a service request where the subject of the request explictly designates that they do not want to be contacted (e.g., in domestic violence cases where contact may place subject at risk)."
* subject only Reference(Group or USCorePatientProfile|7.0.0 or USCoreLocationProfile|7.0.0)
//* subject MS
//* encounter only Reference(USCoreEncounterProfile)
//* encounter MS
//* occurrence[x] MS

// TODO - Need to get the occurence dateTime as MS
//* occurrence[x] ^requirements = "NOTE: dateTime should be Must Support, but currenlty tooling does not support this."
* occurrence[x] only Period or dateTime or Timing
* occurrence[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* occurrence[x] ^type.extension.valueBoolean = true
* occurrence[x] ^type[1].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* occurrence[x] ^type[=].extension.valueBoolean = true

//* authoredOn MS
* requester only Reference(USCoreRelatedPersonProfile|7.0.0 or Device or SDOHCCPractitionerRole or USCorePractitionerProfile|7.0.0 or USCorePatientProfile|7.0.0 or USCoreOrganizationProfile|7.0.0)
//* requester MS
* performer only Reference(HealthcareService or Device or RelatedPerson or USCorePatientProfile|7.0.0 or USCorePractitionerProfile|7.0.0 or SDOHCCPractitionerRole or USCoreOrganizationProfile|7.0.0 or USCoreCareTeam|7.0.0)
* performer MS
//* reasonCode from USCoreConditionCodes (extensible)
//* reasonCode ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* reasonCode ^extension.valueBoolean = true
//* reasonCode ^short = "ADDITIONAL USCDI: Explanation/Justification for procedure or service"
* reasonCode ^comment = "This element represents why the referral is being made and may be used to decide how the service will be performed, or even if it will be performed at all.   Use `CodeableConcept.text` element if the data is free (uncoded) text as shown in the [CT Scan example](servicerequest-example-di.html).\r\n\r\nInformation represented by ServiceRequest.reasonCode may overlap significantly with information represented by ServiceRequest.reasonReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where similar information could be provided by either ServiceRequest.reasonCode or ServiceRequest.reasonReference, it is recommended that ServiceRequest.reasonReference be used to provide a reason for why a service request was made.."
* reasonReference ^slicing.discriminator.type = #profile
* reasonReference ^slicing.discriminator.path = "resolve()"
* reasonReference ^slicing.rules = #open
//* reasonReference ^extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* reasonReference ^extension.valueBoolean = true
//* reasonReference ^short = "ADDITIONAL USCDI: US Core Profile that supports the requested service"
* reasonReference ^comment = "This element represents why the referral is being made and may be used to decide how the service will be performed, or even if it will be performed at all.  To be as specific as possible,  a reference to  *Observation* or *Condition* should be used if available.  Otherwise when referencing  *DiagnosticReport*  it should contain a finding  in `DiagnosticReport.conclusion` and/or `DiagnosticReport.conclusionCode`.   When using a reference to *DocumentReference*, the target document should contain clear findings language providing the relevant reason for this service request.  Use the CodeableConcept text element in `ServiceRequest.reasonCode` if the data is free (uncoded) text.\r\n\r\nAdditionally, see Comment on reasonCode."
* reasonReference contains SupportedReasonReference 0..* MS
* reasonReference[SupportedReasonReference] only Reference(SDOHCCCondition or SDOHCCObservationScreeningResponse or SDOHCCObservationAssessment)
* reasonReference[SupportedReasonReference] ^comment = "This element represents why the referral is being made and may be used to decide how the service will be performed, or even if it will be performed at all.    To be as specific as possible,  a reference to  *Observation* or *Condition* should be used if available.  Otherwise when referencing  *DiagnosticReport*  it should contain a finding  in `DiagnosticReport.conclusion` and/or `DiagnosticReport.conclusionCode`.   When using a reference to *DocumentReference*, the target document should contain clear findings language providing the relevant reason for this service request.  Use the CodeableConcept text element in `ServiceRequest.reasonCode` if the data is free (uncoded) text."
* reasonReference[SupportedReasonReference] ^requirements = "When a service request is justified by one or more SDOH conditions or observations, ServiceRequest.reasonReference should reference instances that comply with the SDOHCC Condition profile, or one of the SDOHCC Observation profiles. However, references to other instance types are also possible."
// For STU3 consideration
// * reasonReference[SupportedReasonReference] ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[=].extension.valueBoolean = true
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[=].extension.valueBoolean = true
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * reasonReference[SupportedReasonReference] ^type[=].targetProfile[=].extension.valueBoolean = true

* supportingInfo ^slicing.discriminator.type = #profile
* supportingInfo ^slicing.discriminator.path = "resolve()"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^definition = "Additional clinical information about the patient that may influence the services or their interpretations.     This information includes diagnosis, clinical findings and other observations."
* supportingInfo contains SupportedSupportingInfo 0..* MS
* supportingInfo[SupportedSupportingInfo] only Reference(SDOHCCConsent)
* supportingInfo[SupportedSupportingInfo] ^requirements = "When a service request is supported by a SDOH consent, ServiceRequest.supportingInfo should reference instances that comply with the SDOHCC Consent profile. However, references to other instance types are also possible."
// For STU3 consideration
// * supportingInfo[SupportedSupportingInfo] ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
// * supportingInfo[SupportedSupportingInfo] ^type[=].targetProfile[=].extension.valueBoolean = true
* specimen ..0
* bodySite ..0
