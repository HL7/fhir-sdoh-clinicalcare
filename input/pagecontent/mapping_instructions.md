*The following is used in [Survey Instrument Support](survey_instrument_support.html).*

In this IG, information is first captured in QuestionnaireResponses and is then automatically transformed into [Observations]({{site.data.fhir.path}}observation.html) and [Conditions]({{site.data.fhir.path}}condition.html) (where appropriate). This transformation is necessary because the raw data captured in the QuestionnaireResponses is not directly searchable with FHIR and is not considered 'standardized'.  For example, there may be a wide variety of Questionnaires that might result in a preliminary Condition asserting housing insecurity.  Some of them might be local or proprietary.  As such, there's no way to look at QuestionnaireResponses to find all patients with housing insecurity issues. Once the data is in Condition, the process is more straightforward.

There are a variety of strategies for converting QuestionnaireResponse data into other FHIR resources.  This IG has adopted the map based approach using the FHIR [StructureMap]({{site.data.fhir.path}}structuremap.html) resource.  This approach is selected because it supports complex transformation of data and allows the conversion process between data and Questionnaire to be maintained independently. The StructureMap-based extraction mechanism (considerations, error handling and other details) is documented in the [HL7 Structured Data Capture IG].

The StructureMap resource examples in this IG are generated using the [FHIR Mapping Language]({{site.data.fhir.path}}mapping-language.html).  This language is then used to generate the StructureMap instances.  Authoring the maps in a textual language is much simpler than attempting to craft the XML or JSON StructureMap instances directly.  The mapping language also works regardless of the syntax used for the QuestionnaireResponse.  I.e. it works the same for JSON, XML and RDF instances.

Instructions and tutorials on how to use the FHIR Mapping Language to convert and transform resources are found [here](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Mapping+Language).

That same page also includes references to existing open source implementations that are capable of compiling mapping language instances into FHIR StructureMaps as well as being able to 'execute' maps - i.e. convert a QuestionnaireResponse into a transaction Bundle of other resources.  Implementers are encouraged to leverage one of these existing community-developed implementations rather than creating their own.  This will both save work and minimize the likelihood of introducing implementation-specific errors into the transformation process.

The overall process for supporting this transformation process is therefore as follows:
1. Identify the Questionnaire that will be used to gather SDOH-related information
2. Determine what Observation and Condition resources will need to be created to be searchable within the FHIR record
3. Using the examples provided in this guide as a foundation, create a mapping language file that performs the necessary transformation
4. Compile the mapping file into a StructureMap instance (e.g. using the FHIR Java validator tool)
5. Execute the map against a QuestionnaireResponse
6. Execute the resulting transaction Bundle to create the relevant Observations and Conditions on the desired server

Note that the creation of the mapping file and compiled StructureMap only need to be performed once per Questionnaire.  Implementers leveraging the same Questionnaire are encouraged to share the FHIR Questionnaire instance and associated StructureMap to minimize development and maintenance effort.

This guide includes examples of a Questionnaire, QuestionnaireResponse, resulting Observations and Conditions, and the StructureMap used to convert from one to the other:

1. [Hunger Vital Sign Examples](artifacts.html#hunger-vital-signs-examples)
2. [PRAPARE Examples](artifacts.html#prapare-examples)

{% include markdown-link-references.md %}