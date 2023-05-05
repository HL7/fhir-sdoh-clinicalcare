### Purpose
This profile is used to pass a Task authored by a Practitioner or Organization (.requester field) targeting an Patient or Related Person (.owner field) to the individual. These input fields are required.  The .output is used to return a response appropriate to the requested Task code.

### Usage

#### Types of Tasks

The table shows the types of tasks that can be assigned to the patient and the constraints imposed by each usage that are enforced through invariants:


|    Description     | Task.code             | Task.description | Task.input                  |  Task.output                                    |   Other |
| ------------------ | --------------------- | ---------------- | --------------------------- |------------------------------------------------ | ------ |
| Questionaire (FHIR)| `complete-questionnaire` | required | questionnaire, questionnaire-category required | If present, questionnaire-response   | |
| Questionaire (PDF)| `complete-questionnaire`  | required| questionnaire-pdf, questionnaire-category required | If present, questionnaire-response   | |
| Questionaire (URL)| `complete-questionnaire` | required| questionnaire-url, questionnaire-category required | If present, questionnaire-response   | |
| General Information Request | `general-information` | required |        | If present, general-information-response | The request is in Task.description |
| Make Contact Directions |  `make-contact` |  | at least one Contact entity is required | If present, Task.output must be “chosen-contact” |
| Review Material | `review-material` | |  | | Task.focus of DocumentReference is required. |
{:.grid}

#### Checking Task Status
See [Checking Task Status](checking_task_status.html).

#### Status Management
The status values constrain the task to specific states that are required to support communication with a patient application.

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
In addition to a limited set of status values, the patient application is only permitted to modify a specific set of elements in responding to the task request.  These elements include: .status, .statusReason, and .output.  All other elements are outside of the scope of this IG. The patient application cannot modify the status of the referral task, that can only be done by the requester and the performing or intermediary entity.

{% include markdown-link-references.md %}