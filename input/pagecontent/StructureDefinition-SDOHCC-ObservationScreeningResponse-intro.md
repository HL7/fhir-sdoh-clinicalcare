
### Purpose
SDOHCC Observation Screening Response is intended to represent question-answer pairs from a Social Determinants of Health (SDOH) assessment instruments that are represented in LOINC. An [SDOHCC Observation Screening Response] that identifies a social risk or need can be referenced as evidence for an [SDOHCC Condition]. Sometimes, instead of representing a question answered directly on an assessment instrument, an [SDOHCC Observation Screening Response] may be derived from one or more other [SDOHCC Observation Screening Responses] (see [SDOHCC Observation Response Hunger Vital Sign Question 3 Example]). An SDOHCC Observation Screening Response may be addressed by, or be the outcome of, an [SDOHCC Goal], or be the reason for an [SDOHCC ServiceRequest] or an [SDOHCC Procedure]. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC Observation Screening Response  and the other profiles in this IG.

### Usage

Rather than creating a separate SDOHCC Observation Screening Response profile for each SDOH category (domain) covered in this IG (e.g., food insecurity, transportation insecurity, etc.), this profile can support any SDOH category. The optional Observation.category slice binds to a required value set of SDOH category codes (first column below). As per the table below, the code selected for Observation.category determines a downloadable spreadsheet with a set of preferred, category-specific codes for Observation.code. The codes in the spreadsheets are not represented as VSAC values sets.
For additional guidance on the fields in the spreadsheet, and how to use the codes in the spreadsheets with the SDOHCC Observation Screening Response, please see [Assessment Instrument Spreadsheet Guidance] on the Gravity Project Confluence site.


| [`Observation.category`](ValueSet-SDOHCC-ValueSetSDOHCategory.html) | Domain | Screening Instruments |
| ------ | -------------------- | ------------------------- | ------------ |
| educational-attainment  | Educational Attainment | [Educational Attaiment Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220719%20Less%20than%20high%20school%20education%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| elder-abuse  | Elder Abuse | [Elder Abuse Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220818%20Elder%20Abuse%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| employment-status  | Employment Status | [Employment Status Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220907%20Unemployment%20Screeners%20with%20Currently%20Available%20Codes.xlsx?api=v2 ) |
| financial-insecurity  | Financial Insecurity | [Financial Insecurity Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220113%20Financial%20Insecurity%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| food-insecurity  | Food Insecurity | [Food Insecurity Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220902%20Food%20Insecurity%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| health-insurance-coverage-status  | Health Insurance Coverage Status | [Health Insurance Coverage Status Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220713%20Health%20Insurance%20Coverage%20Status%20Screeners%20with%20Available%20Codes.xlsx?api=v2) |
| health-literacy  | Health Literacy | [Health Literacy Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220713%20Health%20Literacy%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| homelessness  | Homelessness | [Homelessness Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20230111%20Homelessness%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| housing-instability  | Housing Instability | [Housing Instability Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20230111%20Housing%20Instability%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| inadequate-housing  | Inadequate Housing | [Inadequate Housing Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20230111%20Inadequate%20Housing%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| intimate-partner-violence  | Intimate Partner Violence | [Intimate Partner Violence Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220203%20Intimate%20Partner%20Violence%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| material-hardship  | Material Hardship | [Material Hardship Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220721%20Material%20Hardship%20Screeners%20with%20Available%20Codes-2.xlsx?api=v2 ) |
| medical-cost-burden  | Medical Cost Burden | Medical Cost Burden Screeners  (none defined) |
| social-connection  | Social Connection | [Social Connection Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220202%20Social%20Connection%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| stress  | Stress | [Stress Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220202%20Stress%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
| transportation-insecurity  | Transportation Insecurity | [Transportation Insecurity Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20230201%20Transportation%20Insecurity%20Screeners%20with%20Available%20codes.xlsx.xlsx?api=v2 ) |
| veteran-status  | Veteran Status | [Veteran Status Screeners ]( https://confluence.hl7.org/download/attachments/97463504/20220907%20Veteran%20Status%20Screeners%20with%20Available%20Codes.xlsx?api=v2 ) |
{:.grid}

{% include markdown-link-references.md %}