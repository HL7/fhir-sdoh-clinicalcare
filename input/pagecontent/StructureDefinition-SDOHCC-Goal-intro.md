### Purpose
[SDOHCC Goal] is generally intended to represent a goal established to address an identified social risk or need (i.e., [SDOHCC Condition], [SDOHCC Observation Screening Response], [SDOHCC Observation Assessment]). An [SDOHCC ServiceRequest] and [SDOHCC Procedure] can pertain to an SDOHCC Goal. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC Goal and the other profiles in this IG.

### Usage

Rather than offer a separate Goal profile for each SDOH category (also called domain – e.g., food insecurity, transportation insecurity), this profile can support any SDOH category. For Goal.description, the minimum value set bindings are specified in the profile. Additionally, based on the code selected for the optional Goal.category slice, the Table below provides the Gravity-vetted, preferred value sets for Goal.description. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

The preferred value sets in the Table are hosted in the [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/). [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets below. The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate these preferred, category-specific value sets.


| [`Goal.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Goal.description` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.55/expansion/Latest) | 2.16.840.1.113762.1.4.1247.55 |
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.65/expansion/Latest) |2.16.840.1.113762.1.4.1247.65 |
| employment-status  | Employment Status | [VSAC -  Unemployment Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.70/expansion/Latest) |2.16.840.1.113762.1.4.1247.70 |
| financial-insecurity  | Financial Insecurity | [VSAC -  Financial Insecurity Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.30/expansion/Latest) |2.16.840.1.113762.1.4.1247.30 |
| food-insecurity  | Food Insecurity | [VSAC -  Food Insecurity Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.16/expansion/Latest) |2.16.840.1.113762.1.4.1247.16 |
| health-insurance-coverage-status  | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.121/expansion/Latest) |2.16.840.1.113762.1.4.1247.121 |
| health-literacy  | Health Literacy | [VSAC -  Health Literacy Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.117/expansion/Latest) |2.16.840.1.113762.1.4.1247.117 |
| homelessness  | Homelessness | [VSAC -  Homelessness Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.159/expansion/Latest) |2.16.840.1.113762.1.4.1247.159 |
| housing-instability  | Housing Instability | [VSAC -  Housing Instability Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.161/expansion/Latest) |2.16.840.1.113762.1.4.1247.161 |
| inadequate-housing  | Inadequate Housing | [VSAC -  Inadequate Housing Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.50/expansion/Latest) |2.16.840.1.113762.1.4.1247.50 |
| intimate-partner-violence  | Intimate Partner Violence | [VSAC -  Intimate Partner Violence Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.100/expansion/Latest) |2.16.840.1.113762.1.4.1247.100 |
| material-hardship  | Material Hardship | [VSAC -  Material Hardship Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.37/expansion/Latest) |2.16.840.1.113762.1.4.1247.37 |
| medical-cost-burden  | Medical Cost Burden | [VSAC -  Medical Cost Burden Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.120/expansion/Latest) |2.16.840.1.113762.1.4.1247.120 |
| social-connection  | Social Connection | [VSAC -  Social Connection Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.89/expansion/Latest) |2.16.840.1.113762.1.4.1247.89 |
| stress  | Stress | [VSAC -  Stress Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.86/expansion/Latest) |2.16.840.1.113762.1.4.1247.86 |
| transportation-insecurity  | Transportation Insecurity | [VSAC -  Transportation Insecurity Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.163/expansion/Latest) |2.16.840.1.113762.1.4.1247.163 |
| veteran-status  | Veteran Status | VSAC -  Veteran Status Goals  | none |
{:.grid}

{% include markdown-link-references.md %}