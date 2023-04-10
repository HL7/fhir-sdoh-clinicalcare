ValueSet: SDOHCCValueSetObservationDataAbsentReason
Id: SDOHCC-ValueSetObservationDataAbsentReason
Title: "SDOHCC ValueSet Observation DataAbsentReason"
Description: "Codes for the reason an observation does not have a value."
* ^status = #draft
* ^experimental = false
* DataAbsentReason#unknown "Unknown"
* DataAbsentReason#asked-unknown "Asked But Unknown"
* DataAbsentReason#temp-unknown "Temporarily Unknown"
* DataAbsentReason#not-asked "Not asked"
* DataAbsentReason#asked-declined "Asked But Declined"
* DataAbsentReason#masked "Masked"