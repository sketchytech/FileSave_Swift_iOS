//
//  FileSave.m
//
//  Created by Anthony Levings on 10/03/2014.
//  Copyright (c) 2014 Gylphi. All rights reserved. You are free to use this code but we'd grateful if you acknowledge the source when using the code or reproducing it.
//

#import "FileSave.h"

@implementation FileSave



+ (NSURL *)applicationDocumentsDirectory {
    
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)applicationLibraryDirectory {
    
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

+(NSString *)stripSlashIfNeeded:(NSString *)stringWithPossibleSlash {
    
    // If the file name contains a slash at the beginning then we remove so that we don't end up with two
    if ([stringWithPossibleSlash compare:@"/" options:NSLiteralSearch range:NSMakeRange(0, 1)]==NSOrderedSame) {
        stringWithPossibleSlash = [stringWithPossibleSlash substringFromIndex:1];
    }
    // Return the string with no slash at the beginning
    return stringWithPossibleSlash;
}

+(BOOL)createSubDirectory:(NSString *)subdirectoryPath {
    NSError *error;
    BOOL isDir;
    BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:subdirectoryPath isDirectory:&isDir];
    if (exists) {
        /* a file of the same name exists, we don't care about this so won't do anything */
        if (isDir) {
            /* subdirectory already exists, don't create it again */
            return YES;
        }
    }
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:subdirectoryPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) NSLog(@"%@",error);
    return success;
}

+(BOOL)saveDataToDocumentsDirectory:(NSData *)fileData withName:(NSString *)path andSubDirectory:(NSString *)subdirectory
{
    // Remove unnecessary slash if need
    path = [self stripSlashIfNeeded:path];
    subdirectory = [self stripSlashIfNeeded:subdirectory];
    
    // Create generic beginning to file save path
    NSMutableString *savePath = [[NSMutableString alloc] initWithFormat:@"%@/",[self applicationDocumentsDirectory].path];

    if (subdirectory){
        [savePath appendString:subdirectory];
        [self createSubDirectory:[savePath copy]];
        [savePath appendString:@"/"];
    }
    
    // Add requested save path
    [savePath appendString:path];
    // Save the file and see if it was successful
    BOOL ok = [[NSFileManager defaultManager] createFileAtPath:[savePath copy] contents:fileData attributes:nil];
    
    // Return status of file save
    return ok;
        
}

+(BOOL)saveDataToLibraryDirectory:(NSData *)fileData withName:(NSString *)path andSubDirectory:(NSString *)subdirectory
{
    
    // Remove unnecessary slash if need
    path = [self stripSlashIfNeeded:path];
    subdirectory = [self stripSlashIfNeeded:subdirectory];
    
    // Create generic beginning to file save path
    NSMutableString *savePath = [[NSMutableString alloc] initWithFormat:@"%@/",[self applicationLibraryDirectory].path];
    
    
    if (subdirectory){
        [savePath appendString:subdirectory];
        [self createSubDirectory:[savePath copy]];
        [savePath appendString:@"/"];
    }
    
    
    // Add requested save path
    [savePath appendString:path];
    
    NSLog(@"%@",savePath);
    // Save the file and see if it was successful
    BOOL ok = [[NSFileManager defaultManager] createFileAtPath:[savePath copy] contents:fileData attributes:nil];
    
    // Return status of file save
    return ok;
}

+(BOOL)saveContentsOfStringToDocumentsDirectory:(NSString *)fileString withName:(NSString *)path andSubDirectory:(NSString *)subdirectory {
    // Remove unnecessary slash if need
    path = [self stripSlashIfNeeded:path];
    
    // Create generic beginning to file save path
    NSMutableString *savePath = [[NSMutableString alloc] initWithFormat:@"%@/",[self applicationDocumentsDirectory].path];
    
    if (subdirectory){
        [savePath appendString:subdirectory];
        [self createSubDirectory:[savePath copy]];
        [savePath appendString:@"/"];
    }
    // Add requested save path
    [savePath appendString:path];
    
    NSError *error;
    // Save the file and see if it was successful
    BOOL ok = [fileString writeToFile:savePath atomically:NO encoding:NSUTF8StringEncoding error:&error];
    
    if (error) NSLog(@"%@", error);
    
    // Return status of file save
    return ok;

}
+(BOOL)saveContentsOfStringToLibraryDirectory:(NSString *)fileString withName:(NSString *)path andSubDirectory:(NSString *)subdirectory {

    // Remove unnecessary slash if need
    path = [self stripSlashIfNeeded:path];
    
    // Create generic beginning to file save path
    NSMutableString *savePath = [[NSMutableString alloc] initWithFormat:@"%@/",[self applicationLibraryDirectory].path];
    
    if (subdirectory){
        [savePath appendString:subdirectory];
        [self createSubDirectory:[savePath copy]];
        [savePath appendString:@"/"];
    }
    
    // Add requested save path
    [savePath appendString:path];
    
    NSError *error;
    // Save the file and see if it was successful
    BOOL ok = [fileString writeToFile:savePath atomically:NO encoding:NSUTF8StringEncoding error:&error];
    
    if (error) NSLog(@"%@", error);
    
    // Return status of file save
    return ok;

}

@end
