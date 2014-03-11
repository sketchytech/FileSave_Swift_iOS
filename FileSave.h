/
//  FileSave.h
//  TableView
//
//  Created by Anthony Levings on 10/03/2014.
//  Copyright (c) 2014 Gylphi. All rights reserved. You are free to use this code but we'd grateful if you acknowledge the source when using the code or reproducing it.
//

#import <Foundation/Foundation.h>

@interface FileSave : NSObject

#pragma mark - string methods
+(BOOL)saveContentsOfStringToDocumentsDirectory:(NSString *)fileString withName:(NSString *)path andSubDirectory:(NSString *)subdirectory;
+(BOOL)saveContentsOfStringToLibraryDirectory:(NSString *)fileString withName:(NSString *)path andSubDirectory:(NSString *)subdirectory;

#pragma mark - data methods
+(BOOL)saveDataToDocumentsDirectory:(NSData *)fileData withName:(NSString *)path andSubDirectory:(NSString *)subdirectory;
+(BOOL)saveDataToLibraryDirectory:(NSData *)fileData withName:(NSString *)path andSubDirectory:(NSString *)subdirectory;

@end
