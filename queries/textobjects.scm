;function
(function_statement) @function.outer

(function_statement
  (script_block) @function.inner)

;block
; TODO: maybe refine this a bit ?
; Capture any type of block as outer
[
  (statement_block)
  (script_block_expression)
] @block.outer

; Capture the content of any type of block as inner
[
  (statement_block (statement_list))
  (script_block_expression (script_block))
] @block.inner

; call  -  command call
; Write-host "hello world"
(command) @call.outer

(command
  (command_elements) @call.inner)
;
; comment
(comment) @comment
(comment) @comment.inner
(comment) @comment.outer
;
; conditional
; if statement

(if_statement) @conditional.outer

(if_statement
  (statement_block) @conditional.inner)

; parameter
(param_block) @parameter.outer
(param_block (parameter_list) @parameter.inner)

;loop
; while 

(while_statement) @loop.outer

(while_statement
  (statement_block
    (statement_list) @loop.inner))

;
;nunber
; 5
(integer_literal) @number

;assignment $x = 5 + 6
; Capture the entire assignment expression
(assignment_expression) @assignment.outer

(assignment_expression
  value: (pipeline
    (logical_expression)) @assignment.inner)

;class

; Capture the entire class statement
(class_statement) @class.outer

; Capture all properties inside the class
(class_statement
  (class_property_definition) @class.inner)

; Capture the entire return statement
; return something 
(flow_control_statement) @return.outer


