Invariant: SDOH-Obs-3
Description: "Must have either performer or derivedFrom"
Severity: #error
Expression: "performer.exists() or derivedFrom.exists()"
XPath: "true()"