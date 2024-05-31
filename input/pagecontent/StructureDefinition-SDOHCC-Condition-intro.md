
### Purpose
SDOHCC Condition is generally intended to represent a health concern or problem related to a social risk or need. Condition may be the result of screening response Observations (i.e., [SDOHCC Observation Screening Response]) or other Observations made as part of an encounter assessment (i.e., [SDOHCC Observation Assessment]). Condition may be addressed by a Goal ([SDOHCC Goal]) or be the reason for a ServiceRequest ([SDOHCC Service Request]) or Procedure ([SDOHCC Procedure]). See the [Data Modeling Framework] for more detail on the relationships between Condition and the other profiles in this IG.

### Usage

Rather than offer a separate Condition profile for each SDOH category (also called domain – e.g., food insecurity, transportation insecurity), this profile can support any SDOH category. For Condition.code, the minimum value set bindings are specified in the profile. Additionally, based on the code selected for the optional Condition.category slice, the Table below provides the Gravity-vetted, preferred value sets for Condition.code. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

The preferred value sets in the Table are hosted in the [NIH Value Set Authority Center (VSAC)][VSAC]. [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) in VSAC is a grouper value set containing all members of the VSAC Value Sets below. The Gravity Project plans to continue to work with the HL7 Vocabulary WG to determine how best to represent and validate these preferred, category-specific value sets.




<!--| [`Condition.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `Condition.code` ValueSet | ValueSet OID | -->
<!--| ------ | -------------------- | ------------------------- | ------------ |-->
<!--| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.103/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.103|-->
<!--| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.63/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.63|-->
<!--| employment-status  | Employment Status | [VSAC - Unemployment Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.42/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.42|-->
<!--| financial-insecurity  | Financial Insecurity | [VSAC -  Financial Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.108/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.108|-->
<!--| food-insecurity  | Food Insecurity | [VSAC -  Food Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.17/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.17|-->
<!--| health-insurance-coverage-status  | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.148/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.148|-->
<!--| health-literacy  | Health Literacy | [VSAC -  Health Literacy Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.116/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.116|-->
<!--| homelessness  | Homelessness | [VSAC -  Homelessness Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.18/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.18|-->
<!--| housing-instability  | Housing Instability | [VSAC -  Housing Instability Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.24/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.24|-->
<!--| inadequate-housing  | Inadequate Housing | [VSAC -  Inadequate Housing Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.48/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.48|-->
<!--| intimate-partner-violence  | Intimate Partner Violence | [VSAC -  Intimate Partner Violence Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.84/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.84|-->
<!--| material-hardship  | Material Hardship | [VSAC -  Material Hardship Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.35/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.35|-->
<!--| medical-cost-burden  | Medical Cost Burden | [VSAC -  Medical Cost Burden Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.153/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.153|-->
<!--| social-connection  | Social Connection | [VSAC -  Social Connection Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.81/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.81|-->
<!--| stress  | Stress | [VSAC -  Stress Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.75/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.75|-->
<!--| transportation-insecurity  | Transportation Insecurity | [VSAC -  Transportation Insecurity Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.26/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.26|-->
<!--| veteran-status  | Veteran Status | [VSAC -  Veteran Status Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.78/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.78|-->
<!--| digital-literacy	| Digital Literacy | [VSAC - Digital Literacy Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.224/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.224|-->
<!--| digital-access  | Digital Access | [VSAC -  Digital Access Diagnoses ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.231/expansion/Latest ) | 2.16.840.1.113762.1.4.1247.231|-->
<!--| sdoh-category-unspecified<br><br>**Note:** Use “sdoh-category-unspecified” for SDOH domains that are not specified in the [SDOHCC Category value set](ValueSet-SDOHCC-ValueSetSDOHCategory.html).<br><br>If desired, “Condition.category (SDOH): sdoh-category-unspecified” can be further specified with a domain not yet included in the [SDOHCC Category value set](ValueSet-SDOHCC-ValueSetSDOHCategory.html) by using category.text. | SDOH Category Unspecified | **Note:** For new SDOH domains, any Gravity value sets that are available in VSAC but not yet included in the IG can be found on the [Social Risk Terminology Value Sets](https://confluence.hl7.org/display/GRAV/Social+Risk+Terminology+Value+Sets) page on Confluence.|-->
<!--{:.grid}-->



{% include markdown-link-references.md %}