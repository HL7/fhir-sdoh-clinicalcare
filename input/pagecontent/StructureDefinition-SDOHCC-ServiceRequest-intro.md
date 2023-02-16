

### Usage
* Needs an intro that explains what the profile is for and point to the page(s) in the spec where its use in workflow is described.

This profile supports all of the SDOH service request defined in the IG.  Creating and maintaining a separate ServiceRequest profile for each SDOH category would at present be burdensome.
Instead the table below defines the appropriate VSAC-hosted value set to use for each of the SDOH categories.

For each category of SDOH service request, a specific value SHALL be used for Goal.category, and a specific valueset SHALL be used for the ServiceRequest.code as shown in the table below.
Implentations **SHOULD** use the following a value from the listed value sets when a code exists that describes the concept. The value sets are maintained in the  [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/) database. The [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion) contains the full set of values.

The Gravity Project plans to work with the HL7 Vocabulary WG to determine how best to represent the domain specific value sets in each of the relevant resources and to establish appropriate methods to validate the consistent use of the correct domain specific codes. Future versions of this IG will include the logic to select specific value sets based on the SDOH domain.


| [`ServiceRequest.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `ServiceRequest.code` ValueSet | ValueSet URL |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.57/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.57/expansion/Latest |
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.68/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.68/expansion/Latest |
| employment-status  | Employment Status | [VSAC -  Employment Status ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.60/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.60/expansion/Latest |
| financial-insecurity  | Financial Insecurity | [VSAC -  Financial Insecurity ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.31/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.31/expansion/Latest |
| food-insecurity  | Food Insecurity | [VSAC -  Food Insecurity ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.11/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.11/expansion/Latest |
| health-insurance-coverage-status  | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.124/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.124/expansion/Latest |
| health-literacy  | Health Literacy | [VSAC -  Health Literacy ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.119/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.119/expansion/Latest |
| homelessness  | Homelessness | [VSAC -  Homelessness ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.21/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.21/expansion/Latest |
| housing-instability  | Housing Instability | [VSAC -  Housing Instability ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.45/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.45/expansion/Latest |
| inadequate-housing  | Inadequate Housing | [VSAC -  Inadequate Housing ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.53/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.53/expansion/Latest |
| intimate-partner-violence  | Intimate Partner Violence | [VSAC -  Intimate Partner Violence ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.98/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.98/expansion/Latest |
| material-hardship  | Material Hardship | [VSAC -  Material Hardship ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.38/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.38/expansion/Latest |
| medical-cost-burden  | Medical Cost Burden | [VSAC -  Medical Cost Burden ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.123/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.123/expansion/Latest |
| social-connection  | Social Connection | [VSAC -  Social Connection ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.95/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.95/expansion/Latest |
| stress  | Stress | [VSAC -  Stress ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.92/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.92/expansion/Latest |
| transportation-insecurity  | Transportation Insecurity | [VSAC -  Transportation Insecurity ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.28/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.28/expansion/Latest |
| veteran-status  | Veteran Status | [VSAC -  Veteran Status ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.91/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.91/expansion/Latest |
{:.grid}