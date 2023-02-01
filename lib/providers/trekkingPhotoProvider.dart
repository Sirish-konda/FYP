import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:fyp_project/models/trekking_model.dart';

class TrekkingPhotoProvider extends ChangeNotifier {
  final List<TrekkingModel> _trekkingDesc = [
    TrekkingModel(
      title: "Annapurna Base Camp",
      imagePath: "assets/images/trekkingDestination/ABC.png",
      desc: '''
      
\u27A4 Kathmandu – pokhara driving distance: 205km/127miles duration: 6-7 hours
      
\u27A4 Pokhara – tikhedhunga altitude: 1570m driving duration: 2hours

\u27A4 Tikhedhunga – ulleri distance: 7km/4.34miles duration: 3-4hours

\u27A4 Ulleri – ghorepani distance:11km/ 6miles duration: 3-4 hours

\u27A4 Ghorepani – tadapani distance: 11.50km/7.1 miles duration: 4hours

\u27A4 Tadapani – chomrong distance: 10km/ 6.2miles duration: 5hours

\u27A4 Chomrong – Himalaya distance: 12km/ 7.4miles duration: 6-7hours

\u27A4 Himalaya – ABC via machhapuchhare base camp distance: 12.5km/7.7miles duration:5hours

\u27A4 ABC – bamboo distance: 14km/8.6miles duration: 6hours

\u27A4 Bamboo – jhinu danda distance: 8.5km/ 5.2miles duration: 3-4hours

\u27A4 Jhinu danda – ghandruk phedi distance: 4km/2.4miles duration: 2-3 hours

\u27A4 Ghandruk phedi – pokhara altitude: 820m/2697ft duration: 2-3 hours

\u27A4 Pokhara – Kathmandu driving distance: 205km/127miles duration: 6-7 hours

      ''',
      id: 1,
    ),
    TrekkingModel(
        title: "Everest Base Camp",
        imagePath: "assets/images/trekkingDestination/EBC.PNG",
        desc: '''
        
\u27A4 Kathmandu – lukla distance 135km/84miles flight  duration:40minutes
        
\u27A4 Lukla – phakding distance: 6.2km/3.8miles duration: 3hours

\u27A4 Phakding – Namche bazaar distance:7.4km/4.6miles duration:6hours

\u27A4 Namche bazaar - tengboche distance: 11km/ 6.8miles duration: 5-6hours

\u27A4 Tengboche -  dingboche distance: 10.5km/ 6.5 miles duration: 5-6 hours

\u27A4 Dingboche – lobuche distance: 9km/5.5miles duration: 5hours

\u27A4 Lobuche – gorakshep – Everest base camp – gorakshep distance: 12km/7.4miles duration: 7hours

\u27A4 Gorakshep – kalapatthar – pheriche distance: 16km/9.9miles duration:7 hours

\u27A4 Pheriche – Namche bazaar distance: 19km/11.8miles duration: 8 hours

\u27A4 Namche bazaar – lukla distance: 13.5km/8.3miles duration: 6-7 hours

\u27A4 Lukla – Kathmandu distance 135km/84miles flight duration:40minutes

        
        ''',
        id: 2),
    TrekkingModel(
        id: 3,
        title: "Gokyo re Camp",
        imagePath: "assets/images/trekkingDestination/gokyo.PNG",
        desc: '''
        
\u27A4 Kathmandu – lukla distance 135km/84miles flight  duration:40minutes
        
\u27A4 Lukla – phakding distance: 6.2km/3.8miles duration: 3hours

\u27A4 Phakding – Namche bazaar distance:7.4km/4.6miles duration:6hours

\u27A4 Namche bazaar – dole distance: 6.9km duration 5hours

\u27A4 Dole – machhermo distance:7km/4.3miles duration: 5-6hours

\u27A4 Machhermo – gokyo distance:5.7km/3.5miles duration 4hours

\u27A4 Gokyo – summit of gokyo ri distance: 1.5km/0.9miles duration: 1:30hours

\u27A4 Gokyo-phortse distance:15.5km/9.6miles duration: 6hours

\u27A4 Phortse – Namche bazaar distance: 9.1km/5.6miles duration: 6hours

\u27A4 Namche bazaar – lukla distance: 13.5km/8.3miles duration: 6-7 hours

\u27A4 Lukla – Kathmandu distance 135km/84miles flight duration:40minutes

        '''),
    TrekkingModel(
        id: 4,
        title: "Gosaikunda Trek",
        imagePath: "assets/images/trekkingDestination/gosaikunda.PNG",
        desc: '''
\u27A4 Kathmandu – dhunche altitude: 2000m driving duration: 7 – 8 hours
        
\u27A4 Dhunche – sing gompa altitude: 3250m duration: 5-6 hours

\u27A4 Sing gompa – gosaikunda lake altitude: 4380m duration: 6 hours

\u27A4 Gosaikunda – dhunche altitude: 2000m duration 7-8 hours

\u27A4 Dhunche – Kathmandu altitude: 1350m duration: 6-7 hours

        '''),
    TrekkingModel(
        id: 5,
        title: "Khopra ridge trek",
        imagePath: "assets/images/trekkingDestination/khopra.PNG",
        desc: '''
        
\u27A4 Kathmandu – pokhara driving distance: 205km/127miles duration: 6-7 hours
        
\u27A4 Pokhara – nayapul/syauli bazaar/ kimche altitude: 1784m driving duration: 2 and 30 hours

\u27A4 Kimche – ghandruk distance: 8km/ 4.9miles duration: 2hours

\u27A4 Ghandruk – bayeli kharka distance: 15km/8.5miles duration: 6-7hpurs

\u27A4 Bayeli kharka – khopra danda distance: 8km/ 4.9miles duration: 5hours

\u27A4 Khopra danda – swanta distance:9.6km/ 5.9miles duration: 4-5hours

\u27A4 Swanta – ghorepani distance: 8km/ 4.9miles duration: 5hours

\u27A4 Ghorepani – poonhill – birethani distance: 12.5km/ 7.7miles duration: 4-5 hours

\u27A4 Birethani – pokhara  altitude: 822m/2697ft duration: 2 hours

\u27A4 Pokhara – Kathmandu driving distance: 205km/127miles duration: 6-7 hours

        '''),
    TrekkingModel(
        id: 6,
        title: "Langtang National Park",
        imagePath: "assets/images/trekkingDestination/langtang.PNG",
        desc: '''
        
\u27A4 Kathmandu to syabrubesi  by bus. Distance 145km/90miles duration 6-7 hours
        
\u27A4 Trekking from syabrubesi to lama hotel Distance 11.3+km/7+miles duration 6hours

\u27A4 Lamahotel to langtang village Distance 14.8km/9.1miles duration 6 hours

\u27A4 Langtang village ko kyanjin gompa Distance 6.8km/4.2miles duration 3 hours

\u27A4 Kyanjin gompa to lama hotel Distance 21.6km/13.4miles duration 7 hours

\u27A4 Lama hotel to syabrubesi Distance 11.3+km/7+miles duration 6hours

\u27A4 Syabrubesi to Kathmandu 145km/90miles duration 6-7hours

        '''),
    TrekkingModel(
        id: 7,
        title: "Makalu Base Camp Trek",
        imagePath: "assets/images/trekkingDestination/makalu.PNG",
        desc: '''
        
\u27A4 Kathmandu –  tumlingtar distance: 193km duration: 3-4hours
        
\u27A4 Tumlingtar – chichila altitude: 1980m/ 6496ft duration:4hours

\u27A4 Chichila – num altitude: 1040m/3412ft duration: 6hours

\u27A4 Num – seduwa altitude: 1500m/4921ft duration: 6hours

\u27A4 Sedwa – tashi gaun altitude: 2100m/6889ft duration: 5hours

\u27A4 Tashi gaun – khongma danda altitude: 3500m/11482ft duration: 7hours

\u27A4 Khongma danda – dobato altitude: 3500m/11482ft duration: 6hours

\u27A4 Dobato – yangla kharka altitude: 3557m/11669ft duration: 7hours

\u27A4 Yangla kharka – langmale kharka altitude: 4410m/14468ft duration: 6hours

\u27A4 Langmale kharka – Makalu base camp altitude: 4870m/15977ft duration: 3hours

\u27A4 Makalu base camp - Yangla kharka altitude: 3557m/11669ft duration: 7hours

\u27A4 Yangla kharka – dobato altitude: 3500m/11482ft duration: 7hours

\u27A4 Dobato – khongma danda altitude: 3500m/11482ft duration: 6hours

\u27A4 Khongma danda – tashi gaun altitude: 2100m/6889ft duration: 5hours

\u27A4 Tashi gaun – seduwa altitude: 1500m/4921ft duration: 5hours

\u27A4 Seduwa – num altitude: 1040m/3412ft duration: 5hours

\u27A4 Num – chichila – tumlingtar altitude: 1980m/6496ft duration: 7hours

\u27A4 Tumlingtar – Kathmandu altitude: 1300m/4265ft duration: 3-4hours

        '''),
    TrekkingModel(
        id: 8,
        title: "Manasalu Base Camp Trek",
        imagePath: "assets/images/trekkingDestination/manasalu.PNG",
        desc: '''
        
\u27A4 Drive from Kathmandu to sotikhola via arughat distance: 140 km, duration: 8 hours
        
\u27A4 Soltikhola to maccha khola walking distance:14.2km/8.8miles, duration: 5-6 hours 

\u27A4 Machha khola to jagat walking distance:22.2km/13.8miles, duration: 5-6 hours

\u27A4 Jagat to deng walking distance:20 km/12.4 miles, duration: 8-9 hours

\u27A4 Deng to namrung walking distance:19.4km/12miles, duration: 5-6 hours

\u27A4 Namrung to lho gaun walking distance:10.5 km/6.5 miles, duration: 5-6 hours

\u27A4 Lho gaun to samagaun walking distance:8.1 km/5 miles, duration: 6-7 hours

\u27A4 Samagaun to samdo walking distance:8.1 /5.03 miles, duration: 3-4hours

\u27A4 Samdo to dharamsala walking distance:6.6 km/4.10miles, duration: 4-5 hours

\u27A4 Dharamsala to bhimphedi via larkya la pass walking distance:24.5 km/15.22 miles, duration: 8-9 hours

\u27A4 Bimtang to tilje walking distance:26km/16.1miles, duration: 8-9 hours

\u27A4 Tilje to chamje walking distance:19.4km/12miles, duration: 6-7 hours

\u27A4 Chamje to Kathmandu distance 215km/133miles, duration 8-9 hours

        '''),
    TrekkingModel(
        id: 9,
        title: "Mardi Base Camp",
        imagePath: "assets/images/trekkingDestination/mardi.PNG",
        desc: '''
        
\u27A4 Kathmandu – pokhara distance: 205km/127miles duration 6-7 hours
        
\u27A4 Pokhara – kande duration 1 hour
 
\u27A4 Kande – pittam deurali via Australian camp and pothana distance: 5.8km/3.6miles duration: 4 hours

\u27A4 Pittam deurali – forest camp distance:8.3km/5.1 miles and duration 5hours

\u27A4 Forest camp – middle camp/bandal danda via low camp distance: 5.1km/3.1 miles, duration 4 hours

\u27A4 Middle camp – high camp distance: 2.8km/1.7miles duration 3 hours

\u27A4 Hiking to mardi himal base camp – high camp distance: 10km/6.2 miles duration 7-8 hours

\u27A4 High camp – siding village distance:8.1km/5miles duration 7 hours

\u27A4 Siding village – pokhara driving duration 3:30 hours

\u27A4 Pokhara – Kathmandu distance: 205km/127miles duration 6-7 hours

        '''),
    TrekkingModel(
        id: 10,
        title: "Nar phu valley Trek",
        imagePath: "assets/images/trekkingDestination/narPhu.PNG",
        desc: '''
        
\u27A4 Kathmandu – besisahar  - jagat distance: 198km / 123miles duration: 8-10hours
        
\u27A4 Jatat – dharapani distance: 15.8km/9.8miles duration: 5hours

\u27A4 Dharapani – koto altitude: 2610m/8563ft duration: 5-6hours

\u27A4 Koto – meta altitude: 3560m/11680ft duration: 7-8hours

\u27A4 Meta – phu gaun altitude: 4250m/13944ft duration: 7-8hours

\u27A4 Phu gaun – nar altitude: 4250m/13944ft duration: 6-7hours

\u27A4 Nar – kang la pass – ngawal altitude: 5322m/17460ft duration: 7-8hours

\u27A4 Ngawal – manang altitude 3660m/12008ft duration: 4-5hours

\u27A4 Manang – yak kharka altitude: 4110m/13484ft duration: 3-4hours

\u27A4 Yak kharka – thorong phedi altitude: 4600m/15092ft duration: 3-4hours

\u27A4 Thorong phedi – thorong la pass altitude - muktinath: 54525m/17764ft duration: 7-8hours

\u27A4 Muktinath – jomsom altitude: 3800m/12467ft duration: 4-5hours

\u27A4 Jomsom – tatopani distance 113km/70miles driving duration: 6-7hours

\u27A4 Tatopani – pokhara distance: 90km duration: 7hours

\u27A4 Pokhara – Kathmandu driving distance: 205km/127miles duration: 6-7 hour

        '''),
    TrekkingModel(
        id: 11,
        title: "Ghandruk Poonhill",
        imagePath: "assets/images/trekkingDestination/poonhill.PNG",
        desc: '''
        
\u27A4 Kathmandu – pokhara driving distance: 205km/127miles duration: 6-7 hours
        
\u27A4 Pokhara – nayapul driving distance: 40km duration 1hour 30min

\u27A4 Nayapul – ghandruk distance: 13.2km/8.2miles duration: 6hours

\u27A4 Ghandruk – tadapani distance: 8km/4.9miles duration: 4hours

\u27A4 Tadapani – ghorepani distance: 8.1km/5miles duration 5hours

\u27A4 Ghorepani – poonhill – ghorepani distance: 2.9km/1.8miles duration:1:30hours

\u27A4 Ghorepani – tikhedhunga distance:12.1km/7.5miles duration: 5hours

\u27A4 Tikhedhunga – nayapul height 1070m/3510ft duration: 3hours

\u27A4 Nayaul – pokhara driving distance: 40km duration 1hour 30min

\u27A4 Pokhara – Kathmandu driving distance: 205km/127miles duration: 6-7 hours

        '''),
    TrekkingModel(
        id: 12,
        title: "Jumla Rara Lake Trek",
        imagePath: "assets/images/trekkingDestination/rara.PNG",
        desc: '''
        
\u27A4 Kathmandu – Nepalgunj altitude 150m/492ft flight duration:1hour
        
\u27A4 Nepalgunj – jumla altitude 2540m/8333ft flight duration:20mins

\u27A4 Jumla – chere chaur altitude 3055m/10022ft duration: 6hours

\u27A4 Chere chaur – chala chaur altitude 2980m/9776ft duration:5hours

\u27A4 Chala chaur – sinja valley altitude 2490m/8169ft duration: 7hours

\u27A4 Sinja valley – goru singhe altitude 3050m/10006ft duration: 4hours

\u27A4 Goru Singhe - Rara Lake altitude 3010m/9875ft duration: 6hours

\u27A4 Day trip - Muldi Viewpoint altitude 3410m/11187ft duration:3hours

\u27A4 Rara Lake – Pina altitude: 2440,/8005ft duration 6hours

\u27A4 Pina – Bumra altitude 2850m/9350ft duration: 5hours

\u27A4 Bumra – Jumla altitude: 2540m/8333ft duration: 6hours

\u27A4 Jumla -  Nepalgunj (Flight) - Kathmandu (Flight) altitude:1300m/4265ft duration: 3hours
        
        '''),
    TrekkingModel(
        id: 13,
        title: "Tsum Valley Trek",
        imagePath: "assets/images/trekkingDestination/TsumValley.PNG",
        desc: '''
        
\u27A4 Drive from Kathmandu to sotikhola via arughat distance: 140 km, duration: 8 hours
        
\u27A4 Soltikhola to maccha khola walking distance:14.2km/8.8miles, duration: 5-6 hours
 
\u27A4 Machha khola to jagat walking distance:22.2km/13.8miles, duration: 5-6 hours

\u27A4 Jagat – lokpa altitude: 2240m/7349ft duration: 5hours

\u27A4 Lokpa – chumling altitude: 2386m/7828ft duration:5hours

\u27A4 Chumling – chekampar altitude: 3031m/9944ft duration: 6hours

\u27A4 Chekampar – nile altitude: 3361m/11023ft duration:6 hours

\u27A4 Nile – chekampar altitude: 3031m/9944ft duration: 5hours

\u27A4 Chekampar – gumba lundang altitude: 3200m/10498ft duration: 6hours

\u27A4 Gumba lundang – lokpa altitude: 2240m/7349ft duration: 7hours

\u27A4 Lokpa – jagat altitude: 1340m/4396ft duration: 6hours

\u27A4 Jagat – maccha khola altitude: 930m/3051ft duration: 6hours

\u27A4 Machha khola – soti khola altitude: 700m/2296ft duration: 6hours

\u27A4 Soti khola – Kathmandu altitude: 1300m/4265ft duration: 8 hours

        '''),
    TrekkingModel(
        id: 14,
        title: "Upper Mustang",
        imagePath: "assets/images/trekkingDestination/upperMustang.PNG",
        desc: '''
        
\u27A4 Kathmandu – pokhara drive distance: 205km/127miles duration 6-7 hours
        
\u27A4 Pokhara – jomsom altitude:27432m flight duration: 25min

\u27A4 Jomsom – kagbeni altitude:2804m duration: 2hours

\u27A4 Kagbeni – chele altitude:3050m duration: 7-8hous

\u27A4 Chele – syangbochen altitude:3820m duration: 7-8hours

\u27A4 Syangbochen – Tsarang altitude: 3580m duration: 6-7hours

\u27A4 Tsarang – Lo-Manthang altitude: 3700m duration: 8-9 hours

\u27A4 Lo- Manthang – ghami altitude: 3520m duration: 6-7hours

\u27A4 Ghami – samar altitude: 3540m duration: 7-8hours

\u27A4 Samar – muktinath altitude: 3600m duration: 7-8hours

\u27A4 Muktinath – jomsom altitude: 3495m duration: 5-6hours

\u27A4 Jomsom – pokhara altitude:27432m flight duration: 25min

\u27A4 Pokhara – Kathmandu drive distance: 205km/127miles duration 6-7 hours

        '''),
  ];

  UnmodifiableListView<TrekkingModel> get trekkingDesc {
    return UnmodifiableListView(_trekkingDesc);
  }

  int get imgLength => _trekkingDesc.length;
}
