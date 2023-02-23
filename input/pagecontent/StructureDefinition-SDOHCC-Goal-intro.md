### Purpose
[SDOHCC Goal] is generally intended to represent a goal established to address an identified social risk or need (i.e., [SDOHCC Condition], [SDOHCC Observation Screening Response], [SDOHCC Observation Assessment]). An [SDOHCC ServiceRequest] and [SDOHCC Procedure] can pertain to an SDOHCC Goal. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC Goal and the other profiles in this IG.

### Usage

Rather than creating a separate Goal profile for each SDOH category (domain) covered in this IG (e.g., food insecurity, transportation insecurity, etc.), this profile can support any SDOH category. The optional Goal.category slice binds to a required value set of SDOH category codes (first column below). The code selected for Goal.category determines a preferred, category-specific value set for Goal.description as per the table below.
The preferred value sets for Goal.description are hosted in the [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/). The  [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets for Goal below.
The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate the preferred, category-specific value sets for each of the relevant SDOH CC profiles.

| [`Goal.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Goal.description` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.55/expansion/Latest) | 2.16.840.1.113762.1.4.1247.55 |
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.65/expansion/Latest) |2.16.840.1.113762.1.4.1247.65 |
| employment-status  | Employment Status | [VSAC -  Employment Status Goals ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.70/expansion/Latest) |2.16.840.1.113762.1.4.1247.70 |
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