Profile: SDOHCCObservationScreeningResponse_transportation_insecurity
Parent: SDOHCCObservationScreeningResponse
Id: SDOHCC-ObservationScreeningResponse-transportation-insecurity
Title: "SDOHCC Observation Screening Response - Transportation Insecurity"
Description: "Profile for Social Determinants of Health (SDOH) Observation Screening Response for the Transportation Insecurity domain meant for computational use. Review the [Base SDOHCCObservationScreeningResponse profile](StructureDefinition-SDOHCC-ObservationScreeningResponse.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#transportation-insecurity
* valueCodeableConcept ^binding.extension[0].url = $add-binding
* valueCodeableConcept ^binding.extension[=].extension[0].url = "purpose"
* valueCodeableConcept ^binding.extension[=].extension[=].valueCode = #extensible
* valueCodeableConcept ^binding.extension[=].extension[+].url = "valueSet"
* valueCodeableConcept ^binding.extension[=].extension[=].valueCanonical = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.182
//* valueCodeableConcept from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.182 (required)