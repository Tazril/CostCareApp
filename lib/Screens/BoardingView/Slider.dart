import 'package:flutter/cupertino.dart';
import 'package:cost_care/utils/Consts.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/one.png',
      sliderHeading: SLIDER_HEADING_1,
      sliderSubHeading: SLIDER_DESC_1),
  Slider(
      sliderImageUrl: 'assets/two.png',
      sliderHeading: SLIDER_HEADING_2,
      sliderSubHeading: SLIDER_DESC_2),
  Slider(
      sliderImageUrl: 'assets/three.png',
      sliderHeading: SLIDER_HEADING_3,
      sliderSubHeading: SLIDER_DESC_3),
];
