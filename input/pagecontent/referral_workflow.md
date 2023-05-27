This section describes the interactions between the actors in an SDOH referral starting both at a high-level and at the level of FHIR API calls.   First, a high-level overview of the interactions is provided.  This description abstracts technical details and should be accessible to the non-technical reader.
For the sake of simplicity, only relationships critical to the Referral Workflow are provided. (For additional details on task status updates see [Checking Task Status], and  on relationships between profiles see [Data Modeling Framework].)

The use cases here relate to the Gravity [Use Cases].  Implementers will benefit from looking at the detailed technical description of the exchange work flow for each use case, as well as the [Capability Statements] associated with each workflow and the [conformance artifacts](artifacts.html) generally.

### General Workflow

This IG supports the following general [workflow](sdoh_clinical_care_scope.html):

1. Assess the patient to determine social risk -- this may be done by using an assessment instrument, via a conversation with the patient, or both.  As part of the assessment, the patient and provider agree on the specific social risks that are to be labeled as verified health concerns or problems.
2. The patient and provider may establish goals regarding the identified social risk.
3. The patient and provider agree on referrals/interventions that should be undertaken to address the problems and goals.  The patient's consent is obtained to share their specific information with the entity that will be performing the services.  The provider then sends a task to the performing entity to initiate the electronic referral.

The figure below shows this high-level workflow, the actors involved in each step, and the FHIR resources that support each step.

<object data="GeneralWorkflow3.svg" type="image/svg+xml"></object>
<br/>

### Actors, Systems and Icons
The actors in the workflows are described in the table below.   The graphical icons are used throughout the IG.   For each use case, the assumptions regarding each type of actor are described.

| Actor    |  Description |
| ----------  | ------------------ |
| ![providericon] Provider  | Includes licensed providers and others that interact with the patient to assess social risk, set goals, and determine/recommend referrals.   |
| ![cboicon] Community Based Organization (CBO)  | An organization that provides specific services to the community or to a targeted population within the community.   |
| ![cpicon]  Coordination Platform (CP) | An intermediary between a Provider and a CBO that plays a role in facilitating the referral process and finding resources for at-risk individuals.   |
| ![patienticon] Patient   | A consumer, or client, who is the subject of the assessment, goals, referrals and services delivered. Use of the term in this IG does not necessarily imply a clinical context.   |
| ![fhirserver] FHIR Server | A server that supports a FHIR API and can make FHIR API calls to other servers |
| ![fhirapplication] FHIR-enabled Application | An application that can make FHIR API calls to a FHIR server, but does not itself support a FHIR API |
| ![patientapp] FHIR-enabled Patient Application | A patient application that can connect to FHIR servers |
{:.grid}

### Referral Use Cases
The functional use cases in the table below describe the referral process, initiated by a referral source (e.g., provider or other healthcare actor) to a referral target (e.g., a CBO), either directly or indirectly via an intermediary (e.g., a CP). For each use case, the capabilities or limitations of the actors are described.  The table links to the functional use case and the associated detailed technical exchange workflow.

