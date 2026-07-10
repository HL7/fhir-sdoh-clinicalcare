ValueSet: SDOHCCValueSetCapacityStatus
Id: SDOHCC-ValueSetCapacityStatus
Title: "SDOHCC ValueSet Capacity Status"
Description: "Codes for the capacity status for a service."
* ^status = #active
* ^experimental = false
*  SDOHCCCodeSystemTemporaryCodes#no-capacity "No Capacity"
*  SDOHCCCodeSystemTemporaryCodes#capacity "Has Capacity"
*  SDOHCCCodeSystemTemporaryCodes#waitlist "No Capacity - Has Waitlist"