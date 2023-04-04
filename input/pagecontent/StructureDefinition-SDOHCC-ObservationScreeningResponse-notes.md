
### General Guidance For Preferred Value Sets For SDOHCC Observation Screening Response

The minimum value set bindings for Observation.code and Observation.value are specified in the profile. However, for each SDOH category (domain) covered in this IG, there are also category-specific, preferred value sets. For an observation instance, selecting a category-specific code (e.g., food-insecurity, transportation-insecurity) from the [SDOHCC ValueSet SDOH Category](ValueSet-SDOHCC-ValueSetSDOHCategory.html) bound to Observation.category will determine the preferred, category-specific value sets for Observation.code and Observation.value. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

Codes in the category-specific, preferred value sets are from LOINC-encoded assessment instruments that have been vetted as face-valid by the Gravity Project. For the list of assessment instruments from which Gravity has chosen questions, see the [Social Determinants of Health Screening Assessments](broken.html) value set which is hosted in the NIH Value Set Authority Center ([VSAC]). For each Gravity-vetted assessment instrument, the questions are also vetted and only those that also meet Gravity criteria are included in the preferred value sets.

### Guidance on Category-specific Preferred Value Set Naming Conventions, Content, and Usage
For category-specific, preferred value sets for this profile, Table 1 provides guidance on naming conventions, content, and usage. Table 2 provides links to the category-specific preferred value sets in VSAC and to accompanying category-specific Assessment Instrument Spreadsheets on the Gravity Project Confluence page.

| Value Set Naming Pattern                       | Value Set Contains                                                                                                                                                                                                                                           | Value Set Usage Guidance                                                                                                                                                                                                                                                                                                                                                                                                    |
|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                                                |
| <Category> Screening Assessments Questions     | LOINC codes for the preferred, category-specific questions selected from the Assessment Instruments.                                                                                                                                                         | For an SDOHCC Observation Screening Response that represents a question and its coded answer, Observation.code SHOULD be a LOINC question code from this value set and Observation.value SHOULD be a LOINC answer code from the <Category> Screening Assessments Answers value set (described below).                                                                                                                       |
|                                                |
| <Category> Screening Assessments               | LOINC codes for the assessment instruments (LOINC panels) from which the preferred, category-specific questions have been selected.                                                                                                                          | For an SDOHCC Observation Screening Response that is an Observation Grouping, Observation.code SHOULD use panel LOINC codes from this value set. An Observation Grouping does not have an Observation.value. Instead, an Observation Grouping (via Observation.hasMember) references all Observations generated from a specific assessment instrument. See [SDOHCC Observation Response Hunger Vital Sign Grouping Example].  |
|                                                |
| <Category> Screening Assessments And Questions | All codes in <Category > Screening Assessments Questions value set (LOINC question codes) AND <Category> Screening Assessments value set (LOINC panel codes).                                                                                                |
|                                                | For SDOHCC Observation Screening Response, this is the complete set of preferred values allowed for Observation.code for a category-specific Observation and can be used to validate that Observation.code is from a preferred, category-specific value set. |
|                                                |
| <Category> Screening Assessments Answers       | LOINC answer codes for the preferred, category-specific questions.                                                                                                                                                                                           | For an SDOHCC Observation Screening Response that represents a question and a coded answer, Observation.code SHOULD be a LOINC question code from the <Category> Screening Assessments Questions value set and Observation.value SHOULD be a LOINC answer code from the <Category> Screening Assessments Answers value set.                                                                                                 |
{.:grid}

### Guidance For Preferred Value Sets For Observation.code

In the Value Set names below,  \<Category-specific\> is a placeholder for a specific SDOH category (e.g., Food Insecurity).

 **\<Category-specific\> Screening Assessments** Questions Value Set – Contains LOINC codes for the preferred, category-specific questions selected from the Assessment Instruments.

For an SDOHCC Observation Screening Response that represents a question and its coded answer, Observation.code SHOULD be a LOINC question code from this value set and Observation.value SHOULD be a LOINC answer code from the  \<Category-specific\> Screening Assessments Answers Value Set (described below).

 **\<Category-specific\> Screening Assessments**  Value Set – Contains LOINC codes for the assessment instruments (LOINC panels) from which the preferred, category-specific questions have been selected.

For an SDOHCC Observation Screening Response that is an Observation Grouping, Observation.code SHOULD use panel LOINC codes from this value set. An Observation Grouping does not have an Observation.value.

