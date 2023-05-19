This Implementation Guide (IG) provides recommended specifications for the synchronization of patient and Community Based Organization (CBO) applications with API data sources for SDOH information as defined in this IG.

The information below is for establishing connections to enable the exchange of information (seen in the [Referral Workflow] section.

### Requirements

The intent of this section is to further standardize the interactions between FHIR APIs and consumer or CBO applications.  To accomplish this, we recommend that the following processes **SHOULD** be supported by all referral platforms and applications to enable consistent processes to access data. The [capability statements](artifacts.html#capability-statements) provide further specifications for servers.

#### Patient/Client Applications
Interactions between FHIR-enabled Patient/Client Applications and Providers or CBOs are described in the [Patient Coordination Workflow].
This section describes the initial connection of the Patient/Client application to the referral source (Provider) or referral target (CBO) system.

1. Applications are registered with the appropriate referral platforms.
2. On the first use of the application
  * Patient/Client is provided a URL or a QR code.  The patient uses this information to either find the app and install it on their mobile device, or to launch an on-line application. The App authenticates the user using credentials known to or provided by the care provider (E.g. email address, DOB, registration code, etc.).
  * Patient/Client establishes credentials (username/password) and uses them to authenticate.
3. API URL and the tokens are stored in the application
4. When the patient/client authenticates to the application, on a timed schedule or on demand
  * Application uses the URL and refresh token to obtain an access token
5. Application queries for Tasks, ServiceRequests and other referenced data.

Note: steps 3-5 are repeated for each referral source

#### CBO Applications
FHIR-enabled CBO Applications follow the [Direct Referral Light] or [Indirect Referral Light] use cases. This section describes the initial connection of the FHIR-enabled CBO application to the referral source (Provider or Coordinating Platform system).

1. Participating CBO applications are registered with the appropriate referral platforms (e.g., Epic, Unite US)
2. Referral Source provides CBO (e.g., via a QR code) with a URL to the API that redirects to an authorization server
  * CBO enters credentials provided by the referral platform
  * Application is provided with an access token and refresh token
3. API URL and the tokens are stored in the application
4. When the CBO authenticates to the application, on a timed schedule, or on demand
  * Application uses the URL and refresh token to obtain an access token
5. Application queries for relevant data including Tasks assigned to them, Tasks assigned to others, Patient (self) demographics, Goals, ServiceRequests, etc.

Note: steps 2-5 are repeated for each referral source

{% include markdown-link-references.md %}