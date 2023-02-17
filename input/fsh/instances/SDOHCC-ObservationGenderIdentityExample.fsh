Instance: SDOHCC-ObservationGenderIdentityExample
InstanceOf: SDOHCCObservationGenderIdentity
Title: "SDOHCC Observation Gender Identity Example"
Description: "An example of a gender identity Observation where the subject self-reports their gender identity as male."
Usage: #example
* meta.versionId = "3"
* meta.lastUpdated = "2022-04-11T15:43:24.894+00:00"
* meta.source = "#BNAbjPsgHZ0ylsnZ"
* category = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic "Personal Characteristic"
* code = $loinc#76691-5 "Gender identity"
* status = #final
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $sct#446151000124109 "Identifies as male gender"
* method = $SDOHCC-CodeSystemTemporaryCodes#self-reported "Self Reported"