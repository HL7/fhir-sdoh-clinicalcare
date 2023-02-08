Instance: SDOHCC-HealthcareServiceTelecomAppointmentExample
InstanceOf: SDOHCCHealthcareService
Title: "SDOHCC HealthcareService Telecom Appointment Example"
Description: "An example of a HealthcareService with telecom(s) that can be used to make an appointment flagged. This example is used as the referenced healthcare service in other IG examples."
Usage: #example
* meta.versionId = "4"
* meta.lastUpdated = "2021-11-03T20:25:50.174+00:00"
* meta.source = "#ROynShGIb2ksbTSi"
* active = true
* location.reference = "Location/SDOHCC-LocationExample"
* name = "Family Counseling Services"
* telecom[0].extension.url = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ExtensionHealthcareServiceTelecomAppointment"
* telecom[=].extension.valueBoolean = true
* telecom[=].system = #phone
* telecom[=].value = "(555) appoint"
* telecom[=].use = #work
* telecom[+].system = #phone
* telecom[=].value = "(555) office"
* telecom[=].use = #work
* telecom[+].system = #phone
* telecom[=].value = "(555) nursepr"
* telecom[=].use = #work
* telecom[+].extension.url = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ExtensionHealthcareServiceTelecomAppointment"
* telecom[=].extension.valueBoolean = true
* telecom[=].system = #email
* telecom[=].value = "familyCounseling@example.com"
* telecom[=].use = #work