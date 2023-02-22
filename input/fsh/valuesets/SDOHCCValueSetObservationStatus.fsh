ValueSet: SDOHCCValueSetObservationStatus
Id: SDOHCC-ValueSetObservationStatus
Title: "SDOHCC ValueSet Observation Status"
Description: "Codes for the status of a screening response observation."
* ^status = #draft
* ^version = "0.1.0"
* ^meta.versionId = "3"
* ^meta.lastUpdated = "2022-09-20T21:39:16.172+00:00"
* ^meta.source = "#9nXX95sQy2O3Vtv4"
* ^experimental = false
* ObservationStatus#final "Final"
* ObservationStatus#corrected "Corrected"
* ObservationStatus#entered-in-error "Entered in Error"
* ObservationStatus#unknown "Unknown"