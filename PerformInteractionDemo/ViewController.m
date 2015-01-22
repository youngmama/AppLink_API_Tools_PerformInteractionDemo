//
//  ViewController.m
//  PerformInteractionDemo
//
//  Created by ShiStella on 8/1/15.
//  Copyright (c) 2015年 ford. All rights reserved.
//

// These should be replaced with a vaild AppName and AppID
#define PLACEHOLDER_APPNAME @"Perform Interaction Demo"
#define PLACEHOLDER_APPID @"012345678"

// IDs used in the settings bundle
#define PREFS_FIRST_RUN @"firstRun"
#define PREFS_PROTOCOL @"protocol"
#define PREFS_IPADDRESS @"ipaddress"
#define PREFS_PORT @"port"

#define kContentViewTag 88

#import "ViewController.h"
#import "LogInfo.h"
#import "LockViewController.h"

const int kChoiceSetStart_ID=100;
const int kChoice_Start_ID=200;
const int kChoice_PageDown_ID=299;


@interface ViewController ()

@end

@implementation ViewController{
    NSArray *contents;
    NSMutableArray *contentList;
    
    BOOL isFirstRun;
    BOOL isLocked;
    
    NSMutableArray *softButtons;
    
    NSArray *testList;
    NSArray *choiceSetArray;
    int piNum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    float screenWidth = [[UIScreen mainScreen] bounds].size.width;
    float screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    contentList = [[NSMutableArray alloc] init];
    _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(6, 120, screenWidth-12, screenHeight-110)];
    [self.view addSubview:_contentTableView];
    _contentTableView.dataSource = self;
    _contentTableView.delegate = self;
    _contentTableView.tag = kContentViewTag;
    
    softButtons = [[NSMutableArray alloc] init];
    isFirstRun = YES;
    
    testList = [NSArray arrayWithObjects:@"上海",@"北京",@"天津",@"重庆",@"南京",@"深圳",@"宁波",@"杭州",@"成都",@"广州",@"青岛",@"大连",@"澳门",@"香港",@"厦门",@"福州",@"苏州",@"甘肃",@"石家庄",@"长沙", nil];
    [self setupProxy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addData:(NSString *)str
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd-HH:mm:ss"];

    LogInfo *log = [[LogInfo alloc] init];
    log.logContent = str;
    log.logTime = [dateFormatter stringFromDate:[NSDate date]];
    [contentList addObject:log];
    contents = (NSArray *)[contentList copy];
    [_contentTableView reloadData];
}

#pragma mark --
#pragma UITableViewDataSourceDelegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contents count];;
}

#pragma mark --
#pragma UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"simpleCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    LogInfo * log = [contents objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = [NSString stringWithFormat:@"%@,\n%@",log.logTime,log.logContent];;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LogInfo *log = [contents objectAtIndex:indexPath.row];
    NSString * displayStr = [NSString stringWithFormat:@"%@,\n %@",log.logTime,log.logContent];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Detail" message:displayStr delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark Settings Bundle Defaults
-(void) savePreferences {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    //Set to match settings.bundle defaults
    if (![[prefs objectForKey:PREFS_FIRST_RUN] isEqualToString:@"False"]) {
        [prefs setObject:@"False" forKey:PREFS_FIRST_RUN];
        [prefs setObject:@"iap" forKey:PREFS_PROTOCOL];
        [prefs setObject:@"192.168.0.1" forKey:PREFS_IPADDRESS];
        [prefs setObject:@"50007" forKey:PREFS_PORT];
        
        [prefs synchronize];
    }
}

#pragma mark --
#pragma Lock Screen methods
- (void)lockUserInterface
{
    if (!isLocked) {
        [FMCDebugTool logInfo:@"lockUserInterface"];
        [self addData:@"lockUserInterface"];
        isLocked = YES;
        LockViewController *lockVC = [[LockViewController alloc] init];
        [self.navigationController pushViewController:lockVC animated:YES];
    }
}

