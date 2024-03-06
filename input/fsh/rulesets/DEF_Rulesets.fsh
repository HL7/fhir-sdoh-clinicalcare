RuleSet: SliceReferenceOnProfile(path)
* {path} ^slicing.discriminator.type = #profile
* {path} ^slicing.discriminator.path = "$this.resolve()"
* {path} ^slicing.rules = #open
* {path} ^slicing.description = "Slicing based on profile conformance of the referenced resource."


RuleSet: OwningCommitteeExtension
* ^extension[$WG-extension].valueCode = #pc


RuleSet: AdditionalBinding(profile, elementPath, usagePath, usageCategory, valueSet)
* {elementPath} ^binding.extension[+].url = $add-binding
* {elementPath} ^binding.extension[=].extension[0].url = "purpose"
* {elementPath} ^binding.extension[=].extension[=].valueCode = #extensible
* {elementPath} ^binding.extension[=].extension[+].url = "valueSet"
* {elementPath} ^binding.extension[=].extension[=].valueCanonical = {valueSet}

* {elementPath} ^binding.extension[=].extension[+].url = "documentation"
* {elementPath} ^binding.extension[=].extension[=].valueMarkdown = "{profile} {usageCategory}"
* {elementPath} ^binding.extension[=].extension[+].url = "shortDoco"
* {elementPath} ^binding.extension[=].extension[=].valueString = "Use when `{usagePath}` = `{usageCategory}`"

* {elementPath} ^binding.extension[=].extension[+].url = "usage"
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.system = Canonical({profile})
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.code = #{usagePath}
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept = SDOHCCCodeSystemTemporaryCodes#{usageCategory} // This is not official display. Need to support display? "{profile} {usageCategory} ValueSet"
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept.text = "{profile} {usageCategory} ValueSet"