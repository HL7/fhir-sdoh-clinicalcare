ValueSet: SDOHCCValueSetTaskStatus
Id: SDOHCC-ValueSetTaskStatus
Title: "SDOHCC ValueSet Task Status"
Description: "Codes for the status of a task for a patient."
* ^status = #draft
* ^version = "0.1.0"
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2022-09-20T21:39:15.922+00:00"
* ^meta.source = "#UFKtkKm03vaOevPk"
* ^experimental = false
* TaskStatus#ready "Ready"
* TaskStatus#in-progress "In Progress"
* TaskStatus#completed "Completed"
* TaskStatus#cancelled "Cancelled"
* TaskStatus#on-hold "On Hold"