Instance: SDOHCC-PractitionerDrJanWaterExample
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner|7.0.0
Title: "SDOHCC Practitioner Dr Jan Water Example"
Description: "An example of a Practitioner. This example is used as the referenced practitioner in other IG examples."
Usage: #example
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "9941339100"
* identifier[+].system = "http://www.deerland.org/practitioners"
* identifier[=].value = "24242"
* active = true
* name.text = "Dr Jan Water"
* name.family = "Water"
* name.given = "Jan"
* name.prefix = "Dr"
* address.use = #home
* address.line = "318 Humble Street,"
* address.city = "Deerland"
* address.state = "IL"
* address.postalCode = "62223"