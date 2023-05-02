This section presents an introduction to social care assessment instruments, the benefits of the use of standardized assessment instruments, and the use of StructureMap to automate the creation of [SDOHCC Observation Screening Response] and/or [SDOHCC Condition] from LOINC-encoded assessment instruments.

### Introduction to Social Care Assessment Instruments
Social risk assessment instruments are survey tools used to gather information about social risks that can impact an individual’s health and well-being. The information collected through a social care assessment instrument can be used by healthcare providers, public health organizations, and policymakers to develop interventions and programs aimed at addressing the root causes of health disparities and improving health outcomes for individuals and communities. This IG builds on existing FHIR frameworks to generate Observations (e.g., [SDOHCC Observation Screening Response]) and Conditions (e.g., [SDOHCC Condition]) from assessment instruments for incorporation into the patient’s health record.

Assessment instruments fit into the SDOH CC [Conceptual Framework] which illustrates how: 1) Providers incorporate screening into the care process to assess concerns and problems.  2) This information is used to help the Provider and Patient establish goals and identify social risk-related interventions to address those goals. 3) Responses to standard assessment instruments can be used to drive public health analysis of aggregated data from patient populations.

The list of Assessment Instruments from which questions have been selected and vetted by the Gravity Project as [face-valid](https://mmshub.cms.gov/measure-lifecycle/measure-testing/evaluation-criteria/scientific-acceptability/validity#:~:text=correlation%20or%20equity-,Face%20Validity,measure%20score%20is%20not%20feasible) can be found in the [Social Determinants of Health Screening Assessments] Value Set.
(Of note, the IG also offers an [SDOHCC Observation Assessment] profile for Observations that are made independent of the process described here to automate the creation of [SDOHCC Observation Screening Response]).

### Advantages of Standardized Social Care Assessment Instruments

Using a standardized social care assessment instrument has several advantages:

* **Interoperability (structural and semantic)**: Standardization (e.g., using the same tested and validated questions and coding) will help to ensure that data is consistent and comparable across studies and populations.
* **Ease of use**: Standardized social care assessment instruments are generally user-friendly and easy to administer.
* **Cost-effectiveness**: Developing (including testing and validation) custom assessment instruments is time-consuming and expensive.
* **Shared Maintenance**: As research and best practices evolve, standard assessments are more likely to keep up and reflect best current practice.


Assessment instruments used by Gravity are LOINC-encoded and questions chosen from the assessment instruments have been vetted by Gravity as [face-valid](https://mmshub.cms.gov/measure-lifecycle/measure-testing/evaluation-criteria/scientific-acceptability/validity#:~:text=correlation%20or%20equity-,Face%20Validity,measure%20score%20is%20not%20feasible).
The National Library of Medicine [LHC-Forms](https://lhcforms.nlm.nih.gov/lhcforms) is a widget that renders input forms based on FHIR [Questionnaire] for web based applications. The [NLM form Builder](https://lhcforms.nlm.nih.gov/lhcformbuilder.nlm.nih.gov) is a tool that can be used to build and edit FHIR Questionnaires. Using [StructureMap], the question-answer pairs from [QuestionnaireResponse] can be converted to instances of [SDOHCC Observation Screening Response] and, where appropriate, [SDOHCC Condition]. Generating Observations from [QuestionnaireResponse] supports searching for specific results which is difficult to do with [QuestionnaireResponse].
In the future, to promote interoperability, a single StructureMap instance could ideally be provided for each assessment instrument to ensure consistency in the Observations and Conditions (health concerns) generated from that assessment instrument.

### Standardization of Social Care Assessment Instruments
Another benefit to using standardized SDOH Assessment Instruments is to automate the conversion of the responses (values) to the questions (assessment items) into standardized terminology expressing the SDOH observation. We represent the instruments using [Questionnaire] for the item and [QuestionnaireResponse] for the value of the item. For each SDOH domain, we select [standard sets of questions - link to guidance spreadsheet][broken.html] leveraging existing validated assessment instruments along with the work from both the [Regenstrief Institute](https://www.regenstrief.org/) and the  [National Library of Medicine](https://www.nlm.nih.gov/) (NLM) to standardize the capture, coding and output of social care assessment instruments.
We define common canonical URLs, linkIds and allowed answer codes.

LOINC codes are used to describe the results of the question and answer from the social care assessment instrument because they support the encoding of standard assessment tools. While the output of the assessment process is an SDC QuestionnaireResponse, it can be useful to derive FHIR Observation and Condition resources based upon the questions and answers that are deemed to have clinical utility. The Observation supports searching for specific survey results (QuestionnaireResponses don't support searching based on answers provided) and the Condition identifies the health concerns so they can be communicated and promoted to problems on the problem list.

An Observation ~is~ may be used to group all the observations created by the QuestionnaireResponse using the Observation.hasMember reference to each of the individual observations. This approach is consistent with US Core and there are examples presented later in the IG for both example Questionnaires.

### Developing a New Assessment Instrument
Note, most users of this guide will use standardized assessment instruments. This description is provided for those organizations that need to use different instruments, either because they are dealing with determinants for which this IG has not yet identified a standard instrument, or organizational policy requires the use of specific instruments.

Developing a new assessment instrument for incorporation into the process described in this IG involves developing the assessment, calculation logic, and conversion logic. Utilizing assessment instruments built from a set of survey questions as [LOINC Components](https://loinc.org/kb/faq/structure/) with associated [LOINC Answer Lists](https://loinc.org/forums/topic/answer-lists/) is highly encouraged and the most straight forward approach. It supports future interoperability and takes advantage of enhanced capabilities within LCH form management.

* **Develop the assessment Instrument**
* **Develop the [SDC FHIR Questionnaire]**:  The assessment question and answers are incorporated into an [SDC FHIR Questionnaire] which also includes calculation logic that defines the result of some questions as a function of the answers to other questions.  There are tools that support this step (e.g., the open source NLM [LHC-Forms Widget](https://lhcforms.nlm.nih.gov/lhcforms))
* **Develop the Conversion Logic**: The results of the instrument are captured in a [SDC QuestionnaireResponse], and this in turn can be converted to Observations and Conditions using a [StructureMap].  Section **7.4 - fix reference and add hyperlink** below describes the mapping process approach.
Executing the Structure Map on a QuestionaireResponse produces:
  * [Observation][SDOHCC Observation Screening Response] (each representing an assessment question-answer(s) pair),
  * An optional [Observation][SDOHCC Observation Screening Response] that groups the Observations associated with a social care assessment together,
  * The related [Condition(s) resources](StructureDefinition-SDOHCC-Condition.html) indicating Health Concerns identified by the social care assessment instrument answers that should be coded with [US Core Condition codes](https://hl7.org/fhir/us/core/ValueSet/us-core-condition-code).

### Incorporation of Assessment Instruments into Clinical Workflow

To use an assessment instrument in practice, the artifacts produced in the previous section are used.
* **Patient Answers a Questionnaire**:  The patient is provided a [SDC FHIR Questionnaire] and fills it out. The completed questionnaire is stored as a [SDC QuestionnaireResponse]
* **QuestionnaireResponse is Processed Using a StructureMap**:  The resulting QuestionnaireResponse is processed by a StructureMap

Example StructureMap and output are available below in this IG for the [Hunger Vital Signs](https://loinc.org/88121-9/) and [PRAPARE](https://loinc.org/93025-5/) social care assessment instruments.

#### Hunger Vital Sign (HVS) Assessment Instrument Example

This implementation guide includes a complete example of the [Hunger Vital Sign (HVS) Survey](https://loinc.org/88121-9/) assessment instrument[^1] including:

* an [SDC Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html)
* an [SDC QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html)
* a [StructureMap](StructureMap-SDOHCC-StructureMapHungerVitalSign.html) that takes the [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) and creates the appropriate [SDOHCC Observation Screening Response] and [SDOHCC Condition] instances
* ~a [Grouping Observation](Observation-SDOHCC-ObservationResponseHungerVitalSignGroupingExample.html) created using [SDOHCC Observation Screening Response] to group the [SDOHCC Observation Screening Response] instances generated from specific questions and answers from the assessment instrument~
* multiple [SDOHCC Observation Screening Response] instances used to record the questions and answers on the assessment instrument
  * [Question 1](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion1Example.html)
  * [Question 2](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion2Example.html)
  * [Question 3](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion3Example.html) (computed in the assessment instrument based on Questions 1 and 2)
* a [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) that could be used to record the health concern based on the assessment instrument results

#### Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences (PRAPARE) Survey Example

This implementation guide includes a partial example of the [PRAPARE](https://loinc.org/93025-5/) Assessment Instrument[^2] including:

* an [SDC Questionnaire](Questionnaire-SDOHCC-QuestionnairePRAPARE.html)
* an [SDC Questionnaire Response](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html)
* a [StructureMap](StructureMap-SDOHCC-StructureMapPRAPARE.html) that takes the [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html) and creates the appropriate [SDOHCC Observation Screening Response] and [SDOHCC Condition] instances
* multiple [SDOHCC Observation Screening Response] instances used to record the question and answers for a select set of the survey elements (not all questions are provided in these examples)
  * [Employment Status](Observation-SDOHCC-ObservationResponsePRAPAREEmploymentStatusExample.html)
  * [Housing Status](Observation-SDOHCC-ObservationResponsePRAPAREHousingStatusExample.html)
  * [Child Care Need](Observation-SDOHCC-ObservationResponsePRAPAREChildCareNeedExample.html)
  * [Clothing Need](Observation-SDOHCC-ObservationResponsePRAPAREClothingNeedExample.html)
* two [SDOHCC Condition] instances to record the health concerns based on the results of the assessment instrument
  * [Unemployed](Condition-SDOHCC-ConditionUnemployedExample.html)
  *  [Homeless](Condition-SDOHCC-ConditionHomelessExample.html)

[^1]: The Hunger Vital Sign Survey is © 2010 Dr. Erin Hager and Dr. Anna Quigg and the Children’s HealthWatch research team, and the example is included with permission.
[^2]: This example comes from the national PRAPARE social determinants of health assessment protocol, developed and © 2019 by the National Association of Community Health Centers (NACHC), in partnership with the Association of Asian Pacific Community Health Organization (AAPCHO), the Oregon Primary Care Association (OPCA), and the Institute for Alternative Futures (IAF). For more information, visit [www.nachc.org/prapare](http://www.nachc.org/prapare). It is included with permission.

### Representing Assessment Instrument Responses in FHIR
The FHIR QuestionnaireResponse and Observation resources can each be used to present data captured in an assessment instrument. Each resource has advantages and disadvantages. Although DocumentReference can also be used to exchange scanned assessment instrument forms, this IG does not expect support for this legacy approach.  This IG expects that all systems can support exposing information about a completed assessment instrument in a computable way.

QuestionnaireResponse allows the precise capture of the assessment instrument version, the exact text of questions and answers presented to the individual, the order of presentation, and whether questions were skipped.  Thus, QuestionnaireResponse allows an understanding of the assessment instrument logic flow, packages a point-in-time assessment into a single resource for exchange, and provides a complete and fully contextualized view of the individual’s responses.

However, QuestionnaireResponse cannot be searched based on the answers provided.  For example, it is not possible to search a FHIR repository for all Hunger Vital Sign Questionnaires where Question 2 was answered “Often true”.  Thus, QuestionnaireResponse is not sufficient for answers that need to be trended, used as a basis for quality measures, or otherwise searched or filtered by in a computable way.
In contrast, Observation supports retrieval of specific question-answer pairs, comparison, trending, and searching or filtering.  A question-answer pair represented as an Observation can be retrieved and exchanged independently.  Observations can also indicate relationships to other artifacts, such as an Observation that is calculated or determined based on other Observations.
However, Observations do not convey the context of the assessment instrument from which they are obtained.  For example, information about the version of the instrument is not typically or computably captured, the order or presentation of questions is not captured, the exact text of questions and answers is not necessarily retained, and skipped questions are typically not represented.  Determining which assessment instrument a specific Observation came from may require searching for ‘grouping’ Observations and trying to use the grouping to determine which assessment instrument the member Observations came from.
An additional advantage of Questionnaire is that the content and rules can be externally defined and managed and systems capturing the data can simply render the questions and enforce the encoded rules (exact text of questions and answers is not necessarily retained).  In contrast, data captured directly as Observations needs to have rules manually configured or hard-coded into the software in an application-specific manner.

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

There are a variety of strategies for converting QuestionnaireResponse data into other FHIR resources.  This IG has adopted the map based approach using the FHIR [StructureMap] resource.  This approach is selected because it supports complex transformation of data and allows the conversion process between data and Questionnaire to be maintained independently. The StructureMap-based extraction mechanism (considerations, error handling and other details) is documented in the [HL7 Structured Data Capture IG].

The StructureMap resource examples in this IG are generated using the [FHIR Mapping Language].  This language is then used to generate the StructureMap instances.  Authoring the maps in a textual language is much simpler than attempting to craft the XML or JSON StructureMap instances directly.  The mapping language also works regardless of the syntax used for the QuestionnaireResponse.  I.e. it works the same for JSON, XML and RDF instances.

Instructions and tutorials on how to use the FHIR Mapping Language to convert and transform resources are found [here](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Mapping+Language).

That same page also includes references to existing open source implementations that are capable of compiling mapping language instances into FHIR StructureMaps as well as being able to 'execute' maps - i.e. convert a QuestionnaireResponse into a transaction Bundle of other resources.  Implementers are encouraged to leverage one of these existing community-developed implementations rather than creating their own.  This will both save work and minimize the likelihood of introducing implementation-specific errors into the transformation process.

The overall process for supporting this transformation process is therefore as follows:
1. Identify the Questionnaire that will be used to gather SDOH-related information
2. Determine what Observation and Condition resources will need to be created to be searchable within the FHIR record
3. Using the examples provided in this guide as a foundation, create a mapping language file that performs the necessary transformation
4. Compile the mapping file into a StructureMap instance (e.g. using the FHIR Java validator tool)
5. Execute the map against a QuestionnaireResponse
6. Execute the resulting transaction Bundle to create the relevant Observations and Conditions on the desired server
7. Test the map through the completion of the Questionnaire and validate the resulting Observations and Conditions

Note that the creation of the mapping file and compiled StructureMap only need to be performed once per Questionnaire.  Implementers leveraging the same Questionnaire are encouraged to share the FHIR Questionnaire instance and associated StructureMap to minimize development and maintenance effort.

This guide includes examples of a Questionnaire, QuestionnaireResponse, resulting Observations and Conditions, and the StructureMap used to convert from one to the other:

1. [Hunger Vital Sign Examples](artifacts.html#hunger-vital-signs-examples)
2. [PRAPARE Examples](artifacts.html#prapare-examples)

 ----------------------------------------------------------------------------------------------------

 {% include markdown-link-references.md %}
