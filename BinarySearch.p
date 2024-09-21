DECLARE find:BOOLEAN
DECLARE low:INTEGER
DECLARE high:INTEGER
DECLARE mid:INTEGER
DECLARE nums:ARRAY[1:10] OF INTEGER
DECLARE searchnum:INTEGER
find<-FALSE
low<-1
high<-LENGTH(nums)
WHILE find=FALSE AND low<=high
    mid<-(low+high) DIV 2
    IF nums[mid]=searchnum THEN
        find<-TRUE
    ENDIF
    IF searchnum>nums[mid] THEN
        low<-mid+1
    ENDIF
    IF searchnum<nums[mid] THEN
        high<-mid-1
    ENDIF
ENDWHILE