- (void)unlockUserInterface
{
    if (isLocked) {
        [FMCDebugTool logInfo:@"unlockUserInterface"];
        [self addData:@"unlockUserInterface"];
        isLocked = NO;
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma Applink proxy
-(void) setupProxy {
    [FMCDebugTool logInfo:@"setupProxy"];
    [self addData:@"setupProxy"];
    
    if (isFirstRun) {
        [self savePreferences];
    }
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([[prefs objectForKey:PREFS_PROTOCOL] isEqualToString:@"tcpl"]) {
        _proxy = [FMCSyncProxyFactory buildSyncProxyWithListener: self
                                                    tcpIPAddress: nil
                                                         tcpPort: [prefs objectForKey:PREFS_PORT]];
    } else if ([[prefs objectForKey:PREFS_PROTOCOL] isEqualToString:@"tcps"]) {
        _proxy = [FMCSyncProxyFactory buildSyncProxyWithListener: self
                                                    tcpIPAddress: [prefs objectForKey:PREFS_IPADDRESS]
                                                         tcpPort: [prefs objectForKey:PREFS_PORT]];
    } else{
        _proxy = [FMCSyncProxyFactory buildSyncProxyWithListener: self];
    }
    
    _autoIncCorrID = 101;
}

-(void) teardownProxy {
    [FMCDebugTool logInfo:@"teardownProxy"];
    [self addData:@"teardownProxy"];
    [_proxy dispose];
    _proxy = nil;
}

#pragma mark --
#pragma FMCProxyListener

-(void) onOnDriverDistraction:(FMCOnDriverDistraction*) notification
{
    [self addData:@"onOnDriverDistraction"];
}

-(void) onOnHMIStatus:(FMCOnHMIStatus*) notification
{
    [self addData:[NSString stringWithFormat:@"onOnHMIStatus:%@",notification.hmiLevel]];
    if (notification.hmiLevel == FMCHMILevel.HMI_NONE ) {
        
        [FMCDebugTool logInfo:@"HMI_NONE"];
        [self unlockUserInterface];
        
    } else if (notification.hmiLevel == FMCHMILevel.HMI_FULL ) {
        
        [FMCDebugTool logInfo:@"HMI_FULL"];
        
        if(isFirstRun){
            [self lockUserInterface];
            [self buildSoftbuttons];
            [self buildAllChoiceSet];

            [self updateShowScreenMainText1:nil MainText2:nil MediaTrack:nil SoftButtons:softButtons];
            isFirstRun = NO;
        }
        
    } else if (notification.hmiLevel == FMCHMILevel.HMI_BACKGROUND ) {
        [FMCDebugTool logInfo:@"HMI_BACKGROUND"];
    } else if (notification.hmiLevel == FMCHMILevel.HMI_LIMITED ) {
        [FMCDebugTool logInfo:@"HMI_LIMTED"];
    }
}

-(void) onProxyClosed
{
    [self addData:@"onProxyClosed"];
    [FMCDebugTool logInfo:@"onProxyClosed"];

    [self unlockUserInterface];
    [self teardownProxy];
    [self setupProxy];
    isFirstRun = YES;
}

-(void) onProxyOpened
{
    [self addData:@"onProxyOpened"];
    [FMCDebugTool logInfo:@"onProxyOpened"];
    FMCRegisterAppInterface* raiRequest = [FMCRPCRequestFactory buildRegisterAppInterfaceWithAppName:PLACEHOLDER_APPNAME languageDesired:[FMCLanguage EN_US] appID:PLACEHOLDER_APPID];
    raiRequest.isMediaApplication = [NSNumber numberWithBool:YES];
    raiRequest.ngnMediaScreenAppName = nil;
    raiRequest.vrSynonyms = [NSMutableArray arrayWithObjects:@"Perfrom Interaction Demo",@"PID",@"PID测试",nil];
    
    //Build ttsName Array
    NSMutableArray *ttsName = [NSMutableArray arrayWithObject:[FMCTTSChunkFactory buildTTSChunkForString:@"Perfrom Interaction Demo" type:FMCSpeechCapabilities.TEXT]];
    raiRequest.ttsName = ttsName;
    
    [_proxy sendRPCRequest:raiRequest];
}

- (void) buildSoftbuttons
{
    //clear the softbuttons array before build
    if ([softButtons count] > 0) {
        [softButtons removeAllObjects];
    }
    [self addData:@"buildSoftbuttons"];
    
    for (int i = 0; i<1; i++) {
        FMCSoftButton *btn = [[FMCSoftButton alloc] init];
        btn.type = [FMCSoftButtonType TEXT];
        btn.text = @"Start";
        btn.softButtonID = [NSNumber numberWithInt:1001];
        btn.systemAction = [FMCSystemAction DEFAULT_ACTION];
        btn.isHighlighted = [NSNumber numberWithBool:NO];
        [softButtons addObject:btn];
    }
}

- (void)buildAndSendInteractionChoiceSet{
    NSMutableArray *cArry = [[NSMutableArray alloc] init];
    for (int j = 0; j<4; j++) {
        FMCChoice *choice = [[FMCChoice alloc] init];
        choice.choiceID = [NSNumber numberWithInt:(kChoice_Start_ID+j)];
        choice.menuName = [testList objectAtIndex:(j)];
        choice.vrCommands = [NSMutableArray arrayWithObjects: [testList objectAtIndex:(j)], nil];
        choice.image = nil;
        [cArry addObject:choice];
        [self addData:[NSString stringWithFormat:@"---buildAndSendInteractionChoiceSet choiceArray choiceID=%d",(int)(kChoice_Start_ID+j)]];
    }
    // add pagedown
    FMCChoice *pdchoice = [[FMCChoice alloc] init];
    pdchoice.choiceID = [NSNumber numberWithInt:(int)kChoice_PageDown_ID];
    pdchoice.menuName = @"下一页";
    pdchoice.vrCommands = [NSMutableArray arrayWithObjects: @"下一页", nil];
    pdchoice.image = nil;
    [cArry addObject:pdchoice];
    
    FMCCreateInteractionChoiceSet *cics = [FMCRPCRequestFactory buildCreateInteractionChoiceSetWithID:[NSNumber numberWithInt:(kChoiceSetStart_ID + piNum)] choiceSet:(NSArray *)cArry correlationID:[NSNumber numberWithInt:_autoIncCorrID++]];
    [_proxy sendRPCRequest:cics];
    [self addData:[NSString stringWithFormat:@"===buildAndSendInteractionChoiceSet choiceSetID %d",(int)(kChoiceSetStart_ID+piNum)]];
}

- (void)buildAndSendInteractionChoiceSetWithNum:(int)num{
    int startNum = 4*num;
    NSMutableArray *cArry = [[NSMutableArray alloc] init];
    for (int j = startNum; j<4+startNum; j++) {
        FMCChoice *choice = [[FMCChoice alloc] init];
        choice.choiceID = [NSNumber numberWithInt:(kChoice_Start_ID+j)];
        choice.menuName = [testList objectAtIndex:(j)];
        choice.vrCommands = [NSMutableArray arrayWithObjects: [testList objectAtIndex:(j)], nil];
        choice.image = nil;
        [cArry addObject:choice];
        [self addData:[NSString stringWithFormat:@"---buildAndSendInteractionChoiceSet choiceArray choiceID=%d",(int)(kChoice_Start_ID+j)]];
    }
    // add pagedown
    FMCChoice *pdchoice = [[FMCChoice alloc] init];
    pdchoice.choiceID = [NSNumber numberWithInt:(int)kChoice_PageDown_ID];
    pdchoice.menuName = @"下一页";
    pdchoice.vrCommands = [NSMutableArray arrayWithObjects: @"下一页", nil];
    pdchoice.image = nil;
    [cArry addObject:pdchoice];
    
    FMCCreateInteractionChoiceSet *cics = [FMCRPCRequestFactory buildCreateInteractionChoiceSetWithID:[NSNumber numberWithInt:(kChoiceSetStart_ID + num)] choiceSet:(NSArray *)cArry correlationID:[NSNumber numberWithInt:_autoIncCorrID++]];
    [_proxy sendRPCRequest:cics];
    [self addData:[NSString stringWithFormat:@"===buildAndSendInteractionChoiceSet choiceSetID %d",(int)(kChoiceSetStart_ID+num)]];
}

- (void)buildAllChoiceSet
{
    for (int i = 0; i<5; i++) {
        [self buildAndSendInteractionChoiceSetWithNum:i];
    }
}


- (void)updateShowScreenMainText1:(NSString*)text1 MainText2:(NSString*)text2 MediaTrack:(NSString*)track SoftButtons:(NSMutableArray*)buttons
{
    FMCShow* showRequest = [FMCRPCRequestFactory buildShowWithMainField1:text1 mainField2:text2 mainField3:nil mainField4:nil statusBar:nil mediaClock:nil mediaTrack:track alignment:nil graphic:nil softButtons:buttons customPresets:nil correlationID:[NSNumber numberWithInt:self.autoIncCorrID++]];
    [self.proxy sendRPCRequest:showRequest];
    
    if (buttons!=nil) {
        [self addData:[NSString stringWithFormat:@"text1:[%@] + text2:[%@] + track:[%@]+ 1st btn = [%@]",text1,text1,track,((FMCSoftButton *)[buttons objectAtIndex:0]).text]];
    }else{
        [self addData:[NSString stringWithFormat:@"text1:[%@] + text2:[%@] + track:[%@]",text1,text1,track]];
    }
    
}

#pragma mark AppLink Callbacks
-(void) onCreateInteractionChoiceSetResponse:(FMCCreateInteractionChoiceSetResponse *)response{
    [self addData:[NSString stringWithFormat:@"CreateInteractionChoiceSet Response is %@ + result code is %@",response.info,response.resultCode]];
    //    NSLog(@"CreateInteractionChoiceSet Response is %@,result code is %@",response.info,response.resultCode);
}

-(void) onPerformInteractionResponse:(FMCPerformInteractionResponse *)response{
    [self addData:[NSString stringWithFormat:@"PerformInteraction Response is %@ + result code is %@",response.info,response.resultCode]];
//    NSLog(@"PerformInteraction Response is %@,result code is %@",response.info,response.resultCode);
    if ([response.success intValue] == 1) {
        if (piNum < 4) {
            piNum++;
            
            int choiceID = [response.choiceID intValue];
            if (choiceID == kChoice_PageDown_ID) {
                [self startPerformInteractionWithNumber:piNum];
            }else{
                int realNum = choiceID- kChoice_Start_ID;
                FMCAlert* alert = [FMCRPCRequestFactory buildAlertWithAlertText1:@"Alert" alertText2:[testList objectAtIndex:realNum] alertText3:nil duration:[NSNumber numberWithInt:3000] softButtons:nil correlationID:[NSNumber numberWithInt:_autoIncCorrID++]];
                [_proxy sendRPCRequest:alert];
            }
        }else{
            FMCAlert* alert = [FMCRPCRequestFactory buildAlertWithAlertText1:@"Alert" alertText2:@"List finished." alertText3:nil duration:[NSNumber numberWithInt:3000] softButtons:nil correlationID:[NSNumber numberWithInt:_autoIncCorrID++]];
            [_proxy sendRPCRequest:alert];
        }
    }
}


- (void)onOnButtonPress:(FMCOnButtonPress *)notification
{
    if (notification.buttonName == [FMCButtonName CUSTOM_BUTTON]) {
        piNum = 0;
        [self addData:[NSString stringWithFormat:@"onOnButtonPress customBtn with piNum = %d",piNum]];
        
        [self startPerformInteractionWithNumber:0];
    }
}

- (void)startPerformInteractionWithNumber:(int)num
{
    NSMutableArray * listArray;
    if (num == 0) {
        FMCTTSChunk *chunk1 = [[FMCTTSChunk alloc] init];
        chunk1.text = @" 请说出以下地名选择 或 下一页";
        chunk1.type = [FMCSpeechCapabilities TEXT];
        listArray = [[NSMutableArray alloc] initWithObjects:chunk1, nil];
    }else{
        listArray = [[NSMutableArray alloc] init];
    }
    if (testList !=nil) {
        for (int i = num*4; i<4+num*4; i++) {
            FMCTTSChunk *chunk = [[FMCTTSChunk alloc] init];
            chunk.text = [testList objectAtIndex:i];
            chunk.type = [FMCSpeechCapabilities TEXT];
            [listArray addObject:chunk];
        }
    }
    [self addData:[NSString stringWithFormat:@"startPerformInteractionWithNumber choiceSetID %d",(int)(kChoiceSetStart_ID+piNum)]];
    
    FMCPerformInteraction *pi = [FMCRPCRequestFactory buildPerformInteractionWithInitialChunks:listArray initialText:@"请说出以下地名选择或下一页" interactionChoiceSetIDList:[NSArray arrayWithObject:[NSNumber numberWithInt:(kChoiceSetStart_ID+piNum)]] helpChunks:nil timeoutChunks:nil interactionMode:[FMCInteractionMode BOTH] timeout:nil vrHelp:nil correlationID:[NSNumber numberWithInt:(_autoIncCorrID++)]];
    [_proxy sendRPCRequest:pi];

}



@end
