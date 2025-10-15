Instance: SDOHCC-SocialCareProgramExample
InstanceOf: SDOHCCHealthcareService
Title: "SDOHCC HealthcareService Social Care Program Example"
Description: "An example of a HealthcareService with information about a social care program."
Usage: #example
* extension[capacity-status].extension[capacityStatus].valueCodeableConcept = SDOHCCCodeSystemTemporaryCodes#capacity "Has Capacity"
* active = true
* category.coding[ServiceCategory] = USCoreCategory#sdoh "SDOH"
* category.coding[SDOHCC] = SDOHCCCodeSystemTemporaryCodes#housing-instability "Housing instability"
* type = SDOHCCCodeSystemTemporaryCodes#program-support "Program Support"
* location.reference = "Location/SDOHCC-LocationExample"
* name = "HACC"
* telecom[AppointmentContact]
  * system = #phone
  * value = "(555) appoint"
  * use = #work
  * extension[ForAppointment].valueBoolean = true 
* program = http://terminology.hl7.org/CodeSystem/program#21 "Home And Community Care (HACC)"
* characteristic = http://hl7.org/fhir/us/core/CodeSystem/us-core-category#1338051003 "Provision of microwave oven (procedure)"



