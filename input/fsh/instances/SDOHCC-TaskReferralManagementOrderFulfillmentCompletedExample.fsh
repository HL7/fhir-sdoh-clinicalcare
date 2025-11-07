Instance: SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample
InstanceOf: SDOHCCTaskForReferralManagement
Title: "SDOHCC Task Referral Management Order Fulfillment Completed Example"
Description: "An example of a completed Task For Referral Management that has a ServiceRequest for assistance with applying to a food pantry as the Task.focus and a Procedure for assistance with applying to a food pantry as the Task.output."
Usage: #example
* intent = #order
* code = $task-code#fulfill "Fulfill the focal request"
* status = #completed
* focus.reference = "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2020-09-11T21:56:54.671Z"
* requester.reference = "PractitionerRole/SDOHCC-PractitionerRoleDrJanWaterExample"
* requester.display = "Dr Jan Water Family Medicine Physician"
* owner.reference = "Organization/SDOHCC-OrganizationCoordinationPlatformExample"
* owner.display = "ABC Coordination Platform"
* output[PerformedActivityReference]
    * type = $SDOHCC-CodeSystemTemporaryCodes#resulting-activity "Resulting Activity"
    * valueReference.reference = "Procedure/SDOHCC-ProcedureFoodPantryApplicationAssistanceExample"