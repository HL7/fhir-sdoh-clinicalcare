
### Usage
See [Checking Task Status](checking_task_status.html).

Supports the following types of tasks:
| Task type | Request | Response |
| ----      | ------- | -------- |
| questionairre | pdf or structured | pdf or structured |

#### Status Management
The status values constrain the task to specific states that are required to support communication with a patient application.

The allowed state transitions are defined graphically in the state diagram below, and are described in the table below.

{% include img.html img="PatientTaskStateDiagram.svg" caption="Figure 1: Patient Task State Diagram" %}

| Code | Display | Definition | Set By |
| ---- | ------- | ---------- | ------ |
| `ready` | Ready | The task is ready to be performed, but no action has been taken. Used in place of requwested/received/accepted/rejected when request assignment and acceptance is given| Requester |
| `in-progress` | In Progress | The task has been started but is not yet complete | Patient App |
| `completed` | Completed | The task has been completed. |  Patient App|
| `cancelled`  |Cancelled  | The task was not completed | Requester or Patient App |
| `on-hold`  |On Hold | The task has been started but work has been paused. | |
{:grid.}

### Modification of fields
In addition to a limited set of status values, the patient application is only permitted to modify a specific set of elements in responding to the task request.  These elements include: .Status, .StatusReason, and .Output.  All other elements are outside of the scope of this IG. The patient application cannot modify the status of the referral task, that can only be done by the requester and the performing or intermediary entity.

{% include markdown-link-references.md %}