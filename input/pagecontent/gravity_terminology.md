
Gravity Project develops and maintains SDOH-related value sets that are published in the National Institutes of Health (NIH) [Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/).  Hyperlinks to the Gravity Project VSAC value sets can also be found [here](https://confluence.hl7.org/display/GRAV/Social+Risk+Terminology+Value+Sets) on the Gravity Project Confluence site. This section describes how these value sets are used in the SDOHCC profiles and the process for developing the value sets in VSAC.

### Additional Bindings for SDOH Domain-specific Value Sets

The [SDOHCC Observation Screening Response](StructureDefinition-SDOHCC-ObservationScreeningResponse.html), [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html), [SDOHCC Service Request](StructureDefinition-SDOHCC-ServiceRequest.html), [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html), and [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html) profiles have additional bindings for `Observation.code`, `Observation.value`, `Condition.code`, `ServiceRequest.code`, `Procedure.code`, and `Goal.description` respectively. The additional bindings are to SDOH domain-specific value sets  (e.g., for Food Insecurity, Inadequate Housing, etc.) which are determined by the value of the profile’s .category element (selected from [SDOHCC ValueSet SDOH Category](ValueSet-SDOHCC-ValueSetSDOHCategory.html)).

#### Additional Binding Example for the SDOHCC Condition Profile

For the [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html) profile, `Condition.code` has a binding to [US Core Condition Code]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html) (required). However, if `Condition.category` is ‘food-insecurity’, `Condition.code` has an additional binding to [Food Insecurity Diagnoses](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.17/expansion) (a Gravity-authored value set in VSAC).

Excerpt from [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html) :

{% include img-med.html img="SDOHConditionExample.png" %}

### Gravity Project Value Set Development Process

#### Gravity Project Value Set Naming

Gravity-authored VSAC value sets include a term in their name that indicate the SDOHCC profile they are used with as follows:
  
| **Gravity VSAC value set name includes:**  | **Used with:**                                                                 |
| ------------------------------------------ | ------------------------------------------------------------------------------ |
| Diagnoses                                  | [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html)                                           |
| Procedures                                 | [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html)                                           |
| Service Requests                           | [SDOHCC Service Request](StructureDefinition-SDOHCC-ServiceRequest.html)                               |
| Goals                                      | [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html)                                                     |
| Assessments                                | [SDOHCC Observation Screening Response](StructureDefinition-SDOHCC-ObservationScreeningResponse.html) |
{:.grid}

#### Steps for Gravity Project Value Set Creation in VSAC

The steps below outline Gravity’s general process for value set creation in VSAC. For each step, the examples show the process for `Condition.code` for the [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html) profile.

<p>1. Value sets are created that are specific for:</p>

* SDOH domain (category) – e.g., Food insecurity, Transportation Insecurity.
* Profile – e.g., Condition (Diagnoses), Procedure
* Code system – e.g., ICD-10-CM, SNOMED CT, LOINC, CPT, HCPCS

The value sets created in Step 1 do not bind to SDOHCC profile elements. In step 2, they are grouped into value sets that bind to SDOHCC profile elements.

**Example 1**: 

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
   <tr>
      <th>VSAC Value Set Name</th>
      <th>SDOH Domain</th>
      <th>Bound to Profile</th>
      <th>Code System</th>
   </tr>
</thead>
<tbody>
   <tr>
      <td>Food Insecurity Diagnoses ICD10CM</td>
      <td>Food Insecurity</td>
      <td>N/A</td>
      <td>ICD-10-CM</td>
   </tr>
   <tr>
      <td>Food Insecurity Diagnosis SNOMED CT</td>
      <td>Food Insecurity</td>
      <td>N/A</td>
      <td>SNOMED CT</td>
   </tr>
   <tr>
      <td>Transportation Insecurity Diagnoses ICD10CM</td>
      <td>Transportation Insecurity</td>
      <td>N/A</td>
      <td>ICD-10-CM</td>
   </tr>
   <tr>
      <td>Transportation Insecurity Diagnoses SNOMED CT</td>
      <td>Transportation Insecurity</td>
      <td>N/A</td>
      <td>SNOMED CT</td>
   </tr>
   <tr>
      <td>Inadequate Housing Diagnoses ICD10CM</td>
      <td>Inadequate Housing</td>
      <td>N/A</td>
      <td>ICD-10-CM</td>
   </tr>
   <tr>
      <td>Inadequate Housing Diagnoses SNOMED CT</td>
      <td>Inadequate Housing</td>
      <td>N/A</td>
      <td>SNOMED CT</td>
   </tr>
   <tr>
      <td>Additional SDOH domain-specific value sets…</td>
      <td></td>
      <td></td>
      <td></td>
   </tr>
