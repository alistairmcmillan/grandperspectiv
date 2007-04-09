#import "DirectoryViewControlSettings.h"


@implementation DirectoryViewControlSettings

- (id) init {
  return [self initWithColorMappingKey: nil colorPaletteKey: nil mask: nil 
                 maskEnabled: NO showFreeSpace: NO];
}

- (id) initWithColorMappingKey: (NSString *)colorMappingKeyVal 
         colorPaletteKey: (NSString *)colorPaletteKeyVal
         mask: (NSObject <FileItemTest> *)maskVal
         maskEnabled: (BOOL) maskEnabledVal 
         showFreeSpace: (BOOL) showFreeSpaceVal {
  if (self = [super init]) {
    colorMappingKey = [colorMappingKeyVal retain];
    colorPaletteKey = [colorPaletteKeyVal retain];
    mask = [maskVal retain];
    maskEnabled = maskEnabledVal;
    showFreeSpace = showFreeSpaceVal;
  }
  
  return self;
}

- (void) dealloc {
  [colorMappingKey release];
  [colorPaletteKey release];
  [mask release];

  [super dealloc];
}


- (NSString*) colorMappingKey {
  return colorMappingKey;
}

- (void) setColorMappingKey: (NSString *)key {
  if (key != colorMappingKey) {
    [colorMappingKey release];
    colorMappingKey = [key retain];
  }
}


- (NSString*) colorPaletteKey {
  return colorPaletteKey;
}
- (void) setColorPaletteKey: (NSString *)key {
  if (key != colorPaletteKey) {
    [colorPaletteKey release];
    colorPaletteKey = [key retain];
  }
}


- (NSObject <FileItemTest>*) fileItemMask {
  return mask;
}

- (void) setFileItemMask: (NSObject <FileItemTest> *)maskVal {
  if (maskVal != mask) {
    [mask release];
    mask = [maskVal retain];
  }
}


- (BOOL) fileItemMaskEnabled {
  return maskEnabled;
}

- (void) setFileItemMaskEnabled: (BOOL)flag {
  maskEnabled = flag;
}


- (BOOL) showFreeSpace {
  return showFreeSpace;
}

- (void) setShowFreeSpace: (BOOL)flag {
  showFreeSpace = flag;
}

@end
