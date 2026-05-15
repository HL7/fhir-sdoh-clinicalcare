
| Term    |  Definition |
| -------- | ---------- |
|  Business associate     | A person or entity that performs certain functions or activities that involve the use or disclosure of protected health information on behalf of, or provides services to, a covered entity.  A member of the covered entity’s workforce is not a business associate.  A covered health care provider, health plan, or health care clearinghouse can be a business associate of another covered entity.  The Privacy Rule lists some of the functions or activities, as well as the particular services, that make a person or entity a business associate, if the activity or service involves the use or disclosure of protected health information. The types of functions or activities that may make a person or entity a business associate include payment or health care operations activities, as well as other functions or activities regulated by the Administrative Simplification Rules.  See [guidance](https://www.hhs.gov/hipaa/for-professionals/privacy/guidance/business-associates/index.html) on Health Information Privacy. |
|  Care Coordinator                     | One who organizes an individual's care across multiple providers.  |
|  Community Based Organization (CBO)   | An organization that provides specific services to the community or to a targeted population within the community.  |
|  Coordination Platform (CP)           | An intermediary between a provider and a CBO that plays a role in facilitating the referral process and finding resources for at-risk individuals.  |
|  Covered entity                       | Covered entities are defined in the HIPAA rules as (1) health plans, (2) health care clearinghouses, and (3) health care providers who electronically transmit any health information in connection with transactions for which HHS has adopted standards.   See [guidance](https://www.hhs.gov/hipaa/for-professionals/covered-entities/index.html) on Health Information Privacy.|
|  Patient                              | A consumer, or client, who is the subject of the assessment, goals, referrals and services delivered. Use of the term in this IG does not necessarily imply a clinical context.   |
|  Provider                             | Includes licensed providers and qualified professionals that interact with the patient to assess social risks, set goals, and determine/recommend referrals  |
|  SDOH Domain                          | An area of activity describing one of the conditions in which people are born, grow, work, live, and age, and the wider set of forces and systems shaping the conditions of daily life.   |
|  Closed System                          | The Referral Source, Coordination Platform, and CBO all use the same system or platform. In this environment, capacity status is generally known across all actors without the need for a standards-based exchange. Closed systems are out of scope for this guide.   |
|  Open System                          | The Referral Source, Coordination Platform, and CBO each use disparate systems that cannot natively interoperate. To share information like capacity, a standards-based exchange using FHIR is required. Open systems are in scope.   |
|  Hybrid System                          | Some trading partners use the same system, while others use different systems. A standards-based exchange is still necessary to communicate capacity status across the disparate system boundaries. Hybrid systems are in scope.   |
|  Direct Referral                          |  A referral between a referral source (e.g., provider) and a referral target (e.g., CBO) where both entities have FHIR server APIs and an intermediary (e.g., CP) is not involved in the referral.   |
|  Indirect Referral                          | A referral between a referral source (e.g., provider) and a referral target (e.g., a CBO) that involves an intermediary (e.g., a CP) and all entities have FHIR servers APIs.  |
|  Community Resource Platform                          | A web-based application or service directory that enables individuals to search for social care services, complete screening assessments, and initiate referrals on their own behalf. In the context of the FHIR exchange, this platform functions as the **Referral Source system.   |
|  EHR System (Referral Source)                          | The system used by the provider to manage patient care and initiate referrals.  |
|  Intermediary                           |   |
|  Patient Coordination                          |   |
|  Capacity                           |   |
|  Capacity Status                         |   |
|  Referral Source                         |   |
|  Referral Target                          |   |
|  Social Care Network (SCN)                         |   |
{:.grid .center}


{% include markdown-link-references.md %}