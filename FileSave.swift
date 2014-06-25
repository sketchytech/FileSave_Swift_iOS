import Foundation

class FileSave {
    
    class func saveDataToDocumentsDirectory(fileData:NSData, path:String, subdirectory:String?) -> Bool
    {
    // Remove unnecessary slash if need
    var newPath = FileSaver.stripSlashIfNeeded(path)
        var newSubdirectory:String?
        if subdirectory {
        newSubdirectory = FileSaver.stripSlashIfNeeded(subdirectory!)
        }
    // Create generic beginning to file save path
    var savePath = self.applicationDocumentsDirectory().path+"/"
    
    if newSubdirectory {
    savePath += newSubdirectory!
    self.createSubDirectory(savePath)
    savePath += "/"
    }
    
    // Add requested save path
    savePath += newPath
        
        println(savePath)
    // Save the file and see if it was successful
        var ok:Bool = NSFileManager.defaultManager().createFileAtPath(savePath,contents:fileData, attributes:nil)
    
    // Return status of file save
    return ok;
    
    }
    
    class func saveDataToLibraryDirectory(fileData:NSData, path:String, subdirectory:String?) -> Bool
    {
    
        // Remove unnecessary slash if need
        var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String?
        if subdirectory {
            newSubdirectory = FileSaver.stripSlashIfNeeded(subdirectory!)
        }
        
        // Create generic beginning to file save path
        var savePath = self.applicationLibraryDirectory().path+"/"
        
        if newSubdirectory {
            savePath += subdirectory!
            self.createSubDirectory(savePath)
            savePath += "/"
        }
        
        // Add requested save path
        savePath += newPath
        // Save the file and see if it was successful
        var ok:Bool = NSFileManager.defaultManager().createFileAtPath(savePath,contents:fileData, attributes:nil)
        
        // Return status of file save
        return ok;
    }
    
    class func saveDataToTemporaryDirectory(fileData:NSData, path:String, subdirectory:String?) -> Bool
    {
    
    // Remove unnecessary slash if need
    var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String?
        if subdirectory {
            newSubdirectory = FileSaver.stripSlashIfNeeded(subdirectory!)
        }
    
    // Create generic beginning to file save path
    var savePath = self.applicationTemporaryDirectory().path+"/"
    
    if newSubdirectory {
    savePath += newSubdirectory!
    self.createSubDirectory(savePath)
    savePath += "/"
    }
    
    // Add requested save path
    savePath += path
    // Save the file and see if it was successful
    var ok:Bool = NSFileManager.defaultManager().createFileAtPath(savePath,contents:fileData, attributes:nil)
    
    // Return status of file save
    return ok;
    }
    
    class func saveDataToCachesDirectory(fileData:NSData, path:String, subdirectory:String?) -> Bool
    {
    
        
        // Remove unnecessary slash if need
        var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String?
        if subdirectory {
            newSubdirectory = FileSaver.stripSlashIfNeeded(subdirectory!)
        }
        
        // Create generic beginning to file save path
        var savePath = self.applicationCachesDirectory().path+"/"
        
        if newSubdirectory {
            savePath += newSubdirectory!
            self.createSubDirectory(savePath)
            savePath += "/"
        }
        
        // Add requested save path
        savePath += path
        // Save the file and see if it was successful
        var ok:Bool = NSFileManager.defaultManager().createFileAtPath(savePath,contents:fileData, attributes:nil)
        
        // Return status of file save
        return ok;
    }
    
    class func saveDataToApplicationSupportDirectory(fileData:NSData, path:String, subdirectory:String?, excludeFromBackup:Bool) -> Bool
    {
    
    // Remove unnecessary slash if need
    var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String?
        if subdirectory {
            newSubdirectory = FileSaver.stripSlashIfNeeded(subdirectory!)
        }
    
    // Create generic beginning to file save path
    var savePath = self.applicationSupportDirectory().path+"/"
    
