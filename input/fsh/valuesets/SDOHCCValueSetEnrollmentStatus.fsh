ValueSet: SDOHCCValueSetEnrollmentStatus
Id: SDOHCC-ValueSetEnrollmentStatus
Title: "SDOHCC ValueSet Enrollment Status"
Description: "Codes for the enrollment status for a patient."
* ^status = #active
* ^experimental = false
* SDOHCCCodeSystemTemporaryCodes#is-enrolled "Is Enrolled"
* SDOHCCCodeSystemTemporaryCodes#not-enrolled "Not Enrolled"
* SDOHCCCodeSystemTemporaryCodes#not-enrolled-on-waitlist "Not Enrolled - On Waitlist"