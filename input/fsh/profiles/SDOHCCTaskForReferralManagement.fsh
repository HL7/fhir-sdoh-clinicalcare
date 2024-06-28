Profile: SDOHCCTaskForReferralManagement
Parent: Task
Id: SDOHCC-TaskForReferralManagement
Title: "SDOHCC Task For Referral Management"
Description: "Profile for tasks requesting fulfillment of an SDOHCC ServiceRequest (i.e. referral for service) and subsequently tracking and managing the fulfillment of that referral."

* ^status = #active
* . ^short = "A request to fulfill an SDOH service request"
* . ^comment = "For Tasks used in requesting fulfillment of an SDOHCC ServiceRequest (i.e. referral for service) and subsequently tracking and managing the fulfillment of that referral."
* insert OwningCommitteeExtension
* partOf ^slicing.discriminator[0].type = #profile
* partOf ^slicing.discriminator[=].path = "resolve()"
* partOf ^slicing.rules = #open
* partOf contains SupportedPartOf 0..* MS
* partOf[SupportedPartOf] only Reference(SDOHCCTaskForReferralManagement)
* partOf[SupportedPartOf] ^requirements = "Allows an organization (e.g., a Coordination Platform) to create a Task, based on an SDOHCC Task from a referral source, to pass on to another organization (e.g., a  Community Based Organization)."
* status MS
* status ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size. For further details on Task.status see [Checking Task Status](checking_task_status.html)."
* statusReason MS
* statusReason ^comment = "This applies to the current status.  Look at the history of the task to see reasons for past statuses. If the Task.status is rejected, cancelled, on-hold, or failed, then Task.statusReason.text should be included."
* statusReason.text 1.. MS
* intent = #order (exactly)
* intent ^short = "order"
* intent ^definition = "Indicates the \"level\" of actionability associated with the Task."
* intent ^comment = "A request to fulfill task is always an order."
* priority MS
* priority ^comment = "Task.priority should be used to distinguish urgent tasks (e.g., needs shelter immediately) from routine tasks."
* code 1..
* code = $task-code#fulfill
* focus 1.. MS
* focus only Reference(SDOHCCServiceRequest)
* for 1.. MS
* for only Reference(RelatedPerson or Group or USCorePatientProfile)
* authoredOn 1.. MS
* requester 1.. MS
* requester only Reference(USCorePractitionerRoleProfile or USCoreOrganizationProfile)
* owner MS
* owner ^requirements = "This element is Must Support. However, it is not mandatory in order to allow a task to be created without an owner so that one of a potential group of performers can elect to \"own\" the task (e.g., an 'open' request for fulfillment is set and anyone capable of filling the order can claim it.)"
* output ^slicing.discriminator[0].type = #pattern
* output ^slicing.discriminator[=].path = "type"
* output ^slicing.discriminator[+].type = #type
* output ^slicing.discriminator[=].path = "value"
* output ^slicing.rules = #open
* output contains
    PerformedActivityReference 0..* MS and
    PerformedActivityCode 0..* MS
* output[PerformedActivityReference].type = $SDOHCC-CodeSystemTemporaryCodes#resulting-activity
* output[PerformedActivityReference].valueReference only Reference(SDOHCCProcedure)
* output[PerformedActivityReference].valueReference 1..1 MS
* output[PerformedActivityCode].type = $SDOHCC-CodeSystemTemporaryCodes#resulting-activity
* output[PerformedActivityCode].valueCodeableConcept from USCoreProcedureCodes (required)
* output[PerformedActivityCode].valueCodeableConcept 1..1 MS
* status from SDOHCCValueSetReferralTaskStatus (required)