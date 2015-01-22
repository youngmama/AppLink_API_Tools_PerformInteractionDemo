//  FMCSiphonServer.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@interface FMCSiphonServer : NSObject <NSStreamDelegate,NSNetServiceDelegate> {}

+ (void)enableSiphonDebug;
+ (void)disableSiphonDebug;
+ (bool)_siphonRawTransportDataFromApp:(const void*) msgBytes msgBytesLength:(int) msgBytesLength;
+ (bool)_siphonRawTransportDataFromSync:(const void*) msgBytes msgBytesLength:(int) msgBytesLength;
+ (bool)_siphonNSLogData:(NSString *) textToLog;
+ (bool)_siphonFormattedTraceData:(NSString*) traceData;
+ (bool)_siphonIsActive;
+ (void)init;
+ (void)dealloc;

@end
