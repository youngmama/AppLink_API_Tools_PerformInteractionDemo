//  FMCConsoleController.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <UIKit/UIKit.h>
#import <AppLink/FMCDebugTool.h>

@interface FMCConsoleController : UITableViewController <FMCDebugToolConsole> {
	NSMutableArray* messageList;
    BOOL atBottom;
    NSDateFormatter* dateFormatter;
}

@property (strong, readonly) NSMutableArray *messageList;

-(id) initWithTableView:(UITableView*) tableView;


@end
