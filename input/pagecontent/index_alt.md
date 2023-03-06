### Overview

Social determinants of health are the conditions in which people are born, grow, live, work and age that shape health. They are increasingly being recognized as essential factors that influence healthcare outcomes. This HL7 Implementation Guide (IG) defines how to exchange coded content using the HL7 FHIR Standard for the following SDOH-focused care activities: screening, clinical assessment/diagnosis, goal setting, and the planning and performing of interventions.  This IG addresses the need to gather SDOH information in multiple settings, share that information between stakeholders, and exchange referrals between organizations to address specific social risk needs, all with appropriate patient consent.  In addition, the IG touches upon how to share clinical data to support secondary purposes such as population health, quality, and research.

This IG was developed by the [Gravity Project], which aims to build and promulgate consensus driven social determinants of health (SDOH) data standards for health and social care interoperability and use among multi-stakeholders.  Both the project and this implementation guide are focused on the U.S. environment.  This IG leverages content from the [US Core Implementation Guide](https://www.hl7.org/fhir/us/core/) and binds to US-specific terminology.  However, the basic constructs and interaction patterns may well be applicable outside the U.S.

The IG supports the following use cases:
* 	Document SDOH data, including screening data captured through questionaires, in conjunction with patient encounters with providers, payers, and community services
* 	Document and track SDOH-related interventions referred to Community Based Organizations (CBO) to completion
* 	Identify cohorts of individuals that have a common relationship to another entity (e.g., covered by the same payer) **need more material on this**

The activities supported ty this IG include (see [Clinical Scope](sdoc_clinical_care_scope.html) for more details)
  - Screening: This refers to activities where SDOH data from individual patients are initially captured, whether through a self-administered, provider-administered, or health plan-administered questionnaire. These activities may also be repeated at certain intervals to monitor changes in social risks.
  - Assessment/Diagnosis: These include activities where providers (clinical and community-based) and health plans analyze the data obtained through screening to determine a patient’s social risks and needs.
  - Treatment/Interventions: These refer to actions undertaken by providers (clinical and community-based) and health plans to help address identified social risks and needs. These include referrals, case management, care planning, counseling and education, and provision of services and orders.

{% include img.html img="ConceptualFramework.png" caption="Figure 1: Conceptual Framework for SDOH Clinical Care" %}

Currently, this IG is intended to support Patient Applications, Provider's Electronic Health Record(EHR) systems, Coordinating Platforms that intermediate between Providers and Community Based SDOH Service providers, and Community Based SDOH Service Providers.  In the future Payer systems and governmental systems will be supported. The IG establishes a framework for SDOH-related interventions including:
* capture of survey data from validated instruments
* mapping the responses from assessments into observations, conditions, and goals using SDOH-relevant value sets using established standards (see [Mapping Support])
* generating and monitoring referrals from providers and care coordinators for SDOH-related services provided by CBOs
* capturing the results of the referrals as procedures

### Key Technical Content of this IG
* Value sets for describing SDOH-related content:   The Gravity project has worked intensively to develop value sets for SDOH-related content.  This content is described where it is used.  See the following profiles: [SDOHCondition], [SDOHObservationAssessment], [SDOHProcedure], [SDOHProcedure], [SDOHServiceRequest].
* Management of Referral Process:  The management of referrals by providers to Community-based organizations with different levels of FHIR capability and the assignment of tasks to Patients is described in detail.  See [Functional Use Cases] for an introduction.
* [CapabilityStatements] for Referral Sources and Targets:  These capability statements provide the requirements for Referral sources and targets
* [Draft FHIR Artifacts for Personal Characteristics](draft_specifications_for_personal_characteristics.html):   These profiles are included to promote their use and eventual incorporation into USCore.

### Dependencies on Other IGs

| Implementation Guide | Version | Dependency |
| -------------------- | ------- | ---------- |
| [US Core](https://hl7.org/fhir/us/core/STU3.1.1/) | 3.1.1 | All profiles except those based on Observation, Task, and ServiceRequest are based on USCore profiles  |
| [Structured Document Capture (SDC)](http://hl7.org/fhir/uv/sdc/)| 3.0.0  | SDC is the basis for mapping QuestionnaireResponses into Observationa and Conditions   |
| [Subscriptions R5 Backport](http://hl7.org/fhir/uv/subscriptions-backport) |1.1.0   | Subscriptions are recommended for monitoring completion of referrals  |
| [VSAC](http://fhir.org/packages/us.nlm.vsac) | 0.9.0   |    Gravity-developed value sets are managed through VSAC |
{:.grid}

### Relationships to Other IGs

| Implementation Guide |  Relationship  |
| -------------------- |  ---------- |
| [Human Services Directory](https://build.fhir.org/ig/HL7/FHIR-IG-Human-Services-Director) | Can be used by a provider to identify referral targets for SDOH-related services  |
| FAST for Registries? | ??????  |
| DaVinci for Auth?  |   |
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

### Authors

<table>
<thead>
<tr>
<th>Name</th>
<th>Email/URL</th>
</tr>
</thead>
<tbody>
<tr>
<td>HL7 International - Patient Care</td>
<td><a href="http://www.hl7.org/Special/committees/patientcare" target="_new">http://www.hl7.org/Special/committees/patientcare</a></td>
</tr>
</tbody>
</table>

{% include markdown-link-references.md %}