Instance: SDOHCC-ObservationSexualOrientationExample
InstanceOf: SDOHCCObservationSexualOrientation
Title: "SDOHCC Observation Sexual Orientation Example"
Description: "An example of a sexual orientation Observation where the subject self-reports as homosexual."
Usage: #example
* code = $loinc#76690-7 "Sexual orientation"
* status = #final
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $loinc#LA22875-1 "Homosexual"
* method = $SDOHCC-CodeSystemTemporaryCodes#self-reported "Self Reported"