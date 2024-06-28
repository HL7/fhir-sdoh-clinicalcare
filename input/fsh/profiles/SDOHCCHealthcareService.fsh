Profile: SDOHCCHealthcareService
Parent: HealthcareService
Id: SDOHCC-HealthcareService
Title: "SDOHCC Healthcare Service"
Description: "Profile that describes the means by which a healthcare service can be contacted."
* ^status = #active
// TODO need short and definition?
//* . ^short = "Group of SDOH patients for a payer"
//* . ^definition = "For aggregation of individuals with a common set of characteristics (i.e., the same payer and and any condition in the specified SDOH categories) to enable organizations with the appropriate permissions to easily retrieve information related to the cohort of individuals for which they have a common responsibility."
* insert OwningCommitteeExtension
* active 1.. MS
* active = true (exactly)
* location only Reference(SDOHCCLocation)
* location MS
* location ^requirements = "The location must support Location.address so that the patient knows potential addresses when booking an appointment."
* name 1.. MS
* telecom ^slicing.discriminator.type = #exists
* telecom ^slicing.discriminator.path = "extension('http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ExtensionHealthcareServiceTelecomAppointment')"
* telecom ^slicing.rules = #open
* telecom ^mustSupport = false
* telecom contains AppointmentContact 1..* MS
* telecom[AppointmentContact].extension 1..
* telecom[AppointmentContact].extension contains SDOHCCExtensionHealthcareServiceTelecomAppointment named ForAppointment 1..1 MS
* telecom[AppointmentContact].system 1.. MS
* telecom[AppointmentContact].value 1.. MS
* communication MS
* appointmentRequired MS
* availableTime MS
* notAvailable MS
* availabilityExceptions MS