    if newSubdirectory {
    savePath += newSubdirectory!
    self.createSubDirectory(savePath)
    savePath += "/"
    }
    
    // Add requested save path
    savePath += path
    // Save the file and see if it was successful
    var ok:Bool = NSFileManager.defaultManager().createFileAtPath(savePath,contents:fileData, attributes:nil)
    
    var error:NSError?
        
    if excludeFromBackup {
        NSURL.URLWithString(savePath).setResourceValue(true,forKey:NSURLIsExcludedFromBackupKey,
    error:&error)
        }
        if error {
         println(error);
        }
    
    // Return status of file save
    return ok;
    }
    
// string methods
    
    class func saveContentsOfStringToDocumentsDirectory(fileString:String, path:String, subdirectory:String) -> Bool {
    // Remove unnecessary slash if need
    var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String? = self.stripSlashIfNeeded(subdirectory)
    
    // Create generic beginning to file save path
    var savePath = self.applicationDocumentsDirectory().path+"/"
    
    if newSubdirectory {
    savePath += newSubdirectory!
    self.createSubDirectory(savePath)
    savePath += "/"
    }
    
    // Add requested save path
    savePath += path
    
    var error:NSError?;
    // Save the file and see if it was successful
        var ok:Bool = fileString.writeToFile(savePath, atomically:false, encoding:NSUTF8StringEncoding, error:&error)
    
        if error {println(error)}
    
    // Return status of file save
    return ok;
    
    }
    class func saveContentsOfStringToLibraryDirectory(fileString:String, path:String, subdirectory:String) -> Bool {
    
        var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String? = self.stripSlashIfNeeded(subdirectory)
        
        // Create generic beginning to file save path
        var savePath = self.applicationLibraryDirectory().path+"/"
        
        if newSubdirectory {
            savePath += subdirectory
            self.createSubDirectory(savePath)
            savePath += "/"
        }
        
        // Add requested save path
        savePath += path
        
        var error:NSError?;
        // Save the file and see if it was successful
        var ok:Bool = fileString.writeToFile(savePath, atomically:false, encoding:NSUTF8StringEncoding, error:&error)
        
        if (error) {println(error)}
        
        // Return status of file save
        return ok;
    
    }
    class func saveContentsOfStringToTemporaryDirectory(fileString:String, path:String, subdirectory:String) -> Bool {
    
    var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String? = self.stripSlashIfNeeded(subdirectory)
    
    // Create generic beginning to file save path
    var savePath = self.applicationTemporaryDirectory().path+"/"
    
    if newSubdirectory {
    savePath += newSubdirectory!
    self.createSubDirectory(savePath)
    savePath += "/"
    }
    
    // Add requested save path
    savePath += path
    
    var error:NSError?;
    // Save the file and see if it was successful
        var ok:Bool = fileString.writeToFile(savePath, atomically:false, encoding:NSUTF8StringEncoding, error:&error)
    
    if error {
        println(error)
        }
    
    // Return status of file save
    return ok;

    }
    
    class func saveContentsOfStringToCachesDirectory(fileString:String, path:String, subdirectory:String) -> Bool {
    
    var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String? = self.stripSlashIfNeeded(subdirectory)
    
    // Create generic beginning to file save path
    var savePath = self.applicationCachesDirectory().path+"/"
    
    if newSubdirectory {
    savePath += newSubdirectory!
    self.createSubDirectory(savePath)
    savePath += "/"
    }
    
    // Add requested save path
    savePath += path
    
    var error:NSError?;
    // Save the file and see if it was successful
        var ok:Bool = fileString.writeToFile(savePath, atomically:false, encoding:NSUTF8StringEncoding, error:&error)
    
    if error {
        println(error)
        }
    
    // Return status of file save
    return ok;

    
    }
    
    
    class func saveContentsOfStringToApplicationSupportDirectory(fileString:String, path:String, subdirectory:String, excludeFromBackUp:Bool) -> Bool {
    
