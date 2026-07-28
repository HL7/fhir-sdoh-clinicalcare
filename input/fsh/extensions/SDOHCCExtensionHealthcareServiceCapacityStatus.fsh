Extension: SDOHCCExtensionHealthcareServiceCapacityStatus
Id: SDOHCC-ExtensionHealthcareServiceCapacityStatus
Title: "SDOHCC Extension HealthcareService Capacity Status"
Description: "Extension used to convey capacity status — a social service organization's (e.g., a CBO's) ability to accept and serve a new individual for a social care service it offers. The referral target populates and maintains this extension so that referral sources querying capacity status can determine whether the organization can currently take on a new referral for that service."
* ^status = #draft
* ^context.type = #element
* ^context.expression = "HealthcareService"
* . ^short = "capacity status of a social care service (populated by the referral target)"
* . ^definition = "Conveys the capacity status of a social service organization (e.g., a CBO) to accept and serve a new individual for a social care service it offers. The referral target populates and maintains this extension and returns it when responding to a capacity status query."

* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[0].valueCode = #draft

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0

* extension contains
   capacityStatus 1..1 and
   capacityNotes 0..1

* extension[capacityStatus].value[x] only CodeableConcept
* extension[capacityStatus].value[x] from SDOHCC-ValueSetCapacityStatus (extensible)
* extension[capacityStatus] ^short = "The capacity status of the service"
* extension[capacityStatus] ^definition = "The capacity status of the service to accept and serve a new individual"

* extension[capacityNotes].value[x] only string
* extension[capacityNotes] ^short = "Notes about the capacity status"
* extension[capacityNotes] ^definition = "Additional information about the capacity status of the service"
* extension[capacityNotes] ^comment = "Notes should briefly convey information that helps the referral source act on the capacity status, such as the number of individuals on a waitlist or an estimated wait time (e.g., 'Approximately 15 individuals on the waitlist; estimated wait 4-6 weeks.')."