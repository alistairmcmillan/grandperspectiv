#import <Cocoa/Cocoa.h>


/* Result that should be returned by -runTaskWithInput to signal that a task 
 * with a "nil" result was carried out successfully.
 */
extern NSString  *SuccessfulVoidResult;


/* Classes that implement this protocol can be used to execute tasks in a 
 * background thread. The protocol is used to start tasks and to optionally 
 * abort them.
 */
@protocol TaskExecutor

/* Run task with the given input and return the result. It should return "nil" 
 * iff the task has been aborted. It should return SuccessfulVoidResult when 
 * the task with a void result completes successfully.
 *
 * Invoked from a thread other than the main one.
 */
- (id) runTaskWithInput: (id) input;

/* Aborts the currently running task, if any. As long as the executor is
 * disabled, it should not accept any new tasks (but instead let 
 * runTaskWithInput: return nil immediately).
 *
 * Invoked from the main thread.
 */
- (void) disable;

/* Enables the executor again.
 *
 * Invoked from a thread other than the main one.
 */
- (void) enable;

@end
