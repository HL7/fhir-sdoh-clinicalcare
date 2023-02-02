Instance: SDOHCC-ObservationResponseHungerVitalSignGroupingExample
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response Hunger Vital Sign Grouping Example"
Description: "An example of an Observation grouping that has as its members the 3 Observations generated from the LOINC Hunger Vital Sign [HVS] questionnaire (LOINC code 88121-9)."
Usage: #example
* meta.versionId = "2"
* meta.lastUpdated = "2021-06-10T15:34:45.654+00:00"
* meta.source = "#PyoPZHNCWaQ9oBSE"
* status = #final
* category[0] = $observation-category#social-history "Social History"
* category[+] = $observation-category#survey "Survey"
* category[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $loinc#88121-9 "Hunger Vital Sign [HVS]"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* hasMember[0].reference = "Observation/SDOHCC-ObservationResponseHungerVitalSignQuestion1Example"
* hasMember[+].reference = "Observation/SDOHCC-ObservationResponseHungerVitalSignQuestion2Example"
* hasMember[+].reference = "Observation/SDOHCC-ObservationResponseHungerVitalSignQuestion3Example"
* derivedFrom.reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponseHungerVitalSignExample"