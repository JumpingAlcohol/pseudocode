// FUNCTION Sort(num:ARRAY[1:10] OF INTEGER) RETURNS ARRAY[1:10] OF INTEGER
//     DECLARE i:INTEGER
//     DECLARE j:INTEGER
//     DECLARE tem:INTEGER
//     FOR i<-1 TO LENGTH(num)-1
//         FOR j<-1 TO LENGTH(num)-i
//             IF num[j]>num[j+1] THEN
//                 tem<-num[j+1]
//                 num[j+1]<-num[j]
//                 num[j]<-tem
//             ENDIF
//         NEXT j
//     NEXT i
//     RETURN num
// ENDFUNCTION



// FUNCTION Sort(num:ARRAY[1:10] OF INTEGER) RETURNS ARRAY[1:10] OF INTEGER
//     DECLARE i:INTEGER
//     DECLARE j:INTEGER
//     DECLARE tem:INTEGER
//     DECLARE swap:BOOLEAN
//     i<-1
//     REPEAT
//         swap<-FALSE
//         FOR j<-1 TO LENGTH(num)-i
//             IF num[j]>num[j+1] THEN
//                 tem<-num[j+1]
//                 num[j+1]<-num[j]
//                 num[j]<-tem
//                 swap<-TRUE
//             ENDIF
//         NEXT j
//         i<-i+1   
//     UNTIL swap=FALSE
//     RETURN num
// ENDFUNCTION



// FUNCTION Sort(num:ARRAY[1:10] OF INTEGER) RETURNS ARRAY[1:10] OF INTEGER
//     DECLARE i:INTEGER
//     DECLARE j:INTEGER
//     DECLARE tem:INTEGER
//     DECLARE swap:BOOLEAN
//     i<-1
//     swap<-TRUE
//     WHILE swap=TRUE
//         swap<-FALSE
//         FOR j<-1 TO LENGTH(num)-i
//             IF num[j]>num[j+1] THEN
//                 tem<-num[j+1]
//                 num[j+1]<-num[j]
//                 num[j]<-tem
//                 swap<-TRUE
//             ENDIF
//         NEXT j
//         i<-i+1   
//     ENDWHILE
//     RETURN num
// ENDFUNCTION
