### Purpose

SDOHCC Observation Assessment is intended for social risk-related Observations that involve an assessment (e.g., by a provider, payer, etc.) rather than being derived only from question-answer pairs on assessment instruments (as is the case for [SDOHCC Observation Screening Response]).

### Usage

Rather than offer separate SDOHCC Observation Assessment profiles for each SDOH category (domain) covered in this IG (e.g., food insecurity, transportation insecurity, etc.), this profile supports any SDOH category. The Observation.category slice with binding to [SDOHCC ValueSet SDOH Category] allows categorization of the Observation into an SDOH category (domain). However, unlike [SDOHCC Observation Screening Response], this profile does not have Gravity-vetted, preferred value sets in VSAC. This was intentional since it would be very difficult to define value sets to constrain all social risk observations that might be made about an individual.

{% include markdown-link-references.md %}
