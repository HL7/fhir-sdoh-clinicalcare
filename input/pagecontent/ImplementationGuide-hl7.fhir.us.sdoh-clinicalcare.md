
|||
|---|---|
|*Official URL*: {{ site.data.ig.url }}|*Version*: {{ site.data.ig.version }}|
|*NPM package name*: {{ site.data.ig.packageId }}|*ComputableName*: {{ site.data.ig.name }}|
|*Copyright/Legal*: Used by permission of HL7 International, all rights reserved Creative Commons License|
{:.grid}

{{ site.data.ig.description }}

- [XML](ImplementationGuide-hl7.fhir.us.sdoh-clinicalcare.xml)
- [JSON](ImplementationGuide-hl7.fhir.us.sdoh-clinicalcare.json)

### Cross Version Analysis

{% capture cross-version-analysis %}{% lang-fragment cross-version-analysis.xhtml %}{% endcapture %}{{ cross-version-analysis | remove: '<p>' | remove: '</p>'}}

### IG Dependencies

This IG Contains the following dependencies on other IGs.

{% lang-fragment dependency-table.xhtml %}

### Global Profiles

{% lang-fragment globals-table.xhtml %}

### Copyrights

{% capture ip-statement %}{% lang-fragment ip-statements.xhtml %}{% endcapture %}

{{ ip-statement | remove: '<p>' | remove: '</p>'}}

### Parameter Settings

The following [IG Parameters](https://confluence.hl7.org/display/FHIR/Implementation+Guide+Parameters) are set for this Implementation Guide:

{% for p in site.data.ig.definition.parameter %}
- code: {{p.code}}<br/>value: {{p.value }}
{%- endfor -%}

### Expansion Parameters

In HL7 FHIR, expansion parameters are special query parameters that you can pass to a ValueSet $expand operation to control and customize how the ValueSet is expanded (i.e., how the full list of codes/concepts is generated from the ValueSet definition). Gravity SDOH Clinical Care uses the following parameters.

{% include expansion-params-en.xhtml %}
