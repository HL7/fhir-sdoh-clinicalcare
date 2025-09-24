Extension: SDOHCCExtensionHealthcareServiceCapacityStatus
Id: SDOHCC-ExtensionHealthcareServiceCapacityStatus
Title: "SDOHCC Extension HealthcareService Capacity Status"
Description: "Extension for determining the caapcity status of a health care service."
* ^status = #active
* ^context.type = #element
* ^context.expression = "HealthcareService.telecom"
* . ..1
* . ^short = "determining the caapcity status of a service"
* . ^definition = "for determining the caapcity status of a health care service to provide care for an individual."
* value[x] 1..
* value[x] only CodeableConcept
* value[x] from SDOHCC-ValueSetCapacityStatus (extensible)