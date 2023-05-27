This Implementation Guide (IG) provides recommended specifications for the synchronization of patient and Community Based Organization (CBO) applications with API data sources for SDOH information as defined in this IG.

The information below is for establishing connections to enable the exchange of information (seen in the [Referral Workflow] section.

### Requirements

The intent of this section is to further standardize the interactions between FHIR APIs and consumer or CBO applications.  To accomplish this, we recommend that the following processes **SHOULD** be supported by all referral platforms and applications to enable consistent processes to access data. The [capability statements](artifacts.html#capability-statements) provide further specifications for servers.

#### Patient/Client Applications
Interactions between FHIR-enabled Patient/Client Applications and Providers or CBOs are described in the [Patient Coordination Workflow].
This section describes the initial connection of the Patient/Client application to the referral source (Provider) or referral target (CBO) system.

1. Applications are registered with the appropriate referral platforms.
2. On the first use of the application
  * Patient/Client is provided a URL or a QR code.  The patient uses this information to either find the app and install it on their mobile device, or to launch an on-line application.  Optionally, the Patient/Client may be provided with a URL or code to identify the referral platform to the app.  Alternatively, the patient might select the clinic/facility from a list within the app.
  * Once the user has provided the information needed to connect to the referral platform, or has selected the platform, the app will attempt to access the FHIR API of the referral platform and will be redirected based on the platform's [SMART App authentication process](https://www.hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-standalone-launch).
  * On this intial authentication, the user will not yet have authorization credentials and will need to create a new 'account'.  The authorization server will verify the user's identity using credentials known to or provided by the care provider (E.g. email address, DOB, registration code, etc.).
  * Patient/Client establishes credentials (username/password) to be used in the future to authenticate the user to the application.
3. The API URL (and possibly the username and password) are stored in the application
4. When the patient/client authenticates to the application, on a timed schedule or on demand
  * Application authenticates or allows the user to authenticate to the Referral platform and receives an access token
  * The application makes use of the access token and, if necessary, refresh token to maintain an authenticated connection
5. Application queries for Tasks, ServiceRequests and other referenced data and/or updates Tasks and submits resources such as QuestionnaireResponses

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