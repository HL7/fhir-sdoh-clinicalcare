The following are examples of maps that are used to generate StructureMaps to extract a Bundle of Observations and Conditions from:

 1) a [Hunger Vital Sign (HVS) QuestionnaireResponse](mapping_instructions.html#HVS)
 2) a [PRAPARE QuestionnaireResponse](mapping_instructions.html#HVS)

### HVS

The following is an example of a map that is used to generate a StructureMap to extract a Bundle of Observations and Conditions from a Hunger Vital Sign [HVS] QuestionnaireResponse. 

/// name = "SDOHCC-Hunger-Vital-Sign-Map"
/// status = draft

map "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMapHungerVitalSign" = "SDOHCC StructureMap Hunger Vital Sign"

uses "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse" alias questionnaireResponse as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" as target
uses "http://hl7.org/fhir/StructureDefinition/Observation" as target
uses "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Condition" alias sdohccCondition as target
uses "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationAssessment" alias sdohccObservation as target

group sdohMapping(source src : questionnaireResponse, target bundle : Bundle) {
  //temporarily set id to human-readable id as example
  //src -> bundle.id = uuid();
  src -> bundle.id = 'SDOHCC-BundleHungerVitalSignExample';
  src -> bundle.type = 'transaction';

  //for each answer item in the questionnareResponse, create an Observation and add it to the groupObservation
  src.item as answerItem1 where "linkId = '/88122-7'" -> bundle.entry as entry, entry.resource = create('sdohccObservation') as observation1 then
    TransformObservation(src, answerItem1, observation1, entry), TransformObservation1(src, answerItem1, observation1, entry);

  src.item as answerItem2 where "linkId = '/88123-5'" -> bundle.entry as entry, entry.resource = create('sdohccObservation') as observation2 then 
    TransformObservation(src, answerItem2, observation2, entry), TransformObservation2(src, answerItem2, observation2, entry);

  src.item as answerItem3 where "linkId = '/88124-3'" -> bundle.entry as entry, entry.resource = create('sdohccObservation') as observation3 then 
    TransformObservation(src, answerItem3, observation3, entry), TransformObservation3(src, answerItem3, bundle, observation3, entry); 

  //create group observation containing the 3 observations above as hasMember
  //TODO: group observation?
  src -> bundle.entry as entry, entry.resource = create('sdohccObservation') as groupObservation then 
	TransformGroupObservation(src, bundle, groupObservation, entry);

  //create condition if answer to third question is "At Risk"
  src.item where "linkId = '/88124-3' and answer.valueCoding.code ='LA19952-3'" -> bundle.entry as entry, entry.resource = create('sdohccCondition') as condition then
    TransformCondition(src, bundle, condition, entry);
}

group TransformObservation(source src: questionnaireResponse, source answerItem, target observation: sdohccObservation, target entry)
{
  //temporarily set id to human-readable id as example
  //src -> observation.id = uuid() then
  //  SetObservationFullUrl(observation, entry);
  src -> observation.status = 'final';

  src -> observation.meta = create('Meta') as newMeta then {
    src -> newMeta.profile = 'http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationScreeningResponse';
  };

  src -> observation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'social-history', 'Social History');
  src -> observation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'survey', 'Survey');

  //Add sdoh category
  src -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes';
        src -> newCoding.code = 'food-insecurity';
        src -> newCoding.display = 'Food Insecurity';
    };
  };  

  src.authored as authored -> observation.issued = authored, observation.effective = authored;

  answerItem.answer as answer -> observation.value = create('CodeableConcept') as newCC then {
    answer.valueCoding as coding -> newCC.coding = coding as newCoding;
  };

  src.subject as qSubject -> observation.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };
}

group TransformObservation1(source src: questionnaireResponse, source item, target observation: sdohccObservation, target entry)
{
  src -> observation.id = 'SDOHCC-ObservationResponseHungerVitalSignQuestion1Example' then
    SetObservationFullUrl(observation, entry);

  item as i -> observation.code = cc('http://loinc.org', '88122-7') as code;

  src.subject as qSubject -> observation.performer = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };

  src.id as id -> observation.derivedFrom = create('Reference') as newReference then {
    id -> newReference.reference = append('QuestionnaireResponse/', id);
  };
}

group TransformObservation2(source src: questionnaireResponse, source item, target observation: sdohccObservation, target entry)
{
  src -> observation.id = 'SDOHCC-ObservationResponseHungerVitalSignQuestion2Example' then
   	SetObservationFullUrl(observation, entry);

  item as i -> observation.code = cc('http://loinc.org', '88123-5') as code;

  src.subject as qSubject -> observation.performer = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };

  src.id as id -> observation.derivedFrom = create('Reference') as newReference then {
    id -> newReference.reference = append('QuestionnaireResponse/', id);
  };
}

