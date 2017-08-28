// MapView.js
import React from 'react';
import { requireNativeComponent } from 'react-native';
import { View } from 'react-native';
// requireNativeComponent automatically resolves this to "RNTMapManager"
// module.exports = requireNativeComponent('RNTMap', null);

class MapView extends React.Component {
  render() {
    return <RNTMap {...this.props} />;
  }
}

MapView.propTypes = {
  /**
   * When this property is set to `true` and a valid camera is associated
   * with the map, the camera’s pitch angle is used to tilt the plane
   * of the map. When this property is set to `false`, the camera’s pitch
   * angle is ignored and the map is always displayed as if the user
   * is looking straight down onto it.
   */
  pitchEnabled: React.PropTypes.bool,
};

// module.exports = MapView;
export default requireNativeComponent('RNTMap', MapView);