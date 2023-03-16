Instance: SDOHCC-ObservationResponseHungerVitalSignQuestion2Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response Hunger Vital Sign Question 2 Example"
Description: "An example of a screening response Observation that represents the second question (LOINC code 88123-5) and answer from the Hunger Vital Sign [HVS] screening questionnaire represented in LOINC."
Usage: #example
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $loinc#88123-5 "Within the past 12 months the food we bought just didn't last and we didn't have money to get more [U.S. FSS]"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* issued = "2020-09-10T21:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $loinc#LA28397-0 "Often true"
* derivedFrom.reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponseHungerVitalSignExample"