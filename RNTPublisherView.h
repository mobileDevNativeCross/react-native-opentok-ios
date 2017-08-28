//
//  RNTPublisherView.h
//  RNOpenTok
//
//  Created by Gregory Galushka on 4/30/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>

@interface RNTPublisherView: UIView

@property (nonatomic, strong) NSString *apiKey;
@property (nonatomic, strong) NSString *sessionId;
@property (nonatomic, strong) NSString *token;

@property (nonatomic, copy) RCTDirectEventBlock onPublishError;
@property (nonatomic, copy) RCTDirectEventBlock onPublishStop;
@property (nonatomic, copy) RCTDirectEventBlock onPublishStart;

@property (nonatomic, copy) RCTDirectEventBlock onClientConnected;
@property (nonatomic, copy) RCTDirectEventBlock onClientDisconnected;

@end
