
### Purpose
Observation Screening Resonses are created from a Questionaire Response.  They can form the evidence for a Condition, the mitigation target for a Goal, or the reason for a Service Request. See the [Data Modeling Framework] for more detail on the role of the Observation Screening Response in the creation of health concerns, goal setting (patient-centered goals), and creation of referrals using service request and procedure/intervention.

### Usage

This profile supports all of the SDOH Observation Screening Responses defined in the IG.  Creating and maintaining a separate Observation profile for each SDOH category would at present be burdensome.  Instead the table below defines the appropriate screening instruments for each categury with VSAC-hosted value set.

For each category of SDOH Observation Screening Responses, a specific value SHALL be used for Goal.category.
Implentations **SHOULD** use a screening instrument from the listed value sets when one exists.
The value sets are maintained in the  [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/) database.
The [Social Determinants of Health Screening Assessments value set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.126/expansion/Latest) contains the full set of SDOH screening assessment.

The Gravity Project plans to work with the HL7 Vocabulary WG to determine how best to represent the domain specific value sets in each of the relevant resources and to establish appropriate methods to validate the consistent use of the correct domain specific codes. Future versions of this IG will include the logic to select specific value sets based on the SDOH domain.

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
<<<<<<< HEAD
{:.grid}

{% include markdown-link-references.md %}
=======
{:.grid}
>>>>>>> 24509a3 (merge profile changes into FSH_based master branch)
