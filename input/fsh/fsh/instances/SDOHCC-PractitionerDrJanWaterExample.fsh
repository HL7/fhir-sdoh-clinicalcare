Instance: SDOHCC-PractitionerDrJanWaterExample
InstanceOf: USCorePractitionerProfile
Title: "SDOHCC Practitioner Dr Jan Water Example"
Description: "An example of a Practitioner. This example is used as the referenced practitioner in other IG examples."
Usage: #example
* meta.versionId = "4"
* meta.lastUpdated = "2021-11-09T16:39:44.213+00:00"
* meta.source = "#gWAEVDCtxsNjlr2d"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "1111111111"
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