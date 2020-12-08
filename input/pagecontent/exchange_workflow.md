[Previous Page - Support for Multiple Domains](support_for_multiple_domains.html)

# Exchange Workflow

The following diagram depicts the primary exchange workflows that are anticipated by the current version this IG.

1. The patient interacts with the provider and takes a risk survey that creates the specific health concerns defined by the survey and the patient's responses.
2. The provider and patient establish goals and agree on the specific referrals/interventions/exchanges (not depicted in this diagram) and the patient provides consent to share information with the relevant organizations.
3. The Provider's System provides (via a FHIR API) the ability to share information with:
	*  Community Based Organization (CBO) -- share Task and ServiceRequest and allow the CBO to respond by updating the Task status and providing feedback on the service(s) performed (Procedure(s)).
	*  Community Based Social Care Services Platform (CBSC) -- share Task and ServiceRequest and allow the CBSC to respond by updating the Task status and providing feedback on the service(s) performed (Procedure(s)).
			Note: Typically, the CBSC interacts with the Patient and CBOs to perform the requested referrals/services using a variety of methods.
	*  Responsible Payer -- provide access to health concerns (Problems) and Interventions to faciliate shared care planning for the covered member.

<table><tr><td><img src="Exchange Workflow.png" /></td></tr></table>


[Next Page - Privacy and Security](privacy_and_security.html)