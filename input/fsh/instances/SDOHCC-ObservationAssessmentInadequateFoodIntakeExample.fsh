Instance: SDOHCC-ObservationAssessmentInadequateFoodIntakeExample
InstanceOf: SDOHCCObservationAssessment
Title: "SDOHCC Observation Assessment Inadequate Food Intake Example"
Description: "An example of an inadequate food intake Observation that is not necessarily derived only from a screening survey. This observation involves additional assessment (e.g., by a provider, payer, etc.)."
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-03T01:17:13.168+00:00"
* meta.source = "#tMMdSHjiyzXlG2nJ"
* status = #final
* category[0] = $observation-category#social-history "Social History"
* category[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $sct#699653008 "Inadequate oral food intake for physiological needs"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2021-05-10T21:56:54.671Z"
* valueBoolean = true