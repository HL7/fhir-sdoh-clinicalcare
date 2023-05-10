
### Purpose
SDOHCC Observation Screening Response (OSR) is intended to represent question-answer pairs from Social Determinants of Health (SDOH) assessment instruments. An OSR that identifies a social risk or need can be referenced as evidence for an [SDOHCC Condition]. Sometimes, instead of representing a question that was answered directly on an assessment instrument, an OSR may be derived from one or more other OSRs (see [SDOHCC Observation Response Hunger Vital Sign Question 3 Example]). Additionally, an OSR may be addressed by, or be the outcome of, an [SDOHCC Goal], or be the reason for an [SDOHCC ServiceRequest] or an [SDOHCC Procedure]. See the [Data Modeling Framework] for more detail on the relationships between OSR and other profiles in this IG.

An OSR can also group a collection of OSRs using the hasMember field. A OSR grouping, that provides the LOINC code of the assessment instrument from which the member OSRs were created, is especially useful when there is no QuestionnaireReponse, Paper Form, or PDF to support the association of the individual OSRs with an assessment instrument. Although an OSR grouping can also be created for OSRs produced from a QuestionnaireResponse, the grouping will be somewhat redundant when the member OSRs already reference QuestionnaireResponse using the derivedFrom field.

This IG focuses on responses to assessment instruments that are captured using QuestionnaireResponse. To facilitate querying and searching, it is best that individual responses from a QuestionnaireResponse be converted into Observations. The decision as to which responses from a QuestionnaireResponse should be converted into Observations will generally be driven by the clinical utility of each Observation. While clinical utility is subjective, the question codes in the preferred value sets in the [Notes section](#notes) below provide the questions that Gravity has vetted as face-valid.  For more information on this topic and Observation grouping see [Options for Representing Assessment Instrument Responses in FHIR](assessment_instrument_support.html#options-for-representing-assessment-instrument-responses-in-fhir).

In the future, to promote interoperability by ensuring consistency in Observations generated from an assessment instrument, a single StructureMap instance should ideally be provided for each assessment instrument.

### Usage

Rather than offer a separate SDOHCC Observation Screening Response profile for each SDOH category (also called domain – e.g., food insecurity, transportation insecurity), this profile can support any SDOH category. For Observation.code and Observation.value, the minimum value set bindings are specified in the profile. Additionally, based on the code selected for the optional Observation.category slice, the Table in the [Notes](#notes) section below provides the Gravity-vetted, preferred value sets for Observation.code and Observation.value. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

The preferred value sets in the Table are hosted in the [NIH Value Set Authority Center (VSAC)][VSAC]. The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate these preferred, category-specific value sets.



{% include markdown-link-references.md %}