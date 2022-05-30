### Background

Collection of personal characteristics data (e.g., Race and Ethnicity (R/E), gender identity, sexual orientation, recorded sex and gender, and personal pronouns) is important to achieving the goal of health equity. For example, the recent [Cross-Industry Coalition Health Equity Pledge to Address Disparities](https://www.businesswire.com/news/home/20211026005241/en/Cross-Industry-Coalition-of-Health-Care-Organizations-Sign-Health-Equity-Pledge-to-Address-Disparities), and the proposed new [Health Equity Accreditation from NCQA](https://www.ncqa.org/wp-content/uploads/2021/11/Overview-Memo-Health-Equity-Accreditation-Plus.pdf?utm_medium=email&utm_campaign=publiccomment&utm_source=sf&utm_term=20211109) (see page 3, HE 2) both include a focus on the collection of Race and Ethnicity (R/E) data.  

However, there are standards-based challenges for collection and exchange of personal characteristics data.  For example, in some states, R/E data is considered sensitive data and laws vary on the extent to which it can be disclosed.  In addition, some state insurance policies require payers and/or providers to include R/E in reporting. Also, some states may require capturing the source (i.e., performer) and collection method for R/E data.

### Draft Specifications

This Implementation Guide (IG) has defined draft specifications for the exchange of personal characteristics data.  

For example, the draft R/E specifications are defined to meet the reporting requirements of a number of states. As an example, specific organizations require that the source and collection method of R/E data must be reported. Depending on the source and collection method, it is possible for an individual to have more than one observation about a specific personal characteristic (e.g., more than one race and/or more than one ethnicity expressed for an individual).

The current [race extension](http://hl7.org/fhir/us/core/StructureDefinition-us-core-race.html) and [ethnicity extension](http://hl7.org/fhir/us/core/StructureDefinition-us-core-ethnicity.html) for the [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) profile do not allow multiple occurrences of either extension or the capture of source and collection method.

Since personal characteristics (e.g., R/E) are more consistent with an observation than demographic data, we have modeled the specifications as profiles on the base Observation resource.

There are seven personal characteristic Observation profiles included in this IG:

1. [Personal Characteristic](StructureDefinition-SDOHCC-ObservationPersonalCharacteristic.html) (Abstract)
2. [Race](StructureDefinition-SDOHCC-ObservationRaceOMB.html)
3. [Ethnicity](StructureDefinition-SDOHCC-ObservationEthnicityOMB.html)
4. [Gender Identity]( StructureDefinition-SDOHCC-ObservationGenderIdentity.html)
5. [Recorded Sex and Gender](StructureDefinition-SDOHCC-ObservationRecordedSexGender.html)
6. [Sexual Orientation](StructureDefinition-SDOHCC-ObservationSexualOrientation.html)
7. [Personal Pronouns]( StructureDefinition-SDOHCC-ObservationPersonalPronouns.html)

#### Value Sets for Personal Characteristics

Value sets for the draft personal characteristics profiles are based on existing value sets (e.g., US Core, Gender Harmony Project, VSAC, USCDI, etc.) and may change as feedback is solicited and other value sets are developed (e.g., the Gender Harmony Project value sets). 

The personal characteristic profiles adhere to the following consistent structure with respect to handling [null flavors](https://www.hl7.org/fhir/v3/NullFlavor/cs.html):

* Race and Ethnicity – These profiles allow more than one Observation.component.value in order to allow race or ethnicity to be expressed with high-level codes, and/or more detailed level codes, and/or as a string. Null values (e.g., unknown, asked-declined, etc.) apply to all assertions about race or ethnicity regardless of granularity. For this reason, null values cannot be captured as part of individual components and are instead captured as a single element using Observation.dataAbsentReason. As a consequence, the value sets for Observation.component.value. have been modified to exclude null value concepts. Thus, for R/E, the value sets for Observation.component.value are the same as those defined in the [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) extensions with the exception that null flavors are represented using dataAbsentReason.

* Sexual Orientation, Gender Identity, Recorded Sex and Gender, Personal Pronouns - These profiles allow only one Observation.value. Therefore, null value concepts are allowed in the value set for Observation.value.

The value sets for Observation.method may also change as feedback is solicited and/or according to policy (e.g., at the organizational, state, or federal level). For further detail on method, see Recommendations for Collection and Reporting of Personal Characteristics.

#### Guidance for Personal Characteristics of the Patient, Related Person, or Practitioner

If there are one or more race observations, each with one or more races expressed, and the referenced [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) uses the [race extension ](http://hl7.org/fhir/us/core/StructureDefinition-us-core-race.html) to express one or more races, then the [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) race value(s) SHALL match the race value(s) of at least one of the race observations.  

If there are one or more ethnicity observations, and the referenced [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) uses the [ethnicity extension](http://hl7.org/fhir/us/core/StructureDefinition-us-core-ethnicity.html), then the [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient) ethnicity SHALL match the ethnicity of at least one of the ethnicity observations

### Recommendations for Collection and Reporting of Personal Characteristics

The value sets for method as well as the allowed references for performer may change as feedback is solicited and/or according to policy (e.g., at the organizational, state, or federal level).

**R/E Example**:

Since 1997, self-reported collection of R/E in a two question format has been the standard of the Office of Management and Budget (OMB) ([Revisions to the Standards for the Classification of Federal Data on Race and Ethnicity]( https://obamawhitehouse.archives.gov/omb/fedreg_1997standards)). 

Currently, federal policy allows visual observation of R/E in some situations but prohibits it in others (e.g., USDA Food and Nutrition Service policy [Collection of Race and Ethnicity Data by Visual Observation](https://www.fns.usda.gov/cn/Race-and-Ethnicity-Data-Policy-Rescission)). Although the IG value set provides “observed” as a collection method for the R/E profiles, there are concerns over the lack of reliability of “visual observation” of R/E. Therefore, the general recommendation is that R/E should be determined by attestation of the subject (or a related person in the event the subject is a minor or incapable of attesting) and the use of visual observation (i.e., “observed”) to determine R/E is generally discouraged. If future federal law or regulation completely prohibits visual observation of R/E, “observed” will be removed from the IG value set

In situations where an individual (e.g., a parent, guardian, caregiver, etc.) has legal authority on behalf of a subject, the complexity of whether R/E is “self-reported” versus “observed” versus “reported by related person” may need to be determined by policy at the local, state or federal level (e.g., [Department of Education](https://www.govinfo.gov/content/pkg/FR-2007-10-19/html/E7-20613.htm) pg. 59268, Section II C- Identification of Racial and Ethnic Categories and Missing Data).


### Testing Draft Specifications

Please test the draft personal characteristic profiles and provide feedback on any changes that are necessary to support the exchange of this data. Please pay specific attention to the value sets for the characteristics (via Observation.value and Observation.component.value), the value set for collection method (via Observation.method), and the approach for specifying the data’s source (via Observation.performer [Reference](https://www.hl7.org/fhir/references.html#Reference)).

### US Core Intent

If draft specification testing establishes that they are appropriate for exchanging personal characteristics data, the intent is that the profiles will be presented to [Cross Group Projects](http://www.hl7.org/Special/committees/cgp/index.cfm) with the request that they be included in the next version of the [US Core Specification](http://hl7.org/fhir/us/core/).