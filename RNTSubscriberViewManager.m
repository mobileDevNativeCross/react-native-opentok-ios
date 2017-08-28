//
//  RNTSubscriberViewManager.m
//  RNOpenTok
//
//  Created by Gregory Galushka on 5/1/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <React/RCTViewManager.h>
#import "RNTSubscriberViewManager.h"
#import "RNTSubscriberView.h"

@implementation RNTSubscriberViewManager

- (UIView *)view {
    return [RNTSubscriberView new];
}

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(apiKey, NSString)
RCT_EXPORT_VIEW_PROPERTY(sessionId, NSString)
RCT_EXPORT_VIEW_PROPERTY(token, NSString)

RCT_EXPORT_VIEW_PROPERTY(onSubscribeStart, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onSubscribeError, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onSubscribeStop, RCTDirectEventBlock)

@end
