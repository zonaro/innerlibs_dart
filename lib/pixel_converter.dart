extension PixelConverter on num {
  //  *****************  Absolute length units *****************************************
  // https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units

  /// The respective value in centimeters
  double get pxToCentimeter => this * 37.8;

  /// The respective value millimeters
  double get pixelToMillimeter => this * 3.78;

  /// The respective value in quarter-millimeters
  double get pixelToQuarterMillimeter => this * 0.945;

  /// The respective value in inches
  double get pixelToInches => this * 96;

  /// The respective value in picas (1/6th of 1 inch)
  double get pixelToPicas => this * 16;

  /// The respective value in points (1/72th of 1 inch)
  double get pixelInPoints => this * pixelToInches / 72;
}
