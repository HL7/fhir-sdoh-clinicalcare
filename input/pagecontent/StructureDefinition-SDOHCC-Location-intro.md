
### Purpose
SDOHCC Location provides the address of a Healthcare Service to which a subject is referred.
When a subject of care is referred to a Healthcare Service, [SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html) (via Task.input) references [SDOHCC Healthcare Service](StructureDefinition-SDOHCC-HealthcareService.html) which (via HealthcareService.location) references [SDOHCC Location](StructureDefinition-SDOHCC-Location.html) which requires Location.address.


{% include markdown-link-references.md %}