Instance: SDOHCC-ObservationAssessmentSocialIsolationExample
InstanceOf: SDOHCCObservationAssessment
Title: "SDOHCC Observation Assessment Social Isolation Example"
Description: "An example of a social isolation Observation that is not necessarily derived only from a screening survey. This observation involves additional assessment (e.g., by a provider, payer, etc.). This example also includes an Observation.category (i.e., Social Connection) that, at the time the example was added to the IG, was not yet in the “SDOHCC ValueSet SDOH Category”. The example illustrates that categorization is possible using category codes that may not yet be included in the SDOHCC ValueSet SDOH Category (which will continue to be expanded as the Gravity Project continues to develop SDOH terminology content)."
Usage: #example
//* category[0] = $observation-category#social-history "Social History"
* category[SDOH] = $other-code-system#social-connection "Social Connection"
* status = #final
* code = $sct#422650009 "Social isolation"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2021-05-10T21:56:54.671Z"
* performer.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* performer.display = "Dr Jan Water"
* valueBoolean = true