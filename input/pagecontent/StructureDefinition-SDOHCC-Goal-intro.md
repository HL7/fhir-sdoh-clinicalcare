### Purpose
[SDOHCC Goal] is generally intended to represent a goal established to address an identified social risk or need (i.e., [SDOHCC Condition], [SDOHCC Observation Screening Response], [SDOHCC Observation Assessment]). An [SDOHCC ServiceRequest] and [SDOHCC Procedure] can pertain to an SDOHCC Goal. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC Goal and the other profiles in this IG.

### Usage

Rather than offer a separate Goal profile for each SDOH category (also called domain – e.g., food insecurity, transportation insecurity), this profile can support any SDOH category. For Goal.description, the minimum value set bindings are specified in the profile. Additionally, based on the code selected for the optional Goal.category slice, the Table below provides the Gravity-vetted, preferred value sets for Goal.description. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

The preferred value sets in the Table are hosted in the [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/). [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets below. The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate these preferred, category-specific value sets.

[//]: # (Parameter Table DO NOT REMOVE)

| [`Goal.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain - Profile | `Goal.code` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | [Educational Attainment](StructureDefinition-SDOHCC-Goal-educational-attainment.html) | [VSAC - Less Than High School Education Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.55/expansion/Latest) | 2.16.840.1.113762.1.4.1247.55 |
| elder-abuse  | [Elder Abuse](StructureDefinition-SDOHCC-Goal-elder-abuse.html) | [VSAC - Elder Abuse Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.65/expansion/Latest) | 2.16.840.1.113762.1.4.1247.65 |
| employment-status  | [Employment Status](StructureDefinition-SDOHCC-Goal-employment-status.html) | [VSAC - Unemployment Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.70/expansion/Latest) | 2.16.840.1.113762.1.4.1247.70 |
| financial-insecurity  | [Financial Insecurity](StructureDefinition-SDOHCC-Goal-financial-insecurity.html) | [VSAC - Financial Insecurity Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.30/expansion/Latest) | 2.16.840.1.113762.1.4.1247.30 |
| food-insecurity  | [Food Insecurity](StructureDefinition-SDOHCC-Goal-food-insecurity.html) | [VSAC - Food Insecurity Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.16/expansion/Latest) | 2.16.840.1.113762.1.4.1247.16 |
| health-insurance-coverage-status  | [Health Insurance Coverage Status](StructureDefinition-SDOHCC-Goal-health-insurance-coverage-status.html) | [VSAC - Health Insurance Coverage Status Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.121/expansion/Latest) | 2.16.840.1.113762.1.4.1247.121 |
| personal-health-literacy  | [Health Literacy](StructureDefinition-SDOHCC-Goal-personal-health-literacy.html) | [VSAC - Health Literacy Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.117/expansion/Latest) | 2.16.840.1.113762.1.4.1247.117 |
| homelessness  | [Homelessness](StructureDefinition-SDOHCC-Goal-homelessness.html) | [VSAC - Homelessness Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.159/expansion/Latest) | 2.16.840.1.113762.1.4.1247.159 |
| housing-instability  | [Housing Instability](StructureDefinition-SDOHCC-Goal-housing-instability.html) | [VSAC - Housing Instability Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.161/expansion/Latest) | 2.16.840.1.113762.1.4.1247.161 |
| inadequate-housing  | [Inadequate Housing](StructureDefinition-SDOHCC-Goal-inadequate-housing.html) | [VSAC - Inadequate Housing  Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.50/expansion/Latest) | 2.16.840.1.113762.1.4.1247.50 |
| intimate-partner-violence  | [Intimate Partner Violence](StructureDefinition-SDOHCC-Goal-intimate-partner-violence.html) | [VSAC - Intimate Partner Violence Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.100/expansion/Latest) | 2.16.840.1.113762.1.4.1247.100 |
| material-hardship  | [Material Hardship](StructureDefinition-SDOHCC-Goal-material-hardship.html) | [VSAC - Material Hardship Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.37/expansion/Latest) | 2.16.840.1.113762.1.4.1247.37 |
| medical-cost-burden  | [Medical Cost Burden](StructureDefinition-SDOHCC-Goal-medical-cost-burden.html) | [VSAC - Medical Cost Burden Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.120/expansion/Latest) | 2.16.840.1.113762.1.4.1247.120 |
| social-connection  | [Social Connection](StructureDefinition-SDOHCC-Goal-social-connection.html) | [VSAC - Social Connection Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.89/expansion/Latest) | 2.16.840.1.113762.1.4.1247.89 |
| stress  | [Stress](StructureDefinition-SDOHCC-Goal-stress.html) | [VSAC - Stress Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.86/expansion/Latest) | 2.16.840.1.113762.1.4.1247.86 |
| transportation-insecurity  | [Transportation Insecurity](StructureDefinition-SDOHCC-Goal-transportation-insecurity.html) | [VSAC - Transportation Insecurity Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.163/expansion/Latest) | 2.16.840.1.113762.1.4.1247.163 |
| veteran-status  | [Veteran Status](StructureDefinition-SDOHCC-Goal-veteran-status.html) | [VSAC - Veteran Status Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.90/expansion/Latest) | 2.16.840.1.113762.1.4.1247.90 |
{:.grid}

[//]: # (End Parameter Table DO NOT REMOVE)


{% include markdown-link-references.md %}