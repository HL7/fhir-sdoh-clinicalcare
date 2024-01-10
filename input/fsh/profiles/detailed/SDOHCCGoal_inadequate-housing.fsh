Profile: SDOHCCGoal_inadequate_housing
Parent: SDOHCCGoal
Id: SDOHCC-Goal-inadequate-housing
Title: "SDOHCC Goal - Inadequate Housing"
Description: "Profile for Social Determinants of Health (SDOH) Goal for the Inadequate Housing domain meant for computational use. Review the [Base SDOHCCGoal profile](StructureDefinition-SDOHCC-Goal.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#inadequate-housing
* description ^binding.extension[0].url = $add-binding
* description ^binding.extension[=].extension[0].url = "purpose"
* description ^binding.extension[=].extension[=].valueCode = #extensible
* description ^binding.extension[=].extension[+].url = "valueSet"
* description ^binding.extension[=].extension[=].valueCanonical = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.50
//* description from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.50 (required)