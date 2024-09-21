// FUNCTION LinearSearch(Name:ARRAY[0:9] OF STRING,SearchName:STRING) RETURNS INTEGER
//     DECLARE flag:BOOLEAN
//     DECLARE i:INTEGER
//     DECLARE return_value:INTEGER
//     i<-0
//     return_value<--1
//     flag<-FALSE
//     WHILE i<10 AND flag=FALSE
//         IF SearchName=Name[i] THEN
//             flag<-TRUE
//             return_value<-i
//         ENDIF
//         i<-i+1
//     ENDWHILE
//     RETURN return_value
// ENDFUNCTION



// FUNCTION LinearSearch(Name:ARRAY[0:9] OF STRING,SearchName:STRING) RETURNS INTEGER
//     DECLARE i:INTEGER
//     WHILE i<10  AND Name[i]<>SearchName
//         i<-i+1
//     ENDWHILE
//     IF i>=10 THEN
//         RETURN -1
//     ELSE
//         RETURN i
//     ENDIF
// ENDFUNCTION



// FUNCTION LinearSearch(Name:ARRAY[0:9] OF STRING,SearchName:STRING) RETURNS INTEGER
//     DECLARE i:INTEGER
//     FOR i<- 0 TO 9
//         IF Name[i]=SearchName THEN
//             RETURN i
//         ENDIF
//     NEXT i
//     RETURN -1
// ENDFUNCTION
