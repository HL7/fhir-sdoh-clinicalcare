
### Purpose
SDOHCC Observation Screening Response is intended to represent question-answer pairs from Social Determinants of Health (SDOH) assessment instruments. An SDOHCC Observation Screening Response that identifies a social risk or need can be referenced as evidence for an [SDOHCC Condition]. Sometimes, instead of representing a question that was answered directly on an assessment instrument, an SDOHCC Observation Screening Response may be derived from one or more other SDOHCC Observation Screening Responses (see [SDOHCC Observation Response Hunger Vital Sign Question 3 Example]). Additionally, an SDOHCC Observation Screening Response may be addressed by, or be the outcome of, an [SDOHCC Goal], or be the reason for an [SDOHCC ServiceRequest] or an [SDOHCC Procedure]. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC Observation Screening Response and the other profiles in this IG.

In this IG, responses to assessment instruments are captured using QuestionnaireResponse. To facilitate querying and searching, it is best that individual responses from a QuestionnaireResponse be converted into Observations. The decision as to whether to convert individual responses from a QuestionnaireResponse into Observations will generally be driven by the clinical utility of the Observation. While clinical utility is subjective, the question codes in the preferred value sets in [Table 2: Category-specific Preferred Value Sets and Assessment Instrument Spreadsheets] represent the questions that Gravity has vetted as face-valid.

In the future, to promote interoperability, a single StructureMap instance should ideally be provided for each assessment instrument to ensure consistency in the Observations generated from that assessment instrument.

### Usage

Rather than offer separate SDOHCC Observation Screening Response profiles for each SDOH category (domain) covered in this IG (e.g., food insecurity, transportation insecurity, etc.), this profile supports any SDOH category. The minimum required value set bindings for elements are specified in the profile. Additionally, the Table in the [notes](#notes) section below provides Gravity-vetted, preferred value sets for this profile. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.



{% include markdown-link-references.md %}