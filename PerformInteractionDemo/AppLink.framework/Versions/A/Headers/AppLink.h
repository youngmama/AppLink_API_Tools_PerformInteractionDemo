//  AppLink.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

//Proxy
#import <AppLink/FMCJingle.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import <AppLink/FMCSyncProxy.h>
#import <AppLink/FMCSyncProxyFactory.h>
#import <AppLink/FMCTTSChunkFactory.h>

//Debug
#import <AppLink/FMCConsoleController.h>
#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCSiphonServer.h>

//RPC Requests
#import <AppLink/FMCAddCommand.h>
#import <AppLink/FMCAddSubMenu.h>
#import <AppLink/FMCAlert.h>
#import <AppLink/FMCAlertManeuver.h>
#import <AppLink/FMCChangeRegistration.h>
#import <AppLink/FMCCreateInteractionChoiceSet.h>
#import <AppLink/FMCDeleteCommand.h>
#import <AppLink/FMCDeleteFile.h>
#import <AppLink/FMCDeleteInteractionChoiceSet.h>
#import <AppLink/FMCDeleteSubMenu.h>
#import <AppLink/FMCDiagnosticMessage.h>
#import <AppLink/FMCEncodedSyncPData.h>
#import <AppLink/FMCEndAudioPassThru.h>
#import <AppLink/FMCGetDTCs.h>
#import <AppLink/FMCGetVehicleData.h>
#import <AppLink/FMCListFiles.h>
#import <AppLink/FMCPerformAudioPassThru.h>
#import <AppLink/FMCPerformInteraction.h>
#import <AppLink/FMCPutFile.h>
#import <AppLink/FMCReadDID.h>
#import <AppLink/FMCRegisterAppInterface.h>
#import <AppLink/FMCResetGlobalProperties.h>
#import <AppLink/FMCScrollableMessage.h>
#import <AppLink/FMCSetAppIcon.h>
#import <AppLink/FMCSetDisplayLayout.h>
#import <AppLink/FMCSetGlobalProperties.h>
#import <AppLink/FMCSetMediaClockTimer.h>
#import <AppLink/FMCShow.h>
#import <AppLink/FMCShowConstantTBT.h>
#import <AppLink/FMCSlider.h>
#import <AppLink/FMCSpeak.h>
#import <AppLink/FMCSubscribeButton.h>
#import <AppLink/FMCSubscribeVehicleData.h>
#import <AppLink/FMCSyncPData.h>
#import <AppLink/FMCUpdateTurnList.h>
#import <AppLink/FMCUnregisterAppInterface.h>
#import <AppLink/FMCUnsubscribeButton.h>
#import <AppLink/FMCUnsubscribeVehicleData.h>

