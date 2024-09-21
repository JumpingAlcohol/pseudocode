CONSTANT Max=10
DECLARE Queue:ARRAY[0:Max-1] OF INTEGER
DECLARE Head:INTEGER
DECLARE Tail:INTEGER
DECLARE Count:INTEGER       //number of valid values

PROCEDURE InitQueue()
    Head<-0
    Tail<--1
    Count<-0
ENDPROCEDURE

FUNCTION IsEmpty() RETURNS BOOLEAN
    RETURN Count=0
ENDFUNCTION

FUNCTION IsFull() RETURNS BOOLEAN
    RETURN Count=Max
ENDFUNCTION

FUNCTION EnQueue(item:INTEGER) RETURNS BOOLEAN
    IF IsFull() THEN
        OUTPUT "The queue is full, could not enqueue!"
        RETURN FALSE
    ELSE
        Tail<-(Tail+1) MOD Max
        Queue[Tail]<-item
        Count<-Count+1
        RETURN TRUE
    ENDIF
ENDFUNCTION

//if queue is empty, dequeue -999
FUNCTION DeQueue() RETURNS INTEGER
    DECLARE item:INTEGER
    IF IsEmpty() THEN
        OUTPUT "The queue is empty, could not dequeue!"
        RETURN -999
    ELSE
        item<-Queue[Head]
        Head<-(Head+1) MOD Max
        Count<-Count-1
        RETURN item
    ENDIF
ENDFUNCTION