    var newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String? = self.stripSlashIfNeeded(subdirectory)
    
    // Create generic beginning to file save path
    var savePath = self.applicationSupportDirectory().path+"/"
    
    if newSubdirectory {
    savePath += newSubdirectory!
    self.createSubDirectory(savePath)
    savePath += "/"
    }
    
    // Add requested save path
    savePath += path
    
    var error:NSError?;
    // Save the file and see if it was successful
    var ok:Bool = fileString.writeToFile(savePath, atomically:false, encoding:NSUTF8StringEncoding, error:&error)
    
    if error {println(error)}
    
    var errorExclude:NSError?
    
    if excludeFromBackUp {
        NSURL.URLWithString(savePath).setResourceValue(true, forKey:NSURLIsExcludedFromBackupKey,
    error:&error)
    }
    if errorExclude {
    println(errorExclude);
    }
    
    // Return status of file save
    return ok;
    }

    
    
// private methods
    
  //directories
    
 class func applicationDocumentsDirectory() -> NSURL {
    
        var documentsDirectory:String?
        var paths:AnyObject[] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true);
    if paths.count > 0 {
        if let pathString = paths[0] as? NSString {
            documentsDirectory = pathString
        }
    }
    
    return NSURL.URLWithString(documentsDirectory)
    }
    
   class func applicationLibraryDirectory() -> NSURL {
        var libraryDirectory:String?
        var paths:AnyObject[] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.LibraryDirectory, NSSearchPathDomainMask.UserDomainMask, true);
        if paths.count > 0 {
            if let pathString = paths[0] as? NSString {
                libraryDirectory = pathString
            }
        }
    return NSURL.URLWithString(libraryDirectory)
    }
    
class func applicationSupportDirectory() -> NSURL {
    var applicationSupportDirectory:String?
    var paths:AnyObject[] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.ApplicationSupportDirectory, NSSearchPathDomainMask.UserDomainMask, true);
    if paths.count > 0 {
        if let pathString = paths[0] as? NSString {
            applicationSupportDirectory = pathString
        }
    }
    return NSURL.URLWithString(applicationSupportDirectory)
    }
    
    
    
    
    
  class func applicationTemporaryDirectory() -> NSURL {
    
        var temporaryDirectory:String? = NSTemporaryDirectory();
    
    return NSURL.URLWithString(temporaryDirectory)
    
    }
    class func applicationCachesDirectory() -> NSURL {
        
        var cachesDirectory:String?

        var paths = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory,.UserDomainMask, true);
        
        if paths.count > 0 {
            if let pathString = paths[0] as? NSString {
                cachesDirectory = pathString
            }
        }
    return NSURL.URLWithString(cachesDirectory);
    }
   //pragma mark - strip slashes
    
class func stripSlashIfNeeded(stringWithPossibleSlash:String) -> String {
    var stringWithoutSlash:String = stringWithPossibleSlash
    // If the file name contains a slash at the beginning then we remove so that we don't end up with two
    if stringWithPossibleSlash.hasPrefix("/") {
    stringWithoutSlash = stringWithPossibleSlash.substringFromIndex(1)
    }
    // Return the string with no slash at the beginning
    return stringWithoutSlash
    }
    
    class func createSubDirectory(subdirectoryPath:NSString) -> Bool {
    var error:NSError?
    var isDir:ObjCBool=false;
    var exists:Bool = NSFileManager.defaultManager().fileExistsAtPath(subdirectoryPath, isDirectory:&isDir)
    if (exists) {
    /* a file of the same name exists, we don't care about this so won't do anything */
    if isDir==true {
    /* subdirectory already exists, don't create it again */
    return true;
    }
    }
    var success:Bool = NSFileManager.defaultManager().createDirectoryAtPath(subdirectoryPath, withIntermediateDirectories:true, attributes:nil, error:&error)
    
    if error { println(error) }
    
    return success;
    }
}
