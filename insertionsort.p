FUNCTION Sort(num:ARRAY[1:10] OF INTEGER) RETURNS ARRAY[1:10] OF INTEGER
    DECLARE i:INTEGER
    DECLARE j:INTEGER
    DECLARE InsertV:INTEGER
    FOR i <- 2 TO LENGTH(num)
        InsertV<-num[i]
        j<-i-1
        WHILE InsertV<num[j] AND j>=1
            num[j+1]<-num[j]
            j<-j-1
        ENDWHILE
        num[j+1]<-InsertV
    NEXT i
    RETURN num
ENDFUNCTION