- **HealthcareService**: This profile leverages and extends the existing [SDOHCC HealthcareService](StructureDefinition-SDOHCC-HealthcareService.html) profile to advertise a CBO's services and their associated capacity.
    - **Purpose**: To describe a specific service offered by a CBO at a location, including details about programs it supports.
    - **Key Profiled Elements**: The profile is modified in the following ways to support the capacity status use case:
        - The [SDOHCC HealthcareService Capacity Status Extension](StructureDefinition-SDOHCC-ExtensionHealthcareServiceCapacityStatus.html) is added to convey the capacity-status.
        - The `HealthcareService.program` element is used to associate the service with specific social care programs using a standard terminology value set.
        - The `HealthcareService.category` element is constrained with an SDOHCC slice to indicate the specific SDOH domain of the service (e.g., food-insecurity, housing-insecurity).
        - The `HealthcareService.type` element is profiled to differentiate between a service for "Capacity to Assess" and one for "Program or Service-Specific Capacity".
        <!-- - The `HealthcareService.characteristic` element is used to provide more granular details about the service by pointing to specific terminology concepts. -->
- **Organization**: This resource is referenced by `HealthcareService.providedBy` to identify the CBO or other entity that provides the service.
- **Task**: In the post-referral workflow, the `Task.status` element is used to communicate that a referral was rejected specifically due to the CBO being at capacity.


{% include markdown-link-references.md %}