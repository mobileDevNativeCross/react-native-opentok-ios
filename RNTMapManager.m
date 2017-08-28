//
//  RNTMapManager.m
//  RNOpenTok
//
//  Created by Gregory Galushka on 4/30/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

// RNTMapManager.m
#import <MapKit/MapKit.h>

#import <React/RCTViewManager.h>

@interface RNTMapManager : RCTViewManager
@end

@implementation RNTMapManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[MKMapView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(pitchEnabled, BOOL)

@end