group TransformObservation3(source src: questionnaireResponse, source item, source bundle, target observation: sdohccObservation, target entry)
{
  src -> observation.id = 'SDOHCC-ObservationResponseHungerVitalSignQuestion3Example' then
   	SetObservationFullUrl(observation, entry);

  item as i -> observation.code = cc('http://loinc.org', '88124-3') as code;
     
  bundle.entry as entries -> observation.derivedFrom = create('Reference') as df then 
    TransformObservationDerived(entries, df);
}

group TransformObservationDerived(source entries, target df) {
  entries.resource as obs1 where "code.coding.code = '88122-7'"-> df.reference = reference(obs1); 
  entries.resource as obs2 where "code.coding.code = '88123-5'" -> df.reference = reference(obs2); 
}

group TransformGroupObservation(source src: questionnaireResponse, source bundle:Bundle, target groupObservation: Observation, target entry)
{
  //temporarily set id to human-readable id as example
  //src -> groupObservation.id = uuid() then

  src -> groupObservation.meta = create('Meta') as newMeta then {
    src -> newMeta.profile = 'http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-ObservationScreeningResponse';
  };

  src -> groupObservation.id = 'SDOHCC-ObservationResponseHungerVitalSignGroupingExample' then
    SetObservationFullUrl(groupObservation, entry);  
  src -> groupObservation.status = 'final';
  src -> groupObservation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'social-history', 'Social History');
  src -> groupObservation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'survey', 'Survey');
  //Add sdoh category
  src -> groupObservation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes';
        src -> newCoding.code = 'food-insecurity';
        src -> newCoding.display = 'Food Insecurity';
    };
  };  

  src.authored as authored -> groupObservation.effective = authored;
  src.subject as qSubject -> groupObservation.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };  

  src -> groupObservation.code = cc('http://loinc.org', '88121-9', 'Hunger Vital Sign [HVS]');   

  bundle.entry as entries -> groupObservation.hasMember = create('Reference') as df then {
  	entries.resource as obs1 where "code.coding.code = '88122-7'"-> df.reference = reference(obs1); 
	entries.resource as obs2 where "code.coding.code = '88123-5'" -> df.reference = reference(obs2); 
	entries.resource as obs3 where "code.coding.code = '88124-3'" -> df.reference = reference(obs3); 
  };

  src.id as id -> groupObservation.derivedFrom = create('Reference') as newReference then {
    id -> newReference.reference = append('QuestionnaireResponse/', id);
  };
}

group SetObservationFullUrl(source observation: Observation, target entry)
{
  observation.id as id -> entry.fullUrl = append('http://hl7.org/fhir/us/sdoh-clinicalcare/Observation/', id);
}

group TransformCondition(source src: questionnaireResponse, source bundle, target condition: sdohccCondition, target entry)
{
  //temporarily set id to human-readable id as example
  //src -> condition.id = uuid() then
  src -> condition.id = 'SDOHCC-ConditionFoodInsecurityExample' then
    SetConditionFullUrl(condition, entry);
       
  src -> condition.meta = create('Meta') as newMeta then {
    src -> newMeta.profile = 'http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Condition';
  };

  src -> condition.clinicalStatus = cc('http://terminology.hl7.org/CodeSystem/condition-clinical', 'active', 'Active');
  src -> condition.verificationStatus = cc('http://terminology.hl7.org/CodeSystem/condition-ver-status', 'unconfirmed', 'Unconfirmed');
  src -> condition.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/core/CodeSystem/condition-category';
        src -> newCoding.code = 'health-concern';
        src -> newCoding.display = 'Health Concern';
    };
  };
  //Add sdoh category
  src -> condition.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes';
        src -> newCoding.code = 'food-insecurity';
        src -> newCoding.display = 'Food Insecurity';
    };
  };

  src -> condition.code = create('CodeableConcept') as newCodeCC then {
      src -> newCodeCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://snomed.info/sct';
        src -> newCoding.code = '733423003';
        src -> newCoding.display = 'Food insecurity';
    };
    src -> newCodeCC.coding = create('Coding') as newCoding2 then {
        src -> newCoding2.system = 'http://hl7.org/fhir/sid/icd-10-cm';
        src -> newCoding2.code = 'Z59.4';
        src -> newCoding2.display = 'Lack of adequate food and safe drinking water';
    };
  };
      
  src.authored as authored -> condition.onset = create('Period') as period,
    period.start = authored;

  bundle.entry as entries -> condition.evidence as evidence, evidence.detail = create('Reference') as detailReference then {
  	entries.resource as obs3 where "code.coding.code = '88124-3'"-> detailReference.reference = reference(obs3); 
  };

  src.subject as qSubject -> condition.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };
}

