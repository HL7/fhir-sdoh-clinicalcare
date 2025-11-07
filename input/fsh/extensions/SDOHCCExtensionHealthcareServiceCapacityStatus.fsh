Extension: SDOHCCExtensionHealthcareServiceCapacityStatus
Id: SDOHCC-ExtensionHealthcareServiceCapacityStatus
Title: "SDOHCC Extension HealthcareService Capacity Status"
Description: "Extension for determining the capacity status of a health care service."
* ^status = #active
* ^context.type = #element
* ^context.expression = "HealthcareService"
* . ^short = "determining the capacity status of a service"
* . ^definition = "for determining the capacity status of a health care service to provide care for an individual."

* extension contains
   capacityStatus 1..1 and
   capacityNotes 0..1

* extension[capacityStatus].value[x] only CodeableConcept
* extension[capacityStatus].value[x] from SDOHCC-ValueSetCapacityStatus (extensible)
* extension[capacityStatus] ^short = "The capacity status of the service"
* extension[capacityStatus] ^definition = "The capacity status of the service to provide care"

* extension[capacityNotes].value[x] only string
* extension[capacityNotes] ^short = "Notes about the capacity status"
* extension[capacityNotes] ^definition = "Additional information about the capacity status of the service"