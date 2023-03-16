Instance: SDOHCC-ObservationRaceOMBMotherExample
InstanceOf: SDOHCCObservationRaceOMB
Title: "SDOHCC-Observation Race OMB Mother Example"
Description: "An example of a race Observation that uses Observation.focus to make an Observation about the race of the subject’s mother (who is his caretaker)."
Usage: #example
//* category = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic "Personal Characteristic"
//* code = $loinc#72826-1 "Race OMB.1997"
* status = #final
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* focus.reference = "RelatedPerson/SDOHCC-RelatedPersonMotherExample"
* focus.display = "Eve Everywoman"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* method = $SDOHCC-CodeSystemTemporaryCodes#reported-by-related-person "Reported By Related Person"
* component[0].code = $loinc#72826-1 "Race OMB.1997"
* component[=].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#1002-5 "American Indian or Alaska Native"
* component[+].code = $loinc#72826-1 "Race OMB.1997"
* component[=].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#1102-3 "Cheyenne"
* component[+].code = $loinc#72826-1 "Race OMB.1997"
* component[=].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#1088-4 "Cherokee"
* component[+].code = $loinc#72826-1 "Race OMB.1997"
* component[=].valueString = "Cherokee and Cheyenne"