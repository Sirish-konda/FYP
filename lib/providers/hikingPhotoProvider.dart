import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyp_project/models/hikking_model.dart';

class HikingPhotoProvider extends ChangeNotifier {
  final List<HikingModel> _hikingDesc = [
    HikingModel(
        id: 1,
        desc: '''
Starting point: Swayambhu
Ending point: Seto Gumba
Distance: 15 kilometres
Duration: Minimum 3.5 hours
Altitude: 1500m/4920 ft
Highlights:- Stupa and murals
- Sunset and sunrise view
- A panoramic vista of Kathmandu valley
- Clay statues
''',
        imagePath: "assets/images/hikingDestination/Amitabha MAIN.PNG",
        images: [
          HikingImgModel(
              "assets/images/hikingDestination/descImages/amitabha1.PNG"),
          HikingImgModel(
              "assets/images/hikingDestination/descImages/amitabha2.PNG"),
          HikingImgModel(
              "assets/images/hikingDestination/descImages/amitabha3.PNG"),
          HikingImgModel(
              "assets/images/hikingDestination/descImages/amitabha4.PNG"),
        ],
        intro:
            "The Amitabha Monastery is perched atop Druk Amitabha Mountain, with a panoramic view of Kathmandu Valley. It is a spiritual practice center as well as a humanitarian cause. It contains a 2,000-person capacity hall, a library, the Drukpa Lineage's administration office, a nunnery, dormitories for 300 nuns, and a medical facility.",
        location: Geo(lat: 27.7250258, long: 85.2622221),
        title: "Amitabha monastery"),
    HikingModel(
      id: 2,
      desc: '''
Starting point: Kathmandu
Ending point: Kakani
Distance: 25 kilometres
Duration: Minimum 5 hours
Altitude: 2000 m/6560 ft
Highlights:
- A trek through sub-alpine forests
- Astounding views of Kathmandu valley
- Forests full of oak, pine and rhododendron trees
- Views of Langtang Mountain Range, Shisha Pangma Range, Annapurna Range, Mt Manaslu

''',
      imagePath: "assets/images/hikingDestination/kakani MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/kakani 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/kakani 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/kakani 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/kakani 4.PNG"),
      ],
      intro:
          "Kakani Hiking is an ideal one-day hike in Kathmandu that takes you away from the hustle and bustle of city life and into the simple beauty of hills and fields.  The trip is famous for the panoramic views of mountain ranges, Kakani’s cultivated Japanese strawberries, rhododendron-flavored liquor and rainbow trout dishes, and Mountain Memorial Park.",
      location: Geo(lat: 27.96939, long: 85.54724),
      title: "Kakani Height",
    ),
    HikingModel(
      id: 3,
      desc: '''
Starting point: Kathmandu
Ending point: Godawari
Distance: 19 kilometres
Duration: Minimum 3.5 hours
Altitude: 2782 m/9130 ft
Highlights:
- Outstanding views of Kathmandu valley
- Vista of Annapurna and Gaurishankar mountains, Mt Everest, Mt Manaslu
- Botanical garden
- Diverse flora and fauna, especially birds, orchids, butterflies and rhododendrons

''',
      imagePath: "assets/images/hikingDestination/pulchowki MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/pulchowki 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/pulchowki 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/pulchowki 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/pulchowki 4.PNG"),
      ],
      intro:
          "It is the highest and the most scenic hill around kathmandu valley rim. As the tallest hill in the Kathmandu valley, it is covered with snow throughout the winter and remains chilly even in the summer.",
      location: Geo(lat: 27.5711026, long: 85.4055504),
      title: "Pulchowki Height",
    ),
    HikingModel(
      id: 4,
      desc: '''
Starting point: Sankhu
Ending point: Nagarkot
Distance: 28 kilometres
Duration: Minimum 5 hours
Altitude: 2175 m/7135 ft
Highlights:
- A taste of Newari culture at Sankhu
- Sunrise and sunset points
- Nagarkot Tower
- View from Dhaulagiri to Kanchenjunga, Mt Everest, Mt Manaslu, Ganesh Himal, Langtang

''',
      imagePath: "assets/images/hikingDestination/nagarkot MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/nagarkot 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/nagarkot 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/nagarkot 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/nagarkot 4.PNG"),
      ],
      intro:
          "Nagarkot is a gorgeous hill station known for its sunrise and sunset views of the Himalayan Mountains.That includes Annapurna, Langtang, Manaslu, Jugal, Maha Langur and Ganesh Himal ranges.",
      location: Geo(lat: 27.717358, long: 85.504571),
      title: "Nagarkot Hike",
    ),
    HikingModel(
      id: 5,
      desc: '''
Starting point: Budhanilkantha
Ending point: Sundarijal
Distance: 22 kilometres
Duration: Minimum 6 hours
Altitude: 100 m/4930 ft
Highlights:
-	Passing by lakes and waterholes
-	Shivapuri National Park
-	Chisapani settlement
-	Views of all major mountains
-	Waterfalls

''',
      imagePath: "assets/images/hikingDestination/sundarijal MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/sundarijal 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/sundarijal 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/sundarijal 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/sundarijal 4.PNG"),
      ],
      intro:
          "Sundarijal tour takes us towards the north of Kathmandu Valley and offers great short hiking opportunities. Sundarijal is itself located at the center of an ancient forest, belonging to the Sivapuri National Park, and is highly diverse in vegetation like pine, oak, rhododendron and wildlife like Himalaya Black bear, leopard, jungle cat and rhesus monkey.",
      location: Geo(lat: 28.0, long: 84.0),
      title: "Sundarijal Hike",
    ),
    HikingModel(
      id: 6,
      desc: '''
Starting point: Kathmandu
Ending point: Shivapuri
Distance: 10 kilometres
Duration: Minimum 5 hours
Altitude: 2560 m/8400 ft
Highlights:
- Shivapuri National Park and conservation area
- Budhanilkantha temple
- Nagi Gompa

''',
      imagePath: "assets/images/hikingDestination/shivapuri MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/shivapuri 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/shivapuri 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/shivapuri 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/shivapuri 4.PNG"),
      ],
      intro:
          "Shivapuri is a famous short hiking trip from Kathmandu valley. Shivapuri treks offer a rich insight into the lives, history, culture and religion of its inhabitants.  Likewise, this is not just a trail, but a spot that provides a panoramic view of Kathmandu valley, Langtang and Mustang, and the mighty Manaslu.",
      location: Geo(lat: 27.45, long: 85.16),
      title: "Shivapuri Hike",
    ),
    HikingModel(
      id: 7,
      desc: '''
Starting point: Kathmandu
Ending point: Namobuddha
Distance: 38 kilometres
Duration: Minimum 6 hours
Altitude: 1800 m/5900 ft
Highlights:
- River trail
- The quaint town of Panauti
- Suspension bridge
- Buddhist Stupa and shrines
- View of Mt Everest and Langtang Mountain Range

''',
      imagePath: "assets/images/hikingDestination/namo buddha MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/namo buddha 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/namo buddha 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/namo buddha 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/namo buddha 4.PNG"),
      ],
      intro:
          "Namobuddha Day Hike is a fabulous hiking trip near Kathmandu Valley that lets hikers admire the elegance of Buddhist culture and tradition. Namo Budhha is also famous for rice, mustard and millet; so you can also experience the beautiful hillside terraced farms throughout the walk. ",
      location: Geo(lat: 27.5520134, long: 85.6354449),
      title: "Namobuddha Hike",
    ),
    HikingModel(
      id: 8,
      desc: '''
Starting point: Kathmandu
Ending point: Pharping
Distance: 20 kilometres
Duration: Minimum 4.5 hours
Altitude: 2249 m/7380 ft
Highlights:
- Stupas and shrines
- Monastery
- Pine forests
- Langtang and Annapurna range views

''',
      imagePath: "assets/images/hikingDestination/champadevi MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/champadevi 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/champadevi 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/champadevi 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/champadevi 4.PNG"),
      ],
      intro:
          "Champadevi, a beautiful hill in the southeast of Kathmandu Valley, is home to an important Hindu pilgrimage site. Following the hike, you'll also reach the summit of a nearby hill, Chandragiri, which has similarly magnificent views of the mountains and valley below.",
      location: Geo(lat: 27.6786, long: 85.3273),
      title: "Champadevi Hike",
    ),
    HikingModel(
      id: 9,
      desc: '''
Starting point: Sundarijal
Ending point: Chisapani
Distance: 13 kilometres
Duration: Minimum 3 hours
Altitude: 2215 m/7270 ft
Highlights:
- Chisapani village
- Shivapuri National Park trek
- Views of the sub-tropical forests
- Views of Langtang, Ganesh Himal, Jugal Himal, Gaurishankar Himal ranges

''',
      imagePath: "assets/images/hikingDestination/chisapani MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chisapani 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chisapani 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chisapani 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chisapani 4.PNG"),
      ],
      intro:
          "It is a popular trekking destination located in the Shivapuri National Park near Kathmandu. The trek offers stunning views of the Himalayas, lush forests, and traditional rural villages, making it a great opportunity for nature lovers and adventure seekers.",
      location: Geo(lat: 28.0, long: 84.0),
      title: "Chisapani Hike",
    ),
    HikingModel(
      id: 10,
      desc: '''
Starting point: Kathmandu
Ending point: Nagarjuna
Distance: 20 kilometres
Duration: Minimum 4 hours
Altitude: 1950 m/6400 ft
Highlights:
- Padmasambhava monastery
- Viewpoint
- Balaju Water Garden
- Nagarjuna's cave
- Mahasiddha cave
- Manjushree Cave

''',
      imagePath: "assets/images/hikingDestination/nagarjuna MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/nagarjuna 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/nagarjuna 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/nagarjuna 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/nagarjuna 4.PNG"),
      ],
      intro:
          "Hiking to Nagarjuna is easy and short adventure activity near Kathmandu Valley. The mountain is very famous for Nagarjuna’s cave where he performed meditation. Along with Nagarjuna cave there is some other cave of Buddha, Mahasiddhas.",
      location: null,
      title: "Nagarjuna Hike",
    ),
    HikingModel(
      id: 11,
      desc: '''
Starting point: Kathmandu
Ending point: Nagarjuna
Distance: 20 kilometres
Duration: Minimum 4 hours
Altitude: 1950 m/6400 ft
Highlights:
- Padmasambhava monastery
- Viewpoint
- Balaju Water Garden
- Nagarjuna's cave
- Mahasiddha cave
- Manjushree Cave

''',
      imagePath: "assets/images/hikingDestination/chandragiri MAIN.PNG",
      images: [
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chandragiri 1.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chandragiri 2.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chandragiri 3.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chandragiri 4.PNG"),
        HikingImgModel(
            "assets/images/hikingDestination/descImages/chandragiri 5.PNG"),
      ],
      intro:
          "Chandragiri Hill Hiking is the best hiking location in Kathmandu Valley, located in the south at a height of 2250 meters and covered in evergreen forest, 14 kilometers from Thamel. This hike provides a spectacular perspective of Kathmandu Valley, as well as the culture, lifestyle, flora, and fauna of the local people.",
      location: Geo(lat: 27.6672261, long: 85.2058437),
      title: "Chandragiri Hill Hike",
    ),
  ];

  UnmodifiableListView<HikingModel> get hikingDesc {
    return UnmodifiableListView(_hikingDesc);
  }

  void toggleFavorites(int hikingId) {
    final hikingIndex =
        _hikingDesc.indexWhere((hiking) => hiking.id == hikingId);
    _hikingDesc[hikingIndex].isFavorited =
        !_hikingDesc[hikingIndex].isFavorited;
    notifyListeners();
  }

  int get imgLength => _hikingDesc.length;
}
