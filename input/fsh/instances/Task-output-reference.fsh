Instance: Task-output-reference
InstanceOf: SearchParameter
Title: "TaskOutputReference"
Description: "The value of any outputs of type 'Reference'"
Usage: #definition
* name = "TaskOutputReference"
* status = #draft
* description = "The value of any outputs of type 'Reference'"
* experimental = false
* code = #output
* base = #Task
* type = #reference
* expression = "(Task.output.value as Reference)"
* xpath = "f:Task/f:output/f:valueReference"
* xpathUsage = #normal