
### Purpose
SDOHCC Procedure is generally intended to represent a procedure performed to address an identified social risk or need (i.e., [SDOHCC Condition], [SDOHCC Observation Screening Response], [SDOHCC Observation Assessment]). SDOHCC Procedure can be based on an [SDOHCC ServiceRequest], pertain to an [SDOHCC Goal], or be the output of an [SDOHCC Task For Referral Management]. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC Procedure and the other profiles in this IG.

### Usage

Rather than offer a separate Procedure profile for each SDOH category (also called domain – e.g., food insecurity, transportation insecurity), this profile can support any SDOH category. For Procedure.code, the minimum value set bindings are specified in the profile. Additionally, based on the code selected for the optional Procedure.category.coding slice, the Table below provides the Gravity-vetted, preferred value sets for Procedure.code. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

The preferred value sets in the Table are hosted in the [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/). The [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets below. The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate these preferred, category-specific value sets.

[//]: # (Parameter Table DO NOT REMOVE)

| [`Procedure.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain - Profile | `Procedure.code` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | [Educational Attainment](StructureDefinition-SDOHCC-Procedure-educational-attainment.html) | [VSAC - Less Than High School Education Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.56/expansion/Latest) | 2.16.840.1.113762.1.4.1247.56 |
| elder-abuse  | [Elder Abuse](StructureDefinition-SDOHCC-Procedure-elder-abuse.html) | [VSAC - Elder Abuse Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.67/expansion/Latest) | 2.16.840.1.113762.1.4.1247.67 |
| employment-status  | [Employment Status](StructureDefinition-SDOHCC-Procedure-employment-status.html) | [VSAC - Unemployment Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.59/expansion/Latest) | 2.16.840.1.113762.1.4.1247.59 |
| financial-insecurity  | [Financial Insecurity](StructureDefinition-SDOHCC-Procedure-financial-insecurity.html) | [VSAC - Financial Insecurity Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.32/expansion/Latest) | 2.16.840.1.113762.1.4.1247.32 |
| food-insecurity  | [Food Insecurity](StructureDefinition-SDOHCC-Procedure-food-insecurity.html) | [VSAC - Food Insecurity Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.7/expansion/Latest) | 2.16.840.1.113762.1.4.1247.7 |
| health-insurance-coverage-status  | [Health Insurance Coverage Status](StructureDefinition-SDOHCC-Procedure-health-insurance-coverage-status.html) | [VSAC - Health Insurance Coverage Status Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.125/expansion/Latest) | 2.16.840.1.113762.1.4.1247.125 |
| personal-health-literacy  | [Health Literacy](StructureDefinition-SDOHCC-Procedure-personal-health-literacy.html) | [VSAC - Health Literacy Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.118/expansion/Latest) | 2.16.840.1.113762.1.4.1247.118 |
| homelessness  | [Homelessness](StructureDefinition-SDOHCC-Procedure-homelessness.html) | [VSAC - Homelessness Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.20/expansion/Latest) | 2.16.840.1.113762.1.4.1247.20 |
| housing-instability  | [Housing Instability](StructureDefinition-SDOHCC-Procedure-housing-instability.html) | [VSAC - Housing Instability Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.44/expansion/Latest) | 2.16.840.1.113762.1.4.1247.44 |
| inadequate-housing  | [Inadequate Housing](StructureDefinition-SDOHCC-Procedure-inadequate-housing.html) | [VSAC - Inadequate Housing Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.52/expansion/Latest) | 2.16.840.1.113762.1.4.1247.52 |
| intimate-partner-violence  | [Intimate Partner Violence](StructureDefinition-SDOHCC-Procedure-intimate-partner-violence.html) | [VSAC - Intimate Partner Violence Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.97/expansion/Latest) | 2.16.840.1.113762.1.4.1247.97 |
| material-hardship  | [Material Hardship](StructureDefinition-SDOHCC-Procedure-material-hardship.html) | [VSAC - Material Hardship Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.39/expansion/Latest) | 2.16.840.1.113762.1.4.1247.39 |
| medical-cost-burden  | [Medical Cost Burden](StructureDefinition-SDOHCC-Procedure-medical-cost-burden.html) | [VSAC - Medical Cost Burden Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.122/expansion/Latest) | 2.16.840.1.113762.1.4.1247.122 |
| social-connection  | [Social Connection](StructureDefinition-SDOHCC-Procedure-social-connection.html) | [VSAC - Social Connection Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.94/expansion/Latest) | 2.16.840.1.113762.1.4.1247.94 |
| stress  | [Stress](StructureDefinition-SDOHCC-Procedure-stress.html) | [VSAC - Stress Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.87/expansion/Latest) | 2.16.840.1.113762.1.4.1247.87 |
| transportation-insecurity  | [Transportation Insecurity](StructureDefinition-SDOHCC-Procedure-transportation-insecurity.html) | [VSAC - Transportation Insecurity Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.27/expansion/Latest) | 2.16.840.1.113762.1.4.1247.27 |
| veteran-status  | [Veteran Status](StructureDefinition-SDOHCC-Procedure-veteran-status.html) | [VSAC - Veteran Status Procedures ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.90/expansion/Latest) | 2.16.840.1.113762.1.4.1247.90 |
{:.grid}

[//]: # (End Parameter Table DO NOT REMOVE)



{% include markdown-link-references.md %}