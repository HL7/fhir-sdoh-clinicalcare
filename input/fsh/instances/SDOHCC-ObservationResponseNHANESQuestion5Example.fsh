Instance: SDOHCC-ObservationResponseNHANESQuestion5Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 5 Example"
Description: "An example of a screening response Observation that represents the fifth question from the NHANES screening questionnaire represented in LOINC."Usage: #example
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
* valueCodeableConcept = $loinc#LA33-6 "Yes"
