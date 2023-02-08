Instance: SDOHCC-ObservationResponseHungerVitalSignQuestion2Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response Hunger Vital Sign Question 2 Example"
Description: "An example of a screening response Observation that represents the second question (LOINC code 88123-5) and answer from the Hunger Vital Sign [HVS] screening questionnaire represented in LOINC."
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-03T01:20:13.913+00:00"
* meta.source = "#wKZYwCGk24dXCysA"
* status = #final
* category[0] = $observation-category#social-history "Social History"
* category[+] = $observation-category#survey "Survey"
* category[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $loinc#88123-5 "Within the past 12 months the food we bought just didn't last and we didn't have money to get more [U.S. FSS]"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* issued = "2020-09-10T21:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $loinc#LA28397-0 "Often true"
* derivedFrom.reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponseHungerVitalSignExample"