### Overview

Social Determinants of Health (SDOH) are increasingly being recognized as essential factors that influence healthcare outcomes. This HL7 Implementation Guide (IG) defines how to exchange SDOH content defined by the Gravity Project using the Fast Healthcare Interoperability Resources (FHIR) standard. It defines how to represent coded content used to support the following care activities: screening, clinical assessment/diagnosis, goal setting, and the planning and performing of interventions. This IG addresses the need to gather SDOH information in multiple settings, share that information between stakeholders, and exchange referrals between organizations to address specific social risk needs, all with appropriate patient consent.  In addition, the IG demonstrates how to share clinical data to support secondary purposes such as population health, quality, and research. The guide supports the following use cases:
* 	Document SDOH data in conjunction with the patient encounters with providers, payers, and community services
* 	Document and track SDOH related interventions to completion
* 	Identify cohorts of individuals that have a common relationship to another entity (e.g., covered by the same payer)


This implementation guide was developed by the Gravity Project, which specifically focuses on using HL7 FHIR to define standards for the exchange of SDOH-related information.  Both the project and this implementation guide are focused on the U.S. environment.  This implementation guide leverages content from the US Core implementation guide and binds to US-specific terminology.  However, the basic constructs and interaction patterns may well be applicable outside the U.S.

### Content and organization

The implementation guide is organized into the following sections:

* Background: Includes [Gravity Background](gravity_background.html), [SDOH Clinical Care Scope](sdoh_clinical_care_scope.html), [Personas and Patient Stories](personas_and_patient_stories.html), and [Technical Background](technical_background.html), that describe the environment in which this implementation guide establishes standards for information exchange
* Context: Describes the [Survey Instrument Support](survey_instrument_support.html),[ QuestionnaireResponse Mapping Instructions](mapping_instructions.html), [Support for Multiple Domains](support_for_multiple_domains.html), and [Exchange Workflow diagram](exchange_workflow.html) that describes a high-level overview of expected process flow
* Specifications: Provides a overview of the [FHIR Artifacts](fhir_artifacts_overview.html) defined and used in this IG, description of [Privacy and Security](privacy_and_security.html) issues, and explains [MustSupport and Missing Data](mustsupport_and_missing_data.html) concepts 
* [Downloads](downloads.html): Provides for the download of various IG related artifacts
* [Credits](credits.html): Identifies the individuals and organizations involved in developing this implementation guide
* [Artifacts Index](artifacts.html):  Introduces and provides links to the FHIR R4 profiles, examples and other FHIR artifacts used in this implementation guide

### Note to Implementers

Implementers should pay specific attention to the following sections:

* [Technical Background](technical_background.html) if the implementer needs basic FHIR information references
* [Survey Instrument Support](survey_instrument_support.html), and [ QuestionnaireResponse Mapping Instructions](mapping_instructions.html) if implementing support for structured assessment instruments
* [Support for Multiple Domains](support_for_multiple_domains.html) to understand this IG's approach to domain specific value sets
* [Exchange Workflow diagram](exchange_workflow.html) to understand the exchange workflows
* [FHIR Artifacts](fhir_artifacts_overview.html) to understand the individual FHIR artifacts described in this IG
* [Privacy and Security](privacy_and_security.html) for implementers that are concerned with privacy and security aspects related to implementing the information exchanges defined in this IG
* [MustSupport and Missing Data](mustsupport_and_missing_data.html) to understand the interpretation of the MustSupport flags and the treatment of Missing Data used in this IG 
* [Artifacts Index](artifacts.html) all implementers need to understand the FHIR R4 profiles, examples and other FHIR artifacts defined in this implementation guide and linked from this section
* [Downloads](downloads.html) links to allow implementers to download the IG and various artifacts

### Update Tracking

* Version 0.1.1 b (second update pushed to continuous build on 5/7/2021)
* Version 0.1.1 c (update to support PRAPARE pushed to continuous build on 5/10/2021)
* Version 0.1.1 d (update to fix deletions and support specific PRAPARE items pushed to continuous build on 5/12/2021)
* Version 0.1.1 e (fixing deletions -- 5/12/2021)
* Version 0.1.1 f (fixed deletions and updated support of and examples for PRAPARE -- pushed to continuous build on 5/13/2021
* Version 0.1.1 g (renamed resource profiles, value sets, code systems, and examples -- deleted old versions -- includes updated profiles and examples (6/8/2021)
* Version 0.1.1 h (updated and moved on 6/11/2021)
* Version 0.1.1 i (base for next set of updates 6/13/2021)
* Version 0.1.1 j (initial non-artifact ballot updates 6/13/2021)
* Version 0.1.1 k (continued ballot updates 6/15/2021)
* Version 0.1.1 l (updated of home page, Privacy and Security, and Credits 6/21/2021)
* Version 0.1.1 m (updated of Technical background, Must Support, Gravity background 6/22/2021)
* Version 0.1.1 n (test .json to include US version of SNOMED-CT 6/24/2021)
* Version 0.1.1 o (updated mapping, support 6/26/2021)
* Version 0.1.1 p (updated multiple sections and corrected hyperlinks 6/27/2021)
* Version 0.1.1 q (updated hyperlinks in all completed section 6/27/2021)
* Version 0.1.1 r (updated sections and examples 6/29/2021)
* Version 0.1.1 S (updated sections and examples 6/30/2021)



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


