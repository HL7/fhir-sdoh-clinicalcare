Profile: SDOHCCGoal_medical_cost_burden
Parent: SDOHCCGoal
Id: SDOHCC-Goal-medical-cost-burden
Title: "SDOHCC Goal - Medical Cost Burden"
Description: "Profile for Social Determinants of Health (SDOH) Goal for the Medical Cost Burden domain meant for computational use. Review the [Base SDOHCCGoal profile](StructureDefinition-SDOHCC-Goal.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#medical-cost-burden
* description ^binding.extension[0].url = $add-binding
* description ^binding.extension[=].extension[0].url = "purpose"
* description ^binding.extension[=].extension[=].valueCode = #extensible
* description ^binding.extension[=].extension[+].url = "valueSet"
* description ^binding.extension[=].extension[=].valueCanonical = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.120
//* description from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.120 (required)