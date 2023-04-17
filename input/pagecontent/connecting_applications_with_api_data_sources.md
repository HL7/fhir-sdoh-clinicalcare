This Implementation Guide (IG) is providing recommended specifications for the synchronization of patient and Community Based Organization (CBO) applications with API data sources for SDOH information as defined in this IG.

The below is for establishing connections to enable the exchange of information (seen in the [Referral Workflow] section.

### Requirements

The intent of this section is to further standardize the interactions between FHIR APIs and consumer or CBO applications.  To accomplish this, we are recommending that the following processes **SHOULD** be supported by all referral platforms and applications, to enable consistent processes to access data. The [capability statements](artifacts.html#capability-statements) provide further specifications for servers.

#### Patient/Client Applications
FHIR-enabled Patient/Client Applications follows connect to Provider or CBO as described in the [Patient Coordination Workflow].
This section describes the initial connection of the the Patient/Client application to the referral source (Provider) or referral target (CBO) CBO System.

1. Applications are registered with the appropriate referral platforms.
2. On the first use of the application
  * Patient/Client is provided a URL or a QR code.  The patient passes this information to the app - by keying in the URL or by authorizing the app to take a picture of the QR code in order to download the application to their smart phone or use as a link to an on-line application.
  * Patient/Client establishes application security  **expand??**
3. Referral Source provides Patient with a URL (e.g., via a QR code) to the API that redirects to an authorization server
  * Patient enters credentials provided by the referral platform
  * Application is provided with an access token and refresh token
4. API URL and the tokens are stored in the application
5. When the patient/client authenticates to the application, on a timed schedule or on demand
  * Application uses the URL and refresh token to obtain an access token
  * ~~Application follows the Referral Source Light workflow process~~
6. **Application queries for Tasks????  "patient app might query for Tasks, Goals, Referrals"**

Note: steps 3-5 are repeated for each referral source

#### CBO Applications
FHIR-enabled CBO Applications follows the [Direct Referral Light] or [Indirect Referral Light] use cases. This section describes the initial connection of the the FHIR-enabled CPO application to the referral source (Provider or Coordinating Platform system).

1. Participating CBO applications are registered with the appropriate referral platforms **(e.g., Epic, UniteUS?)**
2. Referral Source provides ~~Patient~~ CBO (e.g., via a QR code) with a URL to the API that redirects to an authorization server
  * CBO enters credentials provided by the referral platform
  * Application is provided with an access token and refresh token
3. API URL and the tokens are stored in the application
4. When the CBO authenticates to the application, on a timed schedule, or on demand
  * Application uses the URL and refresh token to obtain an access token
5. **Application queries for Tasks???? CBO app will query for Tasks, as well as updates to data they've previously received **

Note: steps 2-4 are repeated for each referral source

{% include markdown-link-references.md %}