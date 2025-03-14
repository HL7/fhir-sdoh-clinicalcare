### Purpose

The SDOHCC PractitionerRole was created due to incompatibility across different versions of US Core. In US Core 3.1.1, `PractitionerRole.code` binds to a value set using NUCC codes. US Core 6.1.0 and US Core 7.0.0 binds to a value set using SNOMED codes. To be backward compatible, SDOHCC PractitionerRole binds to both NUCC and SNOMED based value sets. Below are mappings from NUCC to SNOMED and vice versa:

[NUCC to SNOMED Mappings](http://hl7.org/fhir/us/davinci-hrex/ConceptMap/NUCC-CareTeamMemberFunction)

[SNOMED to NUCC Mappings](http://hl7.org/fhir/us/davinci-hrex/ConceptMap/CareTeamMember-NUCCFunction)

{% include markdown-link-references.md %}