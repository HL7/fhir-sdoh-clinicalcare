### Additional Guidance

The SDOHCC\_Goal\_Base\_1 profile allows the representation of Goals that address SDOH Conditions.

The current flow is that QuestionnaireResponses result in Observations that are used as evidence for Conditions that are addressed by CarePlans and Goals which lead to ServiceRequests and Procedures.

The diagram below shows a simple example of a relationship between Observation, Condition and Goal.

An initial Observation (1) is evidence for a Condition (2) that is addressed by a Goal (3) that may have an outcome of a later Observation (4).
<table><tr><td><img src="Goal_Preface.png" /></td></tr></table>

The sections that follow provide additional guidance on some elements in the SDOHCC\_Goal\_Base\_1 profile. However, this profile is still in the early stages of development.

**Goal.category**

Goal.category is currently bound to the FHIR &quot;Goal Category&quot; value set with binding strength: Example. This value set contains the SNOMED CT codes listed below. However, as Gravity content development continues, Gravity will propose new goal categories to better categorize SDOH goals.

| Code | Display |
| --- | --- |
| dietary | Dietary |
| safety | Safety |
| behavioral | Behavioral |
| nursing | Nursing |
| physiotherapy | Physiotherapy |

**Goal.description**

Goal.description is currently bound to the FHIR &quot; SNOMED CT Clinical Findings&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains (e.g., food, housing, transportation, etc.), the value set for Goal.description will be refined to codes that pertain to SDOH domains.

**Goal.subject**

Since this profile is based on the US Core Goal Profile, Goal.subject is restricted to referencing US Core Patient Profile.

**Goal.target**

**Goal.target.measure**

Goal.target.measure is currently bound to codes from the FHIR &quot;LOINC Codes&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains (e.g., food, housing, transportation etc.), the value set for Goal.target.measure will be refined to codes that pertain to SDOH domains.

**Goal.target.detail**

Goal.target.measure has yet to be refined for this profile.

**Goal.addresses**

To align an SDOH Goal with the SDOH Conditions, Observations and ServiceRequests that it addresses, Goal.addresses references SDOHCC\_Condition\_Base\_1, SDOHCC\_ServiceRequest\_Base\_1, and SDOHCC\_Observation\_ScreeningResponseBase\_1 and may also reference Condition, Observation, ServiceRequest, RiskAssesssment and/or NutritionOrder.

**Goal.outcomeCode**

Goal.outcome.Code can be used identify the outcome when Goal.status is assessed. Goal.outcome.Code is currently bound to the FHIR &quot;SNOMED CT Clinical Findings&quot; value set with binding strength: Example. As the Gravity Project continues to refine content for the SDOH domains, the value set for Goal.outcome.Code will likely be refined to codes that pertain to SDOH domains.

Of note, information represented by Goal.outcome.Code overlaps significantly with information represented by Goal.outcome.Reference. Multiple approaches to representing the same information may negatively impact interoperability. Therefore, where there is overlap in information provided by Goal.outcome.Code and Goal.outcome.Reference, it is recommended that Goal.outcome.Reference be used to identify/provide details of goal outcomes.

**Goal.outcomeReference**

Goal.outcome.Reference can be used to provide details of the Goal outcome (presumably when Goal.status is assessed). To align an SDOH Goal with the SDOH Observation(s) that it references as an outcome, Goal.outcome.Reference references SDOHCC\_Observation\_ScreeningResponseBase\_1 and/or may also reference Observation.

Where there is significant overlap in information provided by Goal.outcome.Code and Goal.outcome.Reference, it is recommended that Goal.outcome.Reference be used to identify/provide details of goal outcomes.

**Additional rules for the Goal profile**

To improve data integrity, the following rules should be applied to this profile:

1. If Goal.description and/or Goal.target are changed, a new Goal instance SHALL be created.

This rule is not specific to SDOH goals. For any goal, a change to these elements essentially results in a different goal.

1. Goal.statusDate SHALL be updated if and ONLY if Goal.achievementStatus is updated.

The Goal resource does not clearly specify whether Goal.statusDate applies to Goal.achievementStatus or to Goal.lifecycleStatus. To unambiguously establish when a goal has been achieved, Goal.statusDate SHALL be synchronized with Goal.achievementStatus.

1. An update to Goal.achievementStatus MAY be supported by an update to Goal.outcomeReference.

This rule is not specific to an SDOH goal. Any goal may be accompanied by an update to Goal.outcomeReference as evidence for a change in Goal.achievementStatus. However, decisions related to linking the goal to the relevant observation that may support it are up to the implementor.