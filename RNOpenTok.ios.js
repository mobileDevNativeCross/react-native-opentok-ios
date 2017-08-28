/**
 * @providesModule RNOpenTok
 * @flow
 */
'use strict';
import React from 'react';
import { NativeModules, NativeAppEventEmitter, Platform, View } from 'react-native';

var NativeRNOpenTok = require('NativeModules').RNOpenTok;
console.log('NativeRNOpenTok', NativeRNOpenTok);
/**
 * High-level docs for the RNOpenTok iOS API can be written here.
 */
// const Session = NativeModules.OpenTokSession;

var PublisherView = function () {
  return (
    <View 
      style={{ width: 100, height: 100, backgroundColor: 'green' }}
    />
  );
};


var RNOpenTok = {
  test: function() {
    NativeRNOpenTok.test();
  },

  // initialize connection
  init: NativeRNOpenTok.connect,
  // send message
  sendMessage: NativeRNOpenTok.sendMessage,
  // PublisherView,
  PublisherView: require('./PublisherView').default,
  SubscriberView: require('./SubscriberView').default,
  VideoCall: require('./OpenTokVideoCall').default,
  MapView: require('./MapView').default,
};

// export const init = Session.connect;

// export const PublisherView = require('./PublisherView').default;

module.exports = RNOpenTok;