//RPC Responses
#import <AppLink/FMCAddCommandResponse.h>
#import <AppLink/FMCAddSubMenuResponse.h>
#import <AppLink/FMCAlertResponse.h>
#import <AppLink/FMCAlertManeuverResponse.h>
#import <AppLink/FMCChangeRegistrationResponse.h>
#import <AppLink/FMCCreateInteractionChoiceSetResponse.h>
#import <AppLink/FMCDeleteCommandResponse.h>
#import <AppLink/FMCDeleteFileResponse.h>
#import <AppLink/FMCDeleteInteractionChoiceSetResponse.h>
#import <AppLink/FMCDeleteSubMenuResponse.h>
#import <AppLink/FMCDiagnosticMessageResponse.h>
#import <AppLink/FMCEncodedSyncPDataResponse.h>
#import <AppLink/FMCEndAudioPassThruResponse.h>
#import <AppLink/FMCGenericResponse.h>
#import <AppLink/FMCGetDTCsResponse.h>
#import <AppLink/FMCGetVehicleDataResponse.h>
#import <AppLink/FMCListFilesResponse.h>
#import <AppLink/FMCPerformAudioPassThruResponse.h>
#import <AppLink/FMCPerformInteractionResponse.h>
#import <AppLink/FMCPutFileResponse.h>
#import <AppLink/FMCReadDIDResponse.h>
#import <AppLink/FMCRegisterAppInterfaceResponse.h>
#import <AppLink/FMCResetGlobalPropertiesResponse.h>
#import <AppLink/FMCScrollableMessageResponse.h>
#import <AppLink/FMCSetAppIconResponse.h>
#import <AppLink/FMCSetDisplayLayoutResponse.h>
#import <AppLink/FMCSetGlobalPropertiesResponse.h>
#import <AppLink/FMCSetMediaClockTimerResponse.h>
#import <AppLink/FMCShowConstantTBTResponse.h>
#import <AppLink/FMCShowResponse.h>
#import <AppLink/FMCSliderResponse.h>
#import <AppLink/FMCSpeakResponse.h>
#import <AppLink/FMCSubscribeButtonResponse.h>
#import <AppLink/FMCSubscribeVehicleDataResponse.h>
#import <AppLink/FMCSyncPDataResponse.h>
#import <AppLink/FMCUpdateTurnListResponse.h>
#import <AppLink/FMCUnregisterAppInterfaceResponse.h>
#import <AppLink/FMCUnsubscribeButtonResponse.h>
#import <AppLink/FMCUnsubscribeVehicleDataResponse.h>

//RPC Notifications
#import <AppLink/FMCOnAppInterfaceUnregistered.h>
#import <AppLink/FMCOnAudioPassThru.h>
#import <AppLink/FMCOnButtonEvent.h>
#import <AppLink/FMCOnButtonPress.h>
#import <AppLink/FMCOnCommand.h>
#import <AppLink/FMCOnDriverDistraction.h>
#import <AppLink/FMCOnEncodedSyncPData.h>
#import <AppLink/FMCOnHashChange.h>
#import <AppLink/FMCOnHMIStatus.h>
#import <AppLink/FMCOnKeyboardInput.h>
#import <AppLink/FMCOnLanguageChange.h>
#import <AppLink/FMCOnLockScreenStatus.h>
#import <AppLink/FMCOnPermissionsChange.h>
#import <AppLink/FMCOnSyncPData.h>
#import <AppLink/FMCOnSystemRequest.h>
#import <AppLink/FMCOnVehicleData.h>
#import <AppLink/FMCOnTBTClientState.h>
#import <AppLink/FMCOnTouchEvent.h>
#import <AppLink/FMCOnVehicleData.h>

//RPC Structs
#import <AppLink/FMCAirbagStatus.h>
#import <AppLink/FMCAudioPassThruCapabilities.h>
#import <AppLink/FMCBeltStatus.h>
#import <AppLink/FMCBodyInformation.h>
#import <AppLink/FMCButtonCapabilities.h>
#import <AppLink/FMCChoice.h>
#import <AppLink/FMCClusterModeStatus.h>
#import <AppLink/FMCDeviceInfo.h>
#import <AppLink/FMCDeviceStatus.h>
#import <AppLink/FMCDIDResult.h>
#import <AppLink/FMCDisplayCapabilities.h>
#import <AppLink/FMCECallInfo.h>
#import <AppLink/FMCEmergencyEvent.h>
#import <AppLink/FMCGPSData.h>
#import <AppLink/FMCHeadLampStatus.h>
#import <AppLink/FMCHMIPermissions.h>
#import <AppLink/FMCImage.h>
#import <AppLink/FMCKeyboardProperties.h>
#import <AppLink/FMCMenuParams.h>
#import <AppLink/FMCMyKey.h>
#import <AppLink/FMCParameterPermissions.h>
#import <AppLink/FMCPermissionItem.h>
#import <AppLink/FMCPresetBankCapabilities.h>
#import <AppLink/FMCSingleTireStatus.h>
#import <AppLink/FMCSoftButton.h>
#import <AppLink/FMCSoftButtonCapabilities.h>
#import <AppLink/FMCStartTime.h>
#import <AppLink/FMCSyncMsgVersion.h>
#import <AppLink/FMCTextField.h>
#import <AppLink/FMCTireStatus.h>
#import <AppLink/FMCTTSChunk.h>
#import <AppLink/FMCTurn.h>
#import <AppLink/FMCVehicleDataResult.h>
#import <AppLink/FMCVehicleType.h>
#import <AppLink/FMCVrHelpItem.h>

