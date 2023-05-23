### Patient Privacy and Consent
The Gravity Project recognizes the need to appropriately manage privacy and consent related to a patient's social risk issues.  This IG assumes that each organization has appropriate mechanisms in place to secure SDOH information and will only release it with appropriate consent.  The [Office of the National Coordinator (ONC)](https://www.healthit.gov/) and [HL7 International (HL7)](http://www.hl7.org/index.cfm), and the [Office of Civil Rights (OCR)](https://www.hhs.gov/ocr/index.html) (this is not an exhaustive list) have active programs in place to determine what needs to be done to protect all personal information (including SDOH) from inappropriate disclosure and use.

Sharing data with CBOs and CPs must be done in conformance with HIPAA requirements.  Under HIPAA the disclosing party needs to acquire and maintain a record of the patient's consent.
Although CBOs and CPs are not 'covered entities' under HIPAA,
sharing with them can be facilitated by a Business Associate Agreement (BAA) between the covered entity (Providers, Payers and Clearing Houses) and the Business Associate.
Entities covered under a BAA may be able to receive Protected Health Information (PHI) as part of the agreement without consent of the patient. However, they are required to observe the same limitations as covered entities with regard to the protection and disclosure of PHI.  Patient consent would generally be required for a provider to disclose a patient's PHI to a CBO or CP that is neither a covered entity nor covered by a BAA.  CPOs and CPs should only be authorized to access patient data for those patients with whom they have a relationship, and access to each patient's data is restricted to those data elements needed for the referral task, as described in the [Authorization and Access Control](http://hl7.org/fhir/R4/security.html#binding) section of FHIR Security.

 In this version of the IG, we are providing a [profile of the FHIR Consent resource][SDOHCCConsent]  that can be exchanged between a [Covered Entity](https://www.hhs.gov/hipaa/for-professionals/covered-entities/index.html) and a [Business Associate (BA)](https://www.hhs.gov/hipaa/for-professionals/privacy/guidance/business-associates/index.html) when the patient has authorized the BA to release their information to a non-HIPAA covered entity.  The BA can use the provided consent in lieu of obtaining consent directly from the patient, reducing burden on the patient and BA.  Exchanging the consent obtained by the referring party is therefore a convenience, not a requirement.  While this is not a complete treatment of the issues related to consent, it is a starting point to test the viability of exchanging consent information.

 The Consent is referenced indirectly (via ServiceRequest) from the [SDOHCC Task For Referral Management] that is exchanged as part of the referral, and can be retrieved by the referral recipient through FHIR queries.   These relationships are shown in [Data Modeling Framework].

### Statutes, Regulations, and Guiding Principles
All implementations of the SDOH ClinicalCare FHIR Implementation Guide (IG)
* **SHALL** meet all current relevant Federal and State statutes and regulations regarding security and privacy.
* **SHALL** use applicable technical standards required by current regulations published by CMS and ONC (allowing for voluntary use through the the [Standards Version Advancement Process (SVAP)](https://www.healthit.gov/isa/standards-version-advancement-process#:~:text=ONC%20has%20established%20the%20voluntary,of%20Certification%20requirement%20(%C2%A7%20170.405))) unless an exception has been granted.
* **SHOULD** follow the [Gravity Project Data Principles](https://confluence.hl7.org/display/GRAV/Gravity+Data+Principles) when the final version is published.
* **SHALL** support patient/member consent and/or treatment of sensitive information consistent with Federal and State statutes and regulations.
* **SHOULD** support the consent and data sharing policies of trading partners involved in the exchange that are more protective so long as policies are consistent with or more restrictive than Federal and State statutes and regulations.

### FHIR Security and Implementation Guidance
All implementations of the SDOH ClinicalCare FHIR Implementation Guide (IG) **SHOULD** follow the FHIR Security guidance and FHIR Implementer’s Safety guidance as defined in the relevant FHIR specification (e.g., Release 4.1.0) where applicable and not superseded by this Section or specific IG requirements.

The FHIR Security specification provides guidance related to communication security, authentication, authorization/access control, audit, digital signatures, attachments, labels, narrative, and input validation. The FHIR security specification is available [here](http://hl7.org/fhir/R4/security.html)

The FHIR Implementer’s Safety specification is a check list to help implementers be sure that they have considered all the parts of FHIR that impact their system design regarding safety. The FHIR safety check list is available [here](http://hl7.org/fhir/R4/safety.html).

### Security/Privacy Related Technologies Including Explicit Consent and Security Labels
As of May 2020, ONC has elected to not require either Data Labeling or Consent Directives as part of the [Final Rule for the 21st Century Cures Act](https://www.federalregister.gov/documents/2020/05/01/2020-07419/21st-century-cures-act-interoperability-information-blocking-and-the-onc-health-it-certification).

At present there is no explicit regulatory requirement for the use of these technologies.

However, to meet the statutes, regulations, and guiding principles above, consent directives and security labels MAY be considered and used.

Organizations which plan to take advantage of these additional capabilities are responsible for negotiating support for these mechanisms between trading partners. The FHIR implementation guide defining the recommended standard is the [FHIR Data Segmentation for Privacy IG](http://hl7.org/fhir/uv/security-label-ds4p/).

### Exchange Security
When exchanging PHI between entities, the exchange **SHOULD** use the current version and **SHALL** use either current or the immediately prior release of [Transport Level Security (TLS)](https://datatracker.ietf.org/doc/html/rfc8446) as specified by the current release of NIST guidelines ([SP 800-52](https://csrc.nist.gov/publications/detail/sp/800-52/rev-2/final)).
When the identity of the requesting or receiving party is important, implementations **SHOULD** use one or more of the following:
* the [SMART on FHIR Framework](http://docs.smarthealthit.org/),
* mutually authenticated TLS,
* the ONC FHIR At Scale Taskforce (FAST) security tiger team recommended solutions, or
* the OAuth Server to Server Authentication as defined in the [Bulk Data exchange IG].
Note: There is ongoing work to enhance the capabilities of the above specifications to ensure a more secure exchange that recognizes issues related to fine grain scopes.

### Additionally Protected Information
Additionally protected information may include items defined by Federal (e.g., 42 CFR Part 2), State (e.g., many states protect substance abuse disorder, HIV diagnosis/treatment records, release of information on minors – note this is not an exhaustive list) statutes and regulations. In addition, organizations may provide for additional protection for specific types of information that are deemed sensitive to the individual (e.g., SDOH information). The following guidelines apply unless otherwise dictated by statute or regulation:

Where permitted by law and in accordance with legal requirements and, where appropriate, consent of the individual, release of additionally protected information **SHALL** always be supported.
Release of the information without explicit request of the patient/member **SHALL** be based on organization policy consistent with Federal and State regulations. Examples are legal requests for information (HIPAA includes specific guidelines around who and which entities are duly authorized to make such requests and processes that must be followed at 45 CFR 164.512(e)-(f)) and “break glass” to treat a patient that is unable to provide consent (HIPAA speaks to the conditions that allow covered entities to use or disclose PHI when an individual is incapacitated at 45 CFR 164.510(a)(3)).

{% include markdown-link-references.md %}