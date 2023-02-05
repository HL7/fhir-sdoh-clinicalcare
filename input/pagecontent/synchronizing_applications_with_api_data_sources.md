This Implementation Guide (IG) is providing recommended specifications for the synchronization of patient and Community Based Organization (CBO) applications with API data sources for SDOH information as defined in this IG.

The below is for establishing connections to enable the exchange of information (seen in the [Exchange Workflow](exchange_workflow.html) page and with additional guidance in [Functional Use Cases](functional_use_cases.html)).

### Requirements

The intent of this section is to further standardize the interactions between FHIR APIs and consumer or CBO applications.  To accomplish this, we are recommending that the following processes **SHOULD** be supported by all referral platforms and applications, to enable consistent processes to access data. The [capability statements](artifacts.html#behavioral-capability-statements) provide further specifications for servers.

#### Patient/Client Applications

1) Applications are registered with the appropriate referral platforms.

2) On the first use of the application

- Patient/Client is provided a URL to download the application to their smart phone or a link to an on-line application.
- Patient/Client establishes application security

3) Referral Source provides Patient with a URL to the API that redirects to an authorization server

- Patient enters credentials provided by the referral platform
- Application is provided with an access token and refresh token

4) API URL and the tokens are stored in the application

5) When the patient/client authenticates to the application, on a timed schedule or on demand

- Application uses the URL and refresh token to obtain an access token
- Application follows the Referral Source Light workflow process

Note: steps 3-5 are repeated for each referral source

#### CBO Applications

1) Participating CBO applications are registered with the appropriate referral platforms

2) Referral Source provides Patient with a URL to the API that redirects to an authorization server

- CBO enters credentials provided by the referral platform
- Application is provided with an access token and refresh token

3) API URL and the tokens are stored in the application

4) When the CBO authenticates to the application, on a timed schedule, or on demand

- Application uses the URL and refresh token to obtain an access token
- Application follows the Referral Source Light workflow process

Note: steps 2-4 are repeated for each referral source