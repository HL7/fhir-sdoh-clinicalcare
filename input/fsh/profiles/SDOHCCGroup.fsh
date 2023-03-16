Profile: SDOHCCGroup
Parent: Group
Id: SDOHCC-Group
Title: "SDOHCC Group"
Description: "Profile for identifying groups of patients who have a Social Determinants of Health (SDOH) condition and are members of a specific payer organization."
* ^status = #draft
* ^abstract = true
* . ^short = "Group of SDOH patients for a payer"
* . ^definition = "For aggregation of individuals with a common set of characteristics (i.e., the same payer and and any condition in the specified SDOH categories) to enable organizations with the appropriate permissions to easily retrieve information related to the cohort of individuals for which they have a common responsibility."
* active 1..
* active = true (exactly)
* type = #person (exactly)
* type ^short = "person"
* type ^definition = "Identifies that this is a group of persons."
* type ^requirements = "For this IG use case, this will only be used for a group of persons."
* actual = true (exactly)
* actual ^requirements = "Refers only to a specific group of real individuals."
* characteristic ^slicing.discriminator.type = #pattern
* characteristic ^slicing.discriminator.path = "code"
* characteristic ^slicing.rules = #open
* characteristic contains
    HasSDOHCondition 1..1 MS and
    HasPayer 1..1 MS
* characteristic[HasSDOHCondition] ^requirements = "To identify members who have an active instance of a condition with any Condition.category in the value set reference by Group.characteristic.value[x] (i.e., SDOH conditions)."
* characteristic[HasSDOHCondition].code = $SDOHCC-CodeSystemTemporaryCodes#sdoh-condition-category
* characteristic[HasSDOHCondition].code MS
* characteristic[HasSDOHCondition].value[x] only Reference(ValueSet)
* characteristic[HasSDOHCondition].value[x] = Reference(http://hl7.org/fhir/us/sdoh-clinicalcare/ValueSet/SDOHCC-ValueSetSDOHCategory)
* characteristic[HasSDOHCondition].value[x] MS
* characteristic[HasSDOHCondition].exclude = false (exactly)
* characteristic[HasSDOHCondition].exclude MS
* characteristic[HasSDOHCondition].period ..0
* characteristic[HasPayer] ^definition = "Identifies traits whose presence or absence is shared by members of the group."
* characteristic[HasPayer] ^requirements = "To identify members who are covered by a payer referenced by Group.characteristic.value[x]."
* characteristic[HasPayer].code = $SDOHCC-CodeSystemTemporaryCodes#payer-coverage
* characteristic[HasPayer].code MS
* characteristic[HasPayer].value[x] only Reference(USCoreOrganizationProfile)
* characteristic[HasPayer].value[x] MS
* characteristic[HasPayer].exclude = false (exactly)
* characteristic[HasPayer].exclude MS
* characteristic[HasPayer].period ..0
* member MS
* member.entity MS