Profile: SDOHCCCondition_health_insurance_coverage_status
Parent: SDOHCCCondition
Id: SDOHCC-Condition-health-insurance-coverage-status
Title: "SDOHCC Condition - Health Insurance Coverage Status"
Description: "Profile for Social Determinants of Health (SDOH) Condition for the Health Insurance Coverage Status domain meant for computational use. Review the [Base SDOHCCCondition profile](StructureDefinition-SDOHCC-Condition.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#health-insurance-coverage-status
* code ^binding.extension[0].url = $add-binding
* code ^binding.extension[=].extension[0].url = "purpose"
* code ^binding.extension[=].extension[=].valueCode = #extensible
* code ^binding.extension[=].extension[+].url = "valueSet"
* code ^binding.extension[=].extension[=].valueCanonical = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.148
//* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.148 (required)