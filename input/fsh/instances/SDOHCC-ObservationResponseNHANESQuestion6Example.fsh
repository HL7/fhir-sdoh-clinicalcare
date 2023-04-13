Instance: SDOHCC-ObservationResponseNHANESQuestion6Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response Hunger Vital Sign Question 1 Example"
Description: "An example of a screening response Observation that represents the score from the NHANES screening questionnaire represented in LOINC."Usage: #example
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $loinc#76511-5	"Do you belong to any clubs or organizations such as church groups unions, fraternal or athletic groups, or school groups?"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* issued = "2020-09-10T21:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueInteger = 7
* derivedFrom[0].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion1Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion2Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion3Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion4Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion5Example"
