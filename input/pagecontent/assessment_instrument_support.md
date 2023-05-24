This section describes standardized social risk assessment instruments, their benefits, and how to standardize their capture, coding and output leveraging work from the  [Regenstrief Institute](https://www.regenstrief.org/) and the [National Library of Medicine](https://www.nlm.nih.gov/) (NLM), [SDC Questionnaire], [SDC QuestionnaireResponse], and [StructureMap] to automate the creation of [SDOHCC Observation Screening Response] and [SDOHCC Condition].

### Introduction to Social Care Assessment Instruments
Social risk assessment instruments are used to gather information about social risks that can impact an individual’s health and well-being. The information collected through social risk assessment instruments can be used by providers, public health organizations, and policymakers to develop interventions and programs aimed at addressing the root causes of health disparities and improving health outcomes for individuals and communities. This IG builds on existing FHIR frameworks to generate Observations (e.g., [SDOHCC Observation Screening Response]) and Conditions (e.g., [SDOHCC Condition]) from LOINC-encoded assessment instruments for incorporation into the patient’s health record.

Assessment instruments fit into the SDOH CC [Conceptual Framework](sdoh_clinical_care_scope.html) which illustrates how to: 1) incorporate screening into the care process to assess health concerns and problems.  2) use this information to help the provider and patient establish goals and identify social risk-related interventions to address those goals. 3) use responses from standardized assessment instruments to drive public health analysis of aggregated data from patient populations.

