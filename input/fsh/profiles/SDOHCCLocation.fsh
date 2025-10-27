Profile: SDOHCCLocation
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-location|7.0.0
Id: SDOHCC-Location
Title: "SDOHCC Location"
Description: "Profile that describes address information for a healthcare service."
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location|7.0.0"
* ^extension[$compliesWithProfile].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location|3.1.1"
* ^extension[$compliesWithProfile].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location|6.1.0"
* insert OwningCommitteeExtension
* address 1..