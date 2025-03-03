Instance: SDOHCC-ObservationAssessmentInadequateFoodIntakeExample
InstanceOf: SDOHCCObservationAssessment
Title: "SDOHCC Observation Assessment Inadequate Food Intake Example"
Description: "An example of an inadequate food intake Observation that is not necessarily derived only from a screening survey. This observation involves additional assessment (e.g., by a provider, payer, etc.)."
Usage: #example
//* category[0] = $observation-category#social-history "Social History"
// * category[SocialHistory] = $observation-category#social-history "Social History"
* category[us-core][sdoh] = USCoreCategory#sdoh "SDOH"
* category[SDOHCC] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* status = #final
* code = $sct#699653008 "Inadequate oral food intake for physiological needs"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2021-05-10T21:56:54.671Z"
* performer.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* performer.display = "Dr Jan Water"
* valueBoolean = true