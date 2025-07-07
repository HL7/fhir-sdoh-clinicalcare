Instance: SDOHCC-SocialCareProgramExample
InstanceOf: SDOHCCHealthcareService
Title: "SDOHCC HealthcareService Social Care Program Example"
Description: "An example of a HealthcareService with information about a social care program."
Usage: #example
* active = true
* location.reference = "Location/SDOHCC-LocationExample"
* name = "Family Counseling Services"
* telecom[AppointmentContact]
  * system = #phone
  * value = "(555) appoint"
  * use = #work
  * extension[ForAppointment].valueBoolean = true 
* program = http://terminology.hl7.org/CodeSystem/program#21 "Home And Community Care (HACC)"