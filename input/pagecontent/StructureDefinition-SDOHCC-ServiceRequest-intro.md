

### Purpose
SDOHCC ServiceRequest is generally intended to represent a service request to address an identified social risk or need (i.e., [SDOHCC Condition], [SDOHCC Observation Screening Response], [SDOHCC Observation Assessment]). An SDOHCC ServiceRequest can pertain to an [SDOHCC Goal], and can reference the patient’s consent for the referral (i.e., [SDOHCC Consent]). An SDOHCC ServiceRequest can be the focus of an [SDOHCC Task For Referral Management] and an [SDOHCC Procedure] can be an based on an SDOHCC ServiceRequest. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC ServiceRequest and the other profiles in this IG.

### Usage
Rather than creating a separate ServiceRequest profile for each SDOH category (domain) covered in this IG (e.g., food insecurity, transportation insecurity, etc.), this profile can support any SDOH category. The optional ServiceRequest.category slice binds to a required value set of SDOH category codes (first column below). The code selected for ServiceRequest.category determines a preferred, category-specific value set for ServiceRequest.code as per the table below.
The preferred value sets for ServiceRequest.code are hosted in the [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/) (VSAC). The [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets for Condition below.
The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate the preferred, category-specific value sets for each of the relevant SDOH CC profiles.

| [`ServiceRequest.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `ServiceRequest.code` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.57/expansion/Latest ) |2.16.840.1.113762.1.4.1247.57|
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.68/expansion/Latest ) |2.16.840.1.113762.1.4.1247.68|
| employment-status  | Employment Status | [VSAC -  Employment Status ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.60/expansion/Latest ) |2.16.840.1.113762.1.4.1247.60|
| financial-insecurity  | Financial Insecurity | [VSAC -  Financial Insecurity ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.31/expansion/Latest ) |2.16.840.1.113762.1.4.1247.31|
| food-insecurity  | Food Insecurity | [VSAC -  Food Insecurity ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.11/expansion/Latest ) |2.16.840.1.113762.1.4.1247.11|
| health-insurance-coverage-status  | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.124/expansion/Latest ) |2.16.840.1.113762.1.4.1247.124|
| health-literacy  | Health Literacy | [VSAC -  Health Literacy ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.119/expansion/Latest ) |2.16.840.1.113762.1.4.1247.119|
| homelessness  | Homelessness | [VSAC -  Homelessness ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.21/expansion/Latest ) |2.16.840.1.113762.1.4.1247.21|
| housing-instability  | Housing Instability | [VSAC -  Housing Instability ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.45/expansion/Latest ) |2.16.840.1.113762.1.4.1247.45|
| inadequate-housing  | Inadequate Housing | [VSAC -  Inadequate Housing ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.53/expansion/Latest ) |2.16.840.1.113762.1.4.1247.53|
| intimate-partner-violence  | Intimate Partner Violence | [VSAC -  Intimate Partner Violence ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.98/expansion/Latest ) |2.16.840.1.113762.1.4.1247.98|
| material-hardship  | Material Hardship | [VSAC -  Material Hardship ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.38/expansion/Latest ) |2.16.840.1.113762.1.4.1247.38|
| medical-cost-burden  | Medical Cost Burden | [VSAC -  Medical Cost Burden ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.123/expansion/Latest ) |2.16.840.1.113762.1.4.1247.123|
| social-connection  | Social Connection | [VSAC -  Social Connection ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.95/expansion/Latest ) |2.16.840.1.113762.1.4.1247.95|
| stress  | Stress | [VSAC -  Stress ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.92/expansion/Latest ) |2.16.840.1.113762.1.4.1247.92|
| transportation-insecurity  | Transportation Insecurity | [VSAC -  Transportation Insecurity ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.28/expansion/Latest ) |2.16.840.1.113762.1.4.1247.28|
| veteran-status  | Veteran Status | [VSAC -  Veteran Status ServiceRequests ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.91/expansion/Latest ) |2.16.840.1.113762.1.4.1247.91|
{:.grid}