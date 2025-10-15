Instance: SDOHCC-PractitionerPatWilliamsMSWExample
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner|7.0.0
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "9941339101"
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