import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fyp_project/models/heritage_model.dart';

class HeritagePhotoProvider extends ChangeNotifier {
  final List<HeritageModel> _heritageDesc = [
    HeritageModel(
      id: 1,
      title: 'Bhaktapur Durbar Square',
      intro: '''
Bhaktapur Durbar Square" the city is also known as a museum of medieval art and architecture with many specimens of sculpture, woodcarving and huge pagoda temples dedicated to various gods and goddesses. It is a conglomeration of pagoda and shikhara-style temples grouped around a fifty-five window palace of brick and wood. Pottery and weaving are its major traditional industries. 
      ''',
      desc:
          'The major attraction of bhaktapur durbar square includes golden gate which is the main entrance to the palace, Lion’s Gate that has two beautiful stone statues of hindu dieties installed on its either side. It is said that the hands of the artisans who made this statue were cut off immediately after he gave a finishing touch. Bhaktapur durbar square contains a miniature Pashupati temple, Vatsala Temple, Nyatapola Temple, and Bhairava Nath Temple, all of which draw a large number of Hindu pilgrims.',
      images: [
        HeritageImgModel("assets/images/heritageDestination/bhaktapur1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bhaktapur2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bhaktapur3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bhaktapur4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bhaktapur5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/bhaktapurMAIN.PNG",
      location: Geo(lat: 22.0, long: 22.0),
    ),
    HeritageModel(
      id: 2,
      title: 'Boudha',
      intro: 'intro',
      desc: 'desc',
      images: [
        HeritageImgModel("assets/images/heritageDestination/boudha1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/boudha2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/boudha3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/boudha4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/boudha5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/boudhaMAIN.PNG",
      location: Geo(lat: 22.0, long: 22.0),
    ),
    HeritageModel(
      id: 3,
      title: 'Changu Narayan Temple',
      intro: 'intro',
      desc: 'desc',
      images: [
        HeritageImgModel("assets/images/heritageDestination/changu1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/changu2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/changu3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/changu4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/changu5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/changuMAIN.PNG",
      location: Geo(lat: 22.0, long: 22.0),
    ),
    HeritageModel(
      id: 4,
      title: 'Kathmandu Durbar Square',
      intro:
          'Kathmandu Durbar Square is a historic monument also known as ‘Basantapur Durbar Square’ or ‘Hanuman Dhoka Durbar Square’ in the centre of the capital city of Kathmandu. Ancient Newari architecture, lofty temples, popular shrines, and the old royal palace surround the immediate large square. Kathmandu Durbar Square, surrounded by fountains, antique statues, small ponds, and a series of courtyards such as Mohan Chok and Sundari Chok, is a peaceful, devotional location for spiritual seekers.',
      desc:
          'The Durbar Square region is made up of three squares that are loosely connected: Basantapur square, the main Durbar square on the west, and another part of Durbar Square that houses the entrance to Hanuman Dhoka. King Mahendra Malla commissioned the construction of the oldest temples. His contribution included the Janannath Temple, Kotilingeshwara Mahadev, the Mahendreswara Temple and the magnificent Taleju Temple. The Kumari Devi is paraded around the square in a custom-made gilded chariot during the festival of Indra Jatra and others and is worshipped by the people.',
      images: [
        HeritageImgModel("assets/images/heritageDestination/kathmandu1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/kathmandu2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/kathmandu3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/kathmandu4.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/kathmanduMAIN.PNG",
      location: Geo(lat: 22.0, long: 22.0),
    ),
    HeritageModel(
      id: 5,
      title: 'Lumbini',
      intro: 'intro',
      desc: 'desc',
      images: [
        HeritageImgModel("assets/images/heritageDestination/limbini1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/limbini2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/limbini3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/limbini4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/limbini5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/lumbiniMAIN.PNG",
      location: Geo(lat: 22.0, long: 22.0),
    ),
    HeritageModel(
      id: 6,
      title: 'Pasupathinath Temple',
      intro: 'intro',
      desc: 'desc',
      images: [
        HeritageImgModel("assets/images/heritageDestination/bpasupati2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bpasupati3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bpasupati4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bpasupati5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/pashupatiMAIN.PNG",
      location: Geo(lat: 22.0, long: 22.0),
    ),
    HeritageModel(
      id: 7,
      title: 'Patan Durbar Square',
      intro:
          'Patan durbar square is situated at the heart of Lalitpur district, and is renowned for its fine arts and amazing architecture. The square floor is tiled with red bricks. It is believed to be the oldest city in the Kathmandu valley. Patan is a beautiful city with a blend of ancient and modern ways of living, with its rich cultural heritage, authentic local markets, scenes of arts and crafts, and laid-back environment.',
      desc:
          'The attractions of Patan Durbar Square includes Krishna Mandir which is a hindu temple dedicated to lord Krishna. This shikhara type temple has stone carvings and beam pillars. Golden temple is one of the olderst and richest structure, built in 12th century dedicated to Buddhism. Bhimsen Temple, Vishwanath Temple and Taleju Bhawani Temple are dicated to god of trade, Lord Shiva built in 17th century. One can visit the musem as it holds many religious strucures, statues of bronze and other atifacts. ',
      images: [
        HeritageImgModel("assets/images/heritageDestination/patan1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/patan2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/patan3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/patan4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/patan5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/patanMAIN.PNG",
      location: Geo(lat: 22.0, long: 22.0),
    ),
    HeritageModel(
      id: 8,
      title: 'Swayambhu',
      intro: 'intro',
      desc: 'desc',
      images: [
        HeritageImgModel("assets/images/heritageDestination/swayambhu1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu5.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu6.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/swayambhuMAIN.PNG",
      location: Geo(lat: 22.0, long: 22.0),
    ),
  ];

  UnmodifiableListView<HeritageModel> get heritageDesc {
    return UnmodifiableListView(_heritageDesc);
  }

  int get imgLength => _heritageDesc.length;
}
