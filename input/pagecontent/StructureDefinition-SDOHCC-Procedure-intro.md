
### Purpose
Procedures are interventions performed in response to a ServiceRequest as part of the referral process, and are referenced by the Task that is created to track execution of the ServiceRequest.
See the [Data Modeling Framework] for more detail on the role of the Goal in the creation of health concerns, goal setting (patient-centered goals), and creation of referrals using service request and procedure/intervention.

### Usage
* Needs an intro that explains what the profile is for and point to the page(s) in the spec where its use in workflow is described.

This profile supports all of the SDOH procedure defined in the IG.  Creating and maintaining a separate Procedure profile for each SDOH category would at present be burdensome.
Instead the table below defines the appropriate VSAC-hosted value set to use for each of the SDOH categories.

For each category of SDOH procedure, a specific value SHALL be used for Goal.category, and a specific valueset SHALL be used for the Procedure.code as shown in the table below.
Implentations **SHOULD** use the following a value from the listed value sets when a code exists that describes the concept. The value sets are maintained in the  [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/) database. The [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion) contains the full set of values.

The Gravity Project plans to work with the HL7 Vocabulary WG to determine how best to represent the domain specific value sets in each of the relevant resources and to establish appropriate methods to validate the consistent use of the correct domain specific codes. Future versions of this IG will include the logic to select specific value sets based on the SDOH domain.


| [`Procedure.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Procedure.code` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.56/expansion/Latest ) |2.16.840.1.113762.1.4.1247.56|
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.67/expansion/Latest ) |2.16.840.1.113762.1.4.1247.67|
| employment-status  | Employment Status | [VSAC -  Employment Status Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.59/expansion/Latest ) |2.16.840.1.113762.1.4.1247.59|
| financial-insecurity  | Financial Insecurity | [VSAC -  Financial Insecurity Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.32/expansion/Latest ) |2.16.840.1.113762.1.4.1247.32|
| food-insecurity  | Food Insecurity | [VSAC -  Food Insecurity Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.7/expansion/Latest ) |2.16.840.1.113762.1.4.1247.7|
| health-insurance-coverage-status  | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.125/expansion/Latest ) |2.16.840.1.113762.1.4.1247.125|
| health-literacy  | Health Literacy | [VSAC -  Health Literacy Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.118/expansion/Latest ) |2.16.840.1.113762.1.4.1247.118|
| homelessness  | Homelessness | [VSAC -  Homelessness Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.20/expansion/Latest ) |2.16.840.1.113762.1.4.1247.20|
| housing-instability  | Housing Instability | [VSAC -  Housing Instability Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.44/expansion/Latest ) |2.16.840.1.113762.1.4.1247.44|
| inadequate-housing  | Inadequate Housing | [VSAC -  Inadequate Housing Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.52/expansion/Latest ) |2.16.840.1.113762.1.4.1247.52|
| intimate-partner-violence  | Intimate Partner Violence | [VSAC -  Intimate Partner Violence Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.97/expansion/Latest ) |2.16.840.1.113762.1.4.1247.97|
| material-hardship  | Material Hardship | [VSAC -  Material Hardship Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.39/expansion/Latest ) |2.16.840.1.113762.1.4.1247.39|
| medical-cost-burden  | Medical Cost Burden | [VSAC -  Medical Cost Burden Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.122/expansion/Latest ) |2.16.840.1.113762.1.4.1247.122|
| social-connection  | Social Connection | [VSAC -  Social Connection Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.94/expansion/Latest ) |2.16.840.1.113762.1.4.1247.94|
| stress  | Stress | [VSAC -  Stress Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.87/expansion/Latest ) |2.16.840.1.113762.1.4.1247.87|
| transportation-insecurity  | Transportation Insecurity | [VSAC -  Transportation Insecurity Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.27/expansion/Latest ) |2.16.840.1.113762.1.4.1247.27|
| veteran-status  | Veteran Status | [VSAC -  Veteran Status Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.90/expansion/Latest ) |2.16.840.1.113762.1.4.1247.90|
{:.grid}

{% include markdown-link-references.md %}