TYPE Node
    DECLARE Data:STRING
    DECLARE Point:INTEGER
ENDTYPE

DECLARE LList:ARRAY[0:99] OF Node
DECLARE FreeHead:INTEGER

PROCEDURE InitFreeList()
    DECLARE i:INTEGER
    FreeHead<-0
    FOR i <- 0 TO 98
        LList[i].Point<-i+1
    NEXT i
    LList[99].Point<--1
ENDPROCEDURE

DECLARE Head:INTEGER

PROCEDURE InitUserList(BYREF Head:INTEGER)
    Head<--1
ENDPROCEDURE

PROCEDURE InsertAtHead(BYREF Head:INTEGER, BYVAL DataItem:STRING)
    DECLARE NewNode:INTEGER
    IF FreeHead = -1 THEN 
        OUTPUT "The Memory Is Full"
    ELSE
        NewNode<-FreeHead
        FreeHead<-LList[FreeHead].Point                 //重点  take a new node from free list
        LList[NewNode].Data<-DataItem
        LList[NewNode].Point<-Head
        Head<-NewNode
    ENDIF
ENDPROCEDURE

FUNCTION DeleteFromHead(BYREF Head:INTEGER) RETURNS STRING
    DECLARE Current:INTEGER
    DECLARE DataItem:STRING
    IF Head=-1 THEN
        OUTPUT "The List Is Empty"
        RETURN ""
    ELSE
        Current<-Head
        Head<-LList[Current].Point
        DataItem<-LList[Current].Data
        LList[Current].Point<-FreeHead
        FreeHead<-Current
    ENDIF
    RETURN DataItem
ENDFUNCTION

PROCEDURE InsertAtEnd(BYREF Head:INTEGER, BYVAL DataItem:STRING)
    DECLARE NewNode:INTEGER
    DECLARE Current:INTEGER
    IF FreeHead = -1 THEN
        OUTPUT "The Memory Is Full"
    ELSE
        NewNode<-FreeHead
        FreeHead<-LList[FreeHead].Point
        LList[NewNode].Data<-DataItem
        LList[NewNode].Point<--1
        IF Head=-1 THEN                                                 //重要   is the user list empty? if yes, add the new node as the head
            Head<-NewNode
        ELSE                                                            //find the last node
            Current<-Head
            WHILE LList[Current].Point<>-1
                Current<-LList[Current].Point
            ENDWHILE
            LList[Current].Point<-NewNode
        ENDIF

        // DECLARE Previous:INTEGER                                     //another method
        // Previous<--1
        // Current<-Head
        // WHILE Current<>-1
        //     Previous<-Current
        //     Current<-LList[Current].Point
        // ENDWHILE
        // IF Previous=-1 THEN
        //     Head<-NewNode
        // ELSE
        //     LList[Previous].Point<-NewNode
        // ENDIF
    ENDIF
ENDPROCEDURE

FUNCTION DeleteFromEnd(BYREF Head:INTEGER) RETURNS STRING
    DECLARE Current:INTEGER
    DECLARE DataItem:STRING
    DECLARE Previous:INTEGER
    IF Head=-1 THEN
        OUTPUT "The List Is Empty"
        RETURN ""
    ELSE
        //take away the last node
        //find the last node
        Previous<--1
        Current<-Head
        WHILE LList[Current].Point <>-1
            Previous<-Current
            Current<-LList[Current].Point
        ENDWHILE
        //record the last node data for return
        DataItem<-LList[Current].Data
        //if user list has only one node
        IF Previous=-1 THEN         //only one node
            Head<--1
        ELSE
            LList[Previous].Point<--1
        ENDIF
        //return the node to freelist
        LList[Current].Point<-FreeHead
        FreeHead<-Current
    ENDIF
    RETURN DataItem
ENDFUNCTION

PROCEDURE InsertToOrderedList(BYREF Head:INTEGER, BYVAL DataItem:STRING)
    DECLARE NewNode:INTEGER
    DECLARE Previous:INTEGER
    DECLARE Current:INTEGER
    IF FreeHead=-1 THEN
        OUTPUT "Memory is full"
    ELSE
        NewNode<-FreeHead
        FreeHead<-LList[FreeHead].Point           //take a node from free list

        //assign value to the new node
        LList[NewNode].Data<-DataItem

        //insert
        Previous<--1
        Current <-Head
        WHILE Current<>-1 AND DataItem > LList[Current].Data
            Previous<-Current
            Current<-LList[Current].Data
        ENDWHILE
        IF Previous=-1 THEN
            LList[NewNode].Point<-Head
            Head<-NewNode
        ELSE
            LList[NewNode].Point<-Current
            LList[Previous].Point<-NewNode
        ENDIF
    ENDIF
ENDPROCEDURE

PROCEDURE DeleteFromList(BYREF Head:INTEGER, BYVAL DataItem:STRING)
    DECLARE NewNode:INTEGER
    DECLARE Previous:INTEGER
    DECLARE Current:INTEGER
    Current<-Head
    Previous<--1
    WHILE Current<>-1 AND LList[Current].Data<>DataItem
        Previous<-Current
        Current<-LList[Current].Point
    ENDWHILE
    IF Current=-1 THEN
        OUTPUT "Cannot find"
    ELSE
        IF Previous=-1 THEN
            Head<-LList[Current].Point
        ELSE
            LList[Previous].Point<-LList[Current].Point
        ENDIF
        LList[Current].Point<-FreeHead
        FreeHead<-Current
    ENDIF
ENDPROCEDURE