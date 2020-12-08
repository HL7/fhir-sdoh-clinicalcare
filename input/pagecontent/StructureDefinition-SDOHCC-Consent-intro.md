### Additional Guidance

The SDOHCC Consent profile allows the representation of SDOH consent. One specific use for this profile is to represent a consent to release information on a patient to a community-based organization.  This is usually necessary when PII or PHI is moving from a HIPAA covered entity (e.g. provider) to a non-HIPAA environment. The patient must usually consent to this exchange of personal information.
The section that follows provides additional guidance on some elements in the SDOHCC Consent profile.

#### Consent.identifier

Consent.identifier should be used to provide an identifier that is recognized by the issuing organization for the specific patient.

#### Consent.status

Consent.status requires a code from the &quot;ConsentState&quot; value set. In general, Consent.status should reference the value “active” when being exchange with a community-based organization.

#### Consent.scope

Consent.scope requires a code from the &quot;ConsentScopeCodes&quot; value set to which it is bound with binding strength: Extensible. In general, Consent.scope should reference the value “Privacy Consent”.

#### Consent.category

Consent.category requires a code from the &quot;ConsentCategoryCodes&quot; value set to which it is bound with binding strength: Extensible. In general, Consent.category should reference the value “information disclosure”.

#### Consent.patient

US Core does not offer a Consent Profile. For this reason, SDOHCC Consent does not restrict Consent.patient to US Core Patient Profile. However, if an implementer is creating US Core profiles (e.g., US Core Condition, US Core Procedure, etc.) that require US Core Patient for Subject, then US Core Patient should also be used in other profiles (e.g., Observation, ServiceRequest, Consent, etc.) which do not currently specify US Core Patient.


#### Request for comments

We have not chosen to additionally constrain the Consent resource and are seeking input on the appropriateness of constraining the following elements.
* Consent.dateTime
* Consent.performer
* Consent.organizaiton
* Consent.provision
* Consent.provision.actor
* Consent.provision.action

