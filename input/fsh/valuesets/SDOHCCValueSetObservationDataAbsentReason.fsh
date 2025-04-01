ValueSet: SDOHCCValueSetObservationDataAbsentReason
Id: SDOHCC-ValueSetObservationDataAbsentReason
Title: "SDOHCC ValueSet Observation DataAbsentReason"
Description: "Codes for the reason an observation does not have a value."
* ^status = #active
* ^experimental = false
* DataAbsentReason|1.0.0#unknown "Unknown"
* DataAbsentReason|1.0.0#asked-unknown "Asked But Unknown"
* DataAbsentReason|1.0.0#temp-unknown "Temporarily Unknown"
* DataAbsentReason|1.0.0#not-asked "Not asked"
* DataAbsentReason|1.0.0#asked-declined "Asked But Declined"
* DataAbsentReason|1.0.0#masked "Masked"