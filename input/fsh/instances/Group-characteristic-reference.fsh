Instance: Group-characteristic-reference
InstanceOf: SearchParameter
Title: "SDOHCC Group Characteristic Reference Search Parameter"
Description: """
Allows Group resources to be searched by a reference-valued
Group.characteristic.value[x]. This provides the R4 equivalent of the
R5 Group characteristic-reference search parameter.
"""
Usage: #definition

* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/Group-characteristic-reference"
* name = "SDOHCCGroupCharacteristicReference"
* status = #active
* experimental = false
* description = "An entity referenced in a Group characteristic."
* purpose = """
Supports searching SDOHCC Groups by reference-valued characteristics,
including the payer Organization identified by the HasPayer slice.
The R4 characteristic-value composite does not index Reference values.
"""
* code = #characteristic-reference
* base = #Group
* type = #reference
* expression = "Group.characteristic.value.ofType(Reference)"
* xpath = "f:Group/f:characteristic/f:valueReference"
* xpathUsage = #normal
* multipleOr = false
* multipleAnd = false