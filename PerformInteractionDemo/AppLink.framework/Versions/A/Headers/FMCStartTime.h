//  FMCStartTime.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCStartTime : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* hours;
@property(strong) NSNumber* minutes;
@property(strong) NSNumber* seconds;

@end
