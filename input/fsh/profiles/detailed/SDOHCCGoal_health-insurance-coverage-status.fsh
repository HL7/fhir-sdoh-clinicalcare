Profile: SDOHCCGoal_health_insurance_coverage_status
Parent: SDOHCCGoal
Id: SDOHCC-Goal-health-insurance-coverage-status
Title: "SDOHCC Goal - Health Insurance Coverage Status"
Description: "Profile for Social Determinants of Health (SDOH) Goal for the Health Insurance Coverage Status domain meant for computational use. Review the [Base SDOHCCGoal profile](StructureDefinition-SDOHCC-Goal.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#health-insurance-coverage-status
* description ^binding.extension[0].url = $add-binding
* description ^binding.extension[=].extension[0].url = "purpose"
* description ^binding.extension[=].extension[=].valueCode = #extensible
* description ^binding.extension[=].extension[+].url = "valueSet"
* description ^binding.extension[=].extension[=].valueCanonical = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.121
//* description from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.121 (required)