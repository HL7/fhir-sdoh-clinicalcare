### Overview

Social Determinants of Health (SDOH) are increasingly being recognized as essential factors that influence healthcare outcomes. This HL7 Implementation Guide (IG) defines how to exchange SDOH content defined by the Gravity Project using the Fast Healthcare Interoperability Resources (FHIR) standard. It defines how to represent coded content used to support the following care activities: screening, clinical assessment/diagnosis, goal setting, and the planning and performing of interventions. This IG addresses the need to gather SDOH information in the context of clinical encounters and describes how to share SDOH information and other relevant information with outside organizations for the purpose of coordinating services and support to address SDOH related needs. In addition, the IG demonstrates how to share clinical data to support secondary purposes such as population health, quality, and research. The guide supports the following use cases:
* 	Document SDOH data in conjunction with the patient encounters
* 	Document and track SDOH related interventions to completion
* 	Gather and aggregate SDOH data for uses beyond the point of care (e.g. public health, population health, quality measurement, risk adjustment, quality improvement, and research)

This implementation guide was developed under the auspices of the Gravity FHIR accelerator project, which specifically focuses on using HL7 FHIR to define standards for the exchange of SDOH-related information.  Both the project and this implementation guide are focused on the U.S. environment.  This implementation guide leverages content from the US Core implementation guide and binds to US-specific terminology.  However, the basic constructs and interaction patterns may well be applicable outside the U.S.

### Content and organization

The implementation guide is organized into the following sections:

* Background: Includes [Gravity Background](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/gravity_background.html), [SDOH Clinical Care Scope](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/sdoh_clinical_care_scope.html), [Personas and Patient Stories](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/personas_and_patient_stories.html) that describe the SDOH environment surrounding the intended use of this implementation guide
* Context: Describes the [Survey Instrument Support](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/survey_instrument_support.html),[ QuestionnaireResponse Mapping Instructions](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/mapping_instructions.html), [Support for Multiple Domains](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/support_for_multiple_domains.html), and [Exchange Workflow diagram](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/exchange_workflow.html) that describes a high-level overview of expected process flow
* Specifications: Provides a [Technical Background](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/technical_background.html), overview of the [FHIR Artifacts](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/fhir_artifacts_overview.html) defined and used in this IG, description of [Privacy and Security](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/privacy_and_security.html) issues, and explains [MustSupport and Missing Data](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/mustsupport_and_missing_data.html) concepts 
* [Downloads](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/downloads.html): Provides for the download of various IG related artifacts
* [Credits](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/credits.html): Identifies the individuals and organizations involved in developing this implementation guide
* [Artifacts Index](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/artifacts.html):  Introduces and provides links to the FHIR R4 profiles, examples and other FHIR artifacts used in this implementation guide

### Update Tracking

* Version 0.1.1 b (second update pushed to continuous build on 5/7/2021)
* Verison 0.1.1 c (update to support PRAPARE pushed to continuous build on 5/10/2021)
* Verison 0.1.1 d (update to fix deletions and support specific PRAPARE items pushed to continuous build on 5/12/2021)
* Version 0.1.1 e (fixing deletions -- 5/12/2021)
* Version 0.1.1 f (fixed deletions and updated support of and examples for PRAPARE -- pushed to continuous build on 5/13/2021
* Version 0.1.1 g (renamed resource profiles, value sets, code systems, and examples -- deleted old versions -- includes updated profiles and examples (6/8/2021)
* Version 0.1.1 h (updated and moved on 6/11/2021)
* Version 0.1.1 i (base for next set of updates 6/13/2021)
* Version 0.1.1.j (initial non-artifact ballot updates 6/13/2021)




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
<td><a href="http://www.hl7.org/Special/committees/patientare" target="_new">http://www.hl7.org/Special/committees/patientare</a></td>
</tr>
</tbody>
</table>


