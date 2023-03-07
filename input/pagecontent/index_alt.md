### Overview

Social determinants of health (SDOH) are the conditions in the environments where people are born, live, learn, work, play, worship, and age that affect a wide range of health, functioning, and quality-of-life outcomes and risks[^1]. They are increasingly being recognized as essential factors that influence healthcare outcomes. This HL7 Implementation Guide (IG) defines how to exchange coded content using the HL7 FHIR Standard for the following SDOH-focused care activities: screening, clinical assessment/diagnosis, goal setting, and the planning and performing of interventions.  This IG addresses the need to gather SDOH information in multiple settings, share that information between stakeholders, and exchange referrals between organizations to address specific social risk needs, all with appropriate patient consent.  In addition, the IG demonstrates how to share clinical data to support secondary purposes such as population health, quality, and research.

[^1]: [Healthy People 2030](https://health.gov/healthypeople/priority-areas/social-determinants-health)

This IG was developed by the [Gravity Project], which aims to build and promulgate consensus driven social determinants of health (SDOH) data standards for health and social care interoperability and use among multi-stakeholders.  Both the project and this implementation guide are focused on the U.S. environment.  This IG leverages content from the [US Core Implementation Guide](https://www.hl7.org/fhir/us/core/) and binds to US-specific terminology.  However, the basic constructs and interaction patterns may well be applicable outside the U.S.

The IG supports the following use cases:
* 	Documenting SDOH data, including screening data captured through questionaires, in conjunction with patient encounters with providers, payers, and community services
* Managing referrals to Community Based Organizations (CBO) to address SDOH needs via an electronic workflow.  The referral framework supports intermediary organizations to manage service delivery, closed loop feedback to the ordering clinician and direct engagement with the patient and their care-givers.
* 	Identifying cohorts of individuals that have a common relationship to another entity (e.g., covered by the same payer) **need more material on this**

{% include img.html img="ConceptualFramework.png" caption="Figure 1: Conceptual Framework for SDOH Clinical Care" %}

The activities supported by this IG include (see [Clinical Scope](sdoc_clinical_care_scope.html) for more details)
  - Screening: This refers to activities where SDH data from individual patients are initially captured, whether through a self-administered, provider-administered, or health plan-administered questionnaire. These activities may also be repeated at certain intervals to monitor changes in social risks.
  - Assessment/Diagnosis: These include activities where providers (clinical and community-based) and health plans analyze the data obtained through screening to determine a patient’s social risks and needs.
  - Treatment/Interventions: These refer to actions undertaken by providers (clinical and community-based) and health plans to help address identified social risks and needs. These include referrals, case management, care planning, counseling and education, and provision of services and orders.


Currently, this IG is intended to support [Patient Applications], [Provider's Electronic Health Record(EHR)] systems, [Coordinating Platforms] that intermediate between Providers and Community Based SDOH Service providers, and [Community Based SDOH Service Providers].  In the future Payer systems and governmental systems will be supported. The IG establishes a framework for SDOH-related interventions including:
* capture of survey data from validated instruments
* mapping the responses from assessments into observations, conditions, and goals using SDOH-relevant value sets using established standards (see [Mapping Support])
* generating and monitoring referrals from providers and care coordinators for SDOH-related services provided by CBOs
* capturing the results of the referrals as procedures

### Dependencies on Other IGs

| Implementation Guide | Version | Dependency |
| -------------------- | ------- | ---------- |
| [US Core](https://hl7.org/fhir/us/core/STU3.1.1/) | 3.1.1 | All profiles except those based on Observation, Task, and ServiceRequest are based on USCore profiles  |
| [Structured Document Capture (SDC)](http://hl7.org/fhir/uv/sdc/)| 3.0.0  | SDC is the basis for mapping QuestionnaireResponses into Observationa and Conditions   |
| [Subscriptions R5 Backport](http://hl7.org/fhir/uv/subscriptions-backport) |1.1.0   | Subscriptions are recommended for monitoring completion of referrals  |
| [VSAC](http://fhir.org/packages/us.nlm.vsac) | 0.9.0   |    Published Gravity Project social risk data elements are curated within the National Library of Medicine (NLM) Value Set Authority Center ([VSAC](http://fhir.org/packages/us.nlm.vsac)) value sets. The value sets can be identified by searching for "The Gravity Project" steward. You will need to create a free NLM account to access the value sets.  These value sets are updated after the completion of the planned social risk domain cycles (Jul/Dec) and following major terminology release dates (LOINC: Feb/Aug, SNOMED: Mar/Sept, ICD-10: Apr/Oct) in May/Nov.  |
{:.grid}

### Relationships to Other IGs

| Implementation Guide |  Relationship  |
| -------------------- |  ---------- |
| [Human Services Directory](https://build.fhir.org/ig/HL7/FHIR-IG-Human-Services-Director) | Can be used by a provider to identify referral targets for SDOH-related services  |
| [National Healthcare Directory Exchange](http://hl7.org/fhir/us/directory-exchange)| A U.S. Office of the National Coordinator-sponsored IG supporting the exchange of directory information for a wide range of service providers and organizations |
| [SmartApp Launch](http://hl7.org/fhir/smart-app-launch)  | Allows launching third party applications in the context of another system, including allowing the application to controlled access to patient information.  |
| [Bidirectional Service eReferral (BSeR)](http://hl7.org/fhir/us/bser/)  | Whereas this IG orchestrates referrals using the FHIR query interface, BSeR bases referral management on the exchange of self-contained Bundles of FHIR resources.  The approaches for referral management offered by this IG and BSeR should be harmonized to provide a consistent template for management of referrals by all IGs. |
{:.grid}

### How to Read this IG

| Section | Sub-section | Description | Audience |
| --------| ----------- | --------- | ---------|
| Background| SDOH and Gravity | General background on the importance of collecting and standardizing SDOH data, and the Gravity Project     |  General |
| Background| [SDOH Clinical Care Scope](sdoc_clinical_care_scope.html)) | What is in and out of scope for this IG.  Shouldn't this be on the Home Page?     |  General |
| Background| [Functional Use Cases] |  This section provides a functional description of the interactions between the actors in an SDOH referral, and with links to the profiles and sections of the IG where more detail is provided. This should be read prior to the more detailed exchange workflow description.       |  General |
| Background| FHIR Technical | Background material that should be understood prior to attempting to understand this IG     |  General/Introductory |
| Implementation Guidance| [Standard Survey Instruments for SDOH (includes Mapping Instructions)] | The importance of standard survey instruments for the collection of SDOH, and how survey instruments are mapped to SDOH Conditions, Observations and Goals     |  General |
| Implementation Guidance|  [Referral Exchange Workflow] |  This has three parts:  1) General description of Assess/Goals/Intervention workflow (should move to background) 2) Management of Consent (should move to separate section) 3) Detailed technical description of implementation of workflow using the IG's API  |  Detailed Technical |
| Implementation Guidance | [Synchronizing with Data Sources] | I'm not really sure what this is about     |  Detailed Technical  |
| Specifications | [FHIR Artifacts] | An index of the FHIR artifacts defined as part of this implementation guide     |  Detailed Technical |
| Specifications| [Must Support and Missing Data Conformance] | Conformance requirements for must support and missing data     |  Detailed Technical |
| Specifications | [Privacy and Security] | Conformance requirements for privacy and security considerations     |  Detailed Technical |
| Specifications | [Draft FHIR Artifacts for Personal Characteristics](draft_specifications_for_personal_characteristics.html) | Draft proposals for profiles of Observation supporting Personal Characteristics     |  Detailed Technical |
| Specifications | [Downloads] | Downloads     |  Detailed Technical |
{:.grid}

### Key Technical Content of this IG
* [CapabilityStatements]:   FHIR Capability statements provide the detailed requirements for a server or client.  This IG provides capability statements for Patient applications, referral sources and recipients, and coordinating platform intermediaries.
* [Profiles]: FHIR Profiles constrain and extend a base resource.  This I provides profiles of Conditions, Goals, HealthcareService, Location, Observations, Procedures, ServiceRequests and Task.
* [Value Sets]:  FHIR value sets specify a set of codes drawn from one or more code systems, intended for use in a particular context. The Gravity project has worked intensively to develop value sets for SDOH-related content.  This content is described where it is used.  See the following profiles: [SDOHCondition], [SDOHObservationAssessment], [SDOHProcedure], [SDOHProcedure], [SDOHServiceRequest].
* [Examples]:  This IG provides contextually relevant examples of all profiles.
* [Management of Referral Process]:  The management of referrals by providers to Community-based organizations with different levels of FHIR capability and the assignment of tasks to Patients is described in detail.  See [Functional Use Cases] for an introduction.
* [Draft FHIR Artifacts for Personal Characteristics](draft_specifications_for_personal_characteristics.html):   These profiles are included to promote their use and eventual incorporation into USCore.

{% include markdown-link-references.md %}