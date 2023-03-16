
### Purpose
SDOHCC Observation Screening Response is intended to represent question-answer pairs from Social Determinants of Health (SDOH) assessment instruments that are represented in LOINC. An SDOHCC Observation Screening Response that identifies a social risk or need can be referenced as evidence for an [SDOHCC Condition]. Sometimes, instead of representing a question that was answered directly on an assessment instrument, an SDOHCC Observation Screening Response may be derived from one or more other SDOHCC Observation Screening Responses (see [SDOHCC Observation Response Hunger Vital Sign Question 3 Example]). Additionally, an SDOHCC Observation Screening Response may be addressed by, or be the outcome of, an [SDOHCC Goal], or be the reason for an [SDOHCC ServiceRequest] or an [SDOHCC Procedure]. See the [Data Modeling Framework] for more detail on the relationships between SDOHCC Observation Screening Response and the other profiles in this IG.

In this IG, responses to assessment instruments are captured using QuestionnaireResponse. To facilitate querying and searching, it is best that individual responses from a QuestionnaireResponse be converted into Observations. The decision as to whether to convert individual responses from a QuestionnaireResponse into Observations will generally be driven by the clinical utility of the Observation. While clinical utility is subjective, the questions in the preferred value sets in the Usage section below are the questions that Gravity has vetted as face-valid.

In the future, to promote interoperability, a single StructureMap instance should ideally be provided for each assessment instrument to ensure consistency in the Observations generated from that assessment instrument.

### Usage

Rather than offer separate SDOHCC Observation Screening Response profiles for each SDOH category (domain) covered in this IG (e.g., food insecurity, transportation insecurity, etc.), this profile supports any SDOH category. The minimum required value set bindings for elements are specified in the profile. Additionally, the Table below provides Gravity-vetted, preferred value sets for this profile. Where a preferred value set contains a code to describe a needed concept, servers SHOULD use that code.

#### General guidance for preferred value sets for SDOHCC Observation Screening Response

Codes in the preferred value sets are from LOINC-encoded assessment instruments that have been vetted as face-valid by the Gravity Project. The [Social Determinants of Health Screening Assessments](broken.html) Value Set, hosted in the NIH Value Set Authority Center ([VSAC]), contains all assessment instruments from which Gravity has chosen questions. For each Gravity-vetted assessment instrument, the questions are also vetted and only those that also meet Gravity criteria are included in the preferred value sets.

For the Observation.category slice with binding to [SDOHCC ValueSet SDOH Category], the category-specific code selected (first column Table below) determines the preferred, category-specific value sets for Observation.code and Observation.value which are hosted in VSAC.

#### Guidance for preferred value sets for Observation.code

In the Value Set names below,  \<Category-specific\> is a placeholder for a specific SDOH category (e.g., Food Insecurity).

 **\<Category-specific\> Screening Assessments** Questions Value Set – Contains LOINC codes for the preferred, category-specific questions selected from the Assessment Instruments.

For an SDOHCC Observation Screening Response that represents a question and its coded answer, Observation.code SHOULD be a LOINC question code from this value set and Observation.value SHOULD be a LOINC answer code from the  \<Category-specific\> Screening Assessments Answers Value Set (described below).

 **\<Category-specific\> Screening Assessments**  Value Set – Contains LOINC codes for the assessment instruments (LOINC panels) from which the preferred, category-specific questions have been selected.

For an SDOHCC Observation Screening Response that is an Observation Grouping, Observation.code SHOULD use panel LOINC codes from this value set. An Observation Grouping does not have an Observation.value.

Instead, an Observation Grouping (via Observation.hasMember) references all Observations generated from a specific assessment instrument. See [SDOHCC Observation Response Hunger Vital Sign Grouping Example](broken.html).

 **\<Category-specific\> Screening Assessments And Questions** Value Set – Contains all codes in  \<Category-specific\> Screening Assessments Questions Value Set (LOINC question codes) AND  \<Category-specific\> Screening Assessments Value Set (LOINC panel codes).

For SDOHCC Observation Screening Response, this is the complete set of preferred values allowed for Observation.code for a category-specific Observation and can be used to validate that Observation.code is from a preferred, category-specific value set.

#### Guidance for preferred value sets for Observation.value

 \<Category-specific\> Screening Assessments Answers Value Set – Contains LOINC answer codes for the preferred, category-specific questions.

For an SDOHCC Observation Screening Response that represents a question and a coded answer, Observation.code SHOULD be a LOINC question code from the  \<Category-specific\> Screening Assessments Questions Value Set and Observation.value SHOULD be a LOINC answer code from this value set.

Of note, each question (Observation.code) has a subset of allowed answers (Observation.value) and, the allowed answers for a specific question may vary depending on the assessment instrument (LOINC panel) on which the question is presented (e.g., [`88122-7`](https://loinc.org/88122-7) "Within the past 12 months we worried whether our food would run out before we got money to buy more [U.S. FSS]" has 4 possible answers on [Hunger Vital Sign (HVS)](https://loinc.org/88121-9) panel versus three possible answers on the [American Academy of Family Physicians Social Needs Screening Tool](https://loinc.org/99593-6)). For this reason, the category-specific Assessment Instrument Spreadsheets (last column in Table below) provide additional information to link specific assessment instruments to questions and their allowed LOINC Answer Lists. LOINC also provides Answers Lists for questions from specific assessment instruments (panels).

For additional information on fields in the Assessment Instrument Spreadsheets, see [Assessment Instrument Spreadsheet Guidance] on the Gravity Project Confluence site.

Key for the “ValueSet for” Column: For readability, the formal names of these value sets in VSAC are shortened in the Table as follows:
* Questions and Panels =  \<Category-specific\> Screening Assessments And Questions
(Example: The formal name in VSAC for the Questions and Panels Value Set for Food insecurity is “Food Insecurity Screening Assessments And Questions”.)
* Panels =  \<Category-specific\> Screening Assessments
* Questions =  \<Category-specific\> Screening Assessments Questions
* Answers =  \<Category-specific\> Screening Assessments Answers Value Set



<div>
<body class="vsc-initialized">
<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:1000px;">
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
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="broken.html">Questions and Panels</a></td>
			<td>OID-1</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Food Insecurity Assessment Instruments Codes</a></td>
		</tr>
		<tr>
			<td><a href="broken.html">Panels</a></td>
			<td>OID-2</td>
		</tr>
		<tr>
			<td><a href="broken.html">Questions</a></td>
			<td>OID-3</td>
		</tr>
		<tr>
			<td>Observation.value</td>
			<td><a href="broken.html">Answers</a></td>
			<td>OID-4</td>
		</tr>
		<tr>
			<td rowspan="4"><a href="CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td>
			<td rowspan="3">Observation.code</td>
			<td><a href="broken.html">Questions and Panels</a></td>
			<td>OID-5</td>
			<td colspan="1" rowspan="4"><a href="broken.html">Housing Instability Assessment Instruments Codes</a></td>
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
</body>
</div>


{% include markdown-link-references.md %}