| Functional Use Case |  Description           | Actors |
| ------------------------- | ------------------------------------ | ---------------- |
| [Direct Referral](referral_workflow.html#directreferral) | A referral between a referral source (e.g., provider) and a referral target (e.g., CBO) where both entities have FHIR server APIs and an intermediary (e.g., CP) is not involved in the referral.| ![providericon], ![patienticon], ![cboicon] |
| [Direct Referral Light](referral_workflow.html#direct-referral-light) | A “light” version of the Direct Referral. A referral between a referral source (e.g., provider) and a referral target (e.g., CBO) where the referral source has a FHIR server API, the referral target does not have a FHIR server API but has an application that can access the referral source’s FHIR server API, and an intermediary (e.g., CP) is not involved in the referral.  | ![providericon], ![patienticon], ![cboicon]  |
| [Indirect Referral](referral_workflow.html#indirectreferral) | A referral between a referral source (e.g., provider) and a referral target (e.g., a CBO) that involves an intermediary (e.g., a CP) and all entities have FHIR servers APIs.  | ![providericon], ![patienticon], ![cboicon]. ![cpicon] |
| [Indirect Referral Light](referral_workflow.html#indirect-referral-light) | A “light” version of the Indirect Referral. A referral between a referral source (e.g., provider) and a referral target (e.g., CBO) that involves an intermediary (e.g., a CP) where the referral source and intermediary have FHIR server APIs and the referral target does not have a FHIR server API but has an application that can access the intermediaries FHIR server API. | ![providericon], ![patienticon], ![cboicon]. ![cpicon] |
{:.grid}

<div markdown="1" class="stu-note">
Indirect Referral requires making data instances (e.g., ServiceRequest, Condition, DocumentReference) from the referral source on the intermediary server available for query by the referral target and making some data instances (e.g., Procedures) from the referral target available on the intermediary server for query by the referral source. The intermediary can make this happen by cloning the data from the original record creator, or by proxying access to the creating system. This IG does not specify how precisely this should be done and resolution of this issue should be a topic of implementer discussion.
</div>

#### Referral Use Case Overview
The referral use cases described below all involve a provider interacting with a patient to assess needs, establish goals, agree to a referral and acquire patient consent, initiate and track the progress of the referral, and update goals. The “direct” and “indirect” use cases are distinguished by the absence or presence of an intermediary and, in the “light” versions, the FHIR capabilities of the referral target.

Figure 1 and the Table below show the high-level context of the referral use cases that are described in the sections that follow. For the Table, the “Exchanged” column shows data that could be exchanged at that step, and the “Aligns With” column shows data that is not exchanged in FHIR form but whose content typically corresponds with the listed FHIR profile(s). This only specifies the data that is exchanged, so systems are free to use any internal representation.

The [Patient Coordination](referral_workflow.html#patient-coordination-workflow) Workflow shows some, but not all of the possible interactions with the patient. It provides a way for the provider, CP, or CBO to ask a patient to do something, and track whether they have done it and possibly the outcomes. In Figure 1 below, patient coordination is indicated by a red box on steps 9 and 12.

{% include img.html img="HighLevelReferralContext.svg" caption="Figure 1: Referral Use Cases Context" %}


<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
	<caption><b>Step Details for Figure 1</b></caption>
<thead>
<tr>
<th>Step</th>
<th>Actors</th>
<th>Description</th>
<th>Exchanged</th>
<th>Aligns With</th>
</tr>
</thead>
<tbody><tr>
<td>1</td>
<td><img src="Patient.png" alt="Patient" width="35" height="35"></td>
<td>Patient takes standardized assessment tool to identify social risks and needs. This could be done via a SMART app that would post a QuestionnaireResponse or via the PatientTask mechanism, but could be manual</td>
<td><ul>
<li><a href="StructureDefinition-SDOHCC-TaskForPatient.html">SDOHCC Task For Patient</a></li>
<li><a href="https://www.hl7.org/fhir/questionnaire.html">Questionnaire</a></li>
<li><a href="https://www.hl7.org/fhir/questionnaireresponse.html">QuestionnareResponse</a></li></ul></td>
<td>none</td>
</tr>
<tr>
<td>2</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider evaluates assessment and identifies social risks</td>
<td>none</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-ObservationScreeningResponse.html">SDOHCC Observation Screening Response</a></li>
        <li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></li></ul></td>
</tr>
<tr>
<td>3</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35">, <img src="Patient.png" alt="Patient" width="35" height="35"></td>
<td>Provider and Patient: <ul>
                          <li>agree on Conditions to add to Problem List</li>
                          <li>prioritize goals</li>
                          <li>agree on referral</li>
                          <li>obtain consent for sharing information</li>
                          </ul></td>
<td>none</td>
<td>none</td>
</tr>
<tr>
<td>4</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider promotes the health concern to the problem list, records goals, and captures patient consent</td>
<td>none</td>
<td><ul>
<li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Observation Screening Response</a></li>
<li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></li>
<li><a href="StructureDefinition-SDOHCC-Consent.html">SDOHCC Consent</a></li>
<li><a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal</a></li></ul></td>
</tr>
<tr>
<td>5 (optional)</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider makes information regarding the referral, goals and plan available to the patient’s application</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a></li><li><a href="StructureDefinition-SDOHCC-Location.html">SDOHCC Location</a> </li></ul></td>
<td>none</td>
</tr>
<tr>
<td>6</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Provider<sup><a href="#footnote1">1</a></sup> initiates a referral to the CBO or CP</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a></li><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a> </li></ul></td>
<td>none</td>
</tr>
<tr>
<td>7</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>CBO or CP retrieves information about the referral and any needed supporting information, then decides to accept or reject the referral. If the referral is rejected, the process ends or resumes at step #6 with a new task.</td>
<td><ul>
<li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a></li>
<li><a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a></li>
<li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></li>
<li><a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal</a></li>
<li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Observation Screening Response</a></li>
</ul></td>
<td>none</td>
</tr>
<tr>
<td>8</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>CBO or CP updates the status of their work (task) to reflect progress via notes or status.</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a></li></ul></td>
<td>none</td>
</tr>
<tr>
<td>9 (optional)</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35">, <img src="Patient.png" alt="Patient" width="35" height="35"></td>
<td>CBO or CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This IG doesn't highlight communication outside of electronic means, but such communication is possible.</td>
<td>none</td>
<td>none</td>
</tr>
<tr>
<td>10</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>CBO or CP completes the requested action, updates the status of their work (task) to completed, and includes information on what was completed</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC ServiceRequest</a></li><li><a href="StructureDefinition-SDOHCC-Procedure.html">SDOHCC Procedure</a></li></ul></td>
<td>missing</td>
</tr>
<tr>
<td>11</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider receives the updated status and updates the status of the referral (service request)</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a></li></ul></td>
<td>none</td>
</tr>
<tr>
<td>12 (Optional)</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider closes loop by gathering feedback/satisfaction via questionnaire</td>
<td><ul>
<li><a href="StructureDefinition-SDOHCC-TaskForPatient.html">SDOHCCTaskForPatient</a></li>
<li><a href="https://www.hl7.org/fhir/questionnaire.html">Questionnaire</a></li></ul></td>
<td>missing</td>
</tr>
<tr>
<td>13</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider determines if the goals/plan have been satisfied and/or progress has been made on the goal/plan and updates the goal/plan appropriately</td>
<td>none</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal</a></li></ul></td>
</tr>
</tbody></table>

<p>Although this workflow references provider as the referral source, the .requester element in the two profiles exchanged here allow other roles (e.g., care coordinator) and organizations (e.g., payer) to request a referral.<span id="footnote1"><sup><a href="footnote1">1</a></sup></span>.</p>

#### Direct Referral
<a name="directreferral"></a>

In this use case, the patient is referred to a CBO for help addressing prioritized needs. The CBO accepts the referral, provides the requested support to the patient, and shares the updated information with the referring provider.

The provider and the CBO have FHIR servers.  

The example assumes that the provider has an existing relationship with the CBO.
The CBO may not accept the referral or may be unable to perform the requested service.

The details of the FHIR-based exchanges  are provided in the [following section](referral_workflow.html#direct-referral-detailed-view).

##### Direct Referral Detailed View
Figure 2 shows the FHIR exchanges between the referral source and referral target.
For each numbered exchange, the details of the data elements exchanged, and the FHIR request and response are provided.

{% include img.html img="DetailedDirectReferral.svg" caption="Figure 2: Detailed Direct Referral" %}

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Source | Post Referral Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) |
| 2 |  Target  | Get Service Request and Referenced Resources | [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) |
| 3 |  Target | Send Notification | [Subscription Notification Bundle] |
| 4 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 5 |  Target | Send Notification | [Subscription Notification Bundle] |
| 6 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 7 |  Target | Send Notification | [Subscription Notification Bundle] |
| 8 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 9 |  Source | Get Procedures | [Food Provided](Procedure-SDOHCC-ProcedureProvisionOfFoodExample.html), [Application Assistance](Procedure-SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample.html) |
{:.grid}


#### Direct Referral Light
In this use case, a provider works with a patient using a standardized assessment instrument to identify and prioritize social risks and needs, and then refers the patient to a CBO for help addressing those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

The provider has a FHIR server API. Functionally, this differs from the [Direct Referral](referral_workflow.html#direct-referral) in that the CBO does not have a FHIR server API but has an application that can access a FHIR server API. As a result, the provider can’t push information to the CBO, but rather the CBO needs to pull information from the provider. At the conclusion of the referral, the CBO POSTS necessary information (e.g., Procedures) to the provider’s FHIR server API and updates the status and the linked resources of the Task.

The details of the FHIR-based exchanges are provided in the [following section](referral_workflow.html#direct-referral-detailed-view).

##### Direct Referral Light - Detailed View
This referral occurs between the provider (referral source) and the CBO (referral target) where the CBO does not have a FHIR server API. The CBO accesses and manipulates information either using its own software which has a conformant FHIR client or using a third-party application as a FHIR client. 

Figure 3 shows the FHIR exchanges between the referral source and referral target.
For each numbered exchange, the details of the data elements exchanged, and the FHIR request and response are provided.

{% include img.html img="DetailedDirectReferralLight.svg" caption="Figure 3: Detailed Direct Referral Light" %}

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Source | Send e-mail with link to application and authentication instructions |
| 2 |  Target | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) |
| 3 |  Target  | Get Service Request and Referenced Resources | [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) |
| 4 |  Target | Update Task (accepted) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 5 |  Target | Update Task (in-progress) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 6 |  Target | Post Procedures | [Food Provided](Procedure-SDOHCC-ProcedureProvisionOfFoodExample.html), [Application Assistance](Procedure-SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample.html) |
| 7 |  Source | Update Task (completed) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
{:.grid}

#### Indirect Referral
<a name="indirectreferral"></a>

In this use case, a provider works with a patient using a standardized assessment instrument to identify and prioritize social risks and needs, and then refers the patient indirectly via a CP to a CBO for help addressing those needs.  The CP relays the referral to the CBO.  The CBO provides the requested support to the patient and the updated information is relayed back through the CP where it is shared with the referring provider.

Functionally, this Indirect Referral is essentially two direct referrals (provider to CP, and CP to CBO) chained together.  The provider, CP, and CBO all have FHIR servers. 

The provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral, be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.

##### Indirect Referral - Detailed View
The referral occurs in two separate interactions. The first is between the referral source and the intermediary and the second is between the intermediary and the referral target.

In the Indirect Referral, this IG assumes that the referral source does not have the ability to communicate directly with the referral target. There may be multiple referral targets for responsibilities that will be determined and managed by the intermediary. 

1. Create a local copy of, or proxy, all relevant referenced resources from the referral source
2. Create ServiceRequest(s) with ServiceRequest.intent value “filler-order” and ServiceRequest.basedOn references the original referral source ServiceRequest(s) 
3. Create Task(s) to be posted to the referral target(s) that reference the referral source Task(s) via Task.partOf
4. If local copies of the referenced resources are maintained by the intermediary, the intermediary must subscribe or periodically query the referral source for updates to the referenced resources

{% include img.html img="DetailedIndirectReferral.svg" caption="Figure 4: Detailed Indirect Referral" %}

####  Indirect Referral Light

The patient is assessed by a provider and referred to a CP. The CP refers to a CBO to deliver the service. The provider and CP have FHIR server APIs. The CBO does not have a FHIR server API but has an application that can access a FHIR server API.

This section differs from the [Indirect Referral](referral_workflow.html#indirect-referral) in that the interactions between the CP and CBO follow the Direct Light paradigm. The CBO will maintain data on the CP’s FHIR server API. CBOs without their own FHIR server API will modify tasks directly on the CP’s FHIR server API.

The provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CBO have an established relationship.
The provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral, be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.

##### Indirect Referral Light - Detailed View

The referral occurs in two separate interactions. The first is between the referral source and the intermediary and the second is between the intermediary and the referral target. The intermediary SHALL support the following:

1. Create a local copy of, or proxy, all relevant referenced resources from the referral source
2. Create ServiceRequest(s) with ServiceRequest.intent value “filler-order” and ServiceRequest.basedOn references the original referral source ServiceRequest(s) 
3. Create Task(s) to be queried by the referral target(s) that reference the referral source Task(s) via Task.partOf
4. If local copies of the referenced resources are maintained by the intermediary, the intermediary must subscribe or periodically query the referral source for updates to the referenced resources

{% include img.html img="DetailedIndirectReferralLight.svg" caption="Figure 5: Detailed Indirect Referral Light" %}

#### Additional Guidance on Referrals

1. Parties SHOULD use polling if one or both of the parties is unable to support the subscription model (see notes on the [Checking Task Status](checking_task_status.html) page).
2. The receiving party for the referral SHOULD use the batch query process to request periodic updates of referenced resources.
3. The above system flows do not define the handling of all possible scenarios. Exchange scenarios may include refusing the referral, canceling the referral by either party, and error conditions that may occur when using RESTful exchanges.  It is up to each party to follow the current best practice in managing the state of the referral.
4. The referral source SHOULD set the Task.status to “requested”. 
5. The referral target SHOULD update Task.status as it moves through the workflow.

### Patient Coordination Workflow
This implementation guide supports additional interactions with a patient/client application (on a smartphone or portal) including:

| Functional Use Case       |  Task.code            |  Description                         | Actors           |
| ------------------------- | --------------------- | ------------------------------------ | ---------------- |
| [Complete Questionnaire Request](referral_workflow.html#complete-questionnaire-request)|  `complete-questionnaire` | Requesting party (e.g., provider, CBO, or CP) asks a patient to complete a questionnaire. This functionality can be used to assess social risks, inform service qualification or application, indicate reasons for cancellation, or determine the patient’s view of their interaction with the CBO and whether the service provided met their needs. | ![providericon], ![patienticon], ![cboicon]  |
| [General Information Request](referral_workflow.html#general-information-request)|  `general-information-request` | Requesting party sends a patient a free text question and receives a free text response.  | ![providericon], ![patienticon], ![cboicon]  |
| [Make Contact Request](referral_workflow.html#make-contact-request)|   `make-contact-directions` | Requesting party provides contact information for the CBO (in cases where the patient does not want the CBO to initiate contact). | ![providericon], ![patienticon], ![cboicon]  |
| [Review Material Request](referral_workflow.html#review-material-request)|   `review-material` | Requesting party requests that the patient review a document (usually a PDF), video, etc. | ![providericon], ![patienticon], ![cboicon]  |
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
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) |
| 2 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
| 3 |  Patient | Update Task (completed and .Output.value includes text of response) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
{:.grid}

#### Make Contact Request
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO, or CP) for providing one or more options from which to select to make contact with a service, provider or organization. The example shows the patient returning an optional response.

<object data="PatientContact.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) |
| 2 |  Patient  | Get Contact | [HealthCareService](HealthcareService-SDOHCC-HealthcareServiceTelecomAppointmentExample.html) |
| 3 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 4 |  Patient | Update Task (completed and .Output includes chosen contact) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
{:.grid}

#### Review Material Request
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO, or CP) for providing review material. 

<object data="PatientReview.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) |
| 2 |  Patient  | Get DocumentReference | [DocumentReference] |
| 3 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
| 4 |  Patient | Update Task (completed) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
{:.grid}



{% include markdown-link-references.md %}