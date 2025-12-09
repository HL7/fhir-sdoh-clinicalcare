Instance: SDOHCC-TaskContentRichReferralWICExample
InstanceOf: SDOHCCTaskForReferralManagement
Title: "SDOHCC Task Content Rich Referral WIC Example"
Description: "An example of an SDOHCC Task For Referral Management that has uses Task.input to provide rich content about a WIC referral."
Usage: #example
* intent = #order
* code = $task-code#fulfill "Fulfill the focal request"
* status = #accepted
* focus.reference = "ServiceRequest/SDOHCC-ServiceRequestActiveWICReferralExample"
* for.reference = "Patient/SDOHCC-PatientBabyAbbas"
* for.display = "BABY ABBAS"
* authoredOn = "2025-09-11T21:56:54.671Z"
* requester.reference = "PractitionerRole/SDOHCC-PractitionerRoleDrJanWaterExample"
* requester.display = "Dr Jan Water Family Medicine Physician"
* owner.reference = "Organization/SDOHCC-OrganizationWICCommunityOrganizationExample"
* owner.display = "Special Supplemental Nutrition Program for Women, Infants and Children (WIC) Office"
* input[AdditionalContent][0].type = $SDOHCC-CodeSystemTemporaryCodes#additional-content
* input[AdditionalContent][=].valueReference.reference = "Observation/SDOHCC-LabObservationLeadLevelExample"
* input[AdditionalContent][=].valueReference.display = "Lead Level Lab Result"
* input[AdditionalContent][+].type = $SDOHCC-CodeSystemTemporaryCodes#additional-content
* input[AdditionalContent][=].valueReference.reference = "Immunization/SDOHCC-ImmunizationChildhoodImmunizationsExample"
* input[AdditionalContent][=].valueReference.display = "Childhood Immunizations Record"
* input[AdditionalContent][+].type = $SDOHCC-CodeSystemTemporaryCodes#additional-content
* input[AdditionalContent][=].valueReference.reference = "Observation/SDOHCC-VitalSignsHeightExample"
* input[AdditionalContent][=].valueReference.display = "WIC Eligibility Vital Signs Observation - Height"
* input[AdditionalContent][+].type = $SDOHCC-CodeSystemTemporaryCodes#additional-content
* input[AdditionalContent][=].valueReference.reference = "Observation/SDOHCC-VitalSignsWeightExample"
* input[AdditionalContent][=].valueReference.display = "WIC Eligibility Vital Signs Observation - Weight"


Instance: SDOHCC-ServiceRequestActiveWICReferralExample
InstanceOf: SDOHCCServiceRequest
Title: "SDOHCC ServiceRequest Active WIC Referral Example"
Description: "An example of an active ServiceRequest for a referral to the WIC program."
Usage: #example
* status = #active
* intent = #order
* category[0] = $sct#410606002 "Social service procedure"
* category[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $sct#467771000124109 "Assistance with application for food pantry program"
* subject.reference = "Patient/SDOHCC-PatientBabyAbbas"
//* subject.display = "COLIN ABBAS"
* reasonReference.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"

Instance: SDOHCC-PatientBabyAbbas
InstanceOf: USCorePatientProfile|7.0.0
Title: "SDOHCC Patient Baby Abbas"
Description: "An example patient representing Baby Abbas, a 2 year old infant."
Usage: #example
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical Record Number"
* identifier.type.text = "Medical Record Number"
* identifier.system = "http://hospital.smarthealthit.org"
* identifier.value = "65313516351"
* active = true
* name[0].family = "ABBAS"
* name[=].given[0] = "BABY"
* name[=].period.start = "2023-06-15"
* telecom.system = #phone
* telecom.value = "555-555-5555"
* telecom.use = #home
* gender = #male
* birthDate = "2023-06-15"
* address[0].line = "183 Mountain View St"
* address[=].city = "Mounds"
* address[=].state = "OK"
* address[=].postalCode = "74048"
* address[=].country = "US"
* address[=].period.start = "2023-06-15"

Instance: SDOHCC-LabObservationLeadLevelExample
InstanceOf: USCoreLaboratoryResultObservationProfile|7.0.0
Title: "SDOHCC Lab Observation Lead Level Example"
Description: "An example of a laboratory result observation for lead level."
Usage: #example
* status = #final
* category = $observation-category#laboratory "Laboratory"
* code = $loinc#5671-3 "Lead [Mass/volume] in Blood"
* subject.reference = "Patient/SDOHCC-PatientBabyAbbas"
* performer.reference = "Organization/SDOHCC-OrganizationWICCommunityOrganizationExample"
* effectiveDateTime = "2025-05-21T21:56:54.671Z"
* valueQuantity.value = 0.5
* valueQuantity.unit = "µg/dL"
* valueQuantity.system = "http://unitsofmeasure.org"
* interpretation = $v3-ObsInterpretation#N "Normal"


Instance: SDOHCC-ImmunizationChildhoodImmunizationsExample
InstanceOf: USCoreImmunizationProfile|7.0.0
Title: "SDOHCC Immunization Childhood Immunizations Example"
Description: "An example of an immunization record for childhood immunizations."
Usage: #example
* status = #completed
* vaccineCode.coding[0] = http://hl7.org/fhir/sid/cvx#20 "diphtheria, tetanus toxoids and acellular pertussis vaccine"
* vaccineCode.coding[+] = http://hl7.org/fhir/sid/ndc#58160081011 "INFANRIX, 10 VIAL in 1 CARTON (58160-810-11) > .5 mL in 1 VIAL (58160-810-01) (package)"

* patient.reference = "Patient/SDOHCC-PatientBabyAbbas"
* occurrenceDateTime = "2024-06-15"
* performer[0].actor.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* performer[0].actor.display = "Dr Jan Water"
* lotNumber = "DTAP12345"
* site = $sct#368208006 "Left upper arm structure" 



Instance: SDOHCC-VitalSignsHeightExample
InstanceOf: USCoreBodyHeightProfile|7.0.0
Title: "SDOHCC Vital Signs WIC Eligibility Example - Height"
Description: "An example of a height observation used to determine WIC eligibility."
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code = $loinc#8302-2 "Body height"
* subject.reference = "Patient/SDOHCC-PatientBabyAbbas"
* performer.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* effectiveDateTime = "2025-05-21"
* valueQuantity.value = 85.0
* valueQuantity.unit = "cm"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = $unitsofmeasure#cm "cm"

Instance: SDOHCC-VitalSignsWeightExample
InstanceOf: USCoreBodyWeightProfile|7.0.0
Title: "SDOHCC Vital Signs WIC Eligibility Example - Weight"
Description: "An example of a weight observation used to determine WIC eligibility."
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code = $loinc#29463-7 "Body weight"
* subject.reference = "Patient/SDOHCC-PatientBabyAbbas"
* performer.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* effectiveDateTime = "2025-05-21"
* valueQuantity.value = 10.5
* valueQuantity.unit = "kg"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = $unitsofmeasure#kg "kg"

Instance: SDOHCC-OrganizationWICCommunityOrganizationExample
InstanceOf: USCoreOrganizationProfile|7.0.0
Title: "SDOHCC Organization WIC Community Organization Example"
Description: "An example organization representing a WIC community organization."
Usage: #example

* active = true
* name = "Special Supplemental Nutrition Program for Women, Infants and Children (WIC) Office"
* telecom.system = #phone
* telecom.value = "555-555-3000"
* telecom.use = #work
* address[0].line = "10001 Main St"
* address[=].city = "Mounds"
* address[=].state = "OK"
* address[=].postalCode = "74048"
* address[=].country = "US"
