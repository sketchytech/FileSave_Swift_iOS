FileSave
========

Simple method for iOS to save files to the Library and Documents Directories with optional subdirectories.

It's really easy to us, just import the FileSave.h file and then use the following class methds, likes so:


    [FileSave saveContentsOfStringToDocumentsDirectory:@"Hello World" withName:@"helloword.txt" andSubDirectory:nil];
    [FileSave saveContentsOfStringToLibraryDirectory:@"Hello World" withName:@"/helpmeworld.text" andSubDirectory:@"INeedHelp];
    
    NSData *fileData = // your data;
    [FileSave saveDataToDocumentsDirectory:fileData withName:@"Hello.json" andSubDirectory:@"hero"];
    [FileSave saveDataToLibraryDirectory:fileData withName:@"Hello.json" andSubDirectory:@"/help/me/world"];
