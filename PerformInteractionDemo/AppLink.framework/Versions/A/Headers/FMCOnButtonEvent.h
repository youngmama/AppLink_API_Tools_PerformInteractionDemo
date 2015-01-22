//  FMCOnButtonEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCButtonName.h>
#import <AppLink/FMCButtonEventMode.h>

@interface FMCOnButtonEvent : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCButtonName* buttonName;
@property(strong) FMCButtonEventMode* buttonEventMode;
@property(strong) NSNumber* customButtonID;

@end
