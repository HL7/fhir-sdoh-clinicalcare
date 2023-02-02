Instance: SDOHCC-TaskReferralManagementOrderFulfillmentAcceptedExample
InstanceOf: SDOHCCTaskForReferralManagement
Title: "SDOHCC Task Referral Management Order Fulfillment Accepted Example"
Description: "An example of an accepted Task For Referral Management that has as the Task.focus a ServiceRequest for assistance with applying to a food pantry."
Usage: #example
* meta.versionId = "6"
* meta.lastUpdated = "2022-04-22T14:37:03.283+00:00"
* meta.source = "#C2AE4q3wrTUNjyOs"
* status = #accepted
* intent = #order
* code = $task-code#fulfill "Fulfill the focal request"
* focus.reference = "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2020-09-11T21:56:54.671Z"
* requester.reference = "PractitionerRole/SDOHCC-PractitionerRoleDrJanWaterExample"
* requester.display = "Dr Jan Water Family Medicine Physician"
* owner.reference = "Organization/SDOHCC-OrganizationCoordinationPlatformExample"
* owner.display = "ABC Coordination Platform"