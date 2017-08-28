import React from 'react';
import { requireNativeComponent, View } from 'react-native';
import SessionViewProps from './SessionViewProps';
import withLoadingSpinner from './withLoadingSpinner';

const noop = () => {};

/**
 * A React component for publishing video stream over OpenTok to the
 * session provided
 *
 * `Publisher` supports default styling, just like any other View.
 *
 * After successfull session creation, the publisher view displaying live
 * preview of a stream will be appended to the container and will take available
 * space, as layed out by React.
 */
class PublisherView extends React.Component {
  static propTypes = {
    ...View.propTypes,
    ...SessionViewProps,
    /**
     * This function is called on publish start
     */
    onPublishStart: React.PropTypes.func,
    /**
     * This function is called on publish error
     */
    onPublishError: React.PropTypes.func,
    /**
     * This function is called on publish stop
     */
    onPublishStop: React.PropTypes.func,
    /**
     * This function is called when new client is connected to
     * the current stream
     *
     * Receives payload:
     * ```
     * {
     *   connectionId: string,
     *   creationTime: string,
     *   data: string,
     * }
     * ```
     */
    onClientConnected: React.PropTypes.func,
    /**
     * This function is called when client is disconnected from
     * the current stream
     *
     * Receives payload:
     * ```
     * {
     *   connectionId: string,
     * }
     * ```
     */
    onClientDisconnected: React.PropTypes.func,
  };

  static defaultProps = {
    onPublishStart: noop,
    onPublishError: noop,
    onPublishStop: noop,
    onClientConnected: noop,
    onClientDisconnected: noop,
  };

  render() {
    return <RNTPublisherView {...this.props} />;
  }
}

const RNTPublisherView = requireNativeComponent('RNTPublisherView', PublisherView);

// var PublisherView = function () {
//   return (
//     <View 
//       style={{ width: 100, height: 100, backgroundColor: 'black' }}
//     />
//   );
// };

export default PublisherView;

// export default withLoadingSpinner(PublisherView, 'onPublishStart');