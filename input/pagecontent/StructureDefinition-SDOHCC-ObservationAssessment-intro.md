### Purpose

SDOHCC Observation Assessment is intended for social risk-related Observations that involve an assessment (e.g., by a provider, payer, etc.) rather than being derived only from question-answer pairs on assessment instruments (as is the case for [SDOHCC Observation Screening Response](StructureDefinition-SDOHCC-ObservationScreeningResponse.html)).

### Usage

The `Observation.category` slice with binding to [SDOHCC ValueSet SDOH Category](ValueSet-SDOHCC-ValueSetSDOHCategory.html) allows categorization of the Observation into an SDOH category (domain). However, unlike [SDOHCC Observation Screening Response](StructureDefinition-SDOHCC-ObservationScreeningResponse.html), this profile does not have Gravity-vetted, preferred value sets in VSAC. This was intentional so as not to constrain the social risk observations that a provider might make about an individual.

Of note, Gravity Project is continuously developing terminology for new SDOH domains, and some SDOH domains may not yet be represented in [SDOHCC ValueSet SDOH Category](ValueSet-SDOHCC-ValueSetSDOHCategory.html). In this case, `Observation.category`: [sdoh-category-unspecified](CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-sdoh-category-unspecified) can be used and `Observation.category.text` can be added to further specify the domain. For example, at the time of publication of this IG, “disability-status” is not yet included in [SDOHCC ValueSet SDOH Category](ValueSet-SDOHCC-ValueSetSDOHCategory.html). In this case, `Observation.category`: [sdoh-category-unspecified](CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-sdoh-category-unspecified) can be used along with `Observation.category.text`: Disability Status. 


{% include markdown-link-references.md %}
