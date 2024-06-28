Instance: ServiceRequest-supporting-info
InstanceOf: SearchParameter
Title: "ServiceRequestSupportingInfo"
Description: "Allows searching by the 'supportingInfo' references on a ServiceRequest.  Primarily used to support _include of the supportingInfo resources when retrieving a ServiceRequest."
Usage: #definition
* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/ServiceRequest-supporting-info"
* name = "ServiceRequestSupportingInfo"
* status = #active
* experimental = false
* contact.telecom.system = #url
* description = "Any resources referenced by ServiceRequest.supportingInfo"
* code = #supporting-info
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.supportingInfo"
* xpath = "f:ServiceRequest/f:supportingInfo"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true