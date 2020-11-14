### Additional Guidance

The SDOHCC\_ServiceRequest\_Base\_1 profile allows the representation of Service Requests that address SDOH Conditions.

Many of the resources/profiles used for SDOH reference one another. The current flow is that QuestionnaireResponses result in Observations that are used as evidence for Conditions that are addressed by Goals that lead to ServiceRequests and Procedures.

The sections that follow provide additional guidance for some elements in the SDOHCC\_ServiceRequest\_Base\_1 profile.

#### ServiceRequest.category

ServiceRequest.category is optional and bound to the FHIR &quot;Service Request Category Codes&quot; value set with binding strength: Example.

Additionally, an optional ServiceRequest.category slice bound to the value set &quot;SDOHCC ValueSet SDOHDomain 1&quot; the categorization of a Service Request into one or more of the SDOH domains (e.g., food-insecurity-domain, inadequate-housing-domain, etc.). It is recommended that this optional slice be used in order to facilitate searching for SDOH service requests.

#### ServiceRequest.code

ServiceRequest.code is currently bound to the FHIR &quot;Procedure Codes (SNOMED CT)&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains (e.g., food, housing, transportation, etc.), the value set for ServiceRequest.code will be refined to codes that pertain to SDOH domains.

#### ServiceRequest.subject

ServiceRequest.subject is restricted to referencing Patient, Group or Location.

Although the US Core Condition, CarePlan, Goal and Procedure Profiles restrict Subject to US Core Patient Profile, US Core does not offer a ServiceRequest Profile. For this reason, the SDOHCC\_ServiceRequest\_Base\_1 profile does not restrict ServiceRequest.subject to US Core Patient Profile. However, if an implementer is creating US Core profiles (e.g., US Core Condition, US Core Procedure, etc.) that require US Core Patient for Subject, then US Core Patient should also be used for Subject in other profiles (e.g., Observation, ServiceRequest, etc.) which do not currently specify US Core Patient.

#### ServiceRequest.reasonCode

ServiceRequest.reasonCode can be used to provide a coded reason for why a service is being requested.

ServiceRequest.reasonCode is currently bound to the FHIR &quot;Procedure Reason Codes&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains, the value set for ServiceRequest.reasonCode may be refined to codes that pertain to SDOH domains.

Of note, information represented by ServiceRequest.reasonCode overlaps significantly with information represented by ServiceRequest.reasonReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is overlap in information provided by ServiceRequest.reasonReference and ServiceRequest.reasonCode, it is recommended that ServiceRequest.reasonReference should be used to justify why the service is being requested.

#### ServiceRequest.reasonReference

ServiceRequest.reasonReference can be used to justify a service is being requested.

To align an SDOH ServiceRequest with the SDOH Conditions and Observations that justify it, ServiceRequest.reasonReference is sliced to allow the preferred option of referencing the SDOHCC\_Condition\_Base\_1 Profile and/or the SDOHCC\_Observation\_ScreeningResponseBase\_1 Profile.

ServiceRequest.reasonReference should reference the SDOHCC\_Condition\_Base\_1 Profile and/or the SDOHCC\_Observation\_ScreeningResponseBase\_1 Profile if they exist.

Additionally, ServiceRequest.reasonReference may reference Condition, Observation, DocumentReference and/or DiagnosticReport.

Where there is significant overlap in information provided by ServiceRequest.reasonReference and ServiceRequest.reasonCode, it is recommended that ServiceRequest.reasonReference should be used to justify why the service is being requested.