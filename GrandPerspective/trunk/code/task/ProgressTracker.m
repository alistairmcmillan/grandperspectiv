#import "ProgressTracker.h"

#import "DirectoryItem.h"


NSString  *NumFoldersProcessedKey = @"numFoldersProcessed";
NSString  *CurrentFolderPathKey = @"currentFolderPath";


@implementation ProgressTracker

- (id) init {
  if (self = [super init]) {
    mutex = [[NSLock alloc] init];
    directoryStack = [[NSMutableArray alloc] initWithCapacity: 16];
  }

  return self;
}

- (void) dealloc {
  [mutex release];
  [directoryStack release];
  
  [super dealloc];

}

- (void) reset {
  [mutex lock];
  numFoldersProcessed = 0;
  [directoryStack removeAllObjects];
  [mutex unlock];
}


- (void) processingFolder: (DirectoryItem *)dirItem {
  [mutex lock];
  [directoryStack addObject: dirItem];
  [mutex unlock];
}

- (void) processedFolder: (DirectoryItem *)dirItem {
  [mutex lock];
  NSAssert([directoryStack lastObject] == dirItem, @"Inconsistent stack.");
  [directoryStack removeLastObject];
  numFoldersProcessed++;
  [mutex unlock];
}


- (NSDictionary *)progressInfo {
  NSDictionary  *dict;

  [mutex lock];
  dict = [NSDictionary dictionaryWithObjectsAndKeys:
            [NSNumber numberWithInt: numFoldersProcessed],
            NumFoldersProcessedKey,
            [[directoryStack lastObject] path],
            CurrentFolderPathKey,
            nil];
  [mutex unlock];

  return dict;
}

@end // @implementation ProgressTracker
