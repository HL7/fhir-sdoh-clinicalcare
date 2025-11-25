<div markdown="1" class="note-to-balloters">
The Gravity Project team has created a new narrative page providing guidance on the Referral for Further Assessment use case. We would encourage balloters to review this guidance and provide feedback.
</div>

This page describes the use case, actors, systems, and information flows for referring an individual for a more comprehensive assessment of their health-related social needs (HRSN).

### Goal

In many clinical situations, an initial screening may indicate the presence of one or more health-related social needs, but the clinical care team may not have the time, resources, or specialized skills to perform a deeper, more comprehensive assessment. The primary goal of this use case is to enable a healthcare provider or other entity (e.g. behavioral health or other non-healthcare entity) to refer an individual to a community-based organization (CBO) or another partner organization that is equipped to conduct a more thorough assessment.

This exchange is intended to:

- Enable a deeper understanding of an individual's HRSN to create a more holistic picture of their needs and goals.
- Connect individuals with organizations and people skilled in performing comprehensive social needs assessments.
- Ensure the results of the assessment are shared back with the referring provider to inform the individual's overall care plan.
- Complement, not replace, existing workflows for referring a patient for specific services. A referral for further assessment can be initiated independently of, or in conjunction with, a referral for a specific service (e.g., provision of a meal).

For example, a patient might screen positive for food insecurity. During the follow-up conversation, the healthcare provider suspects other needs may be present but lacks the capacity to investigate further. The provider can then send a "Referral for Further Assessment" to a trusted CBO to gain a more complete understanding of the individual's situation and identify appropriate services.

### Actors and Systems

The actors and systems involved in this workflow are the same as those in other referral workflows described in this guide.

#### Actors

- <b>Provider (or other Referral Source)</b>: The healthcare entity, clinician, or care team member that identifies the need for a more detailed assessment of social needs.
- <b>Community-Based Organization (CBO) (or other Referral Target)</b>: The organization that receives the referral and has the skills and resources to perform the comprehensive assessment.
- <b>Patient</b>: The individual who is the subject of the referral and assessment.

#### Systems

The technology systems involved in the exchange mirror those in the established referral workflows and may include:

- <b>EHR System (Referral Source)</b>: The system used by the provider to manage patient care and initiate the referral for assessment.
- <b>CBO System (Referral Target)</b>: The system used by the CBO to receive and manage the assessment referral and document its results.
- <b>Intermediary/Community Platform (CP)</b>: A system that facilitates communication and data exchange between the provider and CBO systems.

### Scope

#### In Scope

- The process of sending a referral request for a further assessment of an individual's health-related social needs.
- Support for both general and domain-specific assessment requests. For example:
    - A general request, such as "Assessment of health and social care needs."
    - A more specific request, such as "Assessment for food insecurity."
- The communication of the assessment results back to the referring provider.

#### Out of Scope

- The specific clinical or business processes for how the CBO conducts the assessment.
- Guidance on the authorization, contracting, or reimbursement workflows associated with conducting assessments.
- The act of enrolling an individual into a program or providing the specific services identified during the assessment.

### Workflows

The exchange flow for a referral for further assessment follows the exact same <b>closed-loop</b> direct, direct referral light, indirect, and indirect referral light patterns described on the Referral Workflow page. The core mechanics of creating a ServiceRequest and Task, sending the referral, and closing the loop by updating the Task remain unchanged.

The primary difference in this use case lies in the <b>intent of the request</b> and the <b>nature of the result</b>. Instead of requesting a specific service (e.g., meal delivery), the provider is requesting a comprehensive or domain-specific assessment. Consequently, when the loop is closed, the information returned in `Task.output` consists of the *findings from that assessment*.

While the referring provider may use these assessment results to adjust the clinical care plan, a common outcome is for the CBO to take ownership of creating a comprehensive <b>social care plan</b> based on the findings. This plan, potentially developed in collaboration with other social care providers, aims to help the individual achieve their goals. Before executing this plan, the CBO may need to seek authorization from the original referring entity or another responsible party to ensure reimbursement for subsequent services. In this scenario, the referring provider may be made aware of not only the assessment results but also the broader social care plan. It is important to note that sharing this information raises privacy considerations. This Implementation Guide assumes that the individual's consent and preferences are managed in accordance with all applicable policies and regulations; the specific mechanisms for managing <b>authorization, reimbursement, and consent from a non-covered entity to a covered entity</b> are currently out of scope for this guide.

The following diagram illustrates the indirect referral pattern as one example of this flow, highlighting where the assessment-specific details fit into the established pattern.  While there are slight variations to adapt each of these flows, the general pattern is consistent. It is recognized that many CBOs may not have FHIR-enabled servers as depicted in this example. For exchanging a referral with a CBO that does not have a FHIR-enabled server, see the direct light and indirect light referral scenarios on the Referral Workflow page.

{% include img.html img="ReferralforFurtherAssessmentWorkflow.jpg" caption="Figure 1: Referral for Further Assessment Workflow" %} 

### Technical Approach and FHIR Resources

This use case employs the same core FHIR resources (ServiceRequest, Task) as other referral workflows. The key to implementing this use case is using specific elements within these resources to differentiate an assessment request and its corresponding results.

Differentiating the Assessment Referral

Three key fields distinguish this referral:

1. `ServiceRequest.code`: This field specifies that the object of the request is an <b>assessment procedure</b>. This CodeableConcept is what differentiates a request to "assess for food insecurity" from a request to "provide food."
    - A <b>general assessment</b> could be coded with a concept like "Assessment of health and social care needs (procedure)".
    - A <b>domain-specific assessment</b> could be coded with a concept like "Food insecurity risk assessment (procedure)".
2. `Task.output`: When closing the loop, this element carries the <b>results of the assessment</b>. The `Task.output` element will contain a Reference to the FHIR resource(s) that document the assessment's findings in the appropriate `Task.output.value[x]` choice, typically valueReference. This may include Observation Screening Responses, Questionnaire Response, Observation Assessments, Conditions, CarePlan, Goal, and Procedures.
3. `ServiceRequest.intent`: This field is required and defines the purpose of the ServiceRequest. It typically would be set to “order”.



