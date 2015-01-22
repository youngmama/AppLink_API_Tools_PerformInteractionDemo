//  FMCAlert.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

@interface FMCAlert : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSString* alertText1;
@property(strong) NSString* alertText2;
@property(strong) NSString* alertText3;
@property(strong) NSMutableArray* ttsChunks;
@property(strong) NSNumber* duration;
@property(strong) NSNumber* playTone;
@property(strong) NSNumber* progressIndicator;
@property(strong) NSMutableArray* softButtons;

@end
