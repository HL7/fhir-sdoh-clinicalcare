

### Usage
This profile is used to capture conditions for all 17 categories of SDOH information, using a contextual binding of valuesets.
For each category of SDOH condition, a specific value SHALL be used for Condition.category, and a specific valueset SHALL be used for the Condition.code as shown in the table below.  In the current version of this IG, this contextual binding is not enforced by invariants.  In future updates of the IG, these invariants may be added.

| [`Condition.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Condition.code` ValueSet | ValueSet URL |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment | Educational Attainment | [VSAC -  Less than high school education Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.103/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.103 |
| elder-abuse | Elder Abuse | [VSAC -  Elder Abuse Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.63/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.63 |
| employment-status | Employment Status | [VSAC -  Unemployment Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.42/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.42 |
| financial-insecurity | Financial Insecurity | [VSAC -  Financial Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.108/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.108 |
| food-insecurity | Food Insecurity | [VSAC -  Food Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.17/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.17 |
| health-insurance-coverage-status | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.148/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.148 |
| personal-health-literacy | Health Literacy | [VSAC -  Health Literacy Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.116/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.116 |
| homelessness | Homelessness | [VSAC -  Homelessness Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.18/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.18 |
| housing-instability | Housing Instability | [VSAC -  Housing Instability Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.24/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.24 |
| inadequate-housing | Inadequate Housing | [VSAC -  Inadequate Housing Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.48/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.48 |
| intimate-partner-violence | Intimate Partner Violence | [VSAC -  Intimate Partner Violence Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.84/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.84 |
| material-hardship | Material Hardship | [VSAC -  Material Hardship Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.35/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.35 |
| medical-cost-burden | Medical Cost Burden | [VSAC -  Medical Cost Burden Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.153/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.153 |
| social-connection | Social Connection | [VSAC -  Social Connection Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.81/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.81 |
| stress | Stress | [VSAC -  Stress Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.75/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.75 |
| transportation-insecurity | Transportation Insecurity | [VSAC -  Transportation Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.26/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.26 |
| veteran-status | Veteran Status | [VSAC -  Veteran Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.78/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.78 |
{:.grid}