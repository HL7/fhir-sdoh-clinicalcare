<div markdown="1" class="note-to-balloters">
The Gravity Project team has created a new narrative page providing guidance on the Enrollment Status use case. We would encourage balloters to review this guidance and provide feedback.
</div>

This page describes the use case, actors, systems, and information flows for sharing a patient's enrollment status in social care programs (e.g. SNAP). The exchange of this information is critical for effective care coordination, resource planning, and reducing administrative burden.

### Goal

The primary goal of this use case is to enable healthcare providers and community-based organizations (CBOs) to share information about a person's or household’s enrollment status in social care programs. This exchange is intended to:

- Improve care provision and coordination by making all involved parties aware of the programs a person is already receiving.
- Reduce the administrative burden on providers who repeatedly need to investigate a patient's program enrollment status.
- Help prevent the duplication of services that can occur when an individual is enrolled in multiple, similar programs.

### Actors and Systems

The actors and systems involved in sharing program enrollment status are the same as those involved in the broader referral workflows.

#### Actors

- Provider: The healthcare entity or clinician that identifies a health-related social need (HRSN).
- Community-Based Organization (CBO): The organization that receives referrals and provides social care services.
- Patient: The individual who is receiving care and whose enrollment status is being shared.

**NOTE:**  An individual who is enrolled in a program may be the point person for a service intended for an entire household.

#### Systems

The systems involved in the exchange mirror those in the established referral workflows and may include:

- EHR System (Referral Source): The system used by the provider to manage patient care and initiate referrals.
- CBO System (Referral Target): The system used by the CBO to manage referrals and service delivery.
- Intermediary/Community Platform (CP): A system that facilitates communication and data exchange between the provider and CBO, particularly in indirect referral scenarios. For example, a Social Care Network (SCN), may play the role of the CP.

### Scope

#### In Scope

Sharing information about an individual's existing enrollment status in a social care program (e.g., enrolled, not enrolled, waitlisted).

#### Out of Scope

The determination of an individual's eligibility status for a program.
The internal business process of determining if an individual is eligible for a program.

### Workflows

There are two primary workflows that trigger the need to share enrollment status information. These workflows leverage the same exchange patterns (e.g., direct, indirect) described on the Referral Workflow page.

#### Referral-Triggered Workflow

This workflow is initiated when a provider refers a patient to a CBO. The exchange of enrollment status information follows the exchange patterns (e.g., direct, indirect) described on the Referral Workflow page.

The following diagram illustrates the indirect referral pattern as one example of this flow. It is also possible to exchange enrollment status observations in the context of the other referral patterns in this guide, including direct, direct light, and indirect light referral. Many CBOs may not have FHIR server capabilities; in this case, the indirect light or direct light referral exchange workflows could be used to exchange the Enrollment Status Observation.

1. Assessment and Referral: A provider assesses a patient, identifies an HRSN, and sends a referral via a ServiceRequest and Task.
2. Enrollment Action (where appropriate): The CBO receives the referral and works to enroll the individual in the relevant program.
3. Status Communication: If the CBO determines the person needs to be enrolled in a program, the CBO creates a new Enrollment Status Observation to represent the final enrollment status or updates an existing Enrollment Status Observation. To close the loop on the referral, the CBO updates the Task, pointing to the Enrollment Status Observation in Task.output.

{% include img.html img="EnrollmentWorkflow.jpg" caption="Figure 1: Social Care Enrollment Workflow" %} 


#### Care Coordination

An Enrollment Status Observation may be exchanged independent of a referral when care team members need to share this information for planning purposes.  ServiceRequest and Task resources do not play a direct role in this workflow.

This can occur in at least three scenarios:

- Following a New Enrollment: An individual contacts a Community-Based Organization (CBO) directly to receive assistance. The CBO assesses the individual's needs and enrolls them in a social care program. The CBO documents this new enrollment status and creates an Enrollment Status Observation to exchange this information with trading partners.
- Documenting an Existing Enrollment: A care team member documents an individual's existing program enrollment status. They then create and share an Enrollment Status Observation to make this information available to other providers for care coordination.
- Prior to initiating a referral, the referrer may want to check on enrollment status in a specific program (either with the SCN or with a specific CBO).

The specific workflows for how, when, and with whom these observations are exchanged are beyond the scope of this guide. Exchanges may occur between social care organizations or between social and healthcare organizations, as appropriate. All sharing of information is assumed to be in compliance with established data security and privacy policies and regulations, and it is further assumed that the appropriate consents and authorizations are in place for the data to be shared. The Enrollment Status Observation is made available to the individual's care team to support coordinated care, for example, through a community information exchange (CIE) or direct secure messaging.

### Technical Approach and FHIR Resources

The exchange of program enrollment status is primarily supported by the Observation resource.

#### Observation

The SDOH CC Enrollment Status Observation profile is the primary resource used to convey an individual's enrollment status.

- Observation.code: This will point to a CodeableConcept representing the specific program (e.g. SNAP, WIC, etc.).
- Observation.subject: This will reference the Patient resource for the individual.
- Observation.effective[x]: This will capture the date and time information relevant to the status.
- Observation.value[x]: This CodeableConcept will contain the specific status, with potential values including:
    - Enrolled
    - Not enrolled
    - Not enrolled, on waitlist
- Observation.note:  Used to capture additional information about the enrollment status such information about the waitlist (e.g. “The waitlist is currently 2 months long.  We will notify the individual when they are ready to be enrolled.”).

#### Task and ServiceRequest

The Task and ServiceRequest resources are used only in the referral-triggered workflow. To "close the loop", the CBO updates the Task.status to completed and adds a Task.output that references the Enrollment Status Observation resource containing the final enrollment status and any other relevant resources (e.g. Procedure).
