#import "RNOpenTok.h"
#import "RCTEventDispatcher.h"
#import <OpenTok/OpenTok.h>

@implementation RNOpenTok {
    OTSession *_session;
}


RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(test)
{
  // Your implementation here
  NSLog(@"sessionDidConnect halloGa!");
}

RCT_EXPORT_METHOD(connect:(NSString *)apiKey sessionId:(NSString *)sessionId token:(NSString *)token)
{
  NSLog(@"apiKey: (%@)", apiKey);
  NSLog(@"sessionId: (%@)", sessionId);
  NSLog(@"token: (%@)", token);

  _session = [
    [OTSession alloc]
    initWithApiKey:apiKey
    sessionId:sessionId
    delegate:self
  ];

  OTError *error = nil;
  [_session connectWithToken:token error:&error];
  
  if (error) {
    NSLog(@"connect failed with error: (%@)", error);
  } else {
    NSLog(@"session created");
  }
}

RCT_EXPORT_METHOD(sendMessage:(NSString *)message)
{
  NSLog(@"signal error %@", message);
  OTError* error = nil;
  [_session
    signalWithType:nil
    string:message
    connection:nil
    error:&error
  ];

  // [_session signalWithType:@"text-chat" string:message connection:nil error:&error];
  if (error) {
      NSLog(@"signal error %@", error);
  } else {
      NSLog(@"signal sent");
  }
}

- (void)session:(OTSession*)session receivedSignalType:(NSString*)type fromConnection:(OTConnection*)connection withString:(NSString*)string {
    NSLog(@"Received signal %@", string);
    [self onMessageRecieved:string data:connection.data];
}

- (void)onMessageRecieved:(NSString *)message data:(NSString *)data
{
  [self.bridge.eventDispatcher sendAppEventWithName:@"onMessageRecieved"
    body:@{
      @"message": message,
      @"data": data,
    }];
}

@end
