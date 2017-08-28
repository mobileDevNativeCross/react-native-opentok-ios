//
//  RNTPublisherViewManager.m
//  RNOpenTok
//
//  Created by Gregory Galushka on 4/30/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <React/RCTViewManager.h>
#import "RNTPublisherViewManager.h"
#import "RNTPublisherView.h"

@implementation RNTPublisherViewManager

- (UIView *)view {
    return [RNTPublisherView new];
}

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(apiKey, NSString)
RCT_EXPORT_VIEW_PROPERTY(sessionId, NSString)
RCT_EXPORT_VIEW_PROPERTY(token, NSString)

RCT_EXPORT_VIEW_PROPERTY(onPublishStart, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onPublishError, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onPublishStop, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onClientConnected, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onClientDisconnected, RCTDirectEventBlock)

@end
