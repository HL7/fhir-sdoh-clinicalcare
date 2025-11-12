Instance: SDOHCC-TaskReferralManagementOrderSubtaskCompletedExample
InstanceOf: SDOHCCTaskForReferralManagement
Title: "SDOHCC Task Referral Management Order Subtask Completed Example"
Description: "An example of a completed Task For Referral Management that delegates responsibility to fulfill a referral from an intermediary organization to another organization (e.g., when a Coordination Platform receives a Task from a referral source and passes it on to a Community Based Organization)."
Usage: #example

* intent = #order
* code = $task-code#fulfill "Fulfill the focal request"
* partOf.reference = "Task/SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample"
* status = #completed
* focus.reference = "ServiceRequest/SDOHCC-ServiceRequestSubreferralSummerFoodProgramExample"
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2019-09-12T21:56:54.671Z"
* requester.reference = "Organization/SDOHCC-OrganizationCoordinationPlatformExample"
* requester.display = "ABC Coordination Platform"
* owner.reference = "Organization/SDOHCC-OrganizationClinicExample"
* owner.display = "Better Health Clinic"
* output[PerformedActivityReference]
  * type = $SDOHCC-CodeSystemTemporaryCodes#resulting-activity "Resulting Activity"
  * valueReference.reference = "Procedure/SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample"