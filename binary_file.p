// // Sequentially access
// // write
// OPENFILE CarFile FOR WRITE
// FOR i<-1 TO MaxRecords
//     PUTRECORD CarFile,Car[i]
// NEXT i
// CLOSEFILE CarFile

// //read
// OPENFILE CarFile FOR READ
// FOR i <- 1 TO MaxRecords
//     GETRECORD CarFile,Car[i]
// NEXT i
// CLOSEFILE CarFile



// //Randomly access
// //write
// OPENFILE CarFile FOR RANDOM
// Address<-Hash(ThisCar.VehicleID)
// SEEK CarFile,Address
// PUTRECORD CarFile,ThisCar
// CLOSEFILE CarFile

// //read
// OPENFILE CarFile FOR RANDOM
// Address<-Hash(ThisCar.VehicleID)
// SEEK CarFile,Address
// GETRECORD CarFile,ThisCar
// CLOSEFILE CarFile



// //exception
// TRY
//     <>
// EXCEPT
//     <>
// ENDTRY