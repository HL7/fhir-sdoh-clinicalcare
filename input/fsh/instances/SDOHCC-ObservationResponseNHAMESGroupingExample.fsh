Instance: SDOHCC-ObservationResponseNHANESGroupingExample
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Grouping Example"
Description: "An example of an Observation grouping that has as its members the 5 Observations generated from the LOINC NHANES questionnaire (LOINC code 76506-5)."
Usage: #example
* category[SocialHistory] = $observation-category#social-history "Social History"
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $loinc#76506-5 "Social Connection and Isolation Panel"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* hasMember[SupportedHasMember][0].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion1Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion2Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion3Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion4Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion5Example"
