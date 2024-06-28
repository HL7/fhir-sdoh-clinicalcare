Instance: SDOHCC-ObservationResponseHungerVitalSignQuestion3Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response Hunger Vital Sign Question 3 Example"
Description: "An example of a screening response Observation that represents Food insecurity risk [HVS] (LOINC code 88124-3) from the Hunger Vital Sign [HVS] questionnaire (LOINC code 88121-9). The Food insecurity risk [HVS] Observation is not answered directly. Rather, it is determined by the responses to the 2 questions on the Hunger Vital Sign [HVS] questionnaire. For this reason, this Observation does not have an Observation.performer. Additionally, this Observation demonstrates the use of “Observation.interpretation: POS” to indicate a possible Health-Related Social Need or risk in the Food Insecurity domain."
Usage: #example
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $loinc#88124-3 "Food insecurity risk [HVS]"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* issued = "2020-09-10T21:56:54.671Z"
* valueCodeableConcept = $loinc#LA19952-3 "At risk"
* derivedFrom[0].reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponseHungerVitalSignExample"   /// NEW
* interpretation = $v3-ObsInterpretation#POS "Positive"