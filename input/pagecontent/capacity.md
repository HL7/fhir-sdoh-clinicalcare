<div markdown="1" class="note-to-balloters">
The Gravity Project team has created a new narrative page providing guidance on the Capacity Status use case. We would encourage balloters to review this guidance and provide feedback.
</div>

This use case addresses the need for a referring entity to determine if a Community-Based Organization (CBO) has the capacity to accept a referral before the referral is formally sent. This "pre-flight" check aims to reduce the administrative burden on clinical staff and CBOs by preventing referrals to organizations that cannot currently provide services. It also improves care coordination by making all involved parties aware of a CBO's capacity status.

Once capacity is confirmed and a referral is initiated, implementers should follow the guidance outlined in the existing Closed-Loop Referral Workflow page.

### Scope

The scope of this use case is to define the exchange of information regarding a CBO's capacity to provide social care services. This implementation guide focuses specifically on the most direct and simple workflow to allow the community an opportunity to implement and provide feedback before addressing more complex scenarios.

#### In Scope

- **Direct Capacity Status Check**: This is a one-to-one query where a **Referral Source** or, more commonly, a **Coordinating Platform** queries a specific CBO about its capacity. This query may be repeated with multiple CBOs until one with available capacity is found, at which point the referral process is completed. This is the primary workflow supported in STU 3.0.
    - This workflow supports two primary types of capacity checks:
        - **Capacity to Assess**: Checking an organization's general availability to assess an individual for any health-related social need.
        - **Program or Service-Specific Capacity**: Checking an organization's capacity to provide a specific service, such as assistance with a program application (e.g., SNAP, HUD), eligibility evaluation, or direct service provision. A “has capacity” response to a program or service-specific capacity status query does not guarantee eligibility or enrollment. Instead, “has capacity” means the referral target has capacity within a specific program or service pending confirmation that the individual meets eligibility criteria after the referral is made.
- **Post-Referral Capacity Status Notification**: A scenario where a CBO, after receiving a referral, communicates that it is unable to accept the patient because it is at capacity. This provides transparency and can support broader analysis of social care resource shortages in a community.

#### Out of Scope

The following scenarios are out-of-scope at this time. This guide focuses on providing guidance related to higher priority, in-scope scenarios. Out-of-scope scenarios may still be appropriate and useful in certain contexts and Gravity standards may still be used in some cases. The following scenarios are out-of-scope:

- **Bulk Capacity Status Check**: A "broadcast" or "Uber model" workflow where a Referral Source sends a single capacity request to multiple CBOs simultaneously and selects the first available respondent. This is out of scope for STU 3.0.
- **Directory-Mediated Capacity Status Check**: A workflow where a Referral Source or Coordinating Platform checks for capacity within one or more centralized service provider directories. This is out of scope for STU 3.0.
- **Contractual Capacity Reporting**: This use case does not cover high-level, aggregate capacity reporting that may occur as part of a contractual obligation between organizations (e.g., a quarterly report on service level agreements).

### Actors and System Environments

#### Actors

This use case uses the existing actors defined in this Implementation Guide: **Referral Source**, **Coordinating Platform**, and **Community-Based Organization (CBO)**.

The most common scenario anticipated involves an indirect referral, where the **Referral Source** sends a referral to a **Coordinating Platform**. The **Coordinating Platform** then takes on the responsibility of checking for capacity with one or more **CBOs** before forwarding the referral.

While less common, this guidance also supports the scenario where a **Referral Source** directly queries a **CBO** for its capacity status.

#### System Environments

The interactions between actors can occur in different system environments. This IG is designed to support data exchange in **Open** and **Hybrid** systems.

- **Closed System**: The Referral Source, Coordinating Platform, and CBO all use the same system or platform. In this environment, capacity status is generally known across all actors without the need for a standards-based exchange. Closed systems are **out of scope** for this guide.
- **Open System**: The Referral Source, Coordinating Platform, and CBO each use disparate systems that cannot natively interoperate. To share information like capacity, a standards-based exchange using FHIR is required. Open systems are **in scope**.
- **Hybrid System**: Some trading partners use the same system, while others use different systems. A standards-based exchange is still necessary to communicate capacity status across the disparate system boundaries. Hybrid systems are **in scope**.

### Exchange Flows

#### Pre-Referral Capacity Inquiry Workflow

This workflow occurs before the initiation of a formal referral to a CBO. It is designed as a general query for service availability and assumes that no identifying information about the individual is exchanged. Consent workflows, as described elsewhere in this guide, are expected to take place *after* a successful capacity check when the formal referral is being prepared.

