### Additional Guidance

The SDOHCC\_Procedure\_Base\_1 profile allows the representation of Procedures that address SDOH Conditions.

Many of the resources/profiles used for SDOH reference one another. The current flow is that QuestionnaireResponses result in Observations that are used as evidence for Conditions that are addressed by Goals that lead to ServiceRequests and Procedures.

The sections that follow provide additional guidance for some elements in the SDOHCC\_Procedure\_Base\_1 profile.

#### Procedure.basedOn

To align an SDOH Procedure with the SDOH ServiceRequest(s) it is based on, Procedure.basedOn is sliced to allow the preferred option of referencing the SDOHCC\_ServiceRequest\_Base\_1 Profile.

Procedure.basedOn should reference the SDOHCC\_ServiceRequest\_Base\_1 Profile if it exists.

Additionally, Procedure.basedOn may reference CarePlan and ServiceRequest.

#### Procedure.category

Procedure.category is currently bound to the &quot;SDOHCC ValueSet SDOHDomain 1&quot; value set with binding strength: Example. This allows the categorization of a Procedure into one or more of the SDOH domains (e.g., food-insecurity-domain, inadequate-housing-domain, etc.).

#### Procedure.code

Procedure.code is currently bound to the FHIR &quot;Procedure Codes (SNOMED CT)&quot; value set with binding strength: Required. As the Gravity Project continues to refine content for the SDOH domains (e.g., food, housing, transportation, etc.), the required value set for Procedure.code will be refined to codes that pertain to SDOH domains.

Additionally, Procedure.code.coding is sliced to allow the optional addition of CPT, LOINC, and HCPCS Level II codes. Each optional coding slice is currently bound to the entire value set for each code system. As the Gravity Project continues to refine content for the SDOH domains, the value set for each coding slice may be refined to codes that pertain to SDOH domains.

#### Procedure.subject

Since this profile is based on the US Core Procedure Profile, Procedure.subject is restricted to referencing US Core Patient Profile.

#### Procedure.reasonCode

Procedure.reasonCode can be used to provide a coded reason for why a procedure was performed.

Procedure.reasonCode is currently bound to the FHIR &quot;Procedure Reason Codes&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains, the value set for Procedure.reasonCode may be refined to codes that pertain to SDOH domains.

Of note, information represented by Procedure.reasonCode overlaps significantly with information represented by Procedure.reasonReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is overlap in information provided by Procedure.reasonReference and Procedure.reasonCode, it is recommended that Procedure.reasonReference should be used to justify why the procedure was performed.

#### Procedure.reasonReference

Procedure.reasonReference can be used to justify why the procedure was performed.

To align an SDOH Procedure with the SDOH Conditions and Observations that justify it, Procedure.reasonReference is sliced to allow the preferred option of referencing the SDOHCC\_Condition\_Base\_1 Profile and/or the SDOHCC\_Observation\_ScreeningResponseBase\_1 Profile.

Procedure.reasonReference should reference the SDOHCC\_Condition\_Base\_1 Profile and/or the SDOHCC\_Observation\_ScreeningResponseBase\_1 Profile if they exist.

Additionally, Procedure.reasonReference may reference Condition, Observation, Procedure, DocumentReference and/or DiagnosticReport.

Where there is significant overlap in information provided by Procedure.reasonReference and Procedure.reasonCode, it is recommended that Procedure.reasonReference should be used to justify why the procedure was performed.