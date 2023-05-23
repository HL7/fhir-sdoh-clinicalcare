### Purpose
This profile is used to pass a Task authored by a Practitioner or Organization (.requester field) targeting a Patient or Related Person (.owner field) to the individual. These fields are required.  The .output is used to return a response appropriate to the requested Task code.

### Usage

#### Types of Tasks

The table shows the types of tasks that can be assigned to the patient and the constraints imposed by each usage that are enforced through invariants:


|    Task Type     | Task.code             | Task.description | Task.input                  |  Task.output                                    |   Task.focus |
| ------------------ | --------------------- | ---------------- | --------------------------- |------------------------------------------------ | ------ |
| Questionnaire (FHIR)| `complete-questionnaire` |  | questionnaire, questionnaire-category required | If present, questionnaire-response   | |
| Questionnaire (PDF)| `complete-questionnaire`  | | questionnaire-pdf, questionnaire-category required | If present, questionnaire-pdf-completed   | |
| Questionnaire (URL)| `complete-questionnaire` | | questionnaire-url, questionnaire-category required |     | |
| General Information  | `general-information` | required |        | If present, general-information-response |  |
| Make Contact Directions |  `make-contact` |  | at least one contact-entity is required | If present, chosen-contact |
| Review Material | `review-material` | |  | | DocumentReference required. |
{:.grid}

#### Checking Task Status
See [Checking Task Status](checking_task_status.html).

#### Status Management
The status values constrain the Task to specific states that are required to support communication with a patient application.

The allowed state transitions are defined graphically in the state diagram below, and are described in the table below.

{% include img.html img="PatientTaskStateDiagram.svg" caption="Figure 1: Patient Task State Diagram" %}

| Code | Display | Definition | Set By |
| ---- | ------- | ---------- | ------ |
| `ready` | Ready | The task is ready to be performed, but no action has been taken. Used in place of requested/received/accepted/rejected when request assignment and acceptance is given| Requester |
| `in-progress` | In Progress | The task has been started but is not yet complete | Patient App |
| `completed` | Completed | The task has been completed. |  Patient App|
| `cancelled`  |Cancelled  | The task was not completed | Requester or Patient App |
| `on-hold`  |On Hold | The task has been started but work has been paused. | |
| `failed` | Failed | The task was attempted but could not be completed due to some error. |  Patient App|
{:.grid}

### Modification of fields
In addition to a limited set of status values, the patient application is only permitted to modify a specific set of elements in responding to the task request.  These elements include: .status, .statusReason, and .output.  All other elements are outside of the scope of this IG. The patient application cannot modify the status of the referral task (SDOHCC Task For Referral Management), that can only be done by the requester and the performing or intermediary entity.

{% include markdown-link-references.md %}