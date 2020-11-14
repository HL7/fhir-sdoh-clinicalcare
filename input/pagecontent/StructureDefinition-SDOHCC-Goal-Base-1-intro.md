### Additional Guidance

The SDOHCC\_Goal\_Base\_1 profile allows the representation of Goals that address SDOH Conditions.

Many of the resources/profiles used for SDOH reference one another. The current flow is that QuestionnaireResponses result in Observations that are used as evidence for Conditions that are addressed by Goals that lead to ServiceRequests and Procedures.

The diagram below shows a simple example of a relationship between Observation, Condition and Goal. 
An initial Observation (1) is evidence for a Condition (2) that is addressed by a Goal (3) that may have an outcome of a later Observation (4).

<table><tr><td><img src="Goal_Preface.png" /></td></tr></table>

The sections that follow provide additional guidance on some elements in the SDOHCC\_Goal\_Base\_1 profile.

#### Goal.category

Goal.category is optional and bound to the FHIR &quot;Goal category&quot; value set with binding strength: Example.

Additionally, an optional Goal.category slice bound to the &quot;SDOHCC ValueSet SDOHDomain 1&quot; value set allows the categorization of a Goal into one or more of the SDOH domains (e.g., food-insecurity-domain, inadequate-housing-domain, etc.). It is recommended that this optional slice be used in order to facilitate searching for SDOH goals.

#### Goal.description

Goal.description is currently bound to codes from the FHIR &quot;LOINC Codes&quot; value set with binding strength: Extensible. As the Gravity Project continues to refine content for the SDOH domains (e.g., food, housing, transportation, etc.), Gravity intends to work with LOINC to include Goal.description codes that pertain to SDOH domains.

#### Goal.subject

Since this profile is based on the US Core Goal Profile, Goal.subject is restricted to referencing US Core Patient Profile.

#### Goal.target

Goal.target can be used to _&quot;Indicate what should be done by when.&quot;_

Exactly how Goal.target.will be used for SDOH goals is evolving. The following is general guidance for Goal.target.

##### Goal.target.measure

Goal.target.measure is currently bound to codes from the FHIR &quot;LOINC Codes&quot; value set with binding strength: Extensible. Gravity intends to work with LOINC to include Goal.target.measure codes that pertain to SDOH domains.

For SDOH goals that have only one target measure that aligns exactly with the goal description, current guidance is to use the same code for Goal.target.measure as for Goal.description. This approach allows the use of Goal.target.due[x] to specify the date the goal should be achieved by. This approach is proposed because it is not possible to assign a due date to a Goal.description without using Goal.target.

#### Goal.statusDate

The Goal Resource does not clearly specify whether Goal.statusDate applies to Goal.achievementStatus or to Goal.lifecycleStatus. It is recommended that Goal.statusDate be synchronized with Goal.achievementStatus.

#### Goal.addresses

Goal.addresses is sliced to allow the preferred option of referencing the SDOHCC\_Condition\_Base\_1 Profile and/or SDOHCC\_Observation\_ScreeningResponseBase\_1 Profile.

Goal.addresses should reference the SDOHCC\_Condition\_Base\_1 Profile and/or SDOHCC\_Observation\_ScreeningResponseBase\_1 Profile if they exist.

Additionally, Goal.addresses may reference Condition, Observation and/or RiskAssessment.

#### Goal.outcomeCode

Goal.outcome.Code can be used identify a goal&#39;s outcome when Goal.status is assessed. Goal.outcomeCode is currently bound to the FHIR &quot;LOINC Codes&quot; value set with binding strength: Example. Gravity intends to work with LOINC to include Goal.outcome codes that pertain to SDOH domains.

Of note, information represented by Goal.outcomeCode overlaps significantly with information represented by Goal.outcomeReference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is overlap in information provided by Goal.outcomeCode and Goal.outcomeReference, it is recommended that Goal.outcomeReference should be used to identify/provide details of goal outcomes.

#### Goal.outcomeReference

Goal.outcomeReference can be used to provide details of the Goal outcome (presumably when Goal.status is assessed). Goal.achievementStatus may be supported by an update to Goal.outcomeReference. The base FHIR Resource restricts Goal.outcomeReference to referencing only Observations.

Goal.outcomeReference may reference any Observation that supports the Goal status.

Additionally, Goal.outcomeReference is sliced to allow referencing the Observation\_ScreeningResponseBase\_1 Profile if it exists and is applicable.

Where there is significant overlap in information provided by Goal.outcomeCode and Goal.outcomeReference, it is recommended that Goal.outcomeReference be used to identify/provide details of goal outcomes.