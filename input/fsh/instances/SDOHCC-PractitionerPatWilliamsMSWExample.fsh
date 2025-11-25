Instance: SDOHCC-PractitionerPatWilliamsMSWExample
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner|7.0.0
Usage: #example
Description: "An example of a Practitioner. This example is used as the referenced practitioner in other IG examples."
Title: "SDOHCC Practitioner Pat Williams Example"
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "1234567893"
* identifier[+].system = "http://www.deerland.org/practitioners"
* identifier[=].value = "24243"
* active = true
* name.text = "Pat Williams"
* name.family = "Williams"
* name.given = "Pat"
* address.use = #home
* address.line = "4312 Friendly Dr.,"
* address.city = "Deerland"
* address.state = "IL"
* address.postalCode = "62223"