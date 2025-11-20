
### Purpose
This profile is used to pass an [SDOHCC Service Request](StructureDefinition-SDOHCC-ServiceRequest.html) (the `Task.focus` field) authored by a Practitioner or Organization (.requester field) targeting a Patient, Related Person or Group (`Task.for` field) to a service-providing organization. These fields are required.  The `Task.output` is used to return a collection of procedure codes or references to procedures that were performed in fulfillment of the referral.

If the Task is posted to the service delivery system and the ServiceRequest is on a different system, the reference should be absolute.
The Task can be updated by either the service requester or the recipient.

### Usage

#### Checking Task Status
See [Checking Task Status](checking_task_status.html).

#### Status Management
The status values allow for a complete flow of the Task in both the requesting and performing systems.

The allowed state transitions are defined graphically in the state diagram below, and are described in the table below.

{% include img.html img="ReferralTaskStateDiagram.svg" caption="Figure 1: Referral Task State Diagram" %}

| Code | Display | Definition | Set By |
| ---- | ------- | ---------- | ------ |
| `draft` | Draft | The task is not yet ready to be acted upon | Requester |
| `requested` | Requested | The task is ready to be acted upon and action is sought | Requester |
| `accepted` | Accepted | The potential performer has agreed to execute the task but has not yet started work | Referral Target |
| `rejected` | Rejected | The potential performer has decided not to execute it prior to performing any action. | Referral Target |
| `cancelled`  | Cancelled  | The task was not completed | Requester or Referral Target |
| `in-progress` | In Progress | The task has been started but is not yet complete | Referral Target |
| `on-hold`  |On Hold | The task has been started but work has been paused. | Referral Target  |
| `failed` | Failed | The task was attempted but could not be completed due to some error. |  Referral Target|
| `completed` | Completed | The task has been completed. |  Referral Target|
| `entered-in-error` | Entered in Error | The task should never have existed and is retained only because of the possibility it may have been used | Requester |
{:.grid}

#### Content-Rich Referral

If a referral requester wants to include additional information relevant that could be relevant for an individual's provision of care or assessment by the referral recipient, the requester can attach these resources to the initial Task resource through `Task.input`. This profile slices the `Task.input` element to allow the referral requester to reference any resource to allow for flexibility in the information that is sent to the referral recipient.

For example, a referral requester want to send a request to a CBO to assist with the enrollment of an individual into a program to support with food insecurity. The requester may want to include in the request the completed assessment(s) that led to the action of submitting a referral. The requester will reference those assessments (`QuestionnaireResponse`, `SDOHCC Observation Screening Response`, etc.) in `Task.input`.


{% include markdown-link-references.md %}