group SetConditionFullUrl(source condition: sdohccCondition, target entry)
{
  condition.id as id -> entry.fullUrl = append('http://hl7.org/fhir/us/sdoh-clinicalcare/Condition/', id);
}

### PRAPARE

The following is an example of a map that is used to generate a StructureMap to extract a Bundle of Observations and Conditions from a PRAPARE QuestionnaireResponse. 

/// name = "SDOHCC_StructureMap_PRAPAREMapper"
/// status = draft

map "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMap-PRAPAREMapper" = "SDOHCC StructureMap PRAPARE Mapper"

uses "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse" alias questionnaireResponse as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" as target
uses "http://hl7.org/fhir/StructureDefinition/Observation" as target
uses "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Condition-Base-1" alias sdohccCondition as target
uses "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Observation-ScreeningResponseBase-1" alias sdohccObservation as target

group sdohMapping(source src : questionnaireResponse, target bundle : Bundle) {
  //temporarily set id to human-readable id as example
  //src -> bundle.id = uuid();
  src -> bundle.id = 'SDOHCC-Bundle-PRAPARE-Example';
  src -> bundle.type = 'transaction';

  //for each answer item in the questionnareResponse, create an Observation and add it to the groupObservation
  src.item as rootItem -> bundle.entry as entry then 
    rootContent(src, rootItem, bundle);

  //create group observation containing all observations as hasMember
  src -> bundle.entry as entry, entry.resource = create('sdohccObservation') as groupObservation then 
    TransformGroupObservation(src, bundle, groupObservation, entry);
}

group rootContent(source qResponse: questionnaireResponse, source rootItem, target bundle) {
  rootItem.item as groupItem -> bundle.entry as entry then 
    groupContent(qResponse, groupItem, bundle);
}

group groupContent(source qResponse: questionnaireResponse, source groupItem, target bundle) {
  groupItem.item as questionItem -> bundle.entry as entry, entry.resource = create('sdohccObservation') as observation then
    TransformObservation(qResponse, questionItem, bundle, observation, entry, bundle);
}

