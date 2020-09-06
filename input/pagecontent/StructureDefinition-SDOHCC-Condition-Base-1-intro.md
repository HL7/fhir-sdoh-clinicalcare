### Additional Guidance

The SDOHCC\_Condition\_Base\_1 profile allows the representation of SDOH Conditions. One specific use for this profile is to represent a Health Concern that is either; 1) directly asserted based on the patient&#39;s answer to an individual Question and Answer pair (QA pair) from an SDOH screening questionnaire or 2) computed/generated based on the patient&#39;s answers to multiple Question and Answer pairs. The Question and Answer pairs from the screening questionnaire are also represented using SDC Questionnaire and SDC QuestionnaireResponse as well as by Observation instances using the SDOHCC\_Observation\_ScreeningResponseBase\_1 profile.

Many of the resources/profiles used for SDOH reference one another. The current flow is that QuestionnaireResponses result in Observations which are used as evidence for Conditions that are addressed by CarePlans and Goals which lead to ServiceRequests and Procedures

The sections that follow provide additional guidance on some elements in the SDOHCC\_Condition\_Base\_1 profile.

**Condition.category**

Condition.category is bound to the US Core Condition Category Codes value set which contains the three codes listed below:

| Code | Display |
| --- | --- |
| problem-list-item | Problem List Item |
| encounter-diagnosis | Encounter Diagnosis |
| health-concern | Health Concern |

When the SDOHCC\_Condition\_Base\_1 profile is used for Conditions that are based only on a patient&#39;s answers to Question and Answer pairs from an SDOH screening questionnaire, Condition.category should be Health Concern.

**Condition.severity**

Condition.severity is currently prohibited. Although Condition.severity could further qualify some codes in the value set for Condition.code, severity will likely apply only to a limited subset of SDOH condition codes. For example, severity could be used for the SDOH domain of &quot;Food insecurity&quot; for which the Gravity Project has defined subtypes that include &quot;Mild food insecurity&quot;, &quot;Moderate food insecurity&quot; and &quot;Severe food insecurity&quot;. However, for other SDOH domains, severity might be expressed differently. For example, subtypes of &quot;Homelessness&quot; include &quot;Sheltered homelessness&quot; and &quot;Unsheltered homelessness&quot;. However, &quot;sheltered&quot; and &quot;unsheltered&quot; do not fit in the traditional set of severity rankings. Therefore, &quot;Sheltered homelessness&quot; and &quot;Unsheltered homelessness&quot; will likely be represented using precoordinated terminology codes bound to Condition.code. Thus, although Condition.severity might be useful for a small subset of SDOH conditions, it is currently prohibited in order to ensure a consistent approach of generally capturing the full meaning of a condition using Condition.code. This approach should facilitate querying and analytics as well as mapping to ICD.

**Condition.code**

Condition.code is currently bound to the &quot;US Core Condition Code&quot; value set. As the Gravity Project continues to refine content for the SDOH domains (e.g., food, housing, transportation, etc.), the value set for Condition.code will be refined to codes that pertain to SDOH domains.

Additionally, Condition.code has been sliced to allow the optional addition of ICD-10 codes to document SDOH conditions for the purpose of billing. The ICD-10Coding slice is currently bound to the FHIR ICD-10 Codes value set. As the Gravity Project continues to refine content for the SDOH domains, the value set for the ICD-10Coding slice will be refined to codes that pertain to SDOH domains.

**Condition.subject**

Since this profile is based on the US Core Condition Profile, Condition.subject is restricted to referencing US Core Patient Profile.

**Condition.onset**

Condition.onset is constrained to dateTime or Period. For SDOH conditions that have their onset over an extended (or fuzzy) period (e.g., the past month), Condition.onset may use a lower precision representation (e.g., month/year or year) as opposed to a higher precision representation (e.g., year/month/date/hour/min).

**Condition.abatement**

Condition.onset is constrained to dateTime or Period. For SDOH conditions that have a fuzzy abatement period, a lower precision representation (e.g., month/year or year) may be used. However, for SDOH conditions that end at a specific point in time (e.g., food insecurity may abate upon acquiring a new job or gaining eligibility to a food program) a higher precision representation (e.g., year/month/date) may also be used.

**Condition.evidence**

**Condition.evidence.code**

Condition.evidence.code can be used to provide supporting manifestations/symptoms that are the basis for a Condition and its verificationStatus. Condition.evidence.code is currently bound to the FHIR &quot;Manifestation and Symptom Codes&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains, the value set for Condition.evidence.code may be refined to codes that pertain to SDOH domains.

Of note, information represented by Condition.evidence.code overlaps significantly with information represented by Condition.evidence.detail. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is overlap in information provided by Condition.evidence.code and Condition.evidence.detail, it is recommended that Condition.evidence.detail be used as supporting evidence for the Condition and its verificationStatus.

**Condition.evidence.detail**

Condition.evidence.detail can be used to provide relevant supporting evidence that is the basis for a Condition and its verificationStatus. To align an SDOH Condition with the Observations and Conditions that support it, Condition.evidence.detail references SDOHCC\_Observation\_ScreeningResponseBase\_1 and SDOHCC-Condition-Base-1, and/or may also reference Condition and Observation.

Where there is significant overlap in information provided by Condition.evidence.code and Condition.evidence.detail, it is recommended that Condition.evidence.detail be used as supporting evidence for the Condition and its verificationStatus.