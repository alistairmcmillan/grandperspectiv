#import "PlainFileItem.h"

#import "UniformType.h"

@implementation PlainFileItem

// Overrides designated initialiser
- (id) initWithName: (NSString *)nameVal 
             parent: (DirectoryItem *)parentVal 
               size: (ITEM_SIZE) sizeVal 
              flags: (UInt8) flagsVal
       creationTime: (CFAbsoluteTime) creationTimeVal 
   modificationTime: (CFAbsoluteTime) modificationTimeVal {
  return [self initWithName: nameVal 
                     parent: parentVal 
                       size: sizeVal 
                       type: nil 
                      flags: flagsVal
               creationTime: creationTimeVal 
           modificationTime: modificationTimeVal];
}

- (id) initWithName: (NSString *)nameVal 
             parent: (DirectoryItem *)parentVal 
               size: (ITEM_SIZE) sizeVal 
               type: (UniformType *)typeVal 
              flags: (UInt8) flagsVal 
       creationTime: (CFAbsoluteTime) creationTimeVal 
   modificationTime: (CFAbsoluteTime) modificationTimeVal {
  if (self = [super initWithName: nameVal 
                          parent: parentVal 
                            size: sizeVal
                           flags: flagsVal
                    creationTime: creationTimeVal
                modificationTime: modificationTimeVal]) {
    type = [typeVal retain];
  }
  
  return self;
}

- (void) dealloc {
  [type release];
  
  [super dealloc];
}


- (FileItem *) duplicateFileItem: (DirectoryItem *)newParent {
  return [[[PlainFileItem allocWithZone: [newParent zone]] 
              initWithName: name 
                    parent: newParent 
                      size: size
                      type: type 
                     flags: flags
              creationTime: creationTime 
          modificationTime: modificationTime] autorelease];
}


- (UniformType *)uniformType {
  return type;
}

@end
