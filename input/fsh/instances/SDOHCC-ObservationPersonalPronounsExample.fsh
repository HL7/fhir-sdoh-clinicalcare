Instance: SDOHCC-ObservationPersonalPronounsExample
InstanceOf: SDOHCCObservationPersonalPronouns
Title: "SDOHCC Observation Personal Pronouns Example"
Description: "An example of a personal pronoun Observation where the subject self-reports their pronoun preference."
Usage: #example
//* category = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic "Personal Characteristic"
//* code = $loinc#90778-2 "Personal pronouns - Reported"
* status = #final
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* valueCodeableConcept = $loinc#LA29518-0 "he/him/his/his/himself"
* method = $SDOHCC-CodeSystemTemporaryCodes#self-reported "Self Reported"