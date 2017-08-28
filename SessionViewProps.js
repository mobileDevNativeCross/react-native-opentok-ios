import React from 'react';

export default {
  /**
   * OpenTok token to use when publishing
   */
  token: React.PropTypes.string.isRequired,
  /**
   * OpenTok sessionId to use when publishing
   */
  sessionId: React.PropTypes.string.isRequired,
  /**
   * OpenTok API Key to be used
   */
  apiKey: React.PropTypes.string.isRequired,
};