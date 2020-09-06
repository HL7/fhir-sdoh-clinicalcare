### Additional Guidance

The SDOHCC\_Procedure\_Base\_1 profile allows the representation of Procedures that address SDOH Conditions.

Many of the resources/profiles used for SDOH reference one another. The current flow is that QuestionnaireResponses result in Observations that are used as evidence for Conditions that are addressed by CarePlans and Goals which lead to ServiceRequests and Procedures.

The sections that follow provide additional guidance for some elements in the SDOHCC\_Procedure\_Base\_1 profile.

**Procedure.basedOn**

To align an SDOH Procedure with the SDOH ServiceRequest(s) it is based on, Procedure.basedOn references SDOHCC\_ServiceRequest\_Base\_1 and also allows ServiceRequest, and CarePlan.

**Procedure.category**

Procedure.category is currently bound to the FHIR &quot;Procedure Category Codes (SNOMED CT)&quot; value set with binding strength: Example. This value set contains the SNOMED CT codes listed below. However, as Gravity content development continues, Gravity may propose new, intervention/service categories to better categorize SDOH interventions/services.

| Code | Display |
| --- | --- |
| 24642003 | Psychiatry procedure or service |
| 409063005 | Counselling |
| 409073007 | Education |
| 387713003 | Surgical procedure |
| 103693007 | Diagnostic procedure |
| 46947000 | Chiropractic manipulation |
| 410606002 | Social service procedure |

**Procedure.code**

Procedure.code is currently bound to the &quot;US Core Procedure Codes&quot; value set with binding strength: Extensible. As the Gravity Project continues to refine content for the SDOH domains (e.g., food, housing, transportation, etc.), the value set for Procedure.code will be restricted to procedure codes that address conditions in the SDOH domain.

Additionally, in the future, Procedure.code may be sliced to allow the optional use of codes to document procedures for the purpose of billing (e.g., CPT codes).

The final Procedure.code value set will likely overlap/align with the ServiceRequest.code value set in the SDOHCC\_ServiceRequest\_Base\_1 profile. Consistent use of similar codes for a Procedure and the ServiceRequest it is based on should facilitate analytics and interoperability.

**Procedure.subject**

Since this profile is based on the US Core Procedure Profile, Procedure.subject is restricted to referencing US Core Patient Profile.

**Procedure.reasonCode**

Procedure.reasonCode can be used to provide a coded reason for why a procedure was performed. It is currently bound to the FHIR &quot;Procedure Reason Codes&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains, the value set for Procedure.reasonCode may be refined to codes that pertain to SDOH domains.

Of note, information represented by Procedure.reasonCode overlaps significantly with information represented by Procedure.reasonReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is overlap in information provided by Procedure.reasonReference and Procedure.reasonCode, it is recommended that Procedure.reasonReference be used to justify why the procedure was performed.

**Procedure.reasonRe­­ference**

Procedure.reasonReference can be used to justify why the procedure was performed. To align an SDOH Procedure with the SDOH Conditions and Observations that justify it, Procedure.reasonReference references SDOHCC\_Condition\_Base\_1 and SDOHCC\_Observation\_ScreeningResponseBase\_1, and may also reference Condition, Observation, Procedure, DocumentReference and/or DiagnosticReport.

Where there is significant overlap in information provided by Procedure.reasonReference and Procedure.reasonCode, it is recommended that Procedure.reasonReference be used to justify why the procedure was performed.