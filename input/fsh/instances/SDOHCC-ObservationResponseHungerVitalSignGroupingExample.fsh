Instance: SDOHCC-ObservationResponseHungerVitalSignGroupingExample
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response Hunger Vital Sign Grouping Example"
Description: "An example of an Observation grouping that has as its members the 3 Observations generated from the LOINC Hunger Vital Sign [HVS] questionnaire (LOINC code 88121-9)."
Usage: #example
* category[SocialHistory] = $observation-category#social-history "Social History"
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $loinc#88121-9 "Hunger Vital Sign [HVS]"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* hasMember[SupportedHasMember][0].reference = "Observation/SDOHCC-ObservationResponseHungerVitalSignQuestion1Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseHungerVitalSignQuestion2Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseHungerVitalSignQuestion3Example"
* derivedFrom[SupportedDerivedFrom].reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponseHungerVitalSignExample"