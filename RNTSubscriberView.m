//
//  RNTSubscriberView.m
//  RNOpenTok
//
//  Created by Gregory Galushka on 5/1/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "RNTSubscriberView.h"
#import "UIView+React.h"
#import "RCTUtils.h"
#import <OpenTok/OpenTok.h>
#import "RCTEventDispatcher.h"

@interface RNTSubscriberView () <OTSessionDelegate, OTSubscriberDelegate>

@end

@implementation RNTSubscriberView {
    OTSession *_session;
    OTSubscriber *_subscriber;
}

- (void)didMoveToWindow {
    NSLog(@"didMoveToSuperview");
    [super didMoveToSuperview];
    [self mount];
}

- (void)mount {
    [self cleanupSubscriber];
    _session = [[OTSession alloc] initWithApiKey:_apiKey sessionId:_sessionId delegate:self];
    
    OTError *error = nil;
    [_session connectWithToken:_token error:&error];
    
    if (error) {
        _onSubscribeError(RCTJSErrorFromNSError(error));
    }
}

- (void)doSubscribe:(OTStream*)stream {
    _subscriber = [[OTSubscriber alloc] initWithStream:stream delegate:self];
    OTError *error = nil;
    
    [_session subscribe:_subscriber error:&error];
    
    if (error)
    {
        _onSubscribeError(RCTJSErrorFromNSError(error));
        return;
    }
    
    [self attachSubscriberView];
}

- (void)attachSubscriberView {
    [_subscriber.view setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self addSubview:_subscriber.view];
}

- (void)cleanupSubscriber {
    [_subscriber.view removeFromSuperview];
    _subscriber = nil;
}

#pragma mark - OTSession delegate callbacks

- (void)sessionDidConnect:(OTSession*)session {}
- (void)sessionDidDisconnect:(OTSession*)session {}
- (void)session:(OTSession*)session streamCreated:(OTStream*)stream {
    if (_subscriber == nil) {
        [self doSubscribe:stream];
    }
}
- (void)session:(OTSession*)session streamDestroyed:(OTStream*)stream {
    _onSubscribeStop(@{});
}
- (void)session:(OTSession*)session didFailWithError:(OTError*)error {
    _onSubscribeError(RCTJSErrorFromNSError(error));
}

#pragma mark - OTSubscriber delegate callbacks

- (void)subscriber:(OTSubscriberKit*)subscriber didFailWithError:(OTError*)error {
    _onSubscribeError(RCTJSErrorFromNSError(error));
    [self cleanupSubscriber];
}
- (void)subscriberDidConnectToStream:(OTSubscriberKit*)subscriber {
    _onSubscribeStart(@{});
}
- (void)subscriberDidDisconnectFromStream:(OTSubscriberKit*)subscriber {
    _onSubscribeStop(@{});
    [self cleanupSubscriber];
}
- (void)subscriberDidReconnectToStream:(OTSubscriberKit*)subscriber {
    _onSubscribeStart(@{});
}
- (void)dealloc {
    [self cleanupSubscriber];
    [_session disconnect:nil];
}

@end
