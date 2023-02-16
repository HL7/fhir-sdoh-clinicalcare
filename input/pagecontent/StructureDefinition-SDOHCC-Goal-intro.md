

### Usage
* Needs an intro that explains what the profile is for and point to the page(s) in the spec where its use in workflow is described.

This profile supports all of the SDOH goal defined in the IG.  Creating and maintaining a separate Goal profile for each SDOH category would at present be burdensome.
Instead the table below defines the appropriate VSAC-hosted value set to use for each of the SDOH categories.

For each category of SDOH goal, a specific value SHALL be used for Goal.category, and a specific valueset SHALL be used for the Goal.code as shown in the table below.
Implentations **SHOULD** use the following a value from the listed value sets when a code exists that describes the concept. The value sets are maintained in the  [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/) database.  The  [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion) contains the full set of values.

The Gravity Project plans to work with the HL7 Vocabulary WG to determine how best to represent the domain specific value sets in each of the relevant resources and to establish appropriate methods to validate the consistent use of the correct domain specific codes. Future versions of this IG will include the logic to select specific value sets based on the SDOH domain.


| [`Goal.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Goal.code` ValueSet | ValueSet OID |
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