Instance: SDOHCC-ObservationResponseHungerVitalSignQuestion3Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response Hunger Vital Sign Question 3 Example"
Description: "An example of a screening response Observation that represents Food insecurity risk [HVS] (LOINC code 88124-3) from the Hunger Vital Sign [HVS] questionnaire (LOINC code 88121-9).  This Observation is derived from the first two questions in the Hunger Vital Sign [HVS] questionnaire. This Observation does not have an Observation.performer because Food insecurity risk [HVS] is derived as opposed to answered directly on the questionnaire."
Usage: #example
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $loinc#88124-3 "Food insecurity risk [HVS]"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* issued = "2020-09-10T21:56:54.671Z"
* valueCodeableConcept = $loinc#LA19952-3 "At risk"
* derivedFrom[0].reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponseHungerVitalSignExample"   /// NEW
