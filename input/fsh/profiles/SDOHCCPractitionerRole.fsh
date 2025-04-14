Profile: SDOHCCPractitionerRole
Parent: USCorePractitionerRoleProfile|7.0.0
Id: SDOHCC-practitionerrole
Title: "SDOHCC PractitionerRole"
Description: "Profile for practitioner roles that address Social Determinants of Health (SDOH)."
* ^extension[$compliesWithProfile].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole|6.1.0"
* ^extension[$compliesWithProfile].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole|3.1.1"
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole|7.0.0"

* code from CareTeamMemberFunction|20240605
// * ^comment = "...  A concept map for converting between the US Core 3.1.1 and 6.1.0 value sets can be found [here](ConceptMap-NUCC-CareTeamMemberFunction.html)"
* insert AdditionalBindingPractitionerRole(code, extensible, "http://hl7.org/fhir/us/core/ValueSet/us-core-provider-role|3.1.0")
// * ^binding.extension.url = $additional-binding
// * ^binding.extension.extension[0].url = "purpose"
// * ^binding.extension.extension[=].valueCode = #extensible
// * ^binding.extension.extension[+].url = "valueSet"
// * ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/us/core/ValueSet/us-core-provider-role|3.1.0"
* practitioner 1..
* practitioner only Reference(USCorePractitionerProfile|7.0.0)
* organization 1..