group TransformObservation(source src: questionnaireResponse, source answerItem, source bundle, target observation: sdohccObservation, target entry, target bundle)
{
  src -> observation.id = uuid() then
  	SetObservationFullUrl(observation, entry);
  src -> observation.status = 'final';
  src -> observation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'social-history', 'Social History');
  src -> observation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'survey', 'Survey');

  //set dates
  src.authored as authored -> observation.issued = authored, observation.effective = authored;

  src.subject as qSubject -> observation.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };
  src.subject as qSubject -> observation.performer = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };  

  src.id as id -> observation.derivedFrom = create('Reference') as newReference then {
    id -> newReference.reference = append('QuestionnaireResponse/', id);
  };

  //answerItem.answer as answer -> observation.id = uuid() then
  //	SetValue(answer, observation);

  //Set observation.code mapping for each corresponding answer

  // 1. Ethnicity
  answerItem where "linkId = '/93043-8/56051-6'" -> observation.code = cc('http://loinc.org', '56051-6') as code then 
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93043-8/56051-6'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 2. Race
  //TBD: How to handle "Others" text?
  answerItem where "linkId = '/93043-8/32624-9'" -> observation.code = cc('http://loinc.org', '32624-9') as code then 
    SetValuesToComponents(answerItem, observation, observation);
  answerItem where "linkId = '/93043-8/32624-9'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  // 3. Farm Worker Status
  answerItem where "linkId = '/93043-8/93035-4'" -> observation.code = cc('http://loinc.org', '93035-4') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93043-8/93035-4'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 4. Veteran Status
  answerItem where "linkId = '/93043-8/93034-7'" -> observation.code = cc('http://loinc.org', '93034-7') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93043-8/93034-7'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'veteran-status';
      src -> newCoding.display = 'Veteran Status';
    };
  };  

  // 5. English Proficiency
  answerItem where "linkId = '/93043-8/54899-0'" -> observation.code = cc('http://loinc.org', '54899-0') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93043-8/54899-0'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  }; 

  // 6. Household Size
  answerItem where "linkId = '/93042-0/63512-8'" -> observation.code = cc('http://loinc.org', '63512-8') as code then {
    answerItem.answer as answer -> observation.value = create('Quantity') as newQty then {
      answer.value as vs -> newQty.value = vs;
      src -> newQty.unit = '{#}';
      src -> newQty.system = 'http://unitsofmeasure.org';
      src -> newQty.code = '{#}';
    };
  };
  answerItem where "linkId = '/93042-0/63512-8'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'housing-instability-homelessness';
      src -> newCoding.display = 'Housing Instability Homelessness';
    };
  };

  // 7. Housing
  answerItem where "linkId = '/93042-0/71802-3'" -> observation.code = cc('http://loinc.org', '71802-3') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93042-0/71802-3'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'housing-instability-homelessness';
      src -> newCoding.display = 'Housing Instability Homelessness';
    };
  };

  // 8. Housing Status
  answerItem where "linkId = '/93042-0/93033-9'" -> observation.code = cc('http://loinc.org', '93033-9') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93042-0/93033-9'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'housing-instability-homelessness';
      src -> newCoding.display = 'Housing Instability Homelessness';
    };
  };  

  // 9. Neighborhood
  answerItem where "linkId = '/93042-0/56799-0'" -> observation.code = cc('http://loinc.org', '56799-0') as code then
    SetValue(answerItem, observation);
  answerItem where "linkId = '/93042-0/93033-9'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  // 10. Education
  answerItem where "linkId = '/93041-2/82589-3'" -> observation.code = cc('http://loinc.org', '82589-3') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93041-2/82589-3'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'educational-attainment';
      src -> newCoding.display = 'Educational attainment';
    };
  }; 

  // 11. Employment
  answerItem where "linkId = '/93041-2/67875-5'" -> observation.code = cc('http://loinc.org', '67875-5') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93041-2/67875-5'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'employment-status';
      src -> newCoding.display = 'Employment Status';
    };
  };

  // 12. Insurance
  answerItem where "linkId = '/93041-2/76437-3'" -> observation.code = cc('http://loinc.org', '76437-3') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93041-2/76437-3'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 13. Household Income
  answerItem where "linkId = '/93041-2/63586-2'" -> observation.code = cc('http://loinc.org', '63586-2') as code then {
    answerItem.answer as answer -> observation.value = create('Quantity') as newQty then {
      answer.value as vs -> newQty.value = vs;
      src -> newQty.unit = '/a';
      src -> newQty.system = 'http://unitsofmeasure.org';
      src -> newQty.code = '/a';
    };
  };
  answerItem where "linkId = '/93041-2/63586-2'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'financial-insecurity';
      src -> newCoding.display = 'Financial Insecurity';
    };
  };

  // 14. Material Security
  answerItem where "linkId = '/93041-2/93031-3'" -> observation.code = cc('http://loinc.org', '93031-3') as code then 
    SetValuesToComponents(answerItem, observation, observation);
  // answer: Food
  answerItem where "linkId = '/93041-2/93031-3' and answer.valueCoding.code ='LA30125-1'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'food-insecurity';
      src -> newCoding.display = 'Food insecurity';
    };
  };

  // 15. Transportation
  answerItem where "linkId = '/93041-2/93030-5'" -> observation.code = cc('http://loinc.org', '93030-5') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93041-2/93030-5'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'transportation-insecurity';
      src -> newCoding.display = 'Transportation Insecurity';
    };
  };

  // 16. Social Integration
  answerItem where "linkId = '/93040-4/93029-7'" -> observation.code = cc('http://loinc.org', '93029-7') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93040-4/93029-7'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 17. Stress
  answerItem where "linkId = '/93040-4/93038-8'" -> observation.code = cc('http://loinc.org', '93038-8') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93040-4/93038-8'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 18. Incarceration
  answerItem where "linkId = '/93039-6/93028-9'" -> observation.code = cc('http://loinc.org', '93028-9') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93039-6/93028-9'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  // 19. Refugee
  answerItem where "linkId = '/93039-6/93027-1'" -> observation.code = cc('http://loinc.org', '93027-1') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93039-6/93027-1'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  // 20. Safety
  answerItem where "linkId = '/93040-4/93038-8'" -> observation.code = cc('http://loinc.org', '93038-8') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93040-4/93038-8'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 21. Domestic Violence
  answerItem where "linkId = '/93039-6/93026-3'" -> observation.code = cc('http://loinc.org', '93026-3') as code then
    SetValueCodeableConcept(answerItem, observation);
  answerItem where "linkId = '/93039-6/93026-3'" -> observation.category = create('CodeableConcept') as newCC then {
    src -> newCC.coding = create('Coding') as newCoding then {
      src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
      src -> newCoding.code = 'sdoh-category-unspecified';
      src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  //create a Condition if homeless
  answerItem where "linkId = '/93042-0/71802-3' and answer.valueCoding.code ='LA30190-5'" -> bundle.entry as entry, entry.resource = create('sdohccCondition') as condition then
    TransformCondition(src, bundle, condition, entry), SetConditionCodeAndEvidence1(bundle, condition);

  //create a Condition if unemployed
  answerItem where "linkId = '/93041-2/67875-5' and answer.valueCoding.code ='LA17956-6'" -> bundle.entry as entry, entry.resource = create('sdohccCondition') as condition then
    TransformCondition(src, bundle, condition, entry), SetConditionCodeAndEvidence2(bundle, condition);
}

group SetValue(source answerItem, target observation) {
  answerItem.answer as answer -> observation.id as id then {
    answer.value as vs -> observation.value = vs;
  };
}

group SetValueCodeableConcept(source src, target observation) {
  src.answer as answer -> observation.value = create('CodeableConcept') as newCC then {
    answer.valueCoding as coding -> newCC.coding = coding as newCoding;
  };
}

group SetValuesToComponents(source answerItem, source srcObservation, target observation) {
  answerItem.answer as answer -> observation.component as newComponent, newComponent.value = create('CodeableConcept') as newCC then {
    answer.valueCoding as coding -> newCC.coding = coding as newCoding;
    srcObservation.code as code ->  newComponent.code = code;
  };
}

group SetObservationFullUrl(source observation: Observation, target entry)
{
  observation.id as id -> entry.fullUrl = append('http://hl7.org/fhir/us/sdoh-clinicalcare/Observation/', id);
}

group TransformCondition(source src: questionnaireResponse, source bundle, target condition: sdohccCondition, target entry)
{
  src -> condition.id = uuid() then
    SetConditionFullUrl(condition, entry);

  src -> condition.id = uuid() then
    SetConditionFullUrl(condition, entry);

  src -> condition.clinicalStatus = cc('http://terminology.hl7.org/CodeSystem/condition-clinical', 'active', 'Active');
  src -> condition.verificationStatus = cc('http://terminology.hl7.org/CodeSystem/condition-ver-status', 'unconfirmed', 'Unconfirmed');

  src -> condition.category = cc('http://hl7.org/fhir/us/core/CodeSystem/condition-category', 'health-concern', 'Health Concern') as category;
    
  src.authored as authored -> condition.onset = create('Period') as period,
    period.start = authored;

  src.subject as qSubject -> condition.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };

  src.subject as qSubject -> condition.asserter = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };
}

