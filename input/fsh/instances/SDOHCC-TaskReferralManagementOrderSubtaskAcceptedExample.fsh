Instance: SDOHCC-TaskReferralManagementOrderSubtaskAcceptedExample
InstanceOf: SDOHCCTaskForReferralManagement
Title: "SDOHCC Task Referral Management Order Subtask Accepted Example"
Description: "An example of an accepted Task For Referral Management that delegates responsibility to fulfill a referral from an intermediary organization to another organization (e.g., when a Coordination Platform receives a Task from a referral source and passes it on to a Community Based Organization)."
Usage: #example
* meta.versionId = "4"
* meta.lastUpdated = "2021-11-15T20:50:16.069+00:00"
* meta.source = "#s9h4KErwVJi21IqY"
* partOf.reference = "Task/SDOHCC-TaskReferralManagementOrderFulfillmentAcceptedExample"
* status = #accepted
* intent = #order
* code = $task-code#fulfill "Fulfill the focal request"
* focus.reference = "ServiceRequest/SDOHCC-ServiceRequestSubreferralSummerFoodProgramExample"
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2020-09-12T20:56:53.671Z"
* requester.reference = "Organization/SDOHCC-OrganizationCoordinationPlatformExample"
* requester.display = "ABC Coordination Platform"
* owner.reference = "Organization/SDOHCC-OrganizationClinicExample"
* owner.display = "Better Health Clinic"