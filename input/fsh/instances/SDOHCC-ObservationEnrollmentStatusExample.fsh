Instance: SDOHCC-ObservationEnrollmentStatusExample
InstanceOf: SDOHCC-ObservationProgramEnrollmentStatus
Title: "SDOHCC Observation Enrollment Status Example"
Description: "An example of a capturing the enrollment status of an individual for a social care program."
Usage: #example
//* category[0] = $observation-category#social-history "Social History"
// * category[SocialHistory] = $observation-category#social-history "Social History"
* category[us-core] = USCoreCategory#sdoh "SDOH"
* category[SDOHCC] = $SDOHCC-CodeSystemTemporaryCodes#program-enrollment-category "Program Enrollment Category"
* status = #final
* code = $SDOHCC-CodeSystemTemporaryCodes#SNAP "Supplemental Nutrition Assistance Program (SNAP)"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* valueCodeableConcept = $SDOHCC-CodeSystemTemporaryCodes#enrolled "Enrolled"
* focus.reference = "HealthcareService/SDOHCC-SocialCareProgramExample"
* effectiveDateTime = "2025-05-21T21:56:54.671Z"
* performer.reference = "Practitioner/SDOHCC-PractitionerPatWilliamsMSWExample"
* performer.display = "Pat Williams"
