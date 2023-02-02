Profile: SDOHCCHealthcareService
Parent: HealthcareService
Id: SDOHCC-HealthcareService
Title: "SDOHCC Healthcare Service"
Description: "Profile that describes the means by which a healthcare service can be contacted."
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2022-05-17T18:54:32.194+00:00"
* ^meta.source = "#7xZKBP02rT8YjgtW"
* ^status = #draft
* active 1.. MS
* active = true (exactly)
* location only Reference(SDOHCCLocation)
* location MS
  * ^requirements = "The location must support Location.address so that the patient knows potential addresses when booking an appointment."
* name 1.. MS
* telecom ^slicing.discriminator.type = #exists
  * ^slicing.discriminator.path = "extension('http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ExtensionHealthcareServiceTelecomAppointment')"
  * ^slicing.rules = #open
  * ^mustSupport = false
* telecom contains AppointmentContact 1..* MS
* telecom[AppointmentContact].extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* telecom[AppointmentContact].extension contains
     SDOHCCExtensionHealthcareServiceTelecomAppointment named ForAppointment 0..1 MS
* telecom[AppointmentContact].system 1.. MS
* telecom[AppointmentContact].value 1.. MS
* communication MS
* appointmentRequired MS
* availableTime MS
* notAvailable MS
* availabilityExceptions MS