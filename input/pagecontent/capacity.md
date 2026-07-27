<div markdown="1" class="note-to-balloters">
**WE ARE ACTIVELY SEEKING FEEDBACK ON THE FHIR STRUCTURES AND NARRATIVE GUIDANCE SURROUNDING THE CAPACITY STATUS ([FHIR-53450](https://jira.hl7.org/browse/FHIR-53450)) USE CASE. WE ENCOURAGE READERS TO REVIEW THE PROPOSED CHANGES AND SUBMIT BALLOT COMMENTS AGAINST THEM.**
</div>


### Overview

This use case addresses the need for a referring entity to determine if a Community-Based Organization (CBO) has the capacity to accept a referral before the referral is formally sent. This "pre-flight" check aims to reduce the administrative burden on clinical staff and CBOs by preventing referrals to organizations that cannot currently provide services. It also improves care coordination by making all involved parties aware of a CBO's capacity status.

Once capacity is confirmed and a referral is initiated, implementers should follow the guidance outlined in the existing Closed-Loop Referral Workflow page.


### Scope

The scope of this use case is to define the exchange of information regarding a CBO's capacity to provide social care services. This implementation guide focuses specifically on the most direct and simple workflow to allow the community an opportunity to implement and provide feedback before addressing more complex scenarios.

#### In Scope

- **Direct Capacity Status Inquiry**: This is a one-to-one query where a **Referral Source** or, more commonly, a **Coordination Platform** queries a specific CBO about its capacity. This query may be repeated with multiple CBOs until one with available capacity is found, at which point the referral process is completed. The direct capacity status query use case does not share any identifying information about the individual.  If more information about the individual  is needed for the CBO to respond to a capacity inquiry, then a referral workflow should be used.
    - This workflow supports two primary types of capacity checks:
        - **Capacity to Assess**: Checking an organization's general availability to assess an individual for any health-related social need.
        - **Program Specific Capacity**: Checking an organization's capacity to provide a specific service type (e.g. Food pantry, Gas assistance, Rapid rehousing) or specific program support (e.g. SNAP, WIC, etc.), A “has capacity” response to a program or service-specific capacity status query does not guarantee eligibility or enrollment. Instead, “has capacity” means the referral target has capacity within a specific program or service pending confirmation that the individual meets eligibility criteria after the referral is made.
- **Post-Referral Capacity Status Notification**: A scenario where a CBO, after receiving a referral, communicates that it is unable to accept the patient because it is at capacity. This provides transparency and can support broader analysis of social care resource shortages in a community.

#### Out of Scope

The following scenarios are out-of-scope at this time. This guide focuses on providing guidance related to higher priority, in-scope scenarios. Out-of-scope scenarios may still be appropriate and useful in certain contexts and Gravity standards may still be used in some cases. The following scenarios are out-of-scope:

- **Bulk Capacity Status Check**: A "broadcast" or "Uber model" workflow where a Referral Source sends a single capacity request to multiple CBOs simultaneously and selects the first available respondent. This is out of scope for STU 3.0.
- **Directory-Mediated Capacity Status Check**: A workflow where a Referral Source or Coordination Platform checks for capacity within one or more centralized service provider directories. This is out of scope for STU 3.0.
- **Organizational Capacity Reporting**: This use case does not cover high-level, aggregate capacity reporting that may occur as part of a contractual obligation between organizations (e.g., a quarterly report on service level agreements).


### Actors and System

#### Actors

This use case uses the existing actors defined in this Implementation Guide: **Referral Source**, **Coordination Platform**, and **Community-Based Organization (CBO)**.

The most common scenario anticipated involves an indirect referral, where the **Referral Source** sends a referral to a **Coordination Platform**. The **Coordination Platform** then takes on the responsibility of checking for capacity with one or more **CBOs** before forwarding the referral.

While less common, this guidance also supports the scenario where a **Referral Source** directly queries a **CBO** for its capacity status.

#### System Environments

The interactions between actors can occur in different system environments. This IG is designed to support data exchange in **Open** and **Hybrid** systems.

- **Closed System**: The Referral Source, Coordination Platform, and CBO all use the same system or platform. In this environment, capacity status is generally known across all actors without the need for a standards-based exchange. Closed systems are **out of scope** for this guide.
- **Open System**: The Referral Source, Coordination Platform, and CBO each use disparate systems that cannot natively interoperate. To share information like capacity, a standards-based exchange using FHIR is required. Open systems are **in scope**.
- **Hybrid System**: Some trading partners use the same system, while others use different systems. A standards-based exchange is still necessary to communicate capacity status across the disparate system boundaries. Hybrid systems are **in scope**.


### Exchange Workflows

#### Pre-Referral Capacity Inquiry Workflow

This workflow occurs before the initiation of a formal referral to a CBO. It is designed as a general query for service availability and assumes that no identifying information about the individual is exchanged. Consent workflows, as described elsewhere in this guide, are expected to take place *after* a successful capacity check when the formal referral is being prepared.

1. **Referral Source Initiates an Indirect Referral**: The workflow begins when a **Referral Source** sends a referral to a **Coordination Platform**, following the process described in the [Closed-Loop Referral Workflow](referral_workflow.html#referral-use-case-overview).
2. **Coordination Platform Searches for CBO Services and Capacity**: Upon receiving the referral, the **Coordination Platform** searches for an appropriate **CBO** with the capacity to fulfill the request. Typically, the Coordination Platform uses its own internal resource directory for this search. In the future, this step could be integrated with standards-based directories, such as the FaST National Directory for Healthcare Providers and Services. The platform queries one or more CBOs by performing a FHIR search on the [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) resource. For example, if the Coordination Platform is looking for a CBO to assess an individual’s social care needs, they would query the selected CBO’s FHIR server(s) for HealthCareService’s that are categorized as “SDOH” and that have a type of “Assessment”.
3. **CBO System Responds with Capacity Status**: The CBO system returns a Bundle containing [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) resources that match the query criteria.
- Each [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) resource in the response **SHALL** indicate its current capacity status.
- The capacity status can be one of the following: 'Has capacity', 'No capacity', or 'No capacity - waitlist available'.
- If a waitlist is available, the IG supports the ability to optionally include unstructured text to provide additional information about the waitlist (e.g. number of people on the waitlist, estimated wait time, etc.).
**NOTE**: Responses to capacity status queries may be synchronous or asynchronous to the request. For example, some implementations may choose to set the capacity status values for the services they offer on a daily or weekly basis and then respond to all inbound capacity requests based on the daily or weekly status values. Other implementations may choose to notify a person each time a capacity status query happens so they can respond synchronously. 
CBOs vary in their service offerings and their ability to communicate general capacity information. Some organizations can only determine their capacity to serve an individual after conducting a comprehensive assessment, taking into account various eligibility criteria and potential funding sources. As a result, certain CBOs might only utilize the "additional assessment required" value, whereas others may never find it necessary.
4. **Coordination Platform Completes the Referral**: If the queried CBO has capacity, the **Coordination Platform** forwards the referral to that **CBO**. If the CBO is at capacity, the Coordination Platform repeats Steps 2 and 3 with other CBOs until a suitable partner is found. This completes the capacity-check portion of the workflow, and the process continues as described in the [Closed-Loop Referral Workflow](referral_workflow.html#referral-use-case-overview).

Step 4 describes the 'Has Capacity' and 'No Capacity' outcomes. If the returned capacity status is 'No Capacity - Has Waitlist', the **Coordination Platform** may forward the referral so the individual can be placed on the waitlist, or repeat Steps 2 and 3 with other CBOs, depending on the needs of the individual. If the returned capacity status is 'Additional Assessment Required', the Coordination Platform may forward the referral so the CBO can determine whether it can serve the individual (see the note on comprehensive assessments above), or repeat Steps 2 and 3 with other CBOs.

The diagram below shows a simplified view of the capacity status query workflow. It depicts the one-to-one query — here a **Referral Source** querying a **CBO** (the Referral Target) directly, as in the Direct Capacity Status Inquiry; a **Coordination Platform** performs the same query in Steps 2 and 3 of the indirect workflow above. The "Get HealthcareService(s)" step is the capacity status query itself: a FHIR search for [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) resources, each of which indicates its current capacity status.

<div>{% include CapacityStatusSimplified.svg %}</div>
<br clear="all"/>

The diagram below shows the capacity status query in the context of the indirect referral workflow described in Steps 1-4 above. In this flow the [SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html) and [SDOHCC Task for Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html) convey the referral itself; the capacity status is carried by the **CBO**’s HealthcareService resources. The capacity status query steps appear under the section labeled "Capacity Check (pre-referral)" and are grouped in a frame marked "Optional" because a **Coordination Platform** may forward a referral without first checking capacity. Within that frame, the Coordination Platform issues the same "Get HealthcareService(s)" query to the CBO, evaluates the capacity status of each returned HealthcareService, and records the outcome by updating the Task status. The **Referral Source** learns the outcome of the capacity check by retrieving the Task or through the dashed "Subscription Notification (optional)" arrows shown elsewhere in the flow.

<div>{% include DetailedIndirectPreReferralCapacityStatus.svg %}</div>
<br clear="all"/>

#### Post-Referral Capacity Status Notification Workflow

This workflow occurs when a CBO rejects an existing referral due to being at capacity. It is an extension of the [Closed-Loop Referral Workflow](referral_workflow.html#referral-use-case-overview). When a CBO determines it cannot fulfill a received referral request due to lack of capacity, its system updates the corresponding Task resource. The `Task.status` is changed to rejected, and `Task.statusReason` is populated with a CodeableConcept to indicate that the rejection is due to the organization being at capacity.

The diagram below shows the post-referral capacity status notification workflow. The capacity-specific steps appear under the section labeled "Capacity Check (post-referral)": the CBO performs "Evaluate Referral and Update CP Task Status (rejected - at capacity)", updating the Task it received from the Coordination Platform (CP); this is the `Task.status` and `Task.statusReason` update described above. The Coordination Platform learns of the rejection through the dashed "Subscription Notification (optional)" arrow or by retrieving the CP Task ("Get CP Task"), and then re-refers the individual to a different CBO. No HealthcareService query occurs in this workflow; the capacity status is conveyed entirely through the Task.

<div>{% include DetailedIndirectPostReferralCapacityStatus.svg %}</div>
<br clear="all"/>

#### Capacity Status Query Light

A “light” version of the Capacity Status Query where the referral source has a FHIR server API and the referral target does not have a FHIR server API but has an application that can access the referral source’s FHIR server API. Because the referral target has no FHIR server for the referral source to query, the capacity request is made out-of-band in the "Send email" step. The referral target’s application then uses the referral source’s FHIR server API to perform the "Post HealthcareService(s)" step, posting HealthcareService resource(s) that indicate the current capacity status, which the referral source evaluates just as in the direct query. The diagram below shows the capacity status query light workflow.

<div>{% include CapacityStatusQueryLight.svg %}</div>
<br clear="all"/>

### FHIR Artifacts and Technical Guidance

This use case primarily leverages the [HealthcareService](https://hl7.org/fhir/R4/healthcareservice.html) resource, with [Task](https://hl7.org/fhir/R4/task.html) being used in the post-referral scenario.

- **HealthcareService**: This use case leverages and extends the existing [SDOHCC HealthcareService](StructureDefinition-SDOHCC-HealthcareService.html) profile to advertise a CBO's services and their associated capacity.
    - **Purpose**: To describe a specific service offered by a CBO at a location, including details about programs it supports.
    - **Key Profiled Elements**: The [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) profile is modified in the following ways to support this use case:
        - The [SDOHCC HealthcareService Capacity Status Extension](StructureDefinition-SDOHCC-ExtensionHealthcareServiceCapacityStatus.html) is added to convey the capacity-status.
        - The `HealthcareService.program` element is used to associate the service with specific social care programs using a standard terminology value set.
        - The `HealthcareService.category` element is constrained with an SDOHCC slice to indicate the specific SDOH domain of the service (e.g., food-insecurity, housing-insecurity).
        - The `HealthcareService.type` element is profiled to differentiate between a service for "Capacity to Assess" and one for "Program or Service-Specific Capacity".
        <!-- - The `HealthcareService.characteristic` element is used to provide more granular details about the service by pointing to specific terminology concepts. -->
- **Organization**: This resource is referenced by `HealthcareService.providedBy` to identify the CBO or other entity that provides the service.
- **Task**: In the post-referral workflow, the `Task.status` element is used to communicate that a referral was rejected specifically due to the CBO being at capacity.
