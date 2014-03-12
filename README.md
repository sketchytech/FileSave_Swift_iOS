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

Class methods also exist for saving to Caches, Temporary and Application Support directories.

See companion class: [FileDelete](https://github.com/sketchytech/FileDelete)
