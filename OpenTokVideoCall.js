import React, { PropTypes, Component } from 'react';
import {
  StyleSheet,
  View,
  Text,
} from 'react-native';

import SubscriberView from './SubscriberView';
import PublisherView from './PublisherView';

export default class OpenTokVideoCall extends Component {
  static propTypes = {
    apiKey: PropTypes.string.isRequired,
    sessionId: PropTypes.string.isRequired,
    publisherToken: PropTypes.string.isRequired,
    subscriberToken: PropTypes.string.isRequired,
  };

  render() {
    const {
      apiKey,
      sessionId,
      publisherToken,
      subscriberToken,
    } = this.props;

    return (
      <View style={styles.container}>
        
        <SubscriberView
          apiKey={apiKey}
          sessionId={sessionId}
          token={subscriberToken}
          style={styles.subscriber}
        />

        <PublisherView
          apiKey={apiKey}
          sessionId={sessionId}
          token={publisherToken}
          style={styles.publisher}
        />

      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  subscriber: { flex: 1 },
  publisher: {
    position: 'absolute',
    top: 32,
    right: 16,
    width: 200,
    height: 160,
  },
});
