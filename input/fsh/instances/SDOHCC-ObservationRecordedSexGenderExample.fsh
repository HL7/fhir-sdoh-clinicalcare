Instance: SDOHCC-ObservationRecordedSexGenderExample
InstanceOf: SDOHCCObservationRecordedSexGender
Title: "SDOHCC Observation Recorded Sex Gender Example"
Description: "An example of a recorded sex or gender Observation where a clinic has derived the designation M (male) from the subject’s driver’s license."
Usage: #example
////* category = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic "Personal Characteristic"
* code = $loinc#99502-7 "Recorded sex or gender"
* status = #final
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2022-04-10T23:56:54.671Z"
* performer.reference = "Organization/SDOHCC-OrganizationClinicExample"
* performer.display = "Better Health Clinic"
* valueCodeableConcept = $loinc#LA15170-6 "M"
* method = $SDOHCC-CodeSystemTemporaryCodes#derived-specify "Derived Specify"
* derivedFrom.identifier.type = $v2-0203#DL "Driver's license number"
* derivedFrom.display = "Driver's license"