group SetConditionFullUrl(source condition: sdohccCondition, target entry)
{
  condition.id as id -> entry.fullUrl = append('http://hl7.org/fhir/us/sdoh-clinicalcare/Condition/', id);
}

group SetConditionCodeAndEvidence1(source bundle, target condition)
{
  bundle -> condition.code = cc('http://snomed.info/sct', '32911000') as code;
  bundle.entry as entries -> condition.evidence as evidence, evidence.detail = create('Reference') as detailReference then {
  	entries.resource as obs where "code.coding.code = '71802-3'"-> detailReference.reference = reference(obs); 
  };
}

group SetConditionCodeAndEvidence2(source bundle, target condition)
{
  bundle -> condition.code = cc('http://snomed.info/sct', '73438004') as code;
  bundle.entry as entries -> condition.evidence as evidence, evidence.detail = create('Reference') as detailReference then {
  	entries.resource as obs where "code.coding.code = '67875-5'"-> detailReference.reference = reference(obs); 
  };
}

group TransformGroupObservation(source src: questionnaireResponse, source bundle:Bundle, target groupObservation: Observation, target entry)
{
  src -> groupObservation.id = uuid() then
    SetObservationFullUrl(groupObservation, entry);  
  src -> groupObservation.status = 'final';
  src -> groupObservation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'social-history', 'Social History');
  src -> groupObservation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'survey', 'Survey');

  src.authored as authored -> groupObservation.effective = authored;
  src.subject as qSubject -> groupObservation.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };  

  src -> groupObservation.code = cc('http://loinc.org', '93025-5');   

  //only add observations that are derived from the answers
  bundle.entry as entries -> groupObservation.hasMember = create('Reference') as df then {
    entries.resource as obs where "status.exists() and hasMember.exists().not()"-> df.reference = reference(obs); 
  };
}