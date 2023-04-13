Instance: SDOHCC-ObservationResponseNHANESQuestion2Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 2 Example"
Description: "An example of a screening response Observation that represents the second question from the NHANES screening questionnaire represented in LOINC."Usage: #example
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $loinc#76508-1 "In a typical week, how many times do you talk on the telephone with family, friends, or neighbors?"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* issued = "2020-09-10T21:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueQuantity = 7 'wk' "week"
