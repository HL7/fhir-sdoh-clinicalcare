

### Usage
* Needs an intro that explains what the profile is for and point to the page(s) in the spec where its use in workflow is described.


This profile is used to capture Diagnoses for all 17 categories of SDOH information, using a contextual binding of valuesets.
For each category of SDOH condition, a specific value SHALL be used for Condition.category, and a specific valueset SHALL be used for the Condition.code as shown in the table below.  In the current version of this IG, this contextual binding is not enforced by invariants.  In future updates of the IG, these invariants may be added.

| [`Condition.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Condition.code` ValueSet | ValueSet URL |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.103/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.103/expansion/Latest |
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.63/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.63/expansion/Latest |
| employment-status  | Employment Status | [VSAC -  Employment Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.42/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.42/expansion/Latest |
| financial-insecurity  | Financial Insecurity | [VSAC -  Financial Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.108/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.108/expansion/Latest |
| food-insecurity  | Food Insecurity | [VSAC -  Food Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.17/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.17/expansion/Latest |
| health-insurance-coverage-status  | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.148/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.148/expansion/Latest |
| health-literacy  | Health Literacy | [VSAC -  Health Literacy Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.116/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.116/expansion/Latest |
| homelessness  | Homelessness | [VSAC -  Homelessness Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.18/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.18/expansion/Latest |
| housing-instability  | Housing Instability | [VSAC -  Housing Instability Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.24/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.24/expansion/Latest |
| inadequate-housing  | Inadequate Housing | [VSAC -  Inadequate Housing Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.48/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.48/expansion/Latest |
| intimate-partner-violence  | Intimate Partner Violence | [VSAC -  Intimate Partner Violence Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.84/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.84/expansion/Latest |
| material-hardship  | Material Hardship | [VSAC -  Material Hardship Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.35/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.35/expansion/Latest |
| medical-cost-burden  | Medical Cost Burden | [VSAC -  Medical Cost Burden Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.153/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.153/expansion/Latest |
| social-connection  | Social Connection | [VSAC -  Social Connection Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.81/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.81/expansion/Latest |
| stress  | Stress | [VSAC -  Stress Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.75/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.75/expansion/Latest |
| transportation-insecurity  | Transportation Insecurity | [VSAC -  Transportation Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.26/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.26/expansion/Latest |
| veteran-status  | Veteran Status | [VSAC -  Veteran Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.78/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.78/expansion/Latest |
{:.grid}