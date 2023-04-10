Extension: SDOHCCExtensionHealthcareServiceTelecomAppointment
Id: SDOHCC-ExtensionHealthcareServiceTelecomAppointment
Title: "SDOHCC Extension HealthcareService Telecom Appointment"
Description: "Extension for flagging a HealthcareService.telecom as one the patient can use to make an appointment."
* ^status = #draft
* ^context.type = #element
* ^context.expression = "HealthcareService.telecom"
* . ..1
* . ^short = "Telecom is for making appointments"
* . ^definition = "For flagging a HealthcareService.telecom as one the patient can use to make an appointment."
* value[x] 1..
* value[x] only boolean
* value[x] = true (exactly)