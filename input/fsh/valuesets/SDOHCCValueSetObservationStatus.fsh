ValueSet: SDOHCCValueSetObservationStatus
Id: SDOHCC-ValueSetObservationStatus
Title: "SDOHCC ValueSet Observation Status"
Description: "Codes for the status of a screening response observation."
* ^status = #draft
* ^experimental = false
* ObservationStatus#final "Final"
* ObservationStatus#corrected "Corrected"
* ObservationStatus#entered-in-error "Entered in Error"
* ObservationStatus#unknown "Unknown"