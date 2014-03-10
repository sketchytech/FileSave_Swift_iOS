/
//  FileSave.h
//  TableView
//
//  Created by Anthony Levings on 10/03/2014.
//  Copyright (c) 2014 Gylphi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileSave : NSObject
+(BOOL)saveDataToDocumentsDirectory:(NSData *)fileData withName:(NSString *)path andSubDirectory:(NSString *)subdirectory;
+(BOOL)saveDataToLibraryDirectory:(NSData *)fileData withName:(NSString *)path andSubDirectory:(NSString *)subdirectory;

+(BOOL)saveContentsOfStringToDocumentsDirectory:(NSString *)fileString withName:(NSString *)path andSubDirectory:(NSString *)subdirectory;
+(BOOL)saveContentsOfStringToLibraryDirectory:(NSString *)fileString withName:(NSString *)path andSubDirectory:(NSString *)subdirectory;
@end
