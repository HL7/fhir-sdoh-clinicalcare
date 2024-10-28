Instance: SDOHCC-ObservationResponsePRAPAREHousingStatusExample
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response PRAPARE Housing Status Example"
Description: "An example of a screening response Observation that represents a question and answer related to housing status from the PRAPARE questionnaire represented in LOINC."
Usage: #example
//* category[Survey] = $observation-category#survey "Survey"
* category[survey] = $observation-category#survey "Survey"
* category[screening-assessment] = USCoreCategory#sdoh "SDOH"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#homelessness "Homelessness"
* status = #final
* code = $loinc#71802-3 "Housing status"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2021-04-26T13:56:33.747Z"
* issued = "2021-04-26T13:56:33.747Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $loinc#LA30190-5 "I do not have housing (staying with others, in a hotel, in a shelter, living outside on the street, on a beach, in a car, or in a park)"
* derivedFrom.reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponsePRAPAREExample"