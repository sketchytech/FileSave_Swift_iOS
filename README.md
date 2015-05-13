FileSave
========

Simple class for iOS to save files to the Library and Documents Directories with optional subdirectories.

Note: If you are working with Swift, it is recommended that you use [SwiftFiles](https://github.com/sketchytech/SwiftFiles), which combines FileSave with FileDelete and FileLoad.

##New Swift version 1.2 (Xcode 6.3 Beta 4), use following methods:
    
    FileSave.saveString("your string", directory:NSSearchPathDirectory.DocumentDirectory, path:"yourFileName.extension", subdirectory:"yourSubfolder")
    FileSave.saveStringToTemporaryDirectory("your string", path:"yourFileName.extension", subdirectory:"yourSubfolder")
    
    
    var data:NSData = // your data 
    FileSave.saveData(data, directory:NSSearchPathDirectory.DocumentDirectory, path: "yourFileName.extension", subdirectory: "yourSubfolder")
    FileSave.saveDataToTemporaryDirectory(data, path: "yourFileName.extension", subdirectory: "yourSubfolder")

The code has been updated for Swift 1.2, no additional updates will be made to Objective-C code and earlier versions of Swift are no longer supported.

See companion class: [FileDelete](https://github.com/sketchytech/FileDelete)

##Objective-C (no longer supported)
It's really easy to use, just import the FileSave.h file and then use the following class methods, like so:

    [FileSave saveContentsOfStringToDocumentsDirectory:@"Hello World" withName:@"helloword.txt" andSubDirectory:nil];
    [FileSave saveContentsOfStringToLibraryDirectory:@"Hello World" withName:@"/helpmeworld.text" andSubDirectory:@"INeedHelp];
    
    NSData *fileData = // your data;
    [FileSave saveDataToDocumentsDirectory:fileData withName:@"Hello.json" andSubDirectory:@"hero"];
    [FileSave saveDataToLibraryDirectory:fileData withName:@"Hello.json" andSubDirectory:@"/help/me/world"];

Notice that it doesn't matter whether you begin with a slash or not on the filename or directory name.

<b>Class methods also exist for saving to Caches, Temporary and Application Support directories.</b>

