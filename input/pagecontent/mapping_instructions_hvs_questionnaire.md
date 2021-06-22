The following is an example of a map that is used to generate a StructureMap to extract a Bundle of Observations and Conditions from a Hunger Vital Sign [HVS] QuestionnaireResponse. 

```
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

```

