Instance: SDOHCC-ObservationAssessmentTransportTooExpensiveExample
InstanceOf: SDOHCCObservationAssessment
Title: "SDOHCC Observation Assessment Transport Too Expensive Example"
Description: "An example of a transportation Observation that is not necessarily derived only from a screening survey. This observation involves additional assessment (e.g., by a provider, payer, etc.). This example also includes an Observation.category (i.e., Transportation Insecurity) that is included in the “SDOHCC ValueSet SDOH Category”. Additionally, a subcategory of Transportation Insecurity (i.e., Transportation Insecurity Financial) is included to illustrate that it is possible to further subcategorize a “SDOHCC ValueSet SDOH Category” code with a code that is not in the ValueSet."
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-11T17:29:56.907+00:00"
* meta.source = "#8WraELAZ2D0HBC1l"
* status = #final
* category[0] = $observation-category#social-history "Social History"
* category[+].coding[0] = $SDOHCC-CodeSystemTemporaryCodes#transportation-insecurity "Transportation Insecurity"
* category[=].coding[+] = $other-code-system#transportation-insecurity-financial "Transportation Insecurity Financial"
* code = $sct#160695008 "Transport too expensive"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2021-05-10T21:56:54.671Z"
* valueBoolean = true