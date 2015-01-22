//
//  ViewController.h
//  PerformInteractionDemo
//
//  Created by ShiStella on 8/1/15.
//  Copyright (c) 2015年 ford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppLink/AppLink.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,FMCProxyListener>

@property (nonatomic, strong) UITableView *contentTableView;

@property (nonatomic, strong) FMCSyncProxy *proxy;
@property (nonatomic) int autoIncCorrID;

@end

