//  FMCAbstractTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCTransport.h"
#import "FMCTransportDelegate.h"

@interface FMCAbstractTransport : NSObject<FMCTransport>

@property (weak) id<FMCTransportDelegate> delegate;
@property (strong) NSString *debugConsoleGroupName;
@property (strong, readonly) NSString* endpointName;
@property (strong, readonly) NSString* endpointParam;

- (id) initWithEndpoint:(NSString*) endpoint endpointParam:(NSString*) endointParam;

- (void)notifyTransportConnected;
- (void)notifyTransportDisconnected;
- (void)handleDataReceivedFromTransport:(NSData *)receivedData;

@end
