Instance: SDOHCC-HealthcareServiceTelecomAppointmentExample
InstanceOf: SDOHCCHealthcareService
Title: "SDOHCC HealthcareService Telecom Appointment Example"
Description: "An example of a HealthcareService with telecom(s) that can be used to make an appointment flagged. This example is used as the referenced healthcare service in other IG examples."
Usage: #example
* active = true
* category.coding[ServiceCategory] = USCoreCategory#sdoh "SDOH"
* category.coding[SDOHCC] = SDOHCCCodeSystemTemporaryCodes#sdoh-category-unspecified "SDOH Category Unspecified"
* type = SDOHCCCodeSystemTemporaryCodes#program-support "Program Support"
* location.reference = "Location/SDOHCC-LocationExample"
* name = "Family Counseling Services"
* telecom[AppointmentContact][0]
  * system = #phone
  * value = "(555) appoint"
  * use = #work
  * extension[ForAppointment].valueBoolean = true 
* telecom[AppointmentContact][+]
  * system = #email
  * value = "familyCounseling@example.com"
  * use = #work
  * extension[ForAppointment].valueBoolean = true 
* telecom[2]
  * system = #phone
  * value = "(555) office"
  * use = #work
* telecom[+]
  * system = #phone
  * value = "(555) nursepr"
  * use = #work
* program = http://terminology.hl7.org/CodeSystem/program#21 "Home And Community Care (HACC)"
// * characteristic = USCoreProcedureCodes#social-care-assessment "Social Care Assessment"