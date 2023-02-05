### Overview

Social Determinants of Health (SDOH) are increasingly being recognized as essential factors that influence healthcare outcomes. This HL7 Implementation Guide (IG) defines how to exchange SDOH content defined by the [Gravity Project]( https://confluence.hl7.org/display/GRAV/The+Gravity+Project) using the HL7 FHIR standard. It defines how to represent coded content used to support the following care activities: screening, clinical assessment/diagnosis, goal setting, and the planning and performing of interventions. This IG addresses the need to gather SDOH information in multiple settings, share that information between stakeholders, and exchange referrals between organizations to address specific social risk needs, all with appropriate patient consent.  In addition, the IG demonstrates how to share clinical data to support secondary purposes such as population health, quality, and research. The guide supports the following use cases:

* 	Document SDOH data in conjunction with patient encounters with providers, payers, and community services
* 	Document and track SDOH-related interventions to completion
* 	Identify cohorts of individuals that have a common relationship to another entity (e.g., covered by the same payer)


This implementation guide was developed by the Gravity Project, which specifically focuses on using HL7 FHIR to define standards for the exchange of SDOH-related information.  Both the project and this implementation guide are focused on the U.S. environment.  This implementation guide leverages content from the [US Core Implementation Guide](https://www.hl7.org/fhir/us/core/) and binds to US-specific terminology.  However, the basic constructs and interaction patterns may well be applicable outside the U.S.

Additional information regarding the background and use of this IG can be found on the [Gravity Confluence Technology Pages](https://confluence.hl7.org/display/GRAV/Technical+Workstream+Dashboard)

### Content and organization

The implementation guide is organized into the following sections:

* Background: Includes [Gravity Background](gravity_background.html), [SDOH Clinical Care Background](sdoh_clinical_care_background.html), [Functional Use Cases](functional_use_cases.html), and [Technical Background](technical_background.html), thesedescribe the environment in which this implementation guide establishes standards for information exchange
* [Change History](stu2_ballot_changes.html) describes the changes included in the STU 2 ballot version of the IG and [Change History](stu2_publication_changes.html) describes the changes applied to the balloted version
* Context: Describes the [Survey Instrument Support](survey_instrument_support.html),[ QuestionnaireResponse Mapping Instructions](mapping_instructions.html), [Support for Multiple Domains](support_for_multiple_domains.html), [Exchange Workflow](exchange_workflow.html) and [Synchronizing Applications with API Data Sources](synchronizing_applications_with_api_data_sources.html) that details a high-level overview of expected process flow
* Specifications: Provides an overview of the [FHIR Artifacts](fhir_artifacts_overview.html) defined and used in this IG, [Checking Task Status](checking_task_status.html) to describe managing task status, [Privacy and Security](privacy_and_security.html) issues,  [MustSupport and Missing Data](mustsupport_and_missing_data.html) concepts and [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)
* [Downloads](downloads.html): Provides for the download of various IG related artifacts
* [Credits](credits.html): Identifies the individuals and organizations involved in developing this implementation guide
* [Artifacts Index](artifacts.html):  Introduces and provides links to the FHIR R4 profiles, examples and other FHIR artifacts used in this implementation guide

### Note to Implementers

Implementers should pay specific attention to the following sections. They are listed in a suggested order:

* [Technical Background](technical_background.html) if the implementer needs basic FHIR information references
* [Survey Instrument Support](survey_instrument_support.html), and [ QuestionnaireResponse Mapping Instructions](mapping_instructions.html) if implementing support for structured assessment instruments
* [Support for Multiple Domains](support_for_multiple_domains.html) to understand this IG's approach to domain specific value sets and terminology use
* [Exchange Workflow diagram](exchange_workflow.html) to understand the exchange workflows. Along with the [Functional Use Cases](functional_use_cases.html),
   *these provide step by step FHIR guidance, and are critical to review.*
* [Synchronizing Applications with API Data Sources](synchronizing_applications_with_api_data_sources.html) describes the suggested method for synchronizing patient/client or Community Based Organization applications with referral systems FHIR APIs
* [FHIR Artifacts](fhir_artifacts_overview.html) to understand the individual FHIR artifacts described in this IG
* [Capability Statements](artifacts.html#behavior-capability-statements) contain important server requirements. It is expected that Providers have conformant FHIR servers.
* [Privacy and Security](privacy_and_security.html) for implementers that are concerned with privacy and security aspects related to implementing the information exchanges defined in this IG
* [MustSupport and Missing Data](mustsupport_and_missing_data.html) to understand the interpretation of the MustSupport flags and the treatment of Missing Data used in this IG
* [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html) for an introduction to draft observation profiles to exchange personal characteristics data, which includes the source and method of acquisition
* [Artifacts Index](artifacts.html) provides easy access for all implementers the FHIR R4 profiles, examples and other FHIR artifacts defined in this implementation guide and linked from this section -- this section also includes details for the declared capability statements for espective servers and clients
* [Downloads](downloads.html) links to allow implementers to download the IG and various artifacts

### Support for external terminologies for ServiceRequest and Procedure

If implementers of this IG wish to use terminologies that are not part of the required value sets for specific elements that have a type of CodableConcept (such as ServiceRequest.code and Procedure.code) they may include a specific Coding that specifies a system (URL that is defined and supported by the terminology author) as well as the specific code (define in the terminology) as long as the meaning of the code is a concept that is logically the same as, or contained in the concept, of the required code.

The following is an example for a ServiceRequest or Procedure where the external terminology

URL is  : http://terminologysystem and the code is : SummerProgram

		"code" : {
  	  "coding" : [
   	   {
 	       "system" : "http://snomed.info/sct",
	        "code" : "467681000124101",
	        "display" : "Assistance with application for Summer Food Service Program"
	      }
	      ]
	    },
	    {
	      "coding" : [
	        {
	          "system" : "http://terminologysystem",
	          "code" : "SummerProgram",
	          "display" : "Summer Food Service Program"
	        }
	      ]
	    }
	  ],

### Intellectual Property
{% include ip-statements.xhtml %}

### Cross Version Analysis
{% include cross-version-analysis.xhtml %}

### Dependencies
{% include dependency-table.xhtml %}

### Globals
{% include globals-table.xhtml %}



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
