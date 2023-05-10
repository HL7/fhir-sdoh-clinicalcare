### Gravity Terminology Development
For each SDOH domain/category (e.g., food insecurity, transportation insecurity), the Gravity Project has developed value sets to be used as preferred value sets for the [SDOHCC Observation Screening Response][SDOHCC Observation Screening Response], [SDOHCC Condition][SDOHCC Condition], [SDOHCC Service Request][SDOHCC Service Request], [SDOHCC Procedure][SDOHCC Procedure], and [SDOHCC Goal][SDOHCC Goal] profiles. For each of these profiles, the minimum value set bindings are specified in the profile. Additional guidance on the use of the Gravity-vetted, preferred value sets is provided in the Usage or Notes section of each profile.

Gravity Project value sets are published in the National Institutes of Health (NIH) [NIH Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/) where they can be accessed by creating a free National Library of Medicine (NLM) account and refining the search by “Steward: The Gravity Project”. Hyperlinks to the VSAC value sets can also be found [here](https://confluence.hl7.org/display/GRAV/Gravity+Terminology+Value+Sets) on the Gravity Project Confluence site.

### Gravity Value Set Structure
The VSAC value set names align with the profiles in which they are used in this IG as follows: 
  
| **Gravity VSAC value sent name includes:** | **Used with:**                                                                 |
| ------------------------------------------ | ------------------------------------------------------------------------------ |
| Diagnoses                                  | [SDOHCC Condition][SDOHCC Condition]                                           |
| Procdures                                  | [SDOHCC Procedure][SDOHCC Procedure]                                           |
| Sevice Requests                            | [SDOHCC Service Request][SDOHCC Service Request]                               |
| Goals                                      | [SDOHCC Goal][SDOHCC Goal]                                                     |
| Assessments                                | [SDOHCC Observation Screening Response][SDOHCC Observation Screening Response] |
{:.grid}


In VSAC, for the above profiles (e.g., [SDOHCC Condition][SDOHCC Condition], code system-specific value sets are created for each domain (e.g., [Food Insecuirty Diagnoses ICD10CM](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.3/expansion/Latest), [Food Insecurity Diagnosis SNOMED CT](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.1/expansion/Latest)) and then grouped into domain-specific value sets (e.g., [Food Insecurity Diagnoses](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.17/expansion/Latest) for use as preferred value sets for a profile. Finally, the domain-specific value sets for each profile are grouped into a value set containing the values for all SDOH domains (e.g., [Social Determinants of Health Conditions](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion/Latest)).

### Example of Value Sets for Condition.code and their grouping in VSAC
The figure below illustrates how value sets are used and grouped for Condition.code for the [SDOHCC Condition][SDOHCC Condition] profile.
* 	The minimum value set bindings specified in the profile for Condition.code (i.e., to [US Core Condition Code]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html))
*   The preferred value set bindings for Condition.code and their grouping structure in VSAC are shown in the green box. (For additional guidance on these preferred value sets for SDOHCC Condition, see [Usage](StructureDefinition-SDOHCC-Condition.html#usage))

{% include img-med.html img="VSACValueSet.svg" caption="Example of VSAC SDOH Group Value Set for Condition.Code" %}


 {% include markdown-link-references.md %}