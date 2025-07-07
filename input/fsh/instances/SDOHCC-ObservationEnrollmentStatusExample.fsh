Instance: SDOHCC-ObservationEnrollmentStatusExample
InstanceOf: SDOHCC-ObservationEnrollmentStatus
Title: "SDOHCC Observation Enrollment Status Example"
Description: "An example of a capturing the enrollment status of an individual for a social care program."
Usage: #example
//* category[0] = $observation-category#social-history "Social History"
// * category[SocialHistory] = $observation-category#social-history "Social History"
* category[us-core] = USCoreCategory#sdoh "SDOH"
* status = #final
* code = $SDOHCC-CodeSystemTemporaryCodes#enrollment-status "Enrollment Status"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* valueCodeableConcept = $SDOHCC-CodeSystemTemporaryCodes#is-enrolled "Is Enrolled"
* focus.reference = "HealthcareService/SDOHCC-SocialCareProgramExample"
* effectivePeriod.start = "2025-05-21T21:56:54.671Z"
* effectivePeriod.end = "2029-05-20T21:56:54.671Z"
* performer.reference = "Practitioner/SDOHCC-PractitionerDrJanWaterExample"
* performer.display = "Dr Jan Water"
