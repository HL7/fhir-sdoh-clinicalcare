Instance: SDOHCC-PractitionerRoleDrJanWaterExample
InstanceOf: USCorePractitionerRoleProfile
Title: "SDOHCC Practitioner Role Dr Jan Water Example"
Description: "An example of a family medicine physician PractitionerRole. This example is used as the referenced practitioner role in other IG examples."
Usage: #example
* meta.versionId = "6"
* meta.lastUpdated = "2022-04-06T20:56:13.866+00:00"
* meta.source = "#BjmS65cneLYxVyRU"
* identifier.system = "http://www.deerland.org/practitioners"
* identifier.value = "2424"
* active = true
* practitioner = Reference(SDOHCC-PractitionerDrJanWaterExample) "Dr Jan Water"
* organization = Reference(SDOHCC-OrganizationClinicExample) "Better Health Clinic"
* code = $provider-taxonomy#207Q00000X "Family Medicine Physician"
* telecom[0].system = #phone
* telecom[=].value = "639 442 6719"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "jan.water@deerland.org"
* telecom[=].use = #work