### Jira Tickets – all applied -- see changes below

#### Index 		

- [FHIR-35753](https://jira.hl7.org/browse/FHIR-35753)	Home page should have compelling sale of problem and solution spec solves/offers
  - Provided link to gravity project on the home page

#### General Changes		

- [FHIR-38772](https://jira.hl7.org/browse/FHIR-38772)	Document change from US Core 4.0.0 to US Core 3.1.1
  - Changed base reference to US Core to 3.1.1 and adjusted any structure definitions required 
- [FHIR-34857](https://jira.hl7.org/browse/FHIR-34857)	Update reference to US Core MS and Missing Data
  - [Updated references to US Core MS and Missing Data](mustsupport_and_missing_data.html)

#### Mapping		

- [FHIR-38082](https://jira.hl7.org/browse/FHIR-38082)	Beef up the mapping instructions page
- [FHIR-38081](https://jira.hl7.org/browse/FHIR-38081)	Mapping page should not have the mapping language content
  - updated [mapping instructions](mapping_instructions.html)

#### Task Instructions		

- [FHIR-37480](https://jira.hl7.org/browse/FHIR-37480)	Add Task.output slice to allow patient to indicate their "chosen-contact"
- [FHIR-35750](https://jira.hl7.org/browse/FHIR-35750)	Suggest more robust requirements around using Task for patient Communications
- [FHIR-35634](https://jira.hl7.org/browse/FHIR-35634)	Clarify SDOH Task distinction
- [FHIR-35746](https://jira.hl7.org/browse/FHIR-35746)	Be clear on what the patient can change in Task
- [FHIR-35740](https://jira.hl7.org/browse/FHIR-35740)	Tighter specification around the updating of Task fields by Patient.
- [FHIR-35751](https://jira.hl7.org/browse/FHIR-35751)	Link to this in the relevant context
- [FHIR-35739](https://jira.hl7.org/browse/FHIR-35739)	Examples should show historical progression with statuses
  - Added the above changes to the [checking task status](checking_task_status.html) page

#### Personal Characteristics		

- [FHIR-34876](https://jira.hl7.org/browse/FHIR-34876)	Need specificity in requirements, e.g., state statutes.
- [FHIR-34863](https://jira.hl7.org/browse/FHIR-34863)	References from Race Profile to Spec Requirements
- [FHIR-34862](https://jira.hl7.org/browse/FHIR-34862)	References from Ethnicity Profile to Spec Requirements
- [FHIR-34860](https://jira.hl7.org/browse/FHIR-34860)	State Requirements Unclear
- [FHIR-34858](https://jira.hl7.org/browse/FHIR-34858)	Race and Ethnicity Text
- [FHIR-35679](https://jira.hl7.org/browse/FHIR-35679)	Illustrate that laws vary around sharing of race and ethnicity data
- [FHIR-35685](https://jira.hl7.org/browse/FHIR-35685)	Observation Subject Extension - use in Observation Profiles for Race and Ethnicity
- [FHIR-35338](https://jira.hl7.org/browse/FHIR-35338)	Concern over race and ethnicity data of "related person" and "practitioner"
- [FHIR-35329](https://jira.hl7.org/browse/FHIR-35329)	Concern over patient race and ethnicity data being shared for non-treatment purposes
- [FHIR-35022](https://jira.hl7.org/browse/FHIR-35022)	Use a single Observation Resource to include both Race and Ethnicity Observations
- [FHIR-34999](https://jira.hl7.org/browse/FHIR-34999)	Adding R/E Observations to the Structured Definitions without indicating they are draft will cause implementation confusion
- [FHIR-35691](https://jira.hl7.org/browse/FHIR-35691)	"Unknown" is not appropriate as an observation method
- [FHIR-34878](https://jira.hl7.org/browse/FHIR-34878)	Need to consider Provenance when R/E Extensions and Observation Resource is used for R/E
- [FHIR-35327](https://jira.hl7.org/browse/FHIR-35327)	For Observation.method value set, add guidance related to use of "observed"
- [FHIR-35325](https://jira.hl7.org/browse/FHIR-35325)	For Observation.method value set, clarify the definition of "reported-by-related-person" and add guidance related to use of "self-reported" and "reported-by-related-person"
- [FHIR-35206](https://jira.hl7.org/browse/FHIR-35206)	Patient Application Client CapabilityStatement does not include Observation therefore patients will not be able to Read nor search for R/E Observation Profiles
- [FHIR-35715](https://jira.hl7.org/browse/FHIR-35715)	Unclear what adhoc and adhocresponse are - please clarify
- [FHIR-35370](https://jira.hl7.org/browse/FHIR-35370)	For Observation.method value set, add guidance related to use of "observed".
- [FHIR-35375](https://jira.hl7.org/browse/FHIR-35375)	Add a challenge related to the sensitivity of SDOH data
  - Updated the [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html) page and referenced artifacts 

#### Value set changes		

- [FHIR-36591](https://jira.hl7.org/browse/FHIR-36591)	Add on-hold to the value set for .status to support patient inability to perform task for a period of time
  - Added on-hold to the [value set for the personal task status](artifacts.html#artifacts-summary)


#### Functional Use Cases		

- [FHIR-35718](https://jira.hl7.org/browse/FHIR-35718)	Restructure and add diagrams to make functional requirements of spec clear
- [FHIR-35639](https://jira.hl7.org/browse/FHIR-35639)	The patient should be given an opportunity to weigh in on whether the referral was successful and goals have been accomplished (or progress made)
- [FHIR-35633](https://jira.hl7.org/browse/FHIR-35633)	Clarifications related to Closing the Loop
- [FHIR-35623](https://jira.hl7.org/browse/FHIR-35623)	Clarify: what happens when the CP shares that info with the CBO or other agency assisting with the Food Insecurity?
- [FHIR-35621](https://jira.hl7.org/browse/FHIR-35621)	What is the CP doing on behalf of the provider organization that renders it a business associate?
- [FHIR-35377](https://jira.hl7.org/browse/FHIR-35377)	Additional info about what a CP is might be helpful here
- [FHIR-34881](https://jira.hl7.org/browse/FHIR-34881)	Referral workflow steps need to be aligned
  - Applied the above ticket dispositions to the [Functional Use Cases](functional_use_cases.html) page

#### Structure Definitions		

- [FHIR-34891](https://jira.hl7.org/browse/FHIR-34891)	Please relax Goal.Achievement cardinality to 0..1 to align with goals that are proposed or planned
  - changed goal.achievement cardinality to 0..1
- [FHIR-35369](https://jira.hl7.org/browse/FHIR-35369)	Streamline representation of SDOH screening instruments
  - based on US Core decision, change grouping observation to have individual observations for multiple selection questions

#### Exchange Workflow		

- [FHIR-35733](https://jira.hl7.org/browse/FHIR-35733)	Patient interaction diagrams need more clarity
- [FHIR-35721](https://jira.hl7.org/browse/FHIR-35721)	Recommend better definition and consistence with diagram and rest of 9
- [FHIR-35717](https://jira.hl7.org/browse/FHIR-35717)	Move this section up so that it is easier to find
- [FHIR-35637](https://jira.hl7.org/browse/FHIR-35637)	Workflow and Managing Consent diagram should be expanded to include API Resources
  - Applied the above ticket dispositions to the [Exchange Workflow](exchange_workflow.html) page

#### Capability Statements		

- [FHIR-36045](https://jira.hl7.org/browse/FHIR-36045)	Procedure _id search parameter Definition & Chaining makes reference to PractitionerRole records
- [FHIR-35960](https://jira.hl7.org/browse/FHIR-35960)	Subscription in the capability statements has SDOHCC-Procedure as the supported Profile
- [FHIR-35076](https://jira.hl7.org/browse/FHIR-35076)	Capability Statements - Please provide specific conformance assertions with respect to the various supported profiles
  - updated [capability statements](artifacts.html#artifacts-summary) page with the requested changes 

#### Privacy and Security		

- [FHIR-35676](https://jira.hl7.org/browse/FHIR-35676)	Add language to clarify that not all legal requests are up to org policy - HIPAA has specific procedures that must be followed regarding these types of disclosures
  * added clarification to the [Privacy and Security](privacy_and_security.html) page