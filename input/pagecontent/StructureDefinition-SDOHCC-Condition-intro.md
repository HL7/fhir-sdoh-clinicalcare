
### Purpose
Conditions are created based on an Observation from a Survey or Assessment as part of the referral process, and can be referenced by a Goal or by a ServiceRequest created to request interventions to address the Condition.  See the [Data Modeling Framework] for more detail on the role of the Goal in the creation of health concerns, goal setting (patient-centered goals), and creation of referrals using service request and procedure/intervention.

### Usage
This profile supports all of the SDOH category defined in the IG.  Creating and maintaining a separate Condition profile for each SDOH category would at present be burdensome.
Instead the table below defines the appropriate VSAC-hosted value set to use for each of the SDOH categories.

For each category of SDOH condition, a specific value SHALL be used for Condition.category, and a specific valueset SHALL be used for the Condition.code as shown in the table below.
Implementations **SHOULD** use a value from the listed value sets when a code exists that describes the concept.  The value sets are maintained in the  [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/) database.  The  [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) contains the full set of values.

The Gravity Project plans to work with the HL7 Vocabulary WG to determine how best to represent the domain specific value sets in each of the relevant resources and to establish appropriate methods to validate the consistent use of the correct domain specific codes. Future versions of this IG will include the logic to select specific value sets based on the SDOH domain.


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
{:.grid}