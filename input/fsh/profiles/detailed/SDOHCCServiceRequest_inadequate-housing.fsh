Profile: SDOHCCServiceRequest_inadequate_housing
Parent: SDOHCCServiceRequest
Id: SDOHCC-ServiceRequest-inadequate-housing
Title: "SDOHCC ServiceRequest - Inadequate Housing"
Description: "Profile for Social Determinants of Health (SDOH) ServiceRequest for the Inadequate Housing domain meant for computational use. Review the [Base SDOHCCServiceRequest profile](StructureDefinition-SDOHCC-ServiceRequest.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#inadequate-housing
* code ^binding.extension[0].url = $add-binding
* code ^binding.extension[=].extension[0].url = "purpose"
* code ^binding.extension[=].extension[=].valueCode = #extensible
* code ^binding.extension[=].extension[+].url = "valueSet"
* code ^binding.extension[=].extension[=].valueCanonical = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.53
//* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.53 (required)