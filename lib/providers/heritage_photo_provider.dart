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
      location: Geo(lat: 27.6720791, long: 85.4259136),
      resturantNumber: [
        RestaurantModel(
          'Mayur Restro',
          '01-6611829',
        ),
        RestaurantModel(
          'Pulachhen Restaurant',
          '9808928652',
        ),
        RestaurantModel(
          'Alucha',
          '9860108771',
        ),
        RestaurantModel(
          'Aama ko Bara pasal',
          '9865998611',
        ),
        RestaurantModel(
          'Balakhu food point',
          '9841314690',
        ),
      ],
    ),
    HeritageModel(
      id: 2,
      title: 'Boudhanath Stupa',
      intro:
          "Boudhanath, commonly known as Boudha, is a stupa located in Kathmandu, Nepal. It is easily identifiable by the massive semicircular white dome and the towering spire with unblinking eyes painted on each side that stare into four direction. The stupa's overall shape represents a huge mandala making it one of the world's largest spherical stupas. According to Buddhist tradition, this site is said to hold the remains of the kassapa Buddha, the 27th of the named Buddhas.",
      desc:
          "Scholars who have studied this site believe it was built in the 14th century, after the Mughal Empire of West Asia and India entered Nepali territory. During the festival of Losar, Boudhanath hosts the largest celebration in Nepal. Boudha is a spiritual and awe-inspiring environment, as well as one of the holiest Buddhist pilgrimage sites in Nepal. During the full moon day, monks pray and perform songs, and all Buddhists visit the site as part of their sacred visit.",
      images: [
        HeritageImgModel("assets/images/heritageDestination/boudha1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/boudha2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/boudha3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/boudha4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/boudha5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/boudhaMAIN.PNG",
      location: Geo(lat: 27.7215109, long: 85.3598087),
      resturantNumber: [
        RestaurantModel(
          'Roadhouse Café',
          '01-4916446',
        ),
        RestaurantModel(
          'Stupa view reataurant',
          '01-4914962',
        ),
        RestaurantModel(
          'Golden eyes restaurant and Café',
          ' 01-4485819',
        ),
        RestaurantModel(
          'La Casita',
          '01-4915645',
        ),
        RestaurantModel(
          'Stupa Thakali Kitchen',
          ' 01-4485728',
        ),
      ],
    ),
    HeritageModel(
      id: 3,
      title: 'Changu Narayan Temple',
      intro:
          "Changunarayan temple is an epic specimen of art and architecture from the lichhavi time period in the 2nd century. It is a two-story pagoda-style temple dedicated to Lord Vishnu and surrounded by ancient carvings and statues. The wood carving struts, gold-plated door, Pati, Manadeva Pillar, festival chariot, and stone sculptures are exquisite.",
      desc:
          "One of the oldest inscriptions found in Kathmandu valley, dating back to 464AD, is carved on a pillar at the temple's entrance and records that the Licchavi King, Manadeva, persuaded his mother, Rajyavati, not to perform sati on her husband's burial pyre, King Dharmadeva.",
      images: [
        HeritageImgModel("assets/images/heritageDestination/changu1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/changu2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/changu3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/changu4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/changu5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/changuMAIN.PNG",
      location: Geo(lat: 27.7164501, long: 85.4258423),
      resturantNumber: [
        RestaurantModel(
          'Bamboo brunch restaurant',
          '984-1725584',
        ),
        RestaurantModel(
          'P&P restaurant',
          '984-1670598',
        ),
        RestaurantModel(
          'Sakura Roof Top Restaurant',
          '986-3553421',
        ),
        RestaurantModel(
          'Temple View Palace restaurant',
          '01-6614815',
        ),
        RestaurantModel(
          'Viewpoint Roof Top restaurant',
          '01-5141110',
        ),
      ],
    ),
    HeritageModel(
      id: 4,
      title: 'Kathmandu Durbar Square',
      intro:
          "Kathmandu Durbar Square is a historic monument also known as ‘Basantapur Durbar Square’ or ‘Hanuman Dhoka Durbar Square’ in the centre of the capital city of Kathmandu. Ancient Newari architecture, lofty temples, popular shrines, and the old royal palace surround the immediate large square. Kathmandu Durbar Square, surrounded by fountains, antique statues, small ponds, and a series of courtyards such as Mohan Chok and Sundari Chok, is a peaceful, devotional location for spiritual seekers.",
      desc:
          'The Durbar Square region is made up of three squares that are loosely connected: Basantapur square, the main Durbar square on the west, and another part of Durbar Square that houses the entrance to Hanuman Dhoka. King Mahendra Malla commissioned the construction of the oldest temples. His contribution included the Janannath Temple, Kotilingeshwara Mahadev, the Mahendreswara Temple and the magnificent Taleju Temple. The Kumari Devi is paraded around the square in a custom-made gilded chariot during the festival of Indra Jatra and others and is worshipped by the people.',
      images: [
        HeritageImgModel("assets/images/heritageDestination/kathmandu1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/kathmandu2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/kathmandu3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/kathmandu4.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/kathmanduMAIN.PNG",
      location: Geo(lat: 27.7042, long: 85.3067),
      resturantNumber: [
        RestaurantModel(
          'Heritage Rooftop Café',
          '01-4248352',
        ),
        RestaurantModel(
          'Bhoye Chenn',
          '985-1220397',
        ),
        RestaurantModel(
          'Royal Heritage',
          '01-4267217',
        ),
        RestaurantModel(
          'Falcha Café',
          '981-8793488',
        ),
        RestaurantModel(
          'Durbar VIew Restaurant',
          '984-0171570',
        ),
      ],
    ),
    HeritageModel(
      id: 5,
      title: 'Lumbini',
      intro:
          "Lumbini is the birthplace of Lord Buddha born in 623 B.C. and one of the most important Buddhist pilgrimage destinations. It is home to a number of temples, monasteries, and monuments commemorating Buddha's life and teachings. The Maya Devi Temple, built on the site where Queen Maya Devi gave birth to Lord Buddha, is the most important structure in Lumbini.",
      desc:
          "Lumbini Grove which is a small village, The Rummendei Pillar erected by Emperor Ashoka, Dharmaswami Maharaja Buddha Vihara which is a Tibetan gompa belonging to the Sakyapa order, kudan village that boasts a huge structural ruin with a cluster of four moulds and a water body are the places that one can see around in Lumbini. Lumbini is one of the holiest places of one of the worlds great religions and its remains contain important evidence about the nature of Buddhist pilgrimage.",
      images: [
        HeritageImgModel("assets/images/heritageDestination/lumbini1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/lumbini2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/lumbini3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/lumbini4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/lumbini5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/lumbiniMAIN.PNG",
      location: Geo(lat: 27.9207, long: 82.7347),
      resturantNumber: [
        RestaurantModel(
          'G.G Café & Restaurant',
          '071-580376',
        ),
        RestaurantModel(
          'Spice Cottage',
          '984-7559871',
        ),
        RestaurantModel(
          'Hotel Ananda Inn.',
          '071-580324',
        ),
        RestaurantModel(
          'Black Stone Café & Restaurant',
          '071-404016',
        ),
        RestaurantModel(
          'Ignite Lounge and Restaurant',
          '985-7075623',
        ),
      ],
    ),
    HeritageModel(
      id: 6,
      title: 'Pasupathinath Temple',
      intro:
          "It is one of the most sacred Hindu temples of Nepal dedicated to lord Shiva, situated on the banks of the holy river Bagmati. The temples existence dates back to 400 A.D. According to mythology, Shiva and Parvati took the form of antelopes. The gods eventually caught up with him and grabbed one of his horns, compelling him to revert to his divine form. The broken horn was worshiped as a linga, but it was eventually buried and lost. Decades later, a herdsman spotted one of his cows pouring milk on the ground, and after digging there, he discovered the celestial linga of Pashupatinath.",
      desc:
          "The temple has a gilded roof, four sides covered in silver and wood carving og the finest quality. The inner sanctum has a shiva lingam and outside sits the largest statue of the Nandi the bull. Deupatan, Jaya Bageshori, Gaurighat (Holy Bath), Kutumbahal, Gaushala, Pingalasthan, and Sleshmantak forest are all part of the temple area. Every year, hundreds of pilgrims visit this temple. ",
      images: [
        HeritageImgModel("assets/images/heritageDestination/bpasupati2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bpasupati3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bpasupati4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/bpasupati5.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/pashupatiMAIN.PNG",
      location: Geo(lat: 27.7105167, long: 85.3466238),
      resturantNumber: [
        RestaurantModel(
          'Bambooze Restro',
          '981-3989890',
        ),
        RestaurantModel(
          'Kohinoor Hotal and Biryani Housee',
          '980-7725786',
        ),
        RestaurantModel(
          'Vedic Food & Lunch Box',
          '984-9075459',
        ),
        RestaurantModel(
          'D&D Café',
          '01-4113689',
        ),
        RestaurantModel(
          'FQ3 Food',
          '01-4465746',
        ),
      ],
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
      location: Geo(lat: 27.6727, long: 85.3253),
      resturantNumber: [
        RestaurantModel(
          'Café De Patan',
          '01-5537599',
        ),
        RestaurantModel(
          'Yala Layeku Kitchen',
          '01-5521254',
        ),
        RestaurantModel(
          'Casa Pagoda',
          '01-5538980',
        ),
        RestaurantModel(
          'Mangal Wood Restro',
          '986-1604764',
        ),
        RestaurantModel(
          'Fresco restaurant',
          '01-5540537',
        ),
      ],
    ),
    HeritageModel(
      id: 8,
      title: 'Swayambhunath Temple',
      intro:
          'Swayambhunath Stupa, a golden spire atop a conical wooded hill, is the most ancient and mystical of all the sacred monuments in Kathmandu valley. It is also referred as the monkey temple. Swayambhu means “Self-existent one” which is believed to date back to 460 A.D. According to legend, Swayambhu was created from a lotus flower that flowered in the center of a lake that once stretched over the Kathmandu Valley.',
      desc:
          " On the western limit of Swayambhu, the greatest image of the Sakyamuni Buddha in Nepal sits on a high pedestal. The region around the stupa is filled  with chaityas, temples, painted pictures of deities, and a plethora of other religious artefacts. The huge gold plated Vajra ‘thunderbolt’ set in the east side of the stupa, the sleeping Buddha, the dewa dharma monastery noted for a bronze icon of Buddha are some of the important monuments to see in this area.",
      images: [
        HeritageImgModel("assets/images/heritageDestination/swayambhu1.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu2.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu3.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu4.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu5.PNG"),
        HeritageImgModel("assets/images/heritageDestination/swayambhu6.PNG"),
      ],
      imagePath: "assets/images/heritageDestination/swayambhuMAIN.PNG",
      location: Geo(lat: 27.7149043, long: 85.288207),
      resturantNumber: [
        RestaurantModel(
          'Yangkus The Momo Palette',
          '980-3015689',
        ),
        RestaurantModel(
          'Tashi Delek Restro',
          '984-2818181',
        ),
        RestaurantModel(
          'Swayambhu Newa Khazaghar',
          '984-1242483',
        ),
        RestaurantModel(
          'Himalayan Bowl',
          '981-0337043',
        ),
        RestaurantModel(
          'White Rabbit',
          '01-5247204',
        ),
      ],
    ),
  ];

  UnmodifiableListView<HeritageModel> get heritageDesc {
    return UnmodifiableListView(_heritageDesc);
  }

  int get imgLength => _heritageDesc.length;
}