</tbody>
</table>

<p>2. Value sets created in Step 1 are grouped into value sets that are only specific for:</p>

* SDOH domain (category) – e.g., Food insecurity, Transportation Insecurity
* Profile – e.g., Condition (Diagnoses), Procedure

These value sets bind to SDOHCC profile elements via an Additional Bindings table.  For example, the value sets in the first column below are in the Additional Bindings table for `Condition.code` for SDOHCC Condition. (See image in Additional Bindings for SDOH Domain-specific Value Sets).

**Example 2**:

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
   <tr>
      <th>VSAC Value Set Name</th>
      <th>SDOH Domain</th>
      <th>Bound to Profile</th>
      <th>Contains VSAC Value Sets</th>
   </tr>
</thead>
<tbody>
   <tr>
      <td>Food Insecurity Diagnoses</td>
      <td>Food Insecurity</td>
      <td>SDOHCC Condition</td>
      <td>Food Insecurity Diagnoses ICD10CM<br>Food Insecurity Diagnosis SNOMED CT</td>
   </tr>
   <tr>
      <td>Transportation Insecurity Diagnoses</td>
      <td>Transportation Insecurity</td>
      <td>SDOHCC Condition</td>
      <td>Transportation Insecurity Diagnoses ICD10CM<br>Transportation Insecurity Diagnoses SNOMED CT
</td>
   </tr>
   <tr>
      <td>Inadequate Housing Diagnoses</td>
      <td>Inadequate Housing</td>
      <td>SDOHCC Condition</td>
      <td>Inadequate Housing Diagnoses ICD10CM<br>Inadequate Housing Diagnoses SNOMED CT
</td>
   </tr>
   <tr>
      <td>Additional SDOH domain-specific value sets…</td>
      <td></td>
      <td></td>
      <td></td>
   </tr>
</tbody>
</table>

<p>3. Value sets created in Step 2 are grouped into SDOH grouping value sets that are only specific for:</p>

* Profile – e.g., Condition (Diagnoses), Procedure

These value sets are not used in the SDOHCC profiles. However, they are referenced in the Screening and Assessments section of the US Core Implementation Guide which provides the following guidance with respect to these Gravity SDOH grouping value sets: “<it>These grouped value sets are narrower subsets of the value sets allowed in the respective US Core Profiles. However, when recording SDOH data US Core Profiles, servers **SHOULD** use them.</it>”

**Example 3**:

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
   <tr>
      <th>VSAC Value Set Name</th>
      <th>Used with Profile</th>
      <th>Contains VSAC Value Sets</th>
   </tr>
</thead>
<tbody>
   <tr>
      <td>Social Determinants of Health Conditions</td>
      <td>US Core Condition</td>
      <td>
      Digital Access Diagnoses<br>
      Digital Literacy Diagnoses<br>
      Less than high school education Diagnoses<br>
      Elder Abuse Diagnoses<br>
      Unemployment Diagnoses<br>
      Financial Insecurity Diagnoses<br>
      Food Insecurity Diagnoses<br>
      Health Insurance Coverage Status Diagnoses<br>
      Homelessness Diagnoses<br>
      Housing Instability Diagnoses<br>
      Inadequate Housing Diagnoses<br>
      Incarceration Status Diagnoses<br>
      Intimate Partner Violence Diagnoses<br>
      Language Access Diagnoses<br>
      Material Hardship Diagnoses<br>
      Medical Cost Burden Diagnoses<br>
      Health Literacy Diagnoses<br>
      Social Connection Diagnoses<br>
      Stress Diagnoses<br>
      Transportation Insecurity Diagnoses<br>
      Utility Insecurity Diagnoses<br>
      Veteran Status Diagnoses<br>

      <br>
      <b>Note</b>: Value sets for new SDOH domains will be added as they are created in VSAC.</td>
   </tr>
</tbody>
</table>

##### Table - Gravity VSAC Value Set Development Process for SDOHCC Condition

This table summarizes the Gravity VSAC value set development process. Gravity-authored VSAC value sets are shown in the first three columns. Value sets in green are bound to `Condition.code` for the [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html) profile.

{% include img-med.html img="VSACValueSets-ConditionExample.png" %}

-------------------------------------------------------------

<sup>1</sup>Gravity-authored SDOH value sets can be accessed by creating a free National Library of Medicine (NLM) account and then refining the search to “Steward: The Gravity Project”.

 {% include markdown-link-references.md %}