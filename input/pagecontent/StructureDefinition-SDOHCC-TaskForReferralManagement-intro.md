
### Purpose
This profile is used to pass a [SDOHCCServiceRequest] (the .focus field) authored by a Practitioner or Organization (.requester field) targeting an Patient, Related Person or Group (.for field) to a service-providing organization. These input fields are required.  The .output is used to return a collection of procedure codes or references to procedures that were performed in fulfillment of the referral.

If the Task is posted to the service delivery system and the ServiceRequest is on a different system, the reference should be absolute.
The Task can be updated by either the service requester or the responder.

### Usage

#### Checking Task Status
See [Checking Task Status](checking_task_status.html).


#### Status Management
The status values allow for a complete flow of the task in both the requesting and performing systems.

The allowed state transitions are defined graphically in the state diagram below, and are described in the table below.

{% include img.html img="ReferralTaskStateDiagram.svg" caption="Figure 1: Referral Task State Diagram" %}

| Code | Display | Definition | Set By |
| ---- | ------- | ---------- | ------ |
| `draft` | Draft | The task is not yet ready to be acted upon | Requester |
| `requested` | Requested | The task is ready to be acted upon and action is sought | Requester |
| `accepted` | Accepted | The potential performer has agreed to execute the task but has not yet started work | Responder |
| `rejected` | Rejected | The potential performer has decided not to execute it prior to performing any action. | Responder |
| `canceled`  |Canceled  | The task was not completed | Requester or Responder |
| `in-progress` | In Progress | The task has been started but is not yet complete | Responder |
| `on-hold`  |On Hold | The task has been started but work has been paused. | Responder  |
| `failed` | Failed | The task was attempted but could not be completed due to some error. |  Responder|
| `completed` | Completed | The task has been completed. |  Responder|
| `entered-in-error` | Entered in Error | The task should never have existed and is retained only because of the possibility it may have been used | Requester |
{:.grid}


{% include markdown-link-references.md %}