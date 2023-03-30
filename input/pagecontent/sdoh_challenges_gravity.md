### Why Social Determinants of Health Matter

The influence of social determinants on outcomes is increasingly recognized in emerging payment reform programs, federal and state-based policies, and information technology initiatives.  Social determinants of health (SDOH) are defined by the [World Health Organization](https://www.who.int/) as the conditions in which people are born, live, work, and age.

The growing awareness around SDOH has contributed to efforts to address actionable social risk factors through the health care delivery system.  Recommendations from national groups, including the [American Academy of Pediatrics](https://www.aap.org/), [American Academy of Family Physicians](https://www.aafp.org/), [Agency for Healthcare Research and Quality](https://www.ahrq.gov/), [National Quality Forum (NQF)](https://www.qualityforum.org/), and [Institute for Health Care Improvement](http://www.ihi.org/) underscore the various roles the health care system could play in helping to identify and address patients' social risks and needs.[^1]

{% include img.html img="Whatgoesintoyourhealth.jpg" caption="Figure 1: What goes into your health? An illustration of the impact health care has on a person’s health versus non-healthcare factors.<sup>1</sup>" %}

There is growing awareness that social risks negatively impact health outcomes and that addressing social risks improves health outcomes.  For example:
* Food insecurity correlates with higher levels of diabetes, hypertension, and heart failure
* Housing instability factors into lower treatment adherence
* Transportation barriers result in missed appointments, delayed care, and lower medication compliance

Addressing SDOH is a primary approach to achieve health equity. See National Center for HIV, Viral Hepatitis, STD, and TB Prevention (NCHHSTP) Social Determinants of Health, [Frequently Asked Questions](https://www.cdc.gov/nchhstp/socialdeterminants/faq.html)

These national calls to action for health care systems have spurred innovations, including a wide range of social care assessment instruments and practice-based interventions.   Some of these innovations have helped to reduce social risks, improve outcomes, and lower costs.   The experimentation in this area has been bolstered by new value-based payment models and accountable care organizations (ACOs), which together offer financial incentives to advance coordinated care between medical and social service organizations and other organizations directly connected to patients.
### Challenges of SDOH Data Interoperability
The systematic documentation and aggregation of SDOH data in EHRs and related systems is limited due to the following:

1.	Limited understanding by the health system of the value and use of such data for clinical care and population health management.
2.	Capture of SDOH data in unstructured and non-standardized formats inhibits the ability to normalize, exchange, and aggregate the data regardless of the data source.
3.	Gaps in and overlap between existing terminologies and codes available to represent SDOH-related activities undertaken in clinical delivery settings.

Based on the growing collection of social risk data in health care systems, an immediate opportunity exists to support data collection, data aggregation, data sharing, quality measurement, benchmarking, and risk adjustment.   Many assessment tools are currently in use, but the concepts addressed vary, and some tools merit further validation and testing across a variety of settings and clinical workflows.  Health IT can play a critical, untapped role in enabling the seamless electronic exchange and use of this data.  However, standardization and harmonization of SDOH concepts, regardless of the social risk assessment tool used, requires a consensus-based approach to maximize buy-in, consistency of implementation, and usefulness of data collected.

### Gravity Project Overview
The [Gravity Project](https://thegravityproject.net/) was initiated by the [Social Interventions Research and Evaluation Network (SIREN)](https://chc.ucsf.edu/siren) with support from the [Robert Wood Johnson Foundation](https://www.rwjf.org/).   The Gravity Project mission is to create and maintain a consensus-building community to expand available SDOH Core Data for Interoperability and accelerate standards-based information exchange by using HL7 FHIR. The Gravity Project aims to standardize medical codes to facilitate the use of social determinants of health-related data in patient care, care coordination between the health and human services sectors, population health management, value-based payment, and clinical research.

The Gravity Project currently has three workstreams as shown in the figure below.  The [Terminology Workstream](https://confluence.hl7.org/display/GRAV/Terminology+Workstream+Dashboard)
develops terminology resources that are published via the [Value Set Authority Center (VSAC)][VSAC] that support capture of SDOH-related data.  The [Technical workstream](https://confluence.hl7.org/display/GRAV/Technical+Workstream+Dashboard) developed this FHIR Implementation Guide (IG) and coordinates with other FHIR IG development projects.

The [Pilot testing workstream](https://confluence.hl7.org/display/GRAV/Gravity+Project+Pilots+Affinity+Group+Home) works with partners to test and provide feedback on the Gravity-developed Terminology Resources and FHIR IG specifications.

{% include img-medsmall.html img="GravityProject.png" caption="Figure 2: Gravity Project Workstreams" %}

For more information about Gravity see the Gravity project [website](https://thegravityproject.net/) or [confluence site](https://confluence.hl7.org/display/GRAV/Join+the+Gravity+Project).

----------------------------------------------------------------------
[^1]: Source: Institute for Clinical Systems Improvement.  Going Beyond Clinical Walls.  Solving Complex Problems (Octoboer 2014).  The BridgeSpan Group.

{% include markdown-link-references.md %}