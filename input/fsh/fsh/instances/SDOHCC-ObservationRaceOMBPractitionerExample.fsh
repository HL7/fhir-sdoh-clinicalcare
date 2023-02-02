Instance: SDOHCC-ObservationRaceOMBPractitionerExample
InstanceOf: SDOHCCObservationRaceOMB
Title: "SDOHCC Observation Race OMB Practitioner Example"
Description: "An example of a race Observation that uses a FHIR extension on Observation.subject to make an Observation about the practitioner’s race."
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2022-04-15T15:50:14.303+00:00"
* meta.source = "#AnhcopcG6lpzIzuJ"
* extension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.subject"
* extension.valueReference.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* extension.valueReference.display = "Dr Jan Water"
* status = #final
* category = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic "Personal Characteristic"
* code = $loinc#72826-1 "Race OMB.1997"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* performer.display = "Dr Jan Water"
* method = $SDOHCC-CodeSystemTemporaryCodes#self-reported "Self Reported"
* component.code = $loinc#72826-1 "Race OMB.1997"
* component.valueCodeableConcept = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"