TYPE Student
    DECLARE Name:STRING
    DECLARE Gender:STRING
    DECLARE Age:INTEGER
ENDTYPE

DECLARE students:ARRAY[1:10] OF Student
DECLARE ano_students:ARRAY[1:7] OF STRING
DECLARE i:INTEGER
DECLARE x:INTEGER
DECLARE myfile:STRING

myfile<-"Student.txt"
OPENFILE myfile FOR WRITE
FOR i <- 1 TO 10
    OUTPUT "Enter name"
    INPUT students[i].Name
    OUTPUT "Enter gender"
    INPUT students[i].Gender
    OUTPUT "Enter age"
    INPUT students[i].Age
    WRITEFILE myfile,students[i]
NEXT i
CLOSEFILE myfile

OPENFILE myfile FOR READ
REPEAT
    x<-1
    IF x<LENGTH(ano_students)+1 THEN
        READFILE myfile,ano_students[x]
        x<-x+1
    ENDIF
    IF x>LENGTH(ano_students) THEN
        OUTPUT "The array is full"
    ENDIF
UNTIL EOF(myfile)
CLOSEFILE myfile

OUTPUT ano_students