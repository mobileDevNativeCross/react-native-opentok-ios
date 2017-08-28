//
//  RNTSubscriberView.h
//  RNOpenTok
//
//  Created by Gregory Galushka on 5/1/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>

@interface RNTSubscriberView: UIView

@property (nonatomic, strong) NSString *apiKey;
@property (nonatomic, strong) NSString *sessionId;
@property (nonatomic, strong) NSString *token;


@property (nonatomic, copy) RCTDirectEventBlock onSubscribeError;
@property (nonatomic, copy) RCTDirectEventBlock onSubscribeStop;
@property (nonatomic, copy) RCTDirectEventBlock onSubscribeStart;

@end
