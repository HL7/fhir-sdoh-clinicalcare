This use case describes the scenario where an individual independently identifies a health-related social need and uses a public-facing community resource directory or platform to find and request services from a Community-Based Organization (CBO).

The primary distinction from the provider-centric workflows described in this guide is that the <b>Individual/Patient</b> is the initiating actor. The system they use to make the request, a <b>Community Resource Platform</b>, acts as the technical <b>Referral Source</b> system. Consequently, the "closed loop" involves communicating referral disposition and outcomes back to this platform for the individual’s benefit, rather than to a clinical healthcare provider.

### Actors and Systems

- <b>Individual/Patient</b>: A person or  with one or more health-related social needs who initiates a search and request for services. The individual is the subject of the referral.
- <b>Community Resource Platform</b>: A web-based application or service directory that enables individuals to search for social care services, complete screening assessments, and initiate referrals on their own behalf. In the context of the FHIR exchange, this platform functions as the <b>Referral Source system.
- <b>Community-Based Organization (CBO)</b>: The organization that receives and acts upon the referral to provide a service. In the FHIR exchange, the CBO functions as the <b>Referral Recipient</b> system.

### Use Case Scope

#### In Scope

- The creation and transmission of a referral from a Community Resource Platform to a CBO, initiated by an Individual/Patient.
- The use of a completed screening QuestionnaireResponse to inform the referral.
- The communication of referral status and outcomes from the CBO back to the Community Resource Platform by updating the referral Task.

#### Out of Scope

- The process by which an individual discovers or authenticates with the Community Resource Platform.
- The specific algorithms used by the platform to match an individual with potential CBOs.
- The management of patient consent, which is assumed to be handled by the Community Resource Platform prior to initiating the referral workflow.

### Workflow and Assumptions

This use case <b>exactly follows the exchange patterns defined in the Direct Referral workflow</b>. The key difference is the nature of the actors.

#### Assumptions

- The individual has securely logged into the Community Resource Platform and their identity has been established by that platform.
- The individual provides all necessary consent within the platform, authorizing it to share their identifying information and screening results with the selected CBO.

#### Workflow Steps

1. The individual completes an SDOH screening questionnaire on the Community Resource Platform.
2. Based on the screening results, the platform displays a list of suitable CBOs.
3. The individual selects a CBO to which they wish to be referred.
4. The <b>Community Resource Platform</b> (acting as the Referral Source) creates the ServiceRequest and related resources and then POSTs a Task resource to the <b>CBO's</b> (Referral Recipient's) FHIR server endpoint.
5. The CBO's system processes the received Task and retrieves the referenced ServiceRequest and Patient resources from the Community Resource Platform's server to get the full referral details. It then updates the status of the Task on its own server (e.g., from requested to accepted).
6. The <b>Community Resource Platform</b> periodically queries (GET) the Task on the CBO's server to check for status changes.
7. As the CBO works the referral, it continues to update the Task on its server (e.g., to in-progress and finally completed or cancelled). Upon completion, it adds references in Task.output to resources detailing the outcome (e.g., a Procedure).
8. The <b>Community Resource Platform</b> retrieves the final Task status and the outcome resources, thereby "closing the loop" and making this information available to the individual.

This workflow may operate within various ecosystem models. Implementers should consult the guidance on <b>Closed, Open, and Hybrid Intermediation Networks</b> to determine how referrals are routed and how participants discover each other’s endpoints and capabilities.

### Exchange Flows and FHIR Resources

The self-referral use case reuses the profiles and exchange patterns defined in the Direct Referral workflow without modification. The key distinction lies in the population of specific elements to reflect the patient-initiated nature of the request.

#### Referral Initiation

The Community Resource Platform initiates the referral by POSTing a Task resource to the CBO's FHIR server.

- <b>Task: The SDOHCC Task For Referral Management profile is used.
    - Task.status: SHALL be requested.
    - Task.requester: This SHALL reference the Organization resource representing the <b>Community Resource Platform</b>.
    - Task.owner: This SHALL reference the Organization resource representing the receiving <b>CBO</b>.
    - Task.for: This SHALL reference the Patient resource for the individual.
    - Task.input: This SHALL contain references to the ServiceRequest and the SDOHCC QuestionnaireResponse from the screening.
- <b>ServiceRequest: The SDOHCC ServiceRequest profile is used to detail the requested service.
    - ServiceRequest.requester: This SHALL reference the Organization resource for the <b>Community Resource Platform</b>. While the individual is the initiator in concept, the platform is the system making the formal FHIR request.
    - ServiceRequest.subject: This SHALL reference the Patient resource for the individual.
    - ServiceRequest.category: Sliced to include a code from the SDOHCC Category value set (e.g., food-insecurity).
    - ServiceRequest.code: Specifies the service being requested from a value set such as SDOHCC ProcedureCode.
- <b>QuestionnaireResponse: The completed screening is represented using the SDOHCC QuestionnaireResponse profile.

#### Closing the Loop

The loop is closed by the CBO updating the original Task on its own server and the Community Resource Platform polling for those updates.

- <b>Task Updates (by CBO)</b>: As the referral is processed, the CBO's system updates the status and content of the Task resource residing on its own FHIR server.
    - Task.status: The CBO updates the status from requested to accepted, rejected, in-progress, and finally to a terminal state like completed or cancelled.
    - Task.output: When the Task status is moved to completed, the CBO SHALL add one or more output elements referencing resources that describe the outcome of the referral, such as an SDOHCC Procedure for services rendered.
- <b>Task Polling (by Community Resource Platform)</b>: The Community Resource Platform periodically performs a GET on the Task resource at the CBO's server to retrieve the current status and, upon completion, the final outcome information referenced in Task.output.