Instead, an Observation Grouping (via Observation.hasMember) references all Observations generated from a specific assessment instrument. See [SDOHCC Observation Response Hunger Vital Sign Grouping Example][SDOHCC-ObservationResponseHungerVitalSignGroupingExample].

 **\<Category-specific\> Screening Assessments And Questions** Value Set – Contains all codes in  \<Category-specific\> Screening Assessments Questions Value Set (LOINC question codes) AND  \<Category-specific\> Screening Assessments Value Set (LOINC panel codes).

For SDOHCC Observation Screening Response, this is the complete set of preferred values allowed for Observation.code for a category-specific Observation and can be used to validate that Observation.code is from a preferred, category-specific value set.

### Guidance For Preferred Value Sets For Observation.value

 **\<Category-specific\> Screening Assessments Answers** Value Set – Contains LOINC answer codes for the preferred, category-specific questions.

For an SDOHCC Observation Screening Response that represents a question and a coded answer, Observation.code SHOULD be a LOINC question code from the  \<Category-specific\> Screening Assessments Questions Value Set and Observation.value SHOULD be a LOINC answer code from this value set.

Of note, each question (Observation.code) has a subset of allowed answers (Observation.value) and, the allowed answers for a specific question may vary depending on the assessment instrument (LOINC panel) on which the question is presented (e.g., [`88122-7`](https://loinc.org/88122-7) "Within the past 12 months we worried whether our food would run out before we got money to buy more [U.S. FSS]" has 4 possible answers on [Hunger Vital Sign (HVS)](https://loinc.org/88121-9) panel versus three possible answers on the [American Academy of Family Physicians Social Needs Screening Tool](https://loinc.org/99593-6)). For this reason, the category-specific Assessment Instrument Spreadsheets (last column in Table below) provide additional information to link specific assessment instruments to questions and their allowed LOINC Answer Lists. LOINC also provides Answers Lists for questions from specific assessment instruments (panels).

For additional information on fields in the Assessment Instrument Spreadsheets, see [Assessment Instrument Spreadsheet Guidance] on the Gravity Project Confluence site.

### Links to Category-specific Preferred Value Sets and Assessment Instrument Spreadsheets

Key for the “ValueSet for” Column: For readability, the formal names of these value sets in VSAC are shortened in the Table as follows:
* Panels and Questions =  \<Category-specific\> Screening Assessments And Questions
(Example: The formal name in VSAC for the Questions and Panels Value Set for Food insecurity is “Food Insecurity Screening Assessments And Questions”.)
* Panels =  \<Category-specific\> Screening Assessments
* Questions =  \<Category-specific\> Screening Assessments Questions
* Answers =  \<Category-specific\> Screening Assessments Answers Value Set

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
	<caption>Category-specific Preferred Value Sets and Assessment Instrument Spreadsheets</caption>
	<tbody>
		<tr>
			<td>Observation.category</td>
			<td>Element binding</td>
			<td>VSAC ValueSet for</td>
			<td>VSAC OID</td>
			<td>Assessment Instrument Spreadsheets</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-educational-attainment">educational-attainment</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="broken.html">Panels and Questions</a></td>
			<td>missing</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Educational Attainment Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="broken.html">Panels</a></td>
			<td>missing</td>
		</tr>
		<tr>
			<td><a href="broken.html">Questions</a></td>
			<td>missing</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="broken.html">Answers</a></td>
			<td>missing</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-elder-abuse">elder-abuse</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.191/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.191</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Elder Abuse Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.144/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.144</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.189/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.189</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.190/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.190</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-employment-status">employment-status</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.205/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.205</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Employment Status Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.133/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.133</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.171/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.171</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.183/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.183</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-financial-insecurity">financial-insecurity</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.193/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.193</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Financial Insecurity Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.138/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.138</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/22.16.840.1.113762.1.4.1196.3483/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1196.3483</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.173/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.173</td>
		</tr>
			<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.2.16.840.1.113762.1.4.1247.194/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.194</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Food Insecurity Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.138/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.127</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.3484/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1196.3484</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.174/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.174</td>
		</tr>		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-health-insurance-coverage-status">health-insurance-coverage-status</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.3519/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1196.3519</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Health Insurance Coverage Status Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.138/expansion/Latest/expansion/Latest">Panels</a></td>
			<td>https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.138/expansion/Latest</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.186/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.186</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.185/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.185</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-personal-health-literacy">personal-health-literacy</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.195/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.195</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Health Literacy Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.141/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.141</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.3485/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1196.3485</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.175/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.175</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.196/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.196</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Homelessness Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.129/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.129</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.3486/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1196.3486</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.176/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.176</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.197/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.197</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Housing Instability Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.130/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.130</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.3487/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1196.3487</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.177/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.177</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-inadequate-housing">inadequate-housing</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.3520/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1196.3520</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Inadequate Housing Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.131/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.131</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.167/expansion/Latest">Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.167</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.178/expansion/Latest">Answers</a></td>
			<td>2.16.840.1.113762.1.4.1247.178</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-intimate-partner-violence">intimate-partner-violence</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.198/expansion/Latest">Panels and Questions</a></td>
			<td>2.16.840.1.113762.1.4.1247.198</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Intimate Partner Violence Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.140/expansion/Latest">Panels</a></td>
			<td>2.16.840.1.113762.1.4.1247.140</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/missing/expansion/Latest">Questions</a></td>
			<td>missing</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/missing/expansion/Latest">Answers</a></td>
			<td>missing</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-material-hardship">material-hardship</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.140/expansion/Latest">Panels and Questions</a></td>
			<td>missing</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Material Hardship Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.140/expansion/Latest">Panels</a></td>
			<td>missing</td>
		</tr>
		<tr>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.140/expansion/Latest">Questions</a></td>
			<td>missing</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.140/expansion/Latest">Answers</a></td>
			<td>missing</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-medical-cost-burden">medical-cost-burden</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="broken.html">Panels and Questions</a></td>
			<td>OID-5</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Medical Cost Burden Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="broken.html">Panels</a></td>
			<td>OID-6</td>
		</tr>
		<tr>
			<td><a href="broken.html">Questions</a></td>
			<td>OID-7</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="broken.html">Answers</a></td>
			<td>OID-8</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-social-connection">social-connection</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="broken.html">Panels and Questions</a></td>
			<td>OID-5</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Social Connection Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="broken.html">Panels</a></td>
			<td>OID-6</td>
		</tr>
		<tr>
			<td><a href="broken.html">Questions</a></td>
			<td>OID-7</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="broken.html">Answers</a></td>
			<td>OID-8</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-stress">stress</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="broken.html">Panels and Questions</a></td>
			<td>OID-5</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Stress Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="broken.html">Panels</a></td>
			<td>OID-6</td>
		</tr>
		<tr>
			<td><a href="broken.html">Questions</a></td>
			<td>OID-7</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="broken.html">Answers</a></td>
			<td>OID-8</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-transportation-insecurity">transportation-insecurity</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="broken.html">Panels and Questions</a></td>
			<td>OID-5</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Transportation Insecurity Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="broken.html">Panels</a></td>
			<td>OID-6</td>
		</tr>
		<tr>
			<td><a href="broken.html">Questions</a></td>
			<td>OID-7</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="broken.html">Answers</a></td>
			<td>OID-8</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-veteran-status">veteran-status</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="broken.html">Panels and Questions</a></td>
			<td>OID-5</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Veteran Status Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="broken.html">Panels</a></td>
			<td>OID-6</td>
		</tr>
		<tr>
			<td><a href="broken.html">Questions</a></td>
			<td>OID-7</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="broken.html">Answers</a></td>
			<td>OID-8</td>
		</tr>
				<tr>
			<td><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-sdoh-category-unspecified">sdoh-category-unspecified</a></td>
			<td colspan="5" rowspan="1">Category-specific value sets not applicable</td>
		</tr>
	</tbody>
</table>

Of note, Grouper VSAC value sets containing the members of all the category-specific value sets for Observation.code and Observation.value are available here:

* For Observation.code:
  * [Social Determinants of Health Screening Assessments And Questions](broken.html) Value Set
  * [Social Determinants of Health Screening Assessments Questions] Value Set
  * [Social Determinants of Health Screening Assessments] Value Set
* For Observation.value: [Social Determinants of Health Screening Assessments Answers] Value Set

### Guidance on Category-specific Assessment Instrument Spreadsheets

Each question (Observation.code) on an assessment instrument has a set of allowed answers (Observation.value). The allowed answers for a specific question may vary depending on the assessment instrument (LOINC panel) on which the question is presented (e.g., [88122-7](https://loinc.org/88122-7) "Within the past 12 months we worried whether our food would run out before we got money to buy more [U.S. FSS]" has 4 possible answers on the [Hunger Vital Sign (HVS)](https://loinc.org/88121-9) panel versus three possible answers on the [American Academy of Family Physicians Social Needs Screening Tool](https://loinc.org/99593-6)). For this reason, the category-specific Assessment Instrument Spreadsheets (last column in Table 2 below) provide additional information to link specific assessment instruments to questions and their allowed LOINC Answer Lists. LOINC also provides Answers Lists for questions from specific assessment instruments (panels).

​For additional information on fields in the Assessment Instrument Spreadsheets, see [Assessment Instrument Spreadsheet Guidance](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/branches/updates_0327/broken.html) on the Gravity Project Confluence site.


{% include markdown-link-references.md %}