//RPC Enums
#import <AppLink/FMCAppHMIType.h>
#import <AppLink/FMCAppInterfaceUnregisteredReason.h>
#import <AppLink/FMCAudioStreamingState.h>
#import <AppLink/FMCAudioType.h>
#import <AppLink/FMCBitsPerSample.h>
#import <AppLink/FMCButtonEventMode.h>
#import <AppLink/FMCButtonName.h>
#import <AppLink/FMCButtonPressMode.h>
#import <AppLink/FMCCarModeStatus.h>
#import <AppLink/FMCECallConfirmationStatus.h>
#import <AppLink/FMCCharacterSet.h>
#import <AppLink/FMCCompassDirection.h>
#import <AppLink/FMCComponentVolumeStatus.h>
#import <AppLink/FMCDimension.h>
#import <AppLink/FMCDisplayType.h>
#import <AppLink/FMCDriverDistractionState.h>
#import <AppLink/FMCDeviceLevelStatus.h>
#import <AppLink/FMCEmergencyEventType.h>
#import <AppLink/FMCFileType.h>
#import <AppLink/FMCFuelCutoffStatus.h>
#import <AppLink/FMCGlobalProperty.h>
#import <AppLink/FMCHMILevel.h>
#import <AppLink/FMCHmiZoneCapabilities.h>
#import <AppLink/FMCIgnitionStableStatus.h>
#import <AppLink/FMCIgnitionStatus.h>
#import <AppLink/FMCImageType.h>
#import <AppLink/FMCInteractionMode.h>
#import <AppLink/FMCKeyboardEvent.h>
#import <AppLink/FMCKeyboardLayout.h>
#import <AppLink/FMCKeypressMode.h>
#import <AppLink/FMCLanguage.h>
#import <AppLink/FMCLockScreenStatus.h>
#import <AppLink/FMCMaintenanceModeStatus.h>
#import <AppLink/FMCMediaClockFormat.h>
#import <AppLink/FMCPermissionStatus.h>
#import <AppLink/FMCPowerModeQualificationStatus.h>
#import <AppLink/FMCPowerModeStatus.h>
#import <AppLink/FMCPrimaryAudioSource.h>
#import <AppLink/FMCPRNDL.h>
#import <AppLink/FMCResult.h>
#import <AppLink/FMCRPCMessageType.h>
#import <AppLink/FMCSamplingRate.h>
#import <AppLink/FMCScreenParams.h>
#import <AppLink/FMCSoftButtonType.h>
#import <AppLink/FMCSpeechCapabilities.h>
#import <AppLink/FMCSystemAction.h>
#import <AppLink/FMCSystemContext.h>
#import <AppLink/FMCTBTState.h>
#import <AppLink/FMCTextAlignment.h>
#import <AppLink/FMCTextFieldName.h>
#import <AppLink/FMCTimerMode.h>
#import <AppLink/FMCTriggerSource.h>
#import <AppLink/FMCUpdateMode.h>
#import <AppLink/FMCVehicleDataActiveStatus.h>
#import <AppLink/FMCVehicleDataEventStatus.h>
#import <AppLink/FMCVehicleDataNotificationStatus.h>
#import <AppLink/FMCVehicleDataResultCode.h>
#import <AppLink/FMCVehicleDataStatus.h>
#import <AppLink/FMCVehicleDataType.h>
#import <AppLink/FMCVrCapabilities.h>
#import <AppLink/FMCWarningLightStatus.h>
#import <AppLink/FMCWiperStatus.h>