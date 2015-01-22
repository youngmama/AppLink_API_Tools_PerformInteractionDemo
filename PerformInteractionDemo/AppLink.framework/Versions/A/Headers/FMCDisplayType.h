//  FMCDisplayType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCDisplayType : FMCEnum {}

+(FMCDisplayType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCDisplayType*) CID;
+(FMCDisplayType*) TYPE2;
+(FMCDisplayType*) TYPE5;
+(FMCDisplayType*) NGN;
+(FMCDisplayType*) GEN2_8_DMA;
+(FMCDisplayType*) GEN2_6_DMA;
+(FMCDisplayType*) MFD3;
+(FMCDisplayType*) MFD4;
+(FMCDisplayType*) MFD5;
+(FMCDisplayType*) GEN3_8_INCH;

@end
