Instance: Task-output-reference
InstanceOf: SearchParameter
Title: "TaskOutputReference"
Description: "Allows searching by the 'output' values of a Task with a type of Reference.  Primarily used to support _include of the outputs when retrieving a Task."
Usage: #definition
* name = "TaskOutputReference"
* status = #draft
* description = "The value of any outputs of type 'Reference'"
* experimental = false
* code = #output
* base = #Task
* type = #reference
* expression = "Task.output.value as Reference"
* xpath = "f:Task/f:output/f:valueReference"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true