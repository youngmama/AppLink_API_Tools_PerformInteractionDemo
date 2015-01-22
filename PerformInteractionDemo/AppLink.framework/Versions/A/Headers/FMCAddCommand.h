//  FMCAddCommand.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCMenuParams.h>
#import <AppLink/FMCImage.h>

@interface FMCAddCommand : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* cmdID;
@property(strong) FMCMenuParams* menuParams;
@property(strong) NSMutableArray* vrCommands;
@property(strong) FMCImage* cmdIcon;

@end
