Profile: SDOHCCCondition_veteran_status
Parent: SDOHCCCondition
Id: SDOHCC-Condition-veteran-status
Title: "SDOHCC Condition - Veteran Status"
Description: "Profile for Social Determinants of Health (SDOH) Condition for the Veteran Status domain meant for computational use. Review the [Base SDOHCCCondition profile](StructureDefinition-SDOHCC-Condition.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#veteran-status
* code ^binding.extension[0].url = $add-binding
* code ^binding.extension[=].extension[0].url = "purpose"
* code ^binding.extension[=].extension[=].valueCode = #extensible
* code ^binding.extension[=].extension[+].url = "valueSet"
* code ^binding.extension[=].extension[=].valueCanonical = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.78
//* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.78 (required)