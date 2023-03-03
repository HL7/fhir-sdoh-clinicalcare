

### Usage
This profile is used to capture goals for all 17 categories of SDOH information, using a contextual binding of valuesets.
For each category of SDOH goals, a specific value SHALL be used for Goal.category, and a specific valueset SHALL be used for the Goal.code as shown in the table below.  In the current version of this IG, this contextual binding is not enforced by invariants.  In future updates of the IG, these invariants may be added.

| [`Goal.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | `ServiceRequest.code` ValueSet | ValueSet URL |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [VSAC -  Less than high school education Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.55/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.55/expansion/Latest |
| elder-abuse  | Elder Abuse | [VSAC -  Elder Abuse Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.65/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.65/expansion/Latest |
| employment-status  | Employment Status | [VSAC -  Employment Status Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.70/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.70/expansion/Latest |
| financial-insecurity  | Financial Insecurity | [VSAC -  Financial Insecurity Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.30/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.30/expansion/Latest |
| food-insecurity  | Food Insecurity | [VSAC -  Food Insecurity Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.16/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.16/expansion/Latest |
| health-insurance-coverage-status  | Health Insurance Coverage Status | [VSAC -  Health Insurance Coverage Status Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.121/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.121/expansion/Latest |
| health-literacy  | Health Literacy | [VSAC -  Health Literacy Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.117/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.117/expansion/Latest |
| homelessness  | Homelessness | [VSAC -  Homelessness Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.159/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.159/expansion/Latest |
| housing-instability  | Housing Instability | [VSAC -  Housing Instability Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.161/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.161/expansion/Latest |
| inadequate-housing  | Inadequate Housing | [VSAC -  Inadequate Housing Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.50/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.50/expansion/Latest |
| intimate-partner-violence  | Intimate Partner Violence | [VSAC -  Intimate Partner Violence Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.100/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.100/expansion/Latest |
| material-hardship  | Material Hardship | [VSAC -  Material Hardship Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.37/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.37/expansion/Latest |
| medical-cost-burden  | Medical Cost Burden | [VSAC -  Medical Cost Burden Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.120/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.120/expansion/Latest |
| social-connection  | Social Connection | [VSAC -  Social Connection Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.89/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.89/expansion/Latest |
| stress  | Stress | [VSAC -  Stress Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.86/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.86/expansion/Latest |
| transportation-insecurity  | Transportation Insecurity | [VSAC -  Transportation Insecurity Goals ]( https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.163/expansion/Latest ) | https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.163/expansion/Latest |
| veteran-status  | Veteran Status | VSAC -  Veteran Status Goals  | none |
{:.grid}

{% include markdown-link-references.md %}