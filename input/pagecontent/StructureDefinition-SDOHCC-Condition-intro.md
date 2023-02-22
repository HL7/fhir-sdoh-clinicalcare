
### Purpose
SDOHCC Condition is generally intended to represent a health concern or problem related to a social risk or need. Condition may be the result of screening response Observations (i.e., [SDOHCC Observation Screening Response]) or other Observations made as part of an encounter assessment (i.e., [SDOHCC Observation Assessment]). Condition may be addressed by a Goal ([SDOHCC Goal]) or be the reason for a ServiceRequest ([SDOHCC Service Request]) or Procedure ([SDOHCC Procedure]). See the [Data Modeling Framework] for more detail on the relationships between Condition and the other profiles in this IG.

### Usage

Rather than creating a separate Condition profile for each SDOH category (domain) covered in this IG (e.g., food insecurity, transportation insecurity, etc), this profile can support any SDOH category. The optional Condition.category slice binds to a required value set of SDOH category codes (first column below). The code selected for Condition.category determines a preferred, category-specific value set for Condition.code as per the table below.

The preferred value sets for Condition.code are hosted in the [NIH Value Set Authority Center (VSAC)]. The [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets for Condition below.

The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate the preferred, category-specific value sets for each of the relevant SDOH CC profiles.


| [`Condition.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Condition.code` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.103/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.103|
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.63/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.63|
| employment-status  | Employment Status | [VSAC -  Employment Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.42/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.42|
| financial-insecurity  | Financial Insecurity | [VSAC -  Financial Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.108/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.108|
| food-insecurity  | Food Insecurity | [VSAC -  Food Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.17/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.17|
| health-insurance-coverage-status  | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.148/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.148|
| health-literacy  | Health Literacy | [VSAC -  Health Literacy Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.116/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.116|
| homelessness  | Homelessness | [VSAC -  Homelessness Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.18/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.18|
| housing-instability  | Housing Instability | [VSAC -  Housing Instability Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.24/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.24|
| inadequate-housing  | Inadequate Housing | [VSAC -  Inadequate Housing Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.48/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.48|
| intimate-partner-violence  | Intimate Partner Violence | [VSAC -  Intimate Partner Violence Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.84/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.84|
| material-hardship  | Material Hardship | [VSAC -  Material Hardship Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.35/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.35|
| medical-cost-burden  | Medical Cost Burden | [VSAC -  Medical Cost Burden Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.153/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.153|
| social-connection  | Social Connection | [VSAC -  Social Connection Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.81/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.81|
| stress  | Stress | [VSAC -  Stress Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.75/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.75|
| transportation-insecurity  | Transportation Insecurity | [VSAC -  Transportation Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.26/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.26|
| veteran-status  | Veteran Status | [VSAC -  Veteran Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.78/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.78|
<<<<<<< HEAD
{:.grid}

{% include markdown-link-references.md %}
=======
{:.grid}
>>>>>>> 24509a3 (merge profile changes into FSH_based master branch)
