
### Purpose
This profile is used to pass a [SDOHCCServiceRequest] (the .focus field) authored by a Practitioner or Organization (.requester field) targetting an Patient, Related Person or Group (.for field) to a service-providing organization. These input fields are required.  The .output is used to return a collection of procedure codes or references to procedures that were performed in fulfillment of the referral.

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
| `received` | Received | A potential performer has claimed ownership of the task and is evaluating whether to perform it | Responder |
| `accepted` | Accepted | The potential performer has agreed to execute the task but has not yet started work | Responder |
| `rejected` | Rejected | The potential performer has decided not to execute it prior to performing any action. | Responder |
| `ready` | Ready | The task is ready to be performed, but no action has been taken. Used in place of requwested/received/accepted/rejected when request assignment and acceptance is given| Responder |
| `in-progress` | In Progress | The task has been started but is not yet complete | Patient App |
| `completed` | Completed | The task has been completed. |  Responder|
| `canceled`  |Canceled  | The task was not completed | Requester or Responder |
| `on-hold`  |On Hold | The task has been started but work has been paused. | Responder  |
| `entered-in-error` | Entered in Error | The task should never have existed and is retained only because of the possiblity it may have been used | Requester |
{:.grid}


{% include markdown-link-references.md %}