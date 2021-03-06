#import "ScanTaskInput.h"

#import "PreferencesPanelControl.h"


@implementation ScanTaskInput

// Overrides designated initialiser
- (id) init {
  NSAssert(NO, @"Use initWithPath:fileSizeMeasure:filterTest instead");
}

- (id) initWithPath: (NSString *)path 
         fileSizeMeasure: (NSString *)fileSizeMeasureVal
         filterTest: (NSObject <FileItemTest> *)filterTestVal {

  NSUserDefaults  *userDefaults = [NSUserDefaults standardUserDefaults];
  
  BOOL  showPackageContentsByDefault =
          ( [userDefaults boolForKey: ShowPackageContentsByDefaultKey]
            ? NSOnState : NSOffState );
            
  return [self initWithPath: path
                 fileSizeMeasure: fileSizeMeasureVal
                 filterTest: filterTestVal
                 packagesAsFiles: !showPackageContentsByDefault];
}
         
- (id) initWithPath: (NSString *)path 
         fileSizeMeasure: (NSString *)fileSizeMeasureVal
         filterTest: (NSObject <FileItemTest> *)filterTestVal
         packagesAsFiles: (BOOL) packagesAsFilesVal {
  if (self = [super init]) {
    pathToScan = [path retain];
    fileSizeMeasure = [fileSizeMeasureVal retain];
    filterTest = [filterTestVal retain];
    packagesAsFiles = packagesAsFilesVal;
  }
  return self;
}

- (void) dealloc {
  [pathToScan release];
  [fileSizeMeasure release];
  [filterTest release];
  
  [super dealloc];
}


- (NSString *) pathToScan {
  return pathToScan;
}

- (NSString *) fileSizeMeasure {
  return fileSizeMeasure;
}

- (NSObject <FileItemTest> *) filterTest {
  return filterTest;
}

- (BOOL) packagesAsFiles {
  return packagesAsFiles;
}

@end
