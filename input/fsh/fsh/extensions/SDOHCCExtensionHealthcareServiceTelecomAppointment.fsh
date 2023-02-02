Extension: SDOHCCExtensionHealthcareServiceTelecomAppointment
Id: SDOHCC-ExtensionHealthcareServiceTelecomAppointment
Title: "SDOHCC Extension HealthcareService Telecom Appointment"
Description: "Extension for flagging a HealthcareService.telecom as one the patient can use to make an appointment."
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-10-27T17:12:16.602+00:00"
* ^meta.source = "#M1539zXBbBxt0iUs"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "HealthcareService.telecom"
* . ..1
  * ^short = "Telecom is for making appointments"
  * ^definition = "For flagging a HealthcareService.telecom as one the patient can use to make an appointment."
* value[x] 1..
* value[x] only boolean
* value[x] = true (exactly)