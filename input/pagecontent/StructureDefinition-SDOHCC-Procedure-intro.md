
### Purpose
SDOHCC Procedure is generally intended to represent a procedure performed to address an identified social risk or need (i.e., [SDOHCC Condition], [SDOHCC Observation Screening Response], [SDOHCC Observation Assessment]). SDOHCC Procedure can be based on an [SDOHCC ServiceRequest], pertain to an [SDOHCC Goal], or be the output of an [SDOHCC Task For Referral Management]. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC Procedure and the other profiles in this IG.

### Usage

Rather than offer a separate Procedure profile for each SDOH category (also called domain – e.g., food insecurity, transportation insecurity), this profile can support any SDOH category. For Procedure.code, the minimum value set bindings are specified in the profile. Additionally, based on the code selected for the optional Procedure.category.coding slice, the Table below provides the Gravity-vetted, preferred value sets for Procedure.code. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

The preferred value sets in the Table are hosted in the [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/). The [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets below. The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate these preferred, category-specific value sets.


| [`Procedure.category.coding`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Procedure.code` ValueSet | ValueSet OID |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.56/expansion/Latest ) |2.16.840.1.113762.1.4.1247.56|
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.67/expansion/Latest ) |2.16.840.1.113762.1.4.1247.67|
| employment-status  | Employment Status | [VSAC -  Unemployment Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.59/expansion/Latest ) |2.16.840.1.113762.1.4.1247.59|
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



| digital-literacy	| Digital Literacy | [VSAC -  Digital Literacy Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.226/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.226 |


| digital-access  | Digital Access | [VSAC -  Digital Access Procedures ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.235/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.235|


| sdoh-category-unspecified<br><br>**Note:** Use “sdoh-category-unspecified” for SDOH domains that are not specified in the [SDOHCC Category value set](ValueSet-SDOHCC-ValueSetSDOHCategory.html).<br><br>If desired, Procedure.category (SDOH): sdoh-category-unspecified” can be further specified with a domain not yet included in the [SDOHCC Category value set](ValueSet-SDOHCC-ValueSetSDOHCategory.html) by using category.text. | SDOH Category Unspecified | **Note:** For new SDOH domains, any Gravity value sets that are available in VSAC but not yet included in the IG can be found on the [Social Risk Terminology Value Sets](https://confluence.hl7.org/display/GRAV/Social+Risk+Terminology+Value+Sets) page on Confluence.|
{:.grid}

{% include markdown-link-references.md %}