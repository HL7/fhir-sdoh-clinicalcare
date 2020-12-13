### Overview

Social Determinants of Health (SDOH) are increasingly being recognized as essential factors that influence healthcare outcomes. This HL7 Implementation Guide (IG) defines how to exchange SDOH content defined by the Gravity Project using the Fast Healthcare Ineroperability Resources (FHIR) standard. It defines how to represent coded content used to support the following care activities: screening, clinical assessment/diagnosis, goal setting, and the planning and performing of interventions. This IG addresses the need to gather SDOH information in the context of clinical encounters and describes how to share SDOH information and other relevant information with outside organizations for the purpose of coordinating services and support to address SDOH related needs. In addition, the IG demonstrates how to share clinical data to support secondary purposes such as population health, quality, and research. The guide supports the following use cases:
* 	Document SDOH data in conjunction with the patient encounters
* 	Document and track SDOH related interventions to completion
* 	Gather and aggregate SDOH data for uses beyond the point of care (e.g. public health, population health, quality measurement, risk adjustment, quality improvement, and research)

This implementation guide was developed under the auspices of the Gravity FHIR accelerator project, which specifically focuses on using HL7 FHIR to define standards for the exchange of SDOH-related information.  Both the project and this implementation guide are focused on the U.S. environment.  This implementation guide leverages content from the US Core implementation guide and binds to US-specific terminology.  However, the basic constructs and interaction patterns may well be applicable outside the U.S.

### Content and organization

The implementation guide is organized into the following sections:

* Background: Includes Gravity Background, SDOH Clinical Care Scope, Personas and Patient Stories that describe the SDOH environment surrounding the intended use of this implementation guide
* Context: Describes the Survey Instrument Support, QuestionnaireResponse Mapping Instructions, Support for Multiple Domains, and Exchange Workflow diagram that describes a high-level overview of expected process flow
* Specifications: Provides a Technical Background, description of Privacy and Security issues, and explains MustSupport and Missing Data concepts 
* Downloads: Provides for the download of various IG related artifacts
* Credits: Identifies the individuals and organizations involved in developing this implementation guide
* Artifacts Index:  Introduces and provides links to the FHIR R4 profiles, examples and other FHIR artifacts used in this implementation guide






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




[Next Page - Gravity Background](gravity_background.html)