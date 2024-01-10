Profile: SDOHCCGoal_intimate_partner_violence
Parent: SDOHCCGoal
Id: SDOHCC-Goal-intimate-partner-violence
Title: "SDOHCC Goal - Intimate Partner Violence"
Description: "Profile for Social Determinants of Health (SDOH) Goal for the Intimate Partner Violence domain meant for computational use. Review the [Base SDOHCCGoal profile](StructureDefinition-SDOHCC-Goal.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#intimate-partner-violence
* description ^binding.extension[0].url = $add-binding
* description ^binding.extension[=].extension[0].url = "purpose"
* description ^binding.extension[=].extension[=].valueCode = #extensible
* description ^binding.extension[=].extension[+].url = "valueSet"
* description ^binding.extension[=].extension[=].valueCanonical = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.100
//* description from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.100 (required)