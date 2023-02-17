Instance: SDOHCC-ObservationSexualOrientationExample
InstanceOf: SDOHCCObservationSexualOrientation
Title: "SDOHCC Observation Sexual Orientation Example"
Description: "An example of a sexual orientation Observation where the subject self-reports as homosexual."
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2022-04-11T15:23:06.636+00:00"
* meta.source = "#G3YhcY8HoYrk7QlB"
* category = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic "Personal Characteristic"
* code = $loinc#76690-7 "Sexual orientation"
* status = #final
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $loinc#LA22875-1 "Homosexual"
* method = $SDOHCC-CodeSystemTemporaryCodes#self-reported "Self Reported"