<div markdown="1" class="note-to-balloters">
The Gravity Project team has added text to the "Referral Use Care Overview" to provide guidance on how to include additional relevant information in a referral request, such as completed questionnaires, assessments, procedures, etc. We would encourage balloters to review this guidance and provide feedback.
</div>

This section describes the interactions between the actors in an SDOH referral starting both at a high-level and at the level of FHIR API calls.   First, a high-level overview of the interactions is provided.  This description abstracts technical details and should be accessible to the non-technical reader.
For the sake of simplicity, only relationships critical to the Referral Workflow are provided. (For additional details on task status updates see [Checking Task Status], and  on relationships between profiles see [Data Modeling Framework].)

The use cases here relate to the Gravity [Use Cases].  Implementers will benefit from looking at the detailed technical description of the exchange work flow for each use case, as well as the [Capability Statements](artifacts.html#behavior-capability-statements) associated with each workflow and the [conformance artifacts](artifacts.html) generally.

### Patient Coordination Workflow
This implementation guide supports additional interactions with a patient/client application (on a smartphone or portal) including:

| Functional Use Case       |  `Task.code`            |  Description                         | Actors           |
| ------------------------- | ----------------------- | ------------------------------------ | ---------------- |
| [Complete Questionnaire Request](patient_coordination_workflow.html#complete-questionnaire-request)|  `complete-questionnaire` | Requesting party (e.g., provider, CBO, or CP) asks a patient to complete a questionnaire. This functionality can be used to assess social risks, inform service qualification or application, indicate reasons for cancellation, or determine the patient’s view of their interaction with the CBO and whether the service provided met their needs. | ![providericon], ![patienticon], ![cboicon], ![cpicon]  |
| [General Information Request](patient_coordination_workflow.html#general-information-request)|  `general-information-request` | Requesting party sends a patient a free text question and receives a free text response.  | ![providericon], ![patienticon], ![cboicon], ![cpicon]  |
| [Make Contact Request](patient_coordination_workflow.html#make-contact-request)|   `make-contact-directions` | Requesting party provides contact information for the CBO (in cases where the patient does not want the CBO to initiate contact). | ![providericon], ![patienticon], ![cboicon], ![cpicon]  |
| [Review Material Request](patient_coordination_workflow.html#review-material-request)|   `review-material` | Requesting party requests that the patient review a document (usually a PDF), video, etc. | ![providericon], ![patienticon], ![cboicon], ![cpicon]  |
{:.grid}

In the examples below, it is assumed that the patient has been equipped with the patient application, and authenticated communication between the patient application and the requester has already been established.
See [Connecting Applications with API Data Sources](connecting_applications_with_api_data_sources.html#patientclient-applications) for more details.  The referenced data instances are all in their completed state. In practice, they would move through the state transitions indicated, with the requester initializing their input fields, and the patient completing the output fields, and updating the status.

#### Complete Questionnaire Request
Here we provide a detailed view of an example interaction between a patient application and a requester (provider, CBO, or CP) for the completion of a questionnaire. The example shows one of the four ways the questionnaire can be transmitted and the response received from the patient.

<object data="PatientQuestionnaire.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientRiskQuestionnaireCompletedExample.html) |
| 2 |  Patient  | Get Questionnaire, Questionnaire PDF, or Questionnaire URL | [Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html)|
| 3 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientRiskQuestionnaireCompletedExample.html) with status changed |
| 4 |  Patient | Post Questionnaire Response or Document Reference with Filled Out PDF | [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) |
| 5 |  Patient | Update Task (completed and .Output references QuestionnaireResponse) | [Patient Task](Task-SDOHCC-TaskPatientRiskQuestionnaireCompletedExample.html) with status changed |
{:.grid}

#### General Information Request
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO, or CP) for a general information request.  The example shows the patient returning an optional response.

<object data="PatientInformation.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientInformationRequestCompletedExample.html) |
| 2 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientInformationRequestCompletedExample.html) with status changed |
| 3 |  Patient | Update Task (completed and .Output.value includes text of response) | [Patient Task](Task-SDOHCC-TaskPatientInformationRequestCompletedExample.html) with status changed |
{:.grid}

#### Make Contact Request
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO, or CP) for providing one or more options from which to select to make contact with a service, provider or organization. The example shows the patient returning an optional response.

<object data="PatientContact.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) |
| 2 |  Patient  | Get Contact | [HealthCareService](HealthcareService-SDOHCC-HealthcareServiceTelecomAppointmentExample.html) |
| 3 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html)  with status changed |
| 4 |  Patient | Update Task (completed and .Output includes chosen contact) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
{:.grid}

#### Review Material Request
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO, or CP) for providing review material. 

<object data="PatientReview.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientReviewInformationCompletedExample.html) |
| 2 |  Patient  | Get DocumentReference | [DocumentReference] |
| 3 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientReviewInformationCompletedExample.html) with status changed |
| 4 |  Patient | Update Task (completed) | [Patient Task](Task-SDOHCC-TaskPatientReviewInformationCompletedExample.html) with status changed |
{:.grid}



{% include markdown-link-references.md %}