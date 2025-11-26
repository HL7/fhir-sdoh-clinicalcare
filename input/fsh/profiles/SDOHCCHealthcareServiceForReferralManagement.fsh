Profile: SDOHCCHealthcareServiceForReferralManagement
Parent: SDOHCCHealthcareService
Id: SDOHCC-HealthcareServiceForReferralManagement
Title: "SDOHCC Healthcare Service for Referral Management"
Description: "Profile that describes the means by which a healthcare service can be contacted."
* ^status = #active
// TODO need short and definition?
//* . ^short = "Group of SDOH patients for a payer"
//* . ^definition = "For aggregation of individuals with a common set of characteristics (i.e., the same payer and and any condition in the specified SDOH categories) to enable organizations with the appropriate permissions to easily retrieve information related to the cohort of individuals for which they have a common responsibility."
* extension contains
    SDOHCC-ExtensionHealthcareServiceCapacityStatus named capacity-status 0..1
* extension[capacity-status] ^short = "Is the service currently at capacity?"

* category 1.. MS
* category.coding 0..* MS
* category.coding ^slicing.discriminator.type = #value
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains 
    ServiceCategory 1..1 MS and
    SDOHCC 0.. MS
* category.coding[ServiceCategory] from SDOHCCValueSetServiceCategory (required)
* category.coding[SDOHCC] from SDOHCCValueSetSDOHCategory (required)
* category.coding[SDOHCC] ^short = "e.g., food-insecurity | transportation-insecurity"
* category.coding[SDOHCC] ^definition = "An SDOH category assigned to the procedure."
* category.coding[SDOHCC] ^requirements = "Allows for alternative encodings within a code system, and translations to other code systems.  \r\nCodes from this value set can be used to assign an SDOH category (e.g., food-insecurity, transportation-insecurity, etc.) to a procedure. It is recommended that SDOH category codes be used to facilitate searching for SDOH procedures that address SDOH conditions, observations, service requests, or goals."
* category.coding[SDOHCC] ^binding.description = "Codes for high-level SDOH categories."

* type 1..1 MS
* name 1.. MS

* program MS

// * characteristic MS
// * characteristic from USCoreProcedureCodes|7.0.0 (required) // code from $us-core-procedure-code (preferred)
// * characteristic ^binding.extension.extension[0].url = "purpose"
// * characteristic ^binding.extension.extension[=].valueCode = #current
// * characteristic ^binding.extension.extension[+].url = "valueSet"
// * characteristic ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code|7.0.0"
// * characteristic ^binding.extension.extension[+].url = "documentation"
// * characteristic ^binding.extension.extension[=].valueMarkdown = "US Core uses the current additional binding from FHIR R5 for this coded element for more flexibility when exchanging legacy and text-only data."
// * characteristic ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
// * characteristic ^binding.description = "Codes describing the type of  Procedure"

// * characteristic ^definition = "The specific procedure that is performed. Use text if the exact nature of the procedure cannot be coded."

// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, digital-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.235, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, digital-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.226, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, educational-attainment, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.56, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, elder-abuse, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.67, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, employment-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.59, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, financial-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.32, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, food-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.7, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, health-insurance-coverage-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.125, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, homelessness, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.20, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, housing-instability, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.44, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, inadequate-housing, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.52, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, incarceration-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.260, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, intimate-partner-violence, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.97, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, language-access, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.268, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, material-hardship, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.39, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, medical-cost-burden, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.122, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, personal-health-literacy, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.118, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, social-connection, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.94, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, stress, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.87, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, transportation-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.27, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, utility-insecurity, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.247, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, veteran-status, http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.90, extensible)
// * insert AdditionalBinding(SDOHCCHealthcareServiceForReferralManagement, characteristic, HealthcareService.category, sdoh-category-unspecified, http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code|7.0.0, required)