The list of assessment instruments from which questions have been selected and vetted by the Gravity Project as [face-valid](https://mmshub.cms.gov/measure-lifecycle/measure-testing/evaluation-criteria/scientific-acceptability/validity#:~:text=correlation%20or%20equity-,Face%20Validity,measure%20score%20is%20not%20feasible) can be found in the [Social Determinants of Health Screening Assessments](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.126/expansion/Latest) Value Set.

### Advantages of Standardized Social Care Assessment Instruments

Advantages of using a standardized social risk assessment instrument include:

* **Interoperability (structural and semantic)**: Standardization (e.g., using the same tested and validated questions and coding) will help to ensure that data is consistent and comparable across studies and populations.
* **Ease of use**: Standardized social risk assessment instruments are generally user-friendly and easy to administer.
* **Cost-effectiveness**: Developing (including testing and validation) custom assessment instruments is time-consuming and expensive.
* **Shared maintenance**: As research and best practices evolve, standardized assessments are more likely to keep up and reflect best current practice.

Leveraging Gravity-vetted, LOINC-encoded, standardized assessment instruments, and resources (described below) provided by the [National Library of Medicine](https://www.nlm.nih.gov/) (NLM) should significantly advance the effort to capture and analyze information gathered from assessment instruments.

In the future, to promote interoperability, a single StructureMap instance could ideally be provided by the questionnaire steward for each standardized social risk assessment instrument to ensure consistency in the Observations and Conditions (health concerns) generated from that assessment instrument.

### Implementing Assessment Instruments
This IG uses the process below for implementing an assessment instrument. The process can be used for assessment instruments vetted by Gravity but can also be applied to other assessment instruments.

* **Use a LOINC-encoded assessment instrument**:  [LOINC Components](https://loinc.org/kb/faq/structure/) and [LOINC Answer Lists](https://loinc.org/forums/topic/answer-lists/) standardize the coding and facilitate leveraging the open-source NLM [LHC-Forms Widget](https://lhcforms.nlm.nih.gov/lhcforms).
* **Convert the LOINC-encoded assessment instrument to an [SDC Questionnaire]**: The open-source NLM [LHC-Forms Widget](https://lhcforms.nlm.nih.gov/lhcforms) supports this step by rendering input forms based on FHIR [Questionnaire] for Web-based applications and can be used to build and edit FHIR Questionnaires. For some assessment instruments, this step may include establishing calculation logic to define the result of some questions as a function of answers to other questions (e.g., where one or more questions determine an answer to another “question” as in Hunger Vital Sign Question 3). 
* **Instantiate the [SDC Questionnaire]**: Using an appropriate application (e.g., the open-source NLM [FHIR SDC SMART App](https://lhcforms.nlm.nih.gov/sdc)) create an [SDC QuestionnaireResponse]
* **Develop translation logic to use** [StructureMap]  (provided by the assessment instrument steward) and a validation tool to generate the following resources instances from the [SDC QuestionnaireResponse]: 
  * [Observation][SDOHCC Observation Screening Response] to represent a question-answer(s) pair from the assessment instrument
  * [Condition][SDOHCC Condition] to represent any health concerns identified by the assessment instrument
  * [Observation][SDOHCC Observation Screening Response] grouping - to group any Observations associated with the assessment instrument. Of note, for Observations that can reference a QuestionnaireResponse (as in this process), this is generally redundant but is not prohibited.

### Incorporating Assessment Instruments into Clinical Workflow

When an [SDC Questionnaire] is completed, stored as an [SDC QuestionnaireResponse], and processed using a [StructureMap], the resulting instances of [Observation][SDOHCC Observation Screening Response] and [Condition][SDOHCC Condition] can be integrated into the clinical workflow to assist in guiding care.

Examples of these artifacts for [Hunger Vital Signs](https://loinc.org/88121-9/) and [PRAPARE](https://loinc.org/93025-5/) are listed below.

#### Hunger Vital Sign (HVS) Assessment Instrument Example

This implementation guide includes a complete example of the [Hunger Vital Sign (HVS) Survey](https://loinc.org/88121-9/) assessment instrument[^1] including:

* an [SDC HVS Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html)
* an [SDC HVS QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html)
* a [StructureMap](StructureMap-SDOHCC-StructureMapHungerVitalSign.html) that takes the [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) and creates the appropriate [SDOHCC Observation Screening Response] and [SDOHCC Condition] instances
* one [SDOHCC Observation Screening Response] instance used to record the questions and answers on the assessment instrument
  * [Question 3](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion3Example.html) (computed in the assessment instrument based on Questions 1 and 2)
* a [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) that could be used to record the health concern based on the assessment instrument results

#### Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences (PRAPARE) Survey Example

This implementation guide includes a partial example of the [PRAPARE](https://loinc.org/93025-5/) Assessment Instrument[^2] including:

* an [SDC PRAPARE Questionnaire](Questionnaire-SDOHCC-QuestionnairePRAPARE.html)
* an [SDC PRAPARE Questionnaire Response](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html)
* a [StructureMap](StructureMap-SDOHCC-StructureMapPRAPARE.html) that takes the [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html) and creates the appropriate [SDOHCC Observation Screening Response] and [SDOHCC Condition] instances
* multiple [SDOHCC Observation Screening Response] instances used to record some of the question and answers (not all questions are provided in these examples)
  * [Employment Status](Observation-SDOHCC-ObservationResponsePRAPAREEmploymentStatusExample.html)
  * [Housing Status](Observation-SDOHCC-ObservationResponsePRAPAREHousingStatusExample.html)
  * [Child Care Need](Observation-SDOHCC-ObservationResponsePRAPAREChildCareNeedExample.html)
  * [Clothing Need](Observation-SDOHCC-ObservationResponsePRAPAREClothingNeedExample.html)
* two [SDOHCC Condition] instances to record the health concerns based on the results of the assessment instrument
  * [Unemployed](Condition-SDOHCC-ConditionUnemployedExample.html)
  *  [Homeless](Condition-SDOHCC-ConditionHomelessExample.html)

[^1]: The Hunger Vital Sign Survey is © 2010 Dr. Erin Hager and Dr. Anna Quigg and the Children’s HealthWatch research team, and the example is included with permission.
[^2]: This example comes from the national PRAPARE social determinants of health assessment protocol, developed and © 2019 by the National Association of Community Health Centers (NACHC), in partnership with the Association of Asian Pacific Community Health Organization (AAPCHO), the Oregon Primary Care Association (OPCA), and the Institute for Alternative Futures (IAF). For more information, visit [www.nachc.org/prapare](http://www.nachc.org/prapare). It is included with permission.

### Options for Representing Assessment Instrument Responses in FHIR
The FHIR QuestionnaireResponse and Observation resources can each be used to present data captured in an assessment instrument. Each resource has advantages and disadvantages. Although DocumentReference can also be used to exchange scanned assessment instrument forms, this IG does not expect support for this legacy approach.  This IG expects that all systems can support exposing information about a completed assessment instrument in a computable way.

QuestionnaireResponse allows the precise capture of the assessment instrument version, the exact text of questions and answers presented to the individual, the order of presentation, and whether questions were skipped.  Thus, QuestionnaireResponse allows an understanding of the assessment instrument logic flow, packages a point-in-time assessment into a single resource for exchange, and provides a complete and fully contextualized view of the individual’s responses.

However, QuestionnaireResponse cannot be searched based on the answers provided.  For example, it is not possible to search a FHIR repository for all Hunger Vital Sign Questionnaires where Question 2 was answered “Often true”.  Thus, QuestionnaireResponse is not sufficient for answers that need to be trended, used as a basis for quality measures, or otherwise searched or filtered by in a computable way.
In contrast, Observation supports retrieval of specific question-answer pairs, comparison, trending, and searching or filtering.  A question-answer pair represented as an Observation can be retrieved and exchanged independently.  Observations can also indicate relationships to other artifacts, such as an Observation that is calculated or determined based on other Observations.
However, Observations do not convey the context of the assessment instrument from which they are obtained.  For example, information about the version of the instrument is not typically or computably captured, the order or presentation of questions is not captured, the exact text of questions and answers is not necessarily retained, and skipped questions are typically not represented.  Determining which assessment instrument a specific Observation came from may require searching for ‘grouping’ Observations and trying to use the grouping to determine which assessment instrument the member Observations came from.
An additional advantage of QuestionnaireResponse is that the content and rules can be externally defined and managed and systems capturing the data can simply render the questions and enforce the encoded rules (exact text of questions and answers is not necessarily retained).  In contrast, data captured directly as Observations needs to have rules manually configured or hard-coded into the software in an application-specific manner.

Therefore, best practice is to be able to capture and share both types of representations. Use QuestionnaireResponse to represent the complete set of question-answer pairs with full context, and then expose as Observations the subset of question-answer pairs that are felt to be useful for searching, filtering, quality measures, etc.
If assessment instrument results are represented only as Observation data, a grouping Observation MUST be used to convey the context of the instrument used to gather the data and all question-answer pairs from the instrument must be expressed as Observations to provide necessary context.  (An example of this approach using a set of Observations from an assessment instrument, a grouping Observation, and without an associated QuestionnaireResponse can be found [here](Observation-SDOHCC-ObservationResponseNHANESGroupingExample.html).)

Where information is represented using a QuestionnaireResponse, there is no requirement that all question-answer pairs be surfaced as Observations, but any Observations that are produced SHALL include a derivation link (derivedFrom) to the QuestionnaireResponse.
Key questions for deciding which question-answer pairs should be represented Observations include but are not limited to:

* Is it a score or other key measure which may determine whether a problem is recorded in the patient’s record?
* Is it something for which a provider might want to see trends?
* Is it needed as part of the calculation of a measure?
* Is it something a provider would likely search for?

Even if systems have the QuestionnaireResponse, some may opt to represent all question-answer pairs as Observations while others may not find this useful and may feel it creates ‘noise’ in the EHR.

### Mapping QuestionnaireResponses to FHIR Resources
When using Questionnaire and QuestionnaireResponse to capture assessment instrument data, it is helpful to be able to automatically create any ‘relevant’ Observations from a Questionnaire without having to manually write code.  Ideally, it would also help interoperability and provider burden if standardized assessment instruments incorporated rules to support the automated generation of ‘unconfirmed’ Conditions (health concerns) during this process and provided relevant ‘support’ links for a provider to easily confirm a Condition after their encounter with the patient.

There are a variety of strategies for converting QuestionnaireResponse data into other FHIR resources.  This IG has adopted the map-based approach using the FHIR [StructureMap] resource.  This approach was selected because it supports complex transformation of data and allows the conversion process between data and Questionnaire to be maintained independently. The StructureMap-based extraction mechanism (considerations, error handling and other details) is documented in the [HL7 Structured Data Capture IG].

The StructureMap resource examples in this IG are generated using the [FHIR Mapping Language].  This language is then used to generate the StructureMap instances.  Authoring the maps in a textual language is much simpler than attempting to craft the XML or JSON StructureMap instances directly.  The mapping language also works regardless of the syntax used for the QuestionnaireResponse, i.e., it works the same for JSON, XML and RDF instances.

Instructions and tutorials on how to use the FHIR Mapping Language to convert and transform resources are found [here](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Mapping+Language).
This page also includes references to existing open-source implementations that are capable of compiling mapping language instances into FHIR StructureMaps as well as being able to 'execute' maps - i.e., convert a QuestionnaireResponse into a transaction Bundle of other resources.  Implementers are encouraged to leverage one of these existing community-developed implementations rather than creating their own.  This will save work and minimize the likelihood of introducing implementation-specific errors into the transformation process.

The overall process for supporting this transformation process is therefore as follows:
1. Identify the Questionnaire that will be used to gather SDOH-related information
2. Determine what Observation and Condition resources will need to be created to be searchable within the FHIR record
3. Using the examples provided in this guide as a foundation, create a mapping language file that performs the necessary transformation
4. Compile the mapping file into a StructureMap instance (e.g., using the FHIR Java validator tool)
5. Execute the map against a QuestionnaireResponse
6. Execute the resulting transaction Bundle to create the relevant Observations and Conditions on the desired server
7. Test the map through the completion of the Questionnaire and validate the resulting Observations and Conditions

Note that the creation of the mapping file and compiled StructureMap only needs to be performed once per Questionnaire.  Implementers leveraging the same Questionnaire are encouraged to share the FHIR Questionnaire instance and associated StructureMap to minimize development and maintenance effort.

This guide includes examples of a Questionnaire, QuestionnaireResponse, resulting Observations and Conditions, and the StructureMap used to convert from one to the other:

1. [Hunger Vital Sign Examples](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html)
2. [PRAPARE Examples](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html)

 ----------------------------------------------------------------------------------------------------

 {% include markdown-link-references.md %}
