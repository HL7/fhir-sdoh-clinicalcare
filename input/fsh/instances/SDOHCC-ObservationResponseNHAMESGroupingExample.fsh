
RuleSet: NHANESCommon
* category[SocialHistory] = $observation-category#social-history "Social History"
* category[Survey] = $observation-category#survey "Survey"
* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#social-connection "Social Connection"
* status = #final
* code = $loinc#76506-5 "Social Connection and Isolation Panel"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2020-09-10T21:56:54.671Z"
* performer.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* performer.display = "Dr Jan Water"
* issued = "2020-09-10T21:56:54.671Z"

Instance: SDOHCC-ObservationResponseNHANESGroupingExample
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Grouping Example"
Description: "An example of an Observation grouping that uses hasMember to group 6 Observations from the LOINC Social connection and isolation panel (LOINC code 76506-5)
because QuestionnaireResponse is not referenced by the 6 individual Observations created from the panel. In the absence of the references to QuestionnaireResponse,
this example illustrates how the 6 Observations from the panel can be linked in an Observation grouping."
Usage: #example
* insert NHANESCommon
* code = $loinc#76506-5 "Social Connection and Isolation Panel"
* hasMember[SupportedHasMember][0].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion1Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion2Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion3Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion4Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion5Example"
* hasMember[SupportedHasMember][+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion6Example"
