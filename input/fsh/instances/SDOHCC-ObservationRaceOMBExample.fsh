Instance: SDOHCC-ObservationRaceOMBExample
InstanceOf: SDOHCCObservationRaceOMB
Title: "SDOHCC Observation Race OMB Example"
Description: "An example of a race Observation where the subject self-reports as more than one race with detailed race information that highlights elements and repetitions."
Usage: #example
//* category = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic "Personal Characteristic"
//* code = $loinc#72826-1 "Race OMB.1997"
* status = #final
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* method = $SDOHCC-CodeSystemTemporaryCodes#self-reported "Self Reported"
* component[Race][0].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#1002-5 "American Indian or Alaska Native"
* component[Race][1].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
* component[DetailedRace][0].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#1102-3 "Cheyenne"
* component[DetailedRace][1].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#1088-4 "Cherokee"
* component[RaceDescription].valueString = "White on my dad's side, Cherokee and Cheyenne on my mom's side"