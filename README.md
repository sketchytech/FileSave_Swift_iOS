FileSave
========

Simple class for iOS to save files to the Library and Documents Directories with optional subdirectories.

It's really easy to use, just import the FileSave.h file and then use the following class methods, like so:


    [FileSave saveContentsOfStringToDocumentsDirectory:@"Hello World" withName:@"helloword.txt" andSubDirectory:nil];
    [FileSave saveContentsOfStringToLibraryDirectory:@"Hello World" withName:@"/helpmeworld.text" andSubDirectory:@"INeedHelp];
    
    NSData *fileData = // your data;
    [FileSave saveDataToDocumentsDirectory:fileData withName:@"Hello.json" andSubDirectory:@"hero"];
    [FileSave saveDataToLibraryDirectory:fileData withName:@"Hello.json" andSubDirectory:@"/help/me/world"];

Notice that it doesn't matter whether you begin with a slash or not on the filename or directory name.

<b>Class methods also exist for saving to Caches, Temporary and Application Support directories.</b>

##New Swift version, use following methods:

    
    FileSave.saveContentsOfStringToDocumentsDirectory("your string", path:"yourFileName.extension", subdirectory:"yourSubfolder")
    FileSave.saveContentsOfStringToLibraryDirectory("your string", path:"yourFileName.extension", subdirectory:"yourSubfolder")
    FileSave.saveContentsOfStringToTemporaryDirectory("your string", path:"yourFileName.extension", subdirectory:"yourSubfolder")
    FileSave.saveContentsOfStringToCachesDirectory("your string", path:"yourFileName.extension", subdirectory:"yourSubfolder")
    FileSave.saveContentsOfStringToApplicationSupportDirectory("your string", path:"yourFileName.extension", subdirectory:"yourSubfolder")
    
    // var data:NSData = // your data 
    FileSave.saveDataToDocumentsDirectory(data, path: "yourFileName.extension", subdirectory: "yourSubfolder")
    FileSave.saveDataToLibraryDirectory(data, path: "yourFileName.extension", subdirectory: "yourSubfolder")
    FileSave.saveDataToTemporaryDirectory(data, path: "yourFileName.extension", subdirectory: "yourSubfolder")
    FileSave.saveDataToCachesDirectory(data, path: "yourFileName.extension", subdirectory: "yourSubfolder")
    FileSave.saveDataToApplicationSupportDirectory(data, path: "yourFileName.extension", subdirectory: "yourSubfolder")

See companion class: [FileDelete](https://github.com/sketchytech/FileDelete)
