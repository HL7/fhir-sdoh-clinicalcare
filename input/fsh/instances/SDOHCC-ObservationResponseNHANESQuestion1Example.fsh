Instance: SDOHCC-ObservationResponseNHANESQuestion1Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 1 Example"
Description: "An example of a screening response Observation that represents the first question from the NHANES screening questionnaire represented in LOINC."
Usage: #example
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $loinc#63503-7	"Are you now married, widowed, divorced, separated, never married or living with a partner?"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* issued = "2020-09-10T21:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $loinc#LA48-4 "Married"
