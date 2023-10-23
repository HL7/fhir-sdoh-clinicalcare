

### Purpose
SDOHCC ServiceRequest is generally intended to represent a service request to address an identified social risk or need (i.e., [SDOHCC Condition], [SDOHCC Observation Screening Response], [SDOHCC Observation Assessment]). An SDOHCC ServiceRequest can pertain to an [SDOHCC Goal], and can reference the patient’s consent for the referral (i.e., [SDOHCC Consent]). An SDOHCC ServiceRequest can be the focus of an [SDOHCC Task For Referral Management] and an [SDOHCC Procedure] can be an based on an SDOHCC ServiceRequest. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC ServiceRequest and the other profiles in this IG.

### Usage

Rather than offer a separate ServiceRequest profile for each SDOH category (also called domain – e.g., food insecurity, transportation insecurity), this profile can support any SDOH category. For ServiceRequest.code, the minimum value set bindings are specified in the profile. Additionally, based on the code selected for the optional ServiceRequest.category slice, the Table below provides the Gravity-vetted, preferred value sets for ServiceRequest.code. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

The preferred value sets in the Table are hosted in the [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/). The [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets below. The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate these preferred, category-specific value sets.


[//]: # (End Parameter Table DO NOT REMOVE)

| [`ServiceRequest.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain - Profile | `ServiceRequest.code` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | [Educational Attainment](StructureDefinition-SDOHCC-ServiceRequest-educational-attainment.html) | [VSAC - Less Than High School Education Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.57/expansion/Latest) | 2.16.840.1.113762.1.4.1247.57 |
| elder-abuse  | [Elder Abuse](StructureDefinition-SDOHCC-ServiceRequest-elder-abuse.html) | [VSAC - Elder Abuse Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.68/expansion/Latest) | 2.16.840.1.113762.1.4.1247.68 |
| employment-status  | [Employment Status](StructureDefinition-SDOHCC-ServiceRequest-employment-status.html) | [VSAC - Unemployment Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.60/expansion/Latest) | 2.16.840.1.113762.1.4.1247.60 |
| financial-insecurity  | [Financial Insecurity](StructureDefinition-SDOHCC-ServiceRequest-financial-insecurity.html) | [VSAC - Financial Insecurity Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.31/expansion/Latest) | 2.16.840.1.113762.1.4.1247.31 |
| food-insecurity  | [Food Insecurity](StructureDefinition-SDOHCC-ServiceRequest-food-insecurity.html) | [VSAC - Food Insecurity Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.11/expansion/Latest) | 2.16.840.1.113762.1.4.1247.11 |
| health-insurance-coverage-status  | [Health Insurance Coverage Status](StructureDefinition-SDOHCC-ServiceRequest-health-insurance-coverage-status.html) | [VSAC - Health Insurance Coverage Status Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.124/expansion/Latest) | 2.16.840.1.113762.1.4.1247.124 |
| personal-health-literacy  | [Health Literacy](StructureDefinition-SDOHCC-ServiceRequest-personal-health-literacy.html) | [VSAC - Health Literacy Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.119/expansion/Latest) | 2.16.840.1.113762.1.4.1247.119 |
| homelessness  | [Homelessness](StructureDefinition-SDOHCC-ServiceRequest-homelessness.html) | [VSAC - Homelessness Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.21/expansion/Latest) | 2.16.840.1.113762.1.4.1247.21 |
| housing-instability  | [Housing Instability](StructureDefinition-SDOHCC-ServiceRequest-housing-instability.html) | [VSAC - Housing Instability Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.45/expansion/Latest) | 2.16.840.1.113762.1.4.1247.45 |
| inadequate-housing  | [Inadequate Housing](StructureDefinition-SDOHCC-ServiceRequest-inadequate-housing.html) | [VSAC - Inadequate Housing Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.53/expansion/Latest) | 2.16.840.1.113762.1.4.1247.53 |
| intimate-partner-violence  | [Intimate Partner Violence](StructureDefinition-SDOHCC-ServiceRequest-intimate-partner-violence.html) | [VSAC - Intimate Partner Violence Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.98/expansion/Latest) | 2.16.840.1.113762.1.4.1247.98 |
| material-hardship  | [Material Hardship](StructureDefinition-SDOHCC-ServiceRequest-material-hardship.html) | [VSAC - Material Hardship Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.38/expansion/Latest) | 2.16.840.1.113762.1.4.1247.38 |
| medical-cost-burden  | [Medical Cost Burden](StructureDefinition-SDOHCC-ServiceRequest-medical-cost-burden.html) | [VSAC - Medical Cost Burden Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.123/expansion/Latest) | 2.16.840.1.113762.1.4.1247.123 |
| social-connection  | [Social Connection](StructureDefinition-SDOHCC-ServiceRequest-social-connection.html) | [VSAC - Social Connection Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.95/expansion/Latest) | 2.16.840.1.113762.1.4.1247.95 |
| stress  | [Stress](StructureDefinition-SDOHCC-ServiceRequest-stress.html) | [VSAC - Stress Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.92/expansion/Latest) | 2.16.840.1.113762.1.4.1247.92 |
| transportation-insecurity  | [Transportation Insecurity](StructureDefinition-SDOHCC-ServiceRequest-transportation-insecurity.html) | [VSAC - Transportation Insecurity Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.28/expansion/Latest) | 2.16.840.1.113762.1.4.1247.28 |
| veteran-status  | [Veteran Status](StructureDefinition-SDOHCC-ServiceRequest-veteran-status.html) | [VSAC - Veteran Status Service Requests ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.91/expansion/Latest) | 2.16.840.1.113762.1.4.1247.91 |
{:.grid}

[//]: # (End Parameter Table DO NOT REMOVE)


{% include markdown-link-references.md %}