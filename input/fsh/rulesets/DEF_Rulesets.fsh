RuleSet: SliceReferenceOnProfile(path)
* {path} ^slicing.discriminator.type = #profile
* {path} ^slicing.discriminator.path = "$this.resolve()"
* {path} ^slicing.rules = #open
* {path} ^slicing.description = "Slicing based on profile conformance of the referenced resource."


RuleSet: OwningCommitteeExtension
* ^extension[$WG-extension].valueCode = #pc


RuleSet: AdditionalBinding(profile, elementPath, usagePath, usageCategory, valueSet, binding)
* {elementPath} ^binding.extension[+].url = $add-binding
* {elementPath} ^binding.extension[=].extension[0].url = "key"
* {elementPath} ^binding.extension[=].extension[=].valueId = {usageCategory}
* {elementPath} ^binding.extension[=].extension[+].url = "purpose"
* {elementPath} ^binding.extension[=].extension[=].valueCode = #{binding}
* {elementPath} ^binding.extension[=].extension[+].url = "valueSet"
* {elementPath} ^binding.extension[=].extension[=].valueCanonical = {valueSet}
* {elementPath} ^binding.extension[=].extension[+].url = "usage"
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.system = Canonical({profile})
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.code = #{usagePath}
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept = SDOHCCCodeSystemTemporaryCodes#{usageCategory} // This is not official display. Need to support display? "{profile} {usageCategory} ValueSet"
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept.text = "{usageCategory}"

RuleSet: AdditionalBindingPractitionerRole(elementPath, binding, valueSet)
//* obeys hrex-pr-1
* {elementPath} ^binding.extension[+].url = $additional-binding
* {elementPath} ^binding.extension[=].extension[0].url = "key"
* {elementPath} ^binding.extension[=].extension[=].valueId = {usageCategory}
* {elementPath} ^binding.extension[=].extension[+].url = "purpose"
* {elementPath} ^binding.extension[=].extension[=].valueCode = #{binding}
* {elementPath} ^binding.extension[=].extension[+].url = "valueSet"
* {elementPath} ^binding.extension[=].extension[=].valueCanonical = {valueSet}