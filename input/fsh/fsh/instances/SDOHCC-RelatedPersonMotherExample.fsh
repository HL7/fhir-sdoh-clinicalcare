Instance: SDOHCC-RelatedPersonMotherExample
InstanceOf: RelatedPerson
Title: "SDOHCC Related Person Mother Example"
Description: "An example of a Related Person who is the mother of the subject/patient (Colin Abbas)."
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2022-04-15T18:42:02.754+00:00"
* meta.source = "#JDXD7gN8AlsBwdK6"
* active = true
* patient = Reference(pat-53234) "COLIN ABBAS"
* relationship = $v3-RoleCode#NMTH "natural mother"
  * text = "Natural Mother"
* name.use = #official
* name.family = "Everywoman"
* name.given = "Eve"
* telecom.system = #phone
* telecom.value = "555-555-2003"
* telecom.use = #work
* gender = #female
* birthDate = "1973-05-31"
* address.use = #home
* address.line = "2222 Home Street"