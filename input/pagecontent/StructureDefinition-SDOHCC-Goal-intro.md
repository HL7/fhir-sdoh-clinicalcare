

### Usage
This profile is used to capture service requests for all 17 categories of SDOH information, using a contextual binding of valuesets.
For each category of SDOH service request, a specific value SHALL be used for ServiceRequest.category, and a specific valueset SHALL be used for the ServiceRequest.code as shown in the table below.  In the current version of this IG, this contextual binding is not enforced by invariants.  In future updates of the IG, these invariants may be added.

| [`ServiceRequest.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `ServiceRequest.code` ValueSet | ValueSet URL |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment | Educational Attainment | [VSAC -  Less than high school education Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.57/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.57 |
| elder-abuse | Elder Abuse | [VSAC -  Elder Abuse Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.68/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.68 |
| employment-status | Employment Status | [VSAC -  Unemployment Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.60/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.60 |
| financial-insecurity | Financial Insecurity | [VSAC -  Financial Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.31/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.31 |
| food-insecurity | Food Insecurity | [VSAC -  Food Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.11/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.11 |
| health-insurance-coverage-status | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.124/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.124 |
| personal-health-literacy | Health Literacy | [VSAC -  Health Literacy Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.119/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.119 |
| homelessness | Homelessness | [VSAC -  Homelessness Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.21/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.21 |
| housing-instability | Housing Instability | [VSAC -  Housing Instability Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.45/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.45 |
| inadequate-housing | Inadequate Housing | [VSAC -  Inadequate Housing Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.53/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.53 |
| intimate-partner-violence | Intimate Partner Violence | [VSAC -  Intimate Partner Violence Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.98/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.98 |
| material-hardship | Material Hardship | [VSAC -  Material Hardship Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.38/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.38 |
| medical-cost-burden | Medical Cost Burden | [VSAC -  Medical Cost Burden Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.123/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.123 |
| social-connection | Social Connection | [VSAC -  Social Connection Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.95/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.95 |
| stress | Stress | [VSAC -  Stress Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.92/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.92 |
| transportation-insecurity | Transportation Insecurity | [VSAC -  Transportation Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.28/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.28 |
| veteran-status | Veteran Status | [VSAC -  Veteran Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.91/expansion ) | https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1247.91 |
{:.grid}