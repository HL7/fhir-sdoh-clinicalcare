### General Workflow


The following depicts the general workflow anticipated by this Implementation guide.  The general process is to:

1. Assess the patient to determine social risk -- this may be done by using an assessment tool or via a conversation with the patient, or both.  As part of the assessment, the patient and provider agree on the specific risk items that are to be labeled as verified health concerns or problems.
2. The patient and provider may establish specific goals regarding the identified social risk.
3. The patient and provider agree on specific referrals/interventions that should be undertaken to address the problems and goals.  The patient's consent is obtained to share their specific information with the entity that will be performing the services.  The provider then sends a task to the performing entity to initiate the electronic referral.

<object data="GeneralWorkflow3.svg" type="image/svg+xml"></object>
<br/>

There are a number of system to system interactions supported by this implementation guide.  These include:

1. referrals via an intermediary (or indirect referrals) that may include interactions with multiple service performers,
2. direct and direct light (where the interaction is with an application) referrals,
3. interactions with a patient to complete a questionnaire or "form", and
4. interactions with a patient to cancel a service or indicate the outcome of the service

<object data="OverallInteractions.svg" type="image/svg+xml"></object>
<br/>


### Closed Loop Referral

#### Actors

Provider / Requester  -- this can be any of the following:

1. a provider or other provider
2. a payer as part of care management, risk assessment, or via programs that assess and intervene regarding social risk
3. a Coordination Platform

Coordination Platform (CP) / Intermediary

1. This is a service that accepts referrals (it may also create them)
2. May determine which Community Based Organization (CBO) is capable and available to provide the appropriate service
3. Engages the CBO to perform the referral
4. Tracks the referral process to completion
5. Reports status back to the Referring Entity

Community Based Organization (CBO) / Performer

1. Provides one or more social risk services
2. Interacts with the CP or RE to provide status of the referral



#### Direct Referral
<a name="direct-referral-exchange">
The referral occurs between the Provider / Requester and the CBO / Performer where the CBO has a FHIR API.

Refer to the [Direct Referral] functional use case to understand the numbers in the interaction diagram below.

##### Interaction Diagram

<table><tr><td><img src="SDOHInteractionsDirectExchange.jpg" /></td></tr></table>

##### Workflow Diagram

<table><tr><td><img src="DirectReferralSF.jpg" /></td></tr></table>



#### Direct Referral Light
<a name="direct-referral-light-exchange">
The referral occurs between the Provider / Requester and the CBO / Performer where the CBO / Performer does not have a FHIR API (FHIR Server or FHIR Façade).   The exchange with the Performer is initiated via an email with a secure link to the Provider / Requester API that can be used by an application available to the CBO / Performer to communicate with the Provider / Requester using RESTful exchanges that read, create, and update resources via the Provider / Requester API.

Refer to the [Direct Referral Light] functional use case to understand the numbers in the interaction diagram below.

##### Interaction Diagram

<table><tr><td><img src="SDOHInteractionsDirectExchangeLight.jpg" /></td></tr></table>

##### Workflow Diagram

<table><tr><td><img src="DirectReferralLightSF.jpg" /></td></tr></table>



#### Indirect Referral
<a name="indirect-referral-exchange">
The referral occurs in two separate interactions. The first is between the Referral Source and the Intermediary and the second is between the Intermediary and the Referral Performer.

This IG assumes that, in an Indirect Referral, the Referral Performer does not have the ability to communicate directly with the Referral Source.  Therefore, the intermediary SHALL support the following.

1. Create a local copy of all of the relevant referenced resources from the Referral Source
2. Create a Task to be Posted to the Referral Performer that references the Referral Source Task via Task.partOf
3. Create a ServiceRequest with ServiceRequest.intent value filler-order and ServiceRequest.basedOn references the original Referral Source ServiceRequest
4. Since local copies of the referenced resources are maintained by the Intermediary, the intermediary must periodically query the Referral Source for updates to the referenced resources
5. There are two version of the [Indirect Referral] -- one where the CBO / Performer has a FHIR API (e.g. [Direct Referral]) and one where the CBO / Performer uses a FHIR enabled application (e.g. [Direct Referral Light])




##### Interaction Diagram

<table><tr><td><img src="SDOHInteractionsIndirectExchange.jpg" /></td></tr></table>

##### Workflow Diagram

<table><tr><td><img src="IndirectReferralSF.jpg" /></td></tr></table>



#### Notes on Direct and Indirect Referrals

1. Parties SHOULD use polling if one or both of the parties is unable to support the subscription model (see notes on the [Checking Task Status](checking_task_status.html) page).
2. The receiving party for the referral SHOULD use the batch query process to request periodic updates of reference resources.
3. The above system flows do not define the handling of all possible scenarios. Exchange scenarios may include refusing the referral, canceling the referral by either party, and error conditions that may occur when using RESTful exchanges.  It is up to each party to follow the current best practice in managing the state of the referral.
4. The Provider / Requester SHOULD set the Task.status to "requested" until it receives a valid HTTPS response indicating that the Task was received at which point it SHOULD set the Task.status to "received".

#### Patient Interactions
<a name="patient-exchange">
This implementation guide supports additional interactions with a patient/client application (on a smartphone or portal).  These interactions include providing the patient/client with:

1. a copy of the service request sent to the service performer
2. contact information for the service performer (where the patient/client does not want the service performer to initiate contact)
3. any required patient instructions
4. the ability to cancel the service and indicate the reason via a short questionnaire
5. the ability to complete a questionnaire or "form" to collect information regarding
   - social risks (risk survey)
   - service qualification or application
6. information regarding available services (usually as a PDF)
7. closing the loop on services delivered (e.g., providing patient outcomes)

##### Overall Workflow

<object data="PatientClientExchange.svg" type="image/svg+xml"></object>

The above patient / client interaction diagram indicates the high level exchanges between the Requester and the Patient / Client:

1. providing referral information (service requested, contact information, instructions) to the patient's application
2. enable a patient to use their application to cancel the service
3. questionnaire retrieved by the patient's application from the referring entity, completed and returned,  to determine the status of a service that may take an extended amount of time (e.g., prior to the patient meeting with the referring provider)
4. questionnaire retrieved by the patient's application from the referring entity, completed and returned, to close the loop with the patient on completion of the service to determine the patient's view their interaction with the CBO / performer and the ability of the service provided to meet their needs

##### Detailed workflow for a single questionnaire

<object data="PatientQuestionnaire.svg" type="image/svg+xml"></object>


### Support for API Access to SDOH Information

The Provider / Requester, CP / Intermediary, and CBO / Performer SHOULD make SDOH information available to authenticated and authorized APIs and applications via a FHIR API conformant to the [ONC 21st Century Cures Act Final Rule](https://www.healthit.gov/curesrule/).  The API SHOULD allow for the exchange of all resources defined on the [FHIR Artifacts Overview](fhir_artifacts_overview.html) page with the patient’s consent where required or appropriate

{% include markdown-link-references.md %}
