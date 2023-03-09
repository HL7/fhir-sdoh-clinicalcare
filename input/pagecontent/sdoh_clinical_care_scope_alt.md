###  SDOH Clinical Care Scope
### Scope of this IG

The focus for this version of the IG is to standardize the exchange of SDOH information related to the following activities:

* *assessment of social risk,
* establishing coded health concerns/problems,
* creating patient driven goals, and
* defining a RESTful closed loop referral process to manage interventions.

####  Out of Scope

The following items are out of scope for this version of the IG.

* Providing guidance on the frequency of administering assessment (this is left up to the responsible organizations based on their standards of practice).
* Standards for reporting quality measures to payers or quality organizations (this is left to the Data Exchange for Quality Measures Implementation Guide that was co-authored by NCQA).
* Addressing Consent beyond the consent to share information between a HIPAA covered entity and entities that are not covered by HIPAA.
* Administrative activities such as eligibility checking, prior authorization, or billing for SDOH services.

### Conceptual Framework

Coded SDOH content is captured across core health care activities: screening/assessment, establishing health concerns, goal setting, care planning, interventions, outcomes and reporting. The conceptual framework, illustrated below, shows how these activities form a cycle of care. Over time, a patient's progress toward care goals can be tracked and measured.    The icons for actors and FHIR-capability are defined [here]. The Gravity Project has identified [17 SDOH domains](ValueSet-SDOHCC-ValueSetSDOHCategory.html) that describe various types of social risk and has domain-specific valuesets for these domains that find expression in the relevant profiles of this IG. Work is ongoing.  A current list of the domains and the active terminology work effort can be found on the Gravity Project [Terminology Pages](https://confluence.hl7.org/display/GRAV/Terminology+Workstream+Dashboard) on Confluence.

{% include img.html img="AlternateScopeOfIG.svg" caption="Figure 1: Scope of IG" %}

### Actors and Process Roles
In the drawing above, each of the actors supports a set of roles that are described here:

* Patient
  * Responds to [questions][Questionnaire] and is [assessed][SDOHCCObservationAssessment] based on their responses
  * Discusses and agrees to [Goals][SDOHCCGoals]
  * [Consents][SDOHCCConsent] to the sharing of their information
  * Reviews materials and/or makes contact with a CBO based on [provider request][SDOHCCPatientTask]
  * Completes [forms][Questionnaire] to provide feedback to providers
* Aggregation
  * Reports summary statistics on groups of patients with common SDOH conditions
* Provider
  * [Screens][SDOHCCObservationAssessment]  patient
  * Records & prioritizes [problems and concerns][SDOHCCCondition]
  * Establishes [Goals][SDOHCCGoals] alongside patient
  * Solicits  [Consents][SDOHCCConsent] for data sharing and, if necessary, [shares it][SDOHCCServiceRequest] with CBO
  * Creates [referrals][SDOHCCServiceRequest] and [solicits] CBOs to fulfill them
  * [Monitors][SDOHCCPatientTask] completion of referral
  * Provides [review material or provides contact instructions][SDOHCCPatientTask] to patients
  * Solicits [feedback][SDOHCCPatientTask] from patients
* Community Based Organization (possibly via Coordinating Platform)
  * Receives [solicitation][SDOHCCPatientTask] to complete [referrals][SDOHCCServiceRequest] from provider
  * Retrieves [referral][SDOHCCServiceRequest] and [accepts or rejects] solicitation
  * Delivers and records [service][SDOHCCProcedure] requested by referral
  * Reports [completion][SDOHCCPatientTask] to referral source
  * Provides [review material][SDOHCCPatientTask] to patients
  * Solicits [feedback][SDOHCCPatientTask] from patients

### Scope of Interactions

The scope of interactions is intended to cover all of the interactions shown in the drawing below. THe focus of the current IG is interactions between a patient, provider, and CBO, with possible intermediation by a CP. In the future, the IG will be expanded to support Payers and Government agencies, and referrals from non-health care providers.  The IG supports interactions with CBOs that support either a FHIR-enabled application that can FHIR servers, or a FHIR-server based application that supports querying other FHIR servers, as well as being queried by other applications.  In the drawing below, bidirectional solid arrows reflect communication between two endpoints with FHIR servers, whereas unidirectional solid arrows reflect communicaiton between a FHIR-enabled application and a FHIR server.

{% include img.html img="SystemDiagram.svg" caption="Figure 2: System Interactions" %}
<br>
<br>
### Data Modeling Framework
The diagram below shows the data model for the assessment process including the creation of health concerns, goal setting (patient-centered goals), and creation of referrals using service request and procedure/intervention. The graphic represents relationships defined in this IG for the [Questionnaire] and  [QuestionnaireResponse] resources, as well as the [Observation], [SDOHCC Condition], [SDOHCC Goal], [SDOHCC Referral Management Task], [SDOHCC ServiceRequest] and [SDOHCC Procedure] profiles.

The [SDOHCC Patient Task] provides the ability to direct the patient to seek service from a particular [SDOHCC HealthcareService], or to fill out a FHIR-based [Questionnaire] or Test-based questionairre, and to return the filled in results of the Questionnairre as a document or [QuestionnaireResponse].

{% include img.html img="FHIRModeling.svg" caption="Figure 2: Data Modeling Framework" %}