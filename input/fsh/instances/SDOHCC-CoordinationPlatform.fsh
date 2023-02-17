Instance: SDOHCC-CoordinationPlatform
InstanceOf: CapabilityStatement
Title: "SDOHCC Coordination Platform Capability Statement"
Description: "This resource describes the required and desired behavior of systems acting as SDOH clinical care 'coordination platforms' (CPs)."
Usage: #definition
* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/CapabilityStatement/SDOHCC-CoordinationPlatform"
* name = "SDOHCC_CoordinationPlatform"
* title = "SDOHCC Coordination Platform"
* status = #draft
* date = "2021-06"
* description = "This resource describes the required and desired behavior of systems acting as SDOH clinical care 'coordination platforms' (CPs)."
* purpose = "CPs are intermediaries who take on responsibility for managing SDOH referrals and ensuring they are executed by appropriate service delivery organizations.  These systems must respond to referral fulfillment Tasks received from [Clinical Care Referral Sources](CapabilityStatement-SDOHCC-ReferralSource.html) and also the initiation and management of referral fulfillment Tasks subsequently directed out to [Referral Recipients](CapabilityStatement-SDOHCC-ReferralRecipient.html).  They may also take on some of the diagnostic work, including having patients or care-givers complete questionnaires, extract relevant observations and preliminary findings and work with patients to define goals."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest[0].mode = #client
* rest[=].documentation = "The clinical care coordinator needs to receive information from and update information in SDOH clinical care [referral sources](CapabilityStatement-SDOHCC-ReferralSource.html)."
* rest[=].security.service = $restful-security-service#SMART-on-FHIR
* rest[=].security.description = "Implementations must meet the general privacy & security requirements documented in [this implementation guide](privacy_and_security.html)."
* rest[=].resource[0].type = #CareTeam
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-careteam"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about the intended performer of a ServiceRequest when the performer is a specific team of people.  Note: Conformance expectations for this resource are lower because CareTeam performers are expected to be uncommon in most SDOH uses"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a CareTeam that is the intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved CareTeams that are the intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known CareTeam records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Condition
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Condition"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about a patient's SDOH-related conditions, particularly those that are the reason for a referral"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a Condition that is the reason for a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Conditions that are referenced by ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Condition records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only SDOH-related conditions"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "clinical-status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-clinical-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only active conditions"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only specific SDOH conditions or sets of conditions"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only conditions associated with a specific patient.  Some systems will require that searches be patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "verification-status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-verification-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to exclude refuted or entered-in-error conditions"
* rest[=].resource[+].type = #Consent
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Consent"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access the consent that authorizes disclosure of ServiceRequest information to non-HIPAA-covered entities"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a Consent referenced as a 'supportingInformation' item of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Consents related to ServiceRequests of interest."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude = "Consent:source-reference:DocumentReference"
* rest[=].resource[=].searchInclude.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude.extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known consent records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "source-reference"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Consent-source-reference"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows including the document that contains the PDF or similar representation of a paper consent"
* rest[=].resource[+].type = #Device
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/StructureDefinition/Device"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to retrieve the requester or intended performer of an SDOH ServiceRequest.  Note: Conformance expectations for this resource are lower because Device requesters and performers are expected to be uncommon in most SDOH uses"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a Device that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Devices that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Device records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #DocumentReference
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to retrieve a scanned or other form of document representing the text of a consent.  Also used for PDF forms."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a PDF or similar content referenced by a Consent or Task."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved DocumentReferences in the event the image/document is amended/corrected/updated."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known DocumentReference records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Goal
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Goal"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access goals related to an SDOH referral"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a goal referenced by a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Goals in the event they are updated."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Goal records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "achievement-status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Goal-achievement-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only include unmet goals"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Goal-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only include SDOH-related goals"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "lifecycle-status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Goal-lifecycle-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only include active goals"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only include goals for a particular patient.  Some systems will require searches to be patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "target-date"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Goal-target-date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering based on when a particular goal is desired to be achieved"
* rest[=].resource[+].type = #HealthcareService
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-HealthcareService"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about the intended performer of a ServiceRequest when the performer is a specific service within a larger facility.  Note: Conformance expectations for this resource are lower because HealthcareService performers are expected to be uncommon in most SDOH uses.  Also used to indicate who a patient or caregiver should contact about a particular service."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a HealthcareService that is the intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved HealthcareServices that are the intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known HealthcareService records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "location"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-location"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieval of the phyical site(s) associated with a HealthService"
* rest[=].resource[+].type = #Location
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Location"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about the potential sites at which a requested service might be performed.  Allows a patient to evaluate the suitability of a proposed activity or service."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a Location that is an available location for a service."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Locations that are the intended locations for services."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Location records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Observation
* rest[=].resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationAssessment"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationScreeningResponse"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationEthnicityOMB"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationRaceOMB"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationGenderIdentity"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationPersonalCharacteristic"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationPersonalPronouns"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationRecordedSexGender"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationSexualOrientation"
* rest[=].resource[=].supportedProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].documentation = "Used to access information about SDOH-related observations for a patient - particularly those that are reasons for a referral.  Also used to access certain SDOH-relevant demographic information."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve an Observation referenced by a ServiceRequest or associated with the patient."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Observations for updates/corrections."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Observation records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only SDOH-related observations"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for specific types of observations"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #MAY
* rest[=].resource[=].searchParam[=].name = "code-value-concept"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-code-value-concept"
* rest[=].resource[=].searchParam[=].type = #composite
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations that have a specific coded value answer for a specified observation type"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "date"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations that held in a particular time period"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "derived-from"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-derived-from"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations derived from a particular QuestionnaireResponse"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations specific to a particular patient.  Some systems will require that all queries be patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations that are completed or revised (i.e. not in-progress or entered-in-error)"
* rest[=].resource[+].type = #Organization
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about an Organization that is the requester or intended performer of a ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve an Organization that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Organizations that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Organization records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Patient
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about the Patient that is the subject a ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve the Patient that is the subject of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Patients."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Patient records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Practitioner
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about an Practitioner that is the requester or intended performer of a ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a Practitioner that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Practitioners that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Practitioner records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #PractitionerRole
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about an PractitionerRole that is the requester or intended performer of a ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a PractitionerRole that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved PractitionerRoles that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude[0] = "PractitionerRole:organization"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:practitioner"
* rest[=].resource[=].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known PractitionerRole records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "organization"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-organization"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows doing an _include on Organization when retrieving the PractitionerRole"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "practitioner"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows doing an _include on Practitioner when retrieving the PractitionerRole"
* rest[=].resource[+].type = #Procedure
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Procedure"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about actions that have been performed as a result of a referral"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows the system to write records of procedures done in response to a referral on the system that asked for the referral."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows the system to update records of procedures done in response to a referral on the system that asked for the referral."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the coordination platform to retrieve procedures referenced by Tasks from more sophisticated 'delivery' systems that store their data on their own system rather than using the coordination platform as a persistence layer."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the coordination platform to check for updates on Procedures after they've already been received or to look for procedures that haven't yet been linked as outputs to the Tasks that initiated the work."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Proceddure records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "based-on"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-based-on"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures resulting from a particular service request"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures that are SDOH-related"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures based on the specific service delivered"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "date"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures based on when they were delivered"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures based on who they were delivered to.  Some systems may require that all searches be patient-specific."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "performer"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-performer"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures based on who delivered the procedure."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures that are complete or in progress"
* rest[=].resource[+].type = #Questionnaire
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-smap"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to retrieve SDOH-related Questionnaires to be filled out by a patient or representative.  Also allows retrieving Questionnaires associated with existing QuestionnaireResponses for editing by SMART-on-FHIR apps."
* rest[=].resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction.extension.valueCode = #SHOULD
* rest[=].resource[=].interaction.code = #search-type
* rest[=].resource[=].interaction.documentation = "Allows the coordination platform to search for questionnaires relevant to a patient context."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for questionnaires associated with particular LOINC or similar codes"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "context-type-value"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-context-type-value"
* rest[=].resource[=].searchParam[=].type = #composite
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures that are SDOH-related"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "identifier"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires with a known identifier"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "publisher"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-publisher"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires based on who is responsible for them"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires that are active (and not draft or required)"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "subject-type"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-subject-type"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires that are intended to be completed about patients - as opposed to practitioner, organizations, etc."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "title"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-title"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires based on the name of the form"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "url"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-url"
* rest[=].resource[=].searchParam[=].type = #uri
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires based on its canonical URL"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "version"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-version"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving a specific version of a Questionnaire"
* rest[=].resource[=].operation.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].operation.extension.valueCode = #MAY
* rest[=].resource[=].operation.name = "populate"
* rest[=].resource[=].operation.definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-populate"
* rest[=].resource[=].operation.documentation = "Allows SMART on FHIR or other systems to pre-populate a questionnaire response with existing information either available locally or queried from elsewhere"
* rest[=].resource[+].type = #QuestionnaireResponse
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow QuestionnaireResponses referenced by a ServiceRequest or Task"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the retrieval of QuestionnaireResponses pointed to as supporting information by a ServiceRequest or as output of a Task."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows checking for updates in previously retrieved QuestionnaireResponses."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known QuestionnaireResponse records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "author"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-author"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering QuestionnaireResponses previously created/edited by a particular individual"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "authored"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-authored"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for QuestionnaireResponses by when they were created/last edited"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponses associated with a particular patient.  Some systems may only permit searches that are patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "questionnaire"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-questionnaire"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponses that have been completed against a specified form"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponses that are complete (or incomplete)"
* rest[=].resource[+].type = #RelatedPerson
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/StructureDefinition/RelatedPerson"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to access information about the requester or intended performer of a ServiceRequest when they are someone with a personal relationship to the Patient.  Note: Conformance expectations for this resource are lower because CareTeam performers are expected to be uncommon in most SDOH uses"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the system to retrieve a RelatedPerson that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved RelatedPersons that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known RelatedPerson records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #ServiceRequest
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ServiceRequest"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to retrieve an order for SDOH-related services"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows client systems to retrieve the ServiceRequest pointed to by a Task."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows client systems to monitor multiple ServiceRequests for change simultaneously via polling."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude[0] = "HealthCareService:location"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:supporting-info"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:pertains-to-goal"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:patient"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:requester"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:performer"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:practitioner"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:organization"
* rest[=].resource[=].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known ServiceRequests records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only retrieve ServiceRequests that are SDOH-related"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve ServiceRequests for specific types of services"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "intent"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-intent"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only 'order' ServiceRequests and not plans, proposals, etc."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "occurrence"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-occurrence"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve ServiceRequests based on the timeframe in which the service needs to be provided"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only ServiceRequests associated with a particular patient.  Note that some systems may mandate that searches are always patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "performer"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-performer"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only ServiceRequests that designate a specific performer"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "requester"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-requester"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only ServiceRequests created by a specific practitioner"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only active ServiceRequests"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "supporting-info"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/ServiceRequest-supporting-info"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows _include to retrieve supporting information for a ServiceRequest - particularly Consent"
* rest[=].resource[+].type = #Subscription
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to monitor updates to Tasks on downstream systems"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Necessary if using subscriptions to monitor updates to the Task"
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Needed to allow the requester to update a subscription - to adjust delivery target, to add additional tasks to monitor (if subscribing by id) typically to cancel a request for fulfillment"
* rest[=].resource[=].operation[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].operation[=].extension.valueCode = #SHOULD
* rest[=].resource[=].operation[=].name = "status"
* rest[=].resource[=].operation[=].definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/Backport-subscription-status"
* rest[=].resource[=].operation[=].documentation = "Necessary for systems supporting subscriptions to ensure that the subscription is functioning properly and to check for errors"
* rest[=].resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].operation[=].extension.valueCode = #MAY
* rest[=].resource[=].operation[=].name = "topic-list"
* rest[=].resource[=].operation[=].definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/Backport-subscriptiontopic-list"
* rest[=].resource[=].operation[=].documentation = "Allows discovery of what subscription topics the systems supports - needed for systems that aren't pre-configured to be aware of what topics are available for use."
* rest[=].resource[+].type = #Task
* rest[=].resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-TaskForPatient"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-TaskForReferralManagement"
* rest[=].resource[=].supportedProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to create Tasks on downstream systems seeking fufillment of ServiceRequests or performance of a patient activity on a coordinating system serving as an intermediary and to retrieve Task updates from a fulfilling system."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows the coordination platform system to create tasks on a delivery system (or downstream coordination system)."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows the coordination platform to modify the status of previously created tasks - e.g. to cancel them.  Servers SHALL enforce appropriate permissions on systems with respect to updates.  Specifically, only authors of a Task have authority to update all aspects of the Task.  (Systems MAY limit what changes can be made to tasks that have been accepted or completed.)  Assigned task owners may change the status, statusReason and outputs.  Users who are neither the author or owner of a Task cannot make changes to it."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the coordination platform to poll a single Task for changes."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the coordination platform to poll multiple tasks simultaneously, as well as to retrieve referenced resources as part of a single query."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].conditionalRead = #modified-since
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude[0] = "Task:focus"
* rest[=].resource[=].searchInclude[+] = "Task:output"
* rest[=].resource[=].searchInclude[+] = "HealthCareService:location"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:supporting-info"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:pertains-to-goal"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:patient"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:requester"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:performer"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:practitioner"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:organization"
* rest[=].resource[=].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Task records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for 'fulfill' tasks as opposed to others.  Some systems may require code to be included as a filter criteria as different Task codes may correspond to different internal database tables."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "owner"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-owner"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering only for tasks that are assigned to a particular owner (or alternatively, tasks that have not yet been assigned)"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows monitoring of tasks associated with a particular patient.  (Some systems may require that all queries be done in the context of a single patient.)"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "requester"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-requester"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving all tasks that have been requested by a particular organization or individual.  This will commonly be used to monitor the tasks initiated by a particular system"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only active or completed tasks"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "focus"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-focus"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving the task(s) seeking fulfillment of a particular ServiceRequest"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "output"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/Task-output-reference"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows for the 'output' of a Task to be included when retrieving a Task"
* rest[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].interaction.extension.valueCode = #SHOULD
* rest[=].interaction.code = #batch
* rest[=].interaction.documentation = "Allows polling for changes to multiple resource types simultaneously"
* rest[+].mode = #server
* rest[=].documentation = "Coordinating systems and service providers will frequently need to access information from the SDOH clinical care manager."
* rest[=].security.service = $restful-security-service#SMART-on-FHIR
* rest[=].security.description = "Implementations must meet the general privacy & security requirements documented in [this implementation guide](privacy_and_security.html)."
* rest[=].resource[0].type = #CareTeam
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-careteam"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about the intended performer of a ServiceRequest when the performer is a specific team of people"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a CareTeam that is the intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved CareTeams that are the intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known CareTeam records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Condition
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Condition"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about a patient's SDOH-related conditions, particularly those that are the reason for a referral"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows records to be authored by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows records to be edited by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a Condition that is the requester or performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved Conditions that are referenced by ServiceRequests."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Condition records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only SDOH-related conditions"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "clinical-status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-clinical-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only active conditions"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only specific SDOH conditions or sets of conditions"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only conditions associated with a specific patient.  Some systems will require that searches be patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "verification-status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-verification-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to exclude refuted or entered-in-error conditions"
* rest[=].resource[+].type = #Consent
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Consent"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow access to the consent that authorizes disclosure of ServiceRequest information to non-HIPAA-covered entities"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows records to be authored by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows records to be edited by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a Consent referenced as a 'supportingInformation' item of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved Consents related to ServiceRequests of interest."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude = "Consent:source-reference:DocumentReference"
* rest[=].resource[=].searchInclude.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude.extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known consent records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "source-reference"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Consent-source-reference"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows including the document that contains the PDF or similar representation of a paper consent"
* rest[=].resource[+].type = #Device
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/StructureDefinition/Device"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow retrieval of the requester or intended performer of an SDOH ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a Device that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved Devices that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Device records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #DocumentReference
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used convey a scanned or other form of document representing the text of a consent.  Also used for PDF forms."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows the app to record a new PDF (e.g. a completed form)"
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows the system to revise a previously stored PDF"
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a PDF or similar content referenced by a Consent or Task."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved DocumentReferences in the event the image/document is amended/corrected/updated."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known DocumentReference records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Goal
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Goal"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow access to goals related to an SDOH referral"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows records to be authored by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows records to be edited by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a goal referenced by a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved Goals in the event they are updated."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Goal records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "achievement-status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Goal-achievement-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only include unmet goals"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Goal-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only include SDOH-related goals"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "lifecycle-status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Goal-lifecycle-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only include active goals"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only include goals for a particular patient.  Some systems will require searches to be patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "target-date"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Goal-target-date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering based on when a particular goal is desired to be achieved"
* rest[=].resource[+].type = #Group
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Group"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Exposes information about which patients associated with a particular payor coverage type currently have SDOH concerns under management"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows a payer or other oversight agency to a Group whose identity is already known (e.g. for polling)."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows a payer or oversight agency to search for groups of interest to allow monitoring of what patients are under care/management for SDOH issues."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude = "Group:member"
* rest[=].resource[=].searchInclude.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude.extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Group records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "characteristic-value"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Group-characteristic-value"
* rest[=].resource[=].searchParam[=].type = #composite
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering based on the insurer or plan associated with the group"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Group-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering based on the type of group"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "managing-entity"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Group-managing-entity"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering based on who is maintaining the group"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "member"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Group-member"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows performing an _include to retrieve the members of the group"
* rest[=].resource[+].type = #HealthcareService
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-HealthcareService"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about the intended performer of a ServiceRequest when the performer is a specific service within a larger facility.  Also used to indicate who a patient or caregiver should contact about a particular service."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a HealthcareService that is the intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved HealthcareServices that are the intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known HealthcareService records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "location"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-location"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieval of the phyical site(s) associated with a HealthService"
* rest[=].resource[+].type = #Location
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Location"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to expose information about the potential sites at which a requested service might be performed.  Allows a patient to evaluate the suitability of a proposed activity or service."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows other systems to retrieve a Location that is an available location for a service."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the monitoring of previously-retrieved Locations that are the intended locations for services."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Location records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Observation
* rest[=].resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationAssessment"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationScreeningResponse"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationEthnicityOMB"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationRaceOMB"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationGenderIdentity"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationPersonalCharacteristic"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationPersonalPronouns"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationRecordedSexGender"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationSexualOrientation"
* rest[=].resource[=].supportedProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #MAY
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about SDOH-related observations for a patient - particularly those that are reasons for a referral as well as certain SDOH-relevant demographic information"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows records to be authored by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows records to be edited by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve an Observation referenced by a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved Observations for updates/corrections."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Observation records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only SDOH-related observations"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for specific types of observations"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #MAY
* rest[=].resource[=].searchParam[=].name = "code-value-concept"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-code-value-concept"
* rest[=].resource[=].searchParam[=].type = #composite
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations that have a specific coded value answer for a specified observation type"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "date"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations that held in a particular time period"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "derived-from"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-derived-from"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations derived from a particular QuestionnaireResponse"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations specific to a particular patient.  Some systems will require that all queries be patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for observations that are completed or revised (i.e. not in-progress or entered-in-error)"
* rest[=].resource[+].type = #Organization
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about an Organization that is the requester or intended performer of a ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve an Organization that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved Organizations that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Organization records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Patient
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about the Patient that is the subject a ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve the Patient that is the subject of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved Patients."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Patient records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #Practitioner
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about an Practitioner that is the requester or intended performer of a ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a Practitioner that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved Practitioners that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Practitioner records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #PractitionerRole
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about an PractitionerRole that is the requester or intended performer of a ServiceRequest"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a PractitionerRole that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved PractitionerRoles that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude[0] = "PractitionerRole:organization"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:practitioner"
* rest[=].resource[=].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known PractitionerRole records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "organization"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-organization"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows doing an _include on Organization when retrieving the PractitionerRole"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "practitioner"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows doing an _include on Practitioner when retrieving the PractitionerRole"
* rest[=].resource[+].type = #Procedure
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Procedure"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream coordination platforms and referral recipients to provide information about actions that have been performed as a result of a referral as well as to allow upstream systems to access that information."
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms and referral recipients to write records of procedures done in response to a referral in situations where they can't store the procedure on their own local system."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms and referral recipients to update records of procedures done - e.g. changing status, adding notes."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows upstream systems to retrieve procedures referenced by Tasks."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows upstream systems to check for updates on Procedures after they've already been received or to look for procedures that haven't yet been linked as outputs to the Tasks that initiated the work."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known PractitionerRole records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "based-on"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-based-on"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures resulting from a particular service request"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures that are SDOH-related"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures based on the specific service delivered"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "date"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures based on when they were delivered"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures based on who they were delivered to.  Some systems may require that all searches be patient-specific."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "performer"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-performer"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures based on who delivered the procedure."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures that are complete or in progress"
* rest[=].resource[+].type = #Questionnaire
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-smap"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow retrieval of SDOH-related Questionnaires to be filled out by a patient or representative.  Also allows retrieving Questionnaires associated with existing QuestionnaireResponses for editing by SMART-on-FHIR apps."
* rest[=].resource[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction.extension.valueCode = #MAY
* rest[=].resource[=].interaction.code = #search-type
* rest[=].resource[=].interaction.documentation = "Allows SMART apps or downstream systems to search for questionnaires relevant to a patient context."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for questionnaires associated with particular LOINC or similar codes"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "context-type-value"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-context-type-value"
* rest[=].resource[=].searchParam[=].type = #composite
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for procedures that are SDOH-related"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "identifier"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires with a known identifier"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "publisher"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-publisher"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires based on who is responsible for them"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires that are active (and not draft or required)"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "subject-type"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-subject-type"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires that are intended to be completed about patients - as opposed to practitioner, organizations, etc."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "title"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-title"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires based on the name of the form"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "url"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-url"
* rest[=].resource[=].searchParam[=].type = #uri
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving Questionnaires based on its canonical URL"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "version"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-version"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving a specific version of a Questionnaire"
* rest[=].resource[=].operation.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].operation.extension.valueCode = #MAY
* rest[=].resource[=].operation.name = "populate"
* rest[=].resource[=].operation.definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-populate"
* rest[=].resource[=].operation.documentation = "Allows SMART on FHIR or other systems to pre-populate a questionnaire response with existing information either available locally or queried from elsewhere"
* rest[=].resource[+].type = #QuestionnaireResponse
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow SMART apps to cread, update and retrieve QuestionnaireResponses relevant to SDOH care"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows questionnaire responses to be authored by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows questionnaire responses to be edited by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows the retrieval of QuestionnaireResponses to use as a starting point for new responses or to continue editing."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows checking for updates in previously retrieved QuestionnaireResponses."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known QuestionnaireResponse records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "author"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-author"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering QuestionnaireResponses previously created/edited by a particular individual"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "authored"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-authored"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for QuestionnaireResponses by when they were created/last edited"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponses associated with a particular patient.  Some systems may only permit searches that are patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "questionnaire"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-questionnaire"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponses that have been completed against a specified form"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving QuestionnaireResponses that are complete (or incomplete)"
* rest[=].resource[+].type = #RelatedPerson
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/StructureDefinition/RelatedPerson"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow downstream systems to access to information about the requester or intended performer of a ServiceRequest when they are someone with a personal relationship to the Patient"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to retrieve a RelatedPerson that is the requester or intended performer of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows downstream coordination platforms or referral recipients to monitor previously-retrieved RelatedPersons that are the requester or intended performer of ServiceRequests."
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known RelatedPerson records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[+].type = #ServiceRequest
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ServiceRequest"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow retrieval of an order for SDOH-related services"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows records to be authored by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows records to be edited by a SMART app if the manager system does not have the capability itself - or finds it better to use a third-party interface."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows client systems to retrieve the ServiceRequest pointed to by a Task."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows client systems to monitor multiple ServiceRequests for change simultaneously via polling."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude[0] = "HealthCareService:location"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:supporting-info"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:pertains-to-goal"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:patient"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:requester"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:performer"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:practitioner"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:organization"
* rest[=].resource[=].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known ServiceRequests records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only retrieve ServiceRequests that are SDOH-related"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve ServiceRequests for specific types of services"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "intent"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-intent"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only 'order' ServiceRequests and not plans, proposals, etc."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "occurrence"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-occurrence"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve ServiceRequests based on the timeframe in which the service needs to be provided"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only ServiceRequests associated with a particular patient.  Note that some systems may mandate that searches are always patient-specific"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "performer"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-performer"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only ServiceRequests that designate a specific performer"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "requester"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-requester"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only ServiceRequests created by a specific practitioner"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to retrieve only active ServiceRequests"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "supporting-info"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/ServiceRequest-supporting-info"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows _include to retrieve supporting information for a ServiceRequest - particularly Consent"
* rest[=].resource[+].type = #Subscription
* rest[=].resource[=].supportedProfile = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription"
* rest[=].resource[=].supportedProfile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile.extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used to allow upstream and occasionally downstream systems to subscribe to and monitor Tasks this system for change"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHOULD
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows upstream systems to initiate a subscription to monitor updates to Tasks (and theoretically other things)"
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #MAY
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows upstream systems to revise existing subscriptions - to adjust delivery target, to add additional tasks to monitor (if subscribing by id), etc."
* rest[=].resource[=].operation[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].operation[=].extension.valueCode = #SHOULD
* rest[=].resource[=].operation[=].name = "status"
* rest[=].resource[=].operation[=].definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/Backport-subscription-status"
* rest[=].resource[=].operation[=].documentation = "Allows upstream systems to verify their subscription is functioning properly and to check for errors"
* rest[=].resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].operation[=].extension.valueCode = #MAY
* rest[=].resource[=].operation[=].name = "topic-list"
* rest[=].resource[=].operation[=].definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/Backport-subscriptiontopic-list"
* rest[=].resource[=].operation[=].documentation = "Allows upstream systems to discover of what subscription topics this system supports - needed for systems that aren't pre-configured to be aware of what topics are available for use."
* rest[=].resource[+].type = #Task
* rest[=].resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-TaskForPatient"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-TaskForReferralManagement"
* rest[=].resource[=].supportedProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].supportedProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest[=].resource[=].documentation = "Used by upstream referral sources and coordination platforms to create and update Tasks seeking fufillment of ServiceRequests or performance of activities by patients and care-givers.  Also used by downstream referral recipients to monitor and update Tasks stored on this system as they respond to requests to fulfill referrals and link in information about actions taken so far"
* rest[=].resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #create
* rest[=].resource[=].interaction[=].documentation = "Allows upstream coordination platforms and referral sources system to create tasks on this system seeking fulfillment of a ServiceRequest."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #update
* rest[=].resource[=].interaction[=].documentation = "Allows modification of an existing Task by upstream systems (e.g. to cancel it) or by downstream systems (to accept or reject it or add output links to performed procedures)."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #read
* rest[=].resource[=].interaction[=].documentation = "Allows retrieval of a Task that was referenced in a subscription notification or per-Task polling for change."
* rest[=].resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension.valueCode = #SHALL
* rest[=].resource[=].interaction[=].code = #search-type
* rest[=].resource[=].interaction[=].documentation = "Allows the other systems to poll multiple tasks simultaneously, as well as to retrieve referenced resources as part of a single query."
* rest[=].resource[=].versioning = #versioned-update
* rest[=].resource[=].conditionalRead = #modified-since
* rest[=].resource[=].referencePolicy = #literal
* rest[=].resource[=].searchInclude[0] = "Task:focus"
* rest[=].resource[=].searchInclude[+] = "Task:output"
* rest[=].resource[=].searchInclude[+] = "HealthCareService:location"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:supporting-info"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:pertains-to-goal"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:patient"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:requester"
* rest[=].resource[=].searchInclude[+] = "ServiceRequest:performer"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:practitioner"
* rest[=].resource[=].searchInclude[+] = "PractitionerRole:organization"
* rest[=].resource[=].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchInclude[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchInclude[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving known Task records - and more specifically, retrieving more than one in a single call to poll for updates"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for only records that have changed since last query"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "code"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering for 'fulfill' tasks as opposed to others.  Some systems may require code to be included as a filter criteria as different Task codes may correspond to different internal database tables."
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "owner"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-owner"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering only for tasks that are assigned to a particular owner (or alternatively, tasks that have not yet been assigned)"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows monitoring of tasks associated with a particular patient.  (Some systems may require that all queries be done in the context of a single patient.)"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "requester"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-requester"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving all tasks that have been requested by a particular organization or individual.  This will commonly be used to monitor the tasks initiated by a particular system"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Allows filtering to only active or completed tasks"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHALL
* rest[=].resource[=].searchParam[=].name = "focus"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-focus"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows retrieving the task(s) seeking fulfillment of a particular ServiceRequest"
* rest[=].resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].name = "output"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/Task-output-reference"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Allows for the 'output' of a Task to be included when retrieving a Task"
* rest[=].interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].interaction.extension.valueCode = #SHOULD
* rest[=].interaction.code = #batch
* rest[=].interaction.documentation = "Allows other systems to poll for changes to multiple resource types simultaneously"