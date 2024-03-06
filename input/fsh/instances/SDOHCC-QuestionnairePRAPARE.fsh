Instance: SDOHCC-QuestionnairePRAPARE
InstanceOf: SDCQuestionnaireExtractStructureMap
Title: "SDOHCC Questionnaire PRAPARE"
Description: "A Questionnaire instance that represents the questions and answers from the PRAPARE questionnaire represented in LOINC (code 93025-5)."
Usage: #example
* extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension.valueCanonical = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMapPRAPARE"
* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/Questionnaire/SDOHCC-QuestionnairePRAPARE"
* name = "SDOHCCQuestionnairePRAPARE"
* title = "SDOHCC Questionnaire PRAPARE"
* status = #draft
* subjectType = #Patient
* date = "2021-04-01T04:01:34+00:00"
* publisher = "HL7 International - Patient Care WG"
* contact.name = "HL7 International - Patient Care"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/patientcare"
* jurisdiction = urn:iso:std:iso:3166#US
* item.linkId = "/93025-5"
* item.code = $loinc#93025-5 "Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences [PRAPARE]"
* item.text = "Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences [PRAPARE]"
* item.type = #group
* item.required = false
* item.item[0].linkId = "/93043-8"
* item.item[=].code = $loinc#93043-8 "Personal characteristics [PRAPARE]"
* item.item[=].text = "Personal characteristics"
* item.item[=].type = #group
* item.item[=].required = false
* item.item[=].item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93043-8/56051-6"
* item.item[=].item[=].code = $loinc#56051-6 "Do you consider yourself Hispanic/Latino?"
* item.item[=].item[=].text = "Do you consider yourself Hispanic/Latino?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA33-6 "Yes"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA32-8 "No"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93043-8/32624-9"
* item.item[=].item[=].code = $loinc#32624-9 "Race"
* item.item[=].item[=].text = "Race"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].repeats = true
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA6156-9 "Asian"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA14045-1 "Native Hawaiian"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30187-1 "Pacific Islander"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA14042-8 "Black/African American"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA4457-3 "White"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA4-4 "American Indian/Alaskan Native"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA46-8 "Other"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93043-8/93035-4"
* item.item[=].item[=].code = $loinc#93035-4 "At any point in the past 2 years, has season or migrant farm work been your or your family's main source of income?"
* item.item[=].item[=].text = "At any point in the past 2 years, has season or migrant farm work been your or your family's main source of income?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA33-6 "Yes"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA32-8 "No"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93043-8/93034-7"
* item.item[=].item[=].code = $loinc#93034-7 "Have you been discharged from the armed forces of the United States?"
* item.item[=].item[=].text = "Have you been discharged from the armed forces of the United States?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA33-6 "Yes"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA32-8 "No"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93043-8/54899-0"
* item.item[=].item[=].code = $loinc#54899-0 "Preferred language"
* item.item[=].item[=].text = "Preferred language"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA43-5 "English"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30188-9 "Language other than English"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[+].linkId = "/93042-0"
* item.item[=].code = $loinc#93042-0 "Family and home [PRAPARE]"
* item.item[=].text = "Family and home"
* item.item[=].type = #group
* item.item[=].required = false
* item.item[=].item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item.item[=].item[=].extension.valueCoding = $unitsofmeasure#{#} "{#}"
* item.item[=].item[=].linkId = "/93042-0/63512-8"
* item.item[=].item[=].code = $loinc#63512-8 "How many people are living or staying at this address?"
* item.item[=].item[=].text = "How many people are living or staying at this address?"
* item.item[=].item[=].type = #integer
* item.item[=].item[=].required = false
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93042-0/71802-3"
* item.item[=].item[=].code = $loinc#71802-3 "Housing status"
* item.item[=].item[=].text = "Housing status"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA30189-7 "I have housing"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30190-5 "I do not have housing (staying with others, in a hotel, in a shelter, living outside on the street, on a beach, in a car, or in a park)"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[=].item.extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item.extension.valueCodeableConcept = $questionnaire-item-control#help "Help-Button"
* item.item[=].item[=].item.extension.valueCodeableConcept.text = "Help-Button"
* item.item[=].item[=].item.linkId = "/93042-0/71802-3-help"
* item.item[=].item[=].item.text = "Describes patients living arrangement"
* item.item[=].item[=].item.type = #display
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93042-0/93033-9"
* item.item[=].item[=].code = $loinc#93033-9 "Are you worried about losing your housing?"
* item.item[=].item[=].text = "Are you worried about losing your housing?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA33-6 "Yes"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA32-8 "No"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].linkId = "/93042-0/56799-0"
* item.item[=].item[=].code = $loinc#56799-0 "Address"
* item.item[=].item[=].text = "Address"
* item.item[=].item[=].type = #string
* item.item[=].item[=].required = false
* item.item[+].linkId = "/93041-2"
* item.item[=].code = $loinc#93041-2 "Money and resources [PRAPARE]"
* item.item[=].text = "Money and resources"
* item.item[=].type = #group
* item.item[=].required = false
* item.item[=].item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93041-2/82589-3"
* item.item[=].item[=].code = $loinc#82589-3 "Highest level of educ"
* item.item[=].item[=].text = "Highest level of educ"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA30191-3 "Less than high school degree"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30192-1 "High school diploma or GED"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30193-9 "More than high school"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93041-2/67875-5"
* item.item[=].item[=].code = $loinc#67875-5 "Employment status current"
* item.item[=].item[=].text = "Employment status current"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA17956-6 "Unemployed"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30138-4 "Part-time or temporary work"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30136-8 "Full-time work"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30137-6 "Otherwise unemployed but not seeking work (ex: student, retired, disabled, unpaid primary care giver)"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93041-2/76437-3"
* item.item[=].item[=].code = $loinc#76437-3 "Primary insurance"
* item.item[=].item[=].text = "Primary insurance"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA30194-7 "None/uninsured"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA17849-3 "Medicaid"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30195-4 "CHIP Medicaid"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA15652-3 "Medicare"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30196-2 "Other public insurance (not CHIP)"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30197-0 "Other public insurance (CHIP)"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA6350-8 "Private insurance"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item.item[=].item[=].extension.valueCoding = $unitsofmeasure#/a "/a"
* item.item[=].item[=].linkId = "/93041-2/63586-2"
* item.item[=].item[=].code = $loinc#63586-2 "What was your best estimate of the total income of all family members from all sources, before taxes, in last year?"
* item.item[=].item[=].text = "What was your best estimate of the total income of all family members from all sources, before taxes, in last year?"
* item.item[=].item[=].type = #decimal
* item.item[=].item[=].required = false
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93041-2/93031-3"
* item.item[=].item[=].code = $loinc#93031-3 "In the past year, have you or any family members you live with been unable to get any of the following when it was really needed?"
* item.item[=].item[=].text = "In the past year, have you or any family members you live with been unable to get any of the following when it was really needed?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].repeats = true
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA30125-1 "Food"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30126-9 "Clothing"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30124-4 "Utilities"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30127-7 "Child care"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30128-5 "Medicine or Any Health Care (Medical, Dental, Mental Health, Vision)"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30129-3 "Phone"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA46-8 "Other"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93041-2/93030-5"
* item.item[=].item[=].code = $loinc#93030-5 "Has lack of transportation kept you from medical appointments, meetings, work, or from getting things needed for daily living"
* item.item[=].item[=].text = "Has lack of transportation kept you from medical appointments, meetings, work, or from getting things needed for daily living?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].repeats = true
* item.item[=].item[=].answerOption[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix"
* item.item[=].item[=].answerOption[=].extension.valueString = "A"
* item.item[=].item[=].answerOption[=].valueCoding = $loinc#LA30133-5 "Yes, it has kept me from medical appointments or from getting my medications"
* item.item[=].item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix"
* item.item[=].item[=].answerOption[=].extension.valueString = "B"
* item.item[=].item[=].answerOption[=].valueCoding = $loinc#LA30134-3 "Yes, it has kept me from non-medical meetings, appointments, work, or from getting things that I need"
* item.item[=].item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix"
* item.item[=].item[=].answerOption[=].extension.valueString = "C"
* item.item[=].item[=].answerOption[=].valueCoding = $loinc#LA32-8 "No"
* item.item[=].item[=].answerOption[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix"
* item.item[=].item[=].answerOption[=].extension.valueString = "X"
* item.item[=].item[=].answerOption[=].valueCoding = $loinc#LA30257-2 "Patient unable to respond"
* item.item[+].linkId = "/93040-4"
* item.item[=].code = $loinc#93040-4 "Social and emotional health [PRAPARE]"
* item.item[=].text = "Social and emotional health"
* item.item[=].type = #group
* item.item[=].required = false
* item.item[=].item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93040-4/93029-7"
* item.item[=].item[=].code = $loinc#93029-7 "How often do you see or talk to people that you care about and feel close to (For example: talking to friends on the phone, visiting friends or family, going to church or club meetings)?"
* item.item[=].item[=].text = "How often do you see or talk to people that you care about and feel close to (For example: talking to friends on the phone, visiting friends or family, going to church or club meetings)?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA27722-0 "Less than once a week"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30130-1 "1 or 2 times a week"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30131-9 "3 to 5 times a week"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30132-7 "5 or more times a week"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93040-4/93038-8"
* item.item[=].item[=].code = $loinc#93038-8 "Stress is when someone feels tense, nervous, anxious or can't sleep at night because their mind is troubled - how stressed are you?"
* item.item[=].item[=].text = "Stress is when someone feels tense, nervous, anxious or can't sleep at night because their mind is troubled. How stressed are you?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA6568-5 "Not at all"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA13863-8 "A little bit"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA13909-9 "Somewhat"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA13902-4 "Quite a bit"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA13914-9 "Very much"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[+].linkId = "/93039-6"
* item.item[=].code = $loinc#93039-6 "Optional additional questions [PRAPARE]"
* item.item[=].text = "Optional additional questions"
* item.item[=].type = #group
* item.item[=].required = false
* item.item[=].item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93039-6/93028-9"
* item.item[=].item[=].code = $loinc#93028-9 "In the past year, have you spent more than 2 nights in a row in a jail, prison, detention center, or juvenile correctional facility?"
* item.item[=].item[=].text = "In the past year, have you spent more than 2 nights in a row in a jail, prison, detention center, or juvenile correctional facility?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA33-6 "Yes"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA32-8 "No"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93039-6/93027-1"
* item.item[=].item[=].code = $loinc#93027-1 "Are you a refugee?"
* item.item[=].item[=].text = "Are you a refugee?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA33-6 "Yes"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA32-8 "No"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93039-6/93026-3"
* item.item[=].item[=].code = $loinc#93026-3 "Do you feel physically and emotionally safe where you currently live?"
* item.item[=].item[=].text = "Do you feel physically and emotionally safe where you currently live?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].valueCoding = $loinc#LA33-6 "Yes"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA32-8 "No"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA14072-5 "Unsure"
* item.item[=].item[=].answerOption[+].valueCoding = $loinc#LA30122-8 "I choose not to answer this question"
* item.item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item.item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item.item[=].item[=].linkId = "/93039-6/76501-6"
* item.item[=].item[=].code = $loinc#76501-6 "Within the last year, have you been afraid of your partner or ex-partner?"
* item.item[=].item[=].text = "Within the last year, have you been afraid of your partner or ex-partner?"
* item.item[=].item[=].type = #choice
* item.item[=].item[=].required = false
* item.item[=].item[=].answerOption[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix"
* item.item[=].item[=].answerOption[=].extension[=].valueString = "1"
* item.item[=].item[=].answerOption[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item.item[=].item[=].answerOption[=].extension[=].valueDecimal = 1
* item.item[=].item[=].answerOption[=].valueCoding = $loinc#LA33-6 "Yes"
* item.item[=].item[=].answerOption[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix"
* item.item[=].item[=].answerOption[=].extension[=].valueString = "0"
* item.item[=].item[=].answerOption[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* item.item[=].item[=].answerOption[=].extension[=].valueDecimal = 0
* item.item[=].item[=].answerOption[=].valueCoding = $loinc#LA32-8 "No"