1. **Referral Source Initiates an Indirect Referral**: The workflow begins when a **Referral Source** sends a referral to a **Coordinating Platform**, following the process described in the [Closed-Loop Referral Workflow](referral_workflow.html#referral-use-case-overview).
2. **Coordinating Platform Searches for CBO Services and Capacity**: Upon receiving the referral, the **Coordinating Platform** searches for an appropriate **CBO** with the capacity to fulfill the request. Typically, the Coordinating Platform uses its own internal resource directory for this search. In the future, this step could be integrated with standards-based directories, such as the FaST National Directory for Healthcare Providers and Services. The platform queries one or more CBOs by performing a FHIR search on the [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) resource.
3. **CBO System Responds with Capacity Status**: The CBO system returns a Bundle containing [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) resources that match the query criteria.
- Each [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) resource in the response **SHALL** indicate its current capacity status.
- The capacity status can be one of the following: 'Has capacity', 'No capacity', or 'No capacity - waitlist available'.
- If a waitlist is available, the IG supports the ability to optionally include unstructured text to provide additional information about the waitlist (e.g. number of people on the waitlist, estimated wait time, etc.).
**NOTE**: Responses to capacity status queries may be synchronous or asynchronous to the request. For example, some implementations may choose to set the capacity status values for the services they offer on a daily or weekly basis and then respond to all inbound capacity requests based on the daily or weekly status values. Other implementations may choose to notify a person each time a capacity status query happens so they can respond synchronously. 
4. **Coordinating Platform Completes the Referral**: If the queried CBO has capacity, the **Coordinating Platform** forwards the referral to that **CBO**. If the CBO is at capacity, the Coordinating Platform repeats Steps 2 and 3 with other CBOs until a suitable partner is found. This completes the capacity-check portion of the workflow, and the process continues as described in the [Closed-Loop Referral Workflow](referral_workflow.html#referral-use-case-overview).

The diagram below shows a simplified view of the capacity status query workflow.

{% include img.html img="CapacityStatusSimplified.png" caption="Figure 1: Simple Capacity Status Query Workflow" %} 

The diagram below shows the capacity status query in the context of the indirect referral workflow. The orange highlighted section shows the capacity status query steps.

{% include img.html img="CapacityStatusIndirect.png" caption="Figure 2: Capacity Status in an Indirect Referral" %} 

#### Post-Referral Capacity Status Notification Workflow

This workflow occurs when a CBO rejects an existing referral due to being at capacity. It is an extension of the [Closed-Loop Referral Workflow](referral_workflow.html#referral-use-case-overview). When a CBO determines it cannot fulfill a received referral request due to lack of capacity, its system updates the corresponding Task resource. The `Task.status` is changed to rejected, and `Task.statusReason` is populated with a CodeableConcept to indicate that the rejection is due to the organization being at capacity.

The diagram below shows the post-referral capacity status notification workflow.

{% include img.html img="PostReferralCapacityStatusNotificationWorkflow.png" caption="Figure 3: Post-Referral Capacity Status Notification Workflow" %} 

#### Capacity Status Query Light

A “light” version of the Capacity Status Query where the referral source has a FHIR server API and the referral target does not have a FHIR server API but has an application that can access the referral source’s FHIR server API. The diagram below shows the capacity status query light workflow.

{% include img.html img="CapacityStatusQueryLight.png" caption="Figure 4: Capacity Status Query Light" %} 

### FHIR Resources and Profiles

This use case primarily leverages the [HealthcareService] resource, with [Task] being used in the post-referral scenario.

- **HealthcareService**: This use case leverages and extends the existing [SDOHCC HealthcareService](StructureDefinition-SDOHCC-HealthcareService.html) profile to advertise a CBO's services and their associated capacity.
    - **Purpose**: To describe a specific service offered by a CBO at a location, including details about programs it supports.
    - **Key Profiled Elements**: The [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html) profile is modified in the following ways to support this use case:
        - The [SDOHCC HealthcareService Capacity Status Extension](StructureDefinition-SDOHCC-ExtensionHealthcareServiceCapacityStatus.html) is added to convey the capacity-status.
        - The `HealthcareService.program` element is used to associate the service with specific social care programs using a standard terminology value set.
        - The `HealthcareService.category` element is constrained with an SDOHCC slice to indicate the specific SDOH domain of the service (e.g., food-insecurity, housing-insecurity).
        - The `HealthcareService.type` element is profiled to differentiate between a service for "Capacity to Assess" and one for "Program or Service-Specific Capacity".
        - The `HealthcareService.characteristic` element is used to provide more granular details about the service by pointing to specific terminology concepts.
- **Organization**: This resource is referenced by `HealthcareService.providedBy` to identify the CBO or other entity that provides the service.
- **Task**: In the post-referral workflow, the `Task.status` element is used to communicate that a referral was rejected specifically due to the CBO being at capacity.
