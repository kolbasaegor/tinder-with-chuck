import 'dart:math';

import 'package:dio/dio.dart';
import 'package:tinder_with_chuck/models/joke.dart';

final imageList = [
  "https://sun9-46.userapi.com/impg/87QxOboNzuC8I0QAfF82ND2Q-xFCGbCIuEI1Cw/R3m_ZruRKMk.jpg?size=165x198&quality=95&sign=0d5db3b406cb5dd7eb1165ff08ea46e9&type=album",
  "https://sun9-73.userapi.com/impg/XXZfMP3uvQ7qdL_X-F5XrP2lot9iHpgzzEL7pg/dAfSqPHRza8.jpg?size=1286x858&quality=95&sign=efc2249a976ce588e133eab1609f4936&type=album",
  "https://sun9-41.userapi.com/impg/aiM_nKIqL0dqVtxRMNEVunAv1j-fhVo5__17OQ/S8QWR4pUwoM.jpg?size=718x487&quality=95&sign=ca4cd564b2bf5e195cbdc6071db44f04&type=album",
  "https://sun9-1.userapi.com/impg/UQJsAcegRfEOJds5zrs0ffWHFlTaKi_tO6HfIQ/Msd5sMlVvak.jpg?size=1620x2160&quality=95&sign=bbc24118b6cdab7b201e1bf0e351208c&type=album",
  "https://sun9-66.userapi.com/impg/TYJV64yeJsg0WRQ8UwNvGC4Xq1rGE70I3GRzMA/JVAPhiB7nbw.jpg?size=766x958&quality=96&sign=3fc67bc4f3cb675aed96f30ec15e4a35&type=album",
  "https://sun9-42.userapi.com/impg/paUNoa9NRhTGctK9hG2YVipGZBus2HC1GHxeAw/k0lwU3gGF10.jpg?size=1280x720&quality=96&sign=caeda0089b7a803a5ac128f641a849ae&type=album",
];

class JokeRepository {
  Future<Joke> getRandomJoke() async {
    final chuckApiResponse =
        await Dio().get("https://api.chucknorris.io/jokes/random");
    final chuckData = chuckApiResponse.data;

    final Map<String, dynamic> jsonJoke = {
      "uuid": chuckData["id"],
      "text": chuckData["value"],
      "imageUrl": imageList[Random().nextInt(imageList.length)]
    };

    return Joke.fromJson(jsonJoke);
  }
}
