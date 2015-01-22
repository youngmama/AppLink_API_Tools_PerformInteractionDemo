//  FMCSetMediaClockTimer.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCStartTime.h>
#import <AppLink/FMCUpdateMode.h>

@interface FMCSetMediaClockTimer : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCStartTime* startTime;
@property(strong) FMCStartTime* endTime;
@property(strong) FMCUpdateMode* updateMode;

@end
