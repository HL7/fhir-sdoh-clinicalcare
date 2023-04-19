
| #    | From |  Description | Instances involved | FHIR Transaction |
| --------------  | -------------- | -------------- | -------------- | -------------- |
| 1 |  Requester | Send e-mail with link to an application and instructions for authentication with the application |      | e-mail |
| 2 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) | [Transaction 1](FHIR_API_Examples.html#post-task-1) |
| 3 |  Patient  | Get Questionnaire, Questionnaire PDF, or Questionnaire URL | [Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html) | [Transaction 3](FHIR_API_Examples.html#post-task-1) |
| 4 |  Patient | Update Task (accepted) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 4](FHIR_API_Examples.html#post-task-1) |
| 5 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 5](FHIR_API_Examples.html#post-task-1) |
| 6 |  Patient | Post Questionnaire Response | [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) | [Transaction 6](FHIR_API_Examples.html#post-task-1) |
| 7 |  Patient | Update Task (completed and .Output references QuestionnaireResponse) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 7](FHIR_API_Examples.html#post-task-1) |
{:.grid}
