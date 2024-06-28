ValueSet: SDOHCCValueSetReferralTaskStatus
Id: SDOHCC-ValueSetReferralTaskStatus
Title: "SDOHCC ValueSet Referral Task Status"
Description: "Codes for the status of a referral task."
* ^status = #active
* ^experimental = false
* include codes from valueset TaskStatus
* exclude TaskStatus#ready
* exclude TaskStatus#received
