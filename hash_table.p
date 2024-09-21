CONSTANT Max=97
TYPE DataRecord
    DECLARE Name:STRING
    DECLARE PhoneNumber:STRING
ENDTYPE

DECLARE HashTable:ARRAY[0:Max-1] OF DataRecord
DECLARE Count:INTEGER

PROCEDURE InitHashTable()
    DECLARE i:INTEGER
    FOR i<-0 TO Max-1
        HashTable[i].Name <- ""
        HashTable[i].PhoneNumber <- ""
    NEXT i
ENDPROCEDURE

FUNCTION HashFunction(key:STRING) RETURNS INTEGER
    DECLARE i:INTEGER
    DECLARE sum:INTEGER
    sum <- 0
    FOR i<-1 TO LENGTH(key)
        sum<-sum+ASC(key[i])
    NEXT i
    RETURN sum MOD Max
ENDFUNCTION

FUNCTION AddItem(key:STRING, value:STRING) RETURNS BOOLEAN
    DECLARE Location:INTEGER
    Location<-HashFunction(key)              //caculate hash location
    IF Count=Max THEN
        OUTPUT "The table is full"
        RETURN FALSE
    ELSE
        WHILE HashTable[Location].Name<> ""                 //find empty location
            Location<-(Location+1) MOD Max
        ENDWHILE
        HashTable[Location].Name<-key                       //input name
        HashTable[Location].PhoneNumber<-value              //input phonenumber
        Count<-Count+1                                      //increment count
        RETURN TRUE
    ENDIF
ENDFUNCTION

FUNCTION GetItem(key:STRING) RETURNS STRING
    DECLARE Location:INTEGER
    DECLARE Ori_Location:INTEGER
    DECLARE Finish:BOOLEAN
    Finish<-FALSE
    IF Count=0 THEN
        OUTPUT "The table is empty"
        RETURN FALSE
    ELSE
        Location<-HashFunction(key)             //caculate hash location
        Ori_Location<-Location                  //record the original location
        WHILE HashTable[Location].Name<>"" AND HashTable[Location].Name<>key AND Finish=FALSE       //location is not empty and the data in location is not the key and still not finish linear probe
            Location<-(Location+1) MOD Max
            IF Ori_Location=Location THEN           //Full table not found
                Finish<-TRUE
            ENDIF
        ENDWHILE
        IF HashTable[Location].Name=key THEN        //check if found or not
            RETURN HashTable[Location].PhoneNumber
        ELSE
            RETURN ""
        ENDIF
    ENDIF
ENDFUNCTION

// FUNCTION DeleteItem(key:STRING) RETURNS BOOLEAN

// ENDFUNCTION