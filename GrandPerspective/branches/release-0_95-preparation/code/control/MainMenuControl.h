#import <Cocoa/Cocoa.h>

@class WindowManager;
@class AsynchronousTaskManager;
@class EditFilterWindowControl;

@interface MainMenuControl : NSObject {
  WindowManager  *windowManager;
  
  AsynchronousTaskManager  *scanTaskManager;
  
  EditFilterWindowControl  *editFilterWindowControl;
}

- (IBAction) openDirectoryView:(id)sender;
- (IBAction) rescanDirectoryView:(id)sender;
- (IBAction) duplicateDirectoryView:(id)sender;
- (IBAction) twinDirectoryView:(id)sender;
- (IBAction) saveDirectoryViewImage:(id)sender;

@end
