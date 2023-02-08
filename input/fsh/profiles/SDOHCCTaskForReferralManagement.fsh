Profile: SDOHCCTaskForReferralManagement
Parent: Task
Id: SDOHCC-TaskForReferralManagement
Title: "SDOHCC Task For Referral Management"
Description: "Profile for tasks requesting fulfillment of an SDOHCC ServiceRequest (i.e. referral for service) and subsequently tracking and managing the fulfillment of that referral."
* ^meta.versionId = "5"
* ^meta.lastUpdated = "2022-05-10T15:07:12.720+00:00"
* ^meta.source = "#tgdzTypVvy7mfvm3"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2020-12-14T04:01:34+00:00"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^short = "A request to fulfill an SDOH service request"
  * ^comment = "For Tasks used in requesting fulfillment of an SDOHCC ServiceRequest (i.e. referral for service) and subsequently tracking and managing the fulfillment of that referral."
* partOf ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "resolve()"
  * ^slicing.rules = #open
* partOf contains SupportedPartOf 0..* MS
* partOf[SupportedPartOf] only Reference(SDOHCCTaskForReferralManagement)
  * ^requirements = "Allows an organization (e.g., a Coordination Platform) to create a Task, based on an SDOHCC Task from a referral source, to pass on to another organization (e.g., a  Community Based Organization)."
* status MS
  * ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size. For further details on Task.status see [Checking Task Status](checking_task_status.html)."
* statusReason MS
  * ^comment = "This applies to the current status.  Look at the history of the task to see reasons for past statuses. If the Task.status is rejected, cancelled, on-hold, or failed, then Task.statusReason.text should be included."
  * text 1.. MS
* intent = #order (exactly)
  * ^short = "order"
  * ^definition = "Indicates the \"level\" of actionability associated with the Task."
  * ^comment = "A request to fulfill task is always an order."
* priority MS
  * ^comment = "Task.priority should be used to distinguish urgent tasks (e.g., needs shelter immediately) from routine tasks."
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
  * ^requirements = "This element is Must Support. However, it is not mandatory in order to allow a task to be created without an owner so that one of a potential group of performers can elect to \"own\" the task (e.g., an 'open' request for fulfillment is set and anyone capable of filling the order can claim it.)"
* output ^slicing.discriminator[0].type = #pattern
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.discriminator[+].type = #type
  * ^slicing.discriminator[=].path = "value"
  * ^slicing.rules = #open
* output contains
    PerformedActivityReference 0..* MS and
    PerformedActivityCode 0..* MS
* output[PerformedActivityReference].type = $SDOHCC-CodeSystemTemporaryCodes#resulting-activity
* output[PerformedActivityReference].value[x] only Reference
* output[PerformedActivityReference].value[x] MS
* output[PerformedActivityCode].type = $SDOHCC-CodeSystemTemporaryCodes#resulting-activity
* output[PerformedActivityCode].value[x] only CodeableConcept
* output[PerformedActivityCode].value[x] MS