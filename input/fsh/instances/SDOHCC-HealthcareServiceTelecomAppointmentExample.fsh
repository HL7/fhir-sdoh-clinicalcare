Instance: SDOHCC-HealthcareServiceTelecomAppointmentExample
InstanceOf: SDOHCCHealthcareService
Title: "SDOHCC HealthcareService Telecom Appointment Example"
Description: "An example of a HealthcareService with telecom(s) that can be used to make an appointment flagged. This example is used as the referenced healthcare service in other IG examples."
Usage: #example
* active = true
* location.reference = "Location/SDOHCC-LocationExample"
* name = "Family Counseling Services"
* telecom[AppointmentContact][0]
  * system = #phone
  * value = "(555) appoint"
  * use = #work
  * extension[ForAppointment].valueBoolean = true 
* telecom[+]
  * system = #phone
  * value = "(555) office"
  * use = #work
* telecom[+]
  * system = #phone
  * value = "(555) nursepr"
  * use = #work
* telecom[AppointmentContact][+]
  * system = #email
  * value = "familyCounseling@example.com"
  * use = #work
  * extension[ForAppointment].valueBoolean = true 