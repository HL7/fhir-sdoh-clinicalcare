### Background

There is strong interest and a variety of activities in the delivery of health and social care to support health equity.  An essential element is to consider race and ethnicity in the context of defining the impact of social determinants of health. This is demonstrated by a recent [Cross-Industry Coalition Health Equity Pledge to Address Disparities](https://www.businesswire.com/news/home/20211026005241/en/Cross-Industry-Coalition-of-Health-Care-Organizations-Sign-Health-Equity-Pledge-to-Address-Disparities), and a proposed new [Health Equity Accreditation from NCQA](https://www.ncqa.org/wp-content/uploads/2021/11/Overview-Memo-Health-Equity-Accreditation-Plus.pdf?utm_medium=email&utm_campaign=publiccomment&utm_source=sf&utm_term=20211109) (see page 3, HE 2) , for which both include a focus on the collection of Race & Ethnicity (R/E) data.  However, there is a standards based challenge for collection and exchange of R/E data.  In most states, R/E data is considered sensitive data.  In addition, there are a variety of states, like New York, Minnesota and California, for which the state insurance codes require payers and/or providers to include R/E in reporting to the state. As such, a key challenge in several states will be knowing the source and method of the R/E data capture – as a crucial means to know and document when and if the R/E data capture must be reported in the state. 

### Draft Specification

This Implementation Guide (IG) has defined draft specifications for the exchange of race and ethnicity data to meet reporting requirements promulgated by a number of states.  Specific organizations require that the source and collection method of race and ethnicity data must be reported. Depending on the source and method of collection, it is possible to have more than one current expression of race and ethnicity for a single person.

The current extensions for [race](http://hl7.org/fhir/us/core/StructureDefinition-us-core-race.html) and [ethnicity](http://hl7.org/fhir/us/core/StructureDefinition-us-core-ethnicity.html) for the [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) profile do not allow for multiple occurrences of either extension or the definition of source and method of collection.

Since the characteristics of race and ethnicity data are more consistent with an observation than demographic data, we have elected to model the specification as profiles on the base Observation resource.

There are two observation profiles included in this IG:

1. [Race](StructureDefinition-SDOHCC-ObservationRace.html)
2. [Ethnicity](StructureDefinition-SDOHCC-ObservationEthnicity.html)

The observations use the same value sets as defined in the [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) extensions.  The only exceptions are the values that are represented in the draft observations as [null flavors](https://www.hl7.org/fhir/v3/NullFlavor/cs.html).

The observation profiles allow for the Observation.subject to reference [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) or if Observation.subject is not specified, then the Observation.subject R5 extension **SHALL** reference [US Core Practitioner](http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner). If the observation applies to a [RelatedPerson](http://hl7.org/fhir/relatedperson.html) then Observation.subject **SHALL** reference [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) and Observation.focus **SHALL** reference [RelatedPerson](http://hl7.org/fhir/relatedperson.html). This allows the use of the race and ethnicity observation to document the race and ethnicity of other actors (practitioner or related person) in the interactions with patients where these characteristics may be important.

If Observation.subject references [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) and [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) includes the respective extension for [race](http://hl7.org/fhir/us/core/StructureDefinition-us-core-race.html)  or [ethnicity](http://hl7.org/fhir/us/core/StructureDefinition-us-core-ethnicity.html) then both the observation and [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) extension **SHALL** have the same text and coded values for race or ethnicity respectively. In the event there are multiple race or ethnicity observations then the extension on [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) **SHALL** have the same text and coded values for race or ethnicity respectively as exist in one of the related observations.

### Recommendations for Collection and Reporting of Race and Ethnicity

The [1997 Standards for Maintaining, Collecting, and Presenting Federal Data on Race and Ethnicity](https://www.doi.gov/pmb/eeo/Data-Standards) provide two formats that may be used for data on race and ethnicity. Self- reporting or self-identification using two separate questions is the preferred method for collecting data on race and ethnicity. In situations where self-reporting is not practicable or feasible, the combined format may be used. This standard recommends that both race and ethnicity should be collected, not just one. 

Further resources

From the [US Census](https://www.census.gov/topics/population/race/about.html) and the [training workshop](https://www2.census.gov/about/training-workshops/2020/2020-02-19-pop-presentation.pdf): “An individual’s response to the race question is based upon self-identification.”

The statement from the [Department of Education](https://www.govinfo.gov/content/pkg/FR-2007-10-19/html/E7-20613.htm) details that with children parent reporting is preferred but by proxy that would still count as self-identification

### Testing Draft Specifications

Please test these two profiles and provide feedback on any changes that are necessary to support the exchange of race and ethnicity data.  Please pay specific attention to the method of specifying source of the data (via a [reference](https://www.hl7.org/fhir/references.html#Reference)) and method of collection (as a [codable concept](https://www.hl7.org/fhir/datatypes.html#CodeableConcept))

### US Core Intent

If the draft specifications prove to be appropriate methods of exchanging race and ethnicity data, based on testing of the draft profiles, it is the intent of the authors to present the results to the [Cross Group Projects](http://www.hl7.org/Special/committees/cgp/index.cfm) and request that the race and ethnicity observation profiles are included in the next version of the [US Core Specification](http://hl7.org/fhir/us/core/) and propose that the current extensions for race and ethnicity should be deprecated.