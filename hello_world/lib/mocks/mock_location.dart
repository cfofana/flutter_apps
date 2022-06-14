import 'package:flutter/cupertino.dart';

import '../models/location.dart';
import '../models/location_fact.dart';

class MockLocation extends Location {
  static Location fetchAny() {
    return Location(
        name: 'Arashiyomo Bamboo Groove, Kyoto, Japan',
        url:
            'https://photos.smugmug.com/i-hFcX6RC/0/1c58ee68/L/famous-bamboo-grove-arashiyama-L.jpg',
        facts: <LocationFact>[
          LocationFact(
            title: 'Summary',
            text: 'ifjo;j fhoiew fjisdoie fhoiewujrieow',
          ),
          LocationFact(
            title: 'How to Get There',
            text: 'ifjo;j fhoiew fjisdoie fhoiewujrieow',
          )
        ]);
  }
}
