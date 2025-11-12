ValueSet: SDOHCCValueSetProgramEnrollmentStatus
Id: SDOHCC-ValueSetEnrollmentStatus
Title: "SDOHCC ValueSet Program Enrollment Status"
Description: "Codes for the program enrollment status for a patient."
* ^status = #active
* ^experimental = false
* SDOHCCCodeSystemTemporaryCodes#enrolled "Enrolled"
* SDOHCCCodeSystemTemporaryCodes#not-enrolled "Not Enrolled"
* SDOHCCCodeSystemTemporaryCodes#not-enrolled-on-waitlist "Not Enrolled - On Waitlist"