Instance: SDOHCC-ObservationEthnicityOMBExample
InstanceOf: SDOHCCObservationEthnicityOMB
Title: "SDOHCC Observation Ethnicity OMB Example"
Description: "An example of an ethnicity Observation where the subject self-reports as Hispanic or Latino with detailed ethnicity information that highlights elements and repetitions."
Usage: #example
//* category[SDOH] = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic "Personal Characteristic"
//* code = $loinc#69490-1 "Ethnicity OMB.1997"
* status = #final
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* method = $SDOHCC-CodeSystemTemporaryCodes#self-reported "Self Reported"
* component[DetailedEthnicity][0].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#2182-4 "Cuban"
* component[DetailedEthnicity][1].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#2159-2 "Nicaraguan"
* component[Ethnicity].valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#2135-2 "Hispanic or Latino"
* component[EthnicityDescription].valueString = "Hispanic, Cuban on my mom's side and Nicaraguan on my dad's side"