Instance: SDOHCC-ObservationResponsePRAPAREEmploymentStatusExample
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response PRAPARE Employment Status Example"
Description: "An example of a screening response Observation that represents a question and answer related to employment status from the PRAPARE questionnaire represented in LOINC."
Usage: #example
//* category[Survey] = $observation-category#survey "Survey"
* category[survey] = $observation-category#survey "Survey"
* category[screening-assessment] = USCoreCategory#sdoh "SDOH"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#employment-status "Employment Status"
* status = #final
* code = $loinc#67875-5 "Employment status - current"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2021-04-26T13:56:33.747Z"
* issued = "2021-04-26T13:56:33.747Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $loinc#LA17956-6 "Unemployed"
* derivedFrom.reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponsePRAPAREExample"