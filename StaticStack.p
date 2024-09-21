CONSTANT Max=10
DECLARE Stack:ARRAY[0:Max-1] OF INTEGER
//last in first out
//top of the stack point to the top element in the stack.
//another situation is the top pointer of the stack1 point to the stack2, the empty element above the top.

//situation1: top pointer point to the top element
DECLARE Top:INTEGER
PROCEDURE InitStack()
    Top<--1
ENDPROCEDURE

FUNCTION IsEmpty() RETURNS BOOLEAN
    IF Top=-1 THEN
        RETURN TRUE
    ELSE
        RETURN FALSE
    ENDIF
ENDFUNCTION

FUNCTION IsFull() RETURNS BOOLEAN
    IF Top=Max-1 THEN
        RETURN TRUE
    ELSE
        RETURN FALSE
    ENDIF
ENDFUNCTION

FUNCTION push(item:INTEGER) RETURNS BOOLEAN
    IF IsFull() THEN
        OUTPUT "The stack is full, could not push!"
        RETURN FALSE
    ELSE
        Top<-Top+1
        Stack[Top]<-item
        RETURN TRUE
    ENDIF
ENDFUNCTION

//if the stack is empty, return a rogue value.
//-999
FUNCTION pop() RETURNS INTEGER
    DECLARE item:INTEGER
    IF IsEmpty() THEN
        OUTPUT "The stack is empty, could not pop!"
        RETURN -999
    ELSE
        item<-Stack[Top]
        Top<-Top-1
        RETURN item
    ENDIF
ENDFUNCTION

FUNCTION peek() RETURNS INTEGER
    IF IsEmpty() THEN
        OUTPUT "The stack is empty, could not peek!"
        RETURN -999
    ELSE
        RETURN Stack[Top]
    ENDIF
ENDFUNCTION