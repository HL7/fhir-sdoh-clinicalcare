### Additional Guidance

The SDOHCC\_ServiceRequest\_Base\_1 profile allows the representation of ServiceRequests that address SDOH Conditions.

Many of the resources/profiles used for SDOH reference one another. The current flow is that QuestionnaireResponses result in Observations that are used as evidence for Conditions that are addressed by CarePlans and Goals which lead to ServiceRequests and Procedures.

The sections that follow provide additional guidance for some elements in the SDOHCC\_ServiceRequest\_Base\_1 profile.

**ServiceRequest.basedOn**

ServiceRequest.basedOn can reference SDOHCC\_ServiceRequest\_Base\_1, ServiceRequest, and/or CarePlan as being fulfilled by this service request.

**ServiceRequest.replaces**

ServiceRequest.basedOn can reference SDOHCC\_ServiceRequest\_Base\_1 and/or ServiceRequest.

**ServiceRequest.category**

ServiceRequest.category is currently bound to the FHIR &quot;Service Request Category Codes&quot; value set with binding strength: Example. This value set contains the SNOMED CT codes listed below. However, as Gravity content development continues, Gravity may propose new, high-level intervention/service categories to better categorize SDOH interventions/services.

| Code | Display |
| --- | --- |
| 108252007 | Laboratory procedure |
| 363679005 | Imaging |
| 409063005 | Counselling |
| 409073007 | Education |
| 387713003 | Surgical procedure |

**ServiceRequest.code**

ServiceRequest.code is currently bound to the &quot;US Core Procedure Codes&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains (e.g., food, housing, transportation, etc.), the value set for ServiceRequest.code will be refined to codes that pertain to SDOH domains.

The final ServiceRequest.code value set will likely overlap/align with the Procedure.code value set in the SDOHCC\_Procedure\_Base\_1 profile. Consistent use of similar codes for a Procedure and the ServiceRequest it is based on should facilitate analytics and interoperability.

**ServiceRequest.subject**

ServiceRequest.subject is restricted to referencing Patient, Group or Location.

Although the US Core Condition, CarePlan, Goal and Procedure Profiles restrict Subject to US Core Patient Profile, US Core does not offer a ServiceRequest Profile. For this reason, the SDOHCC\_ServiceRequest\_Base\_1 profile does not restrict ServiceRequest.subject to US Core Patient Profile. However, if an implementer is creating US Core profiles (e.g., US Core Condition, US Core Procedure, etc.) that require US Core Patient for Subject, then US Core Patient should also be used for Subject in other profiles (e.g., Observation, ServiceRequest, etc.) which do not currently specify US Core Patient.

**ServiceRequest.reasonCode**

ServiceRequest.reasonCode can be used to provide a coded reason for why a service is being requested. It is currently bound to the FHIR &quot;Procedure Reason Codes&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains, the value set for ServiceRequest.reasonCode may be refined to codes that pertain to SDOH domains.

Of note, information represented by ServiceRequest.reasonCode overlaps significantly with information represented by ServiceRequest.reasonReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is overlap in information provided by ServiceRequest.reasonReference and ServiceRequest.reasonCode, it is recommended that ServiceRequest.reasonReference be used to justify why the service is being requested.

**ServiceRequest.reasonRe­­ference**

ServiceRequest.reasonReference can be used to justify a service is being requested. To align an SDOH ServiceRequest with the SDOH Conditions and Observations that justify it, ServiceRequest.reasonReference references SDOHCC\_Condition\_Base\_1 and SDOHCC\_Observation\_ScreeningResponseBase\_1, and may also reference Condition, Observation, DocumentReference and/or DiagnosticReport.

Where there is significant overlap in information provided by ServiceRequest.reasonReference and ServiceRequest.reasonCode, it is recommended that ServiceRequest.reasonReference be used to justify why the service is being requested.