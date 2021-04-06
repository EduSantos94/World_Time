import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;

  String time;

  String flag;

  String url; //America/Sao_Paulo

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {

    try {
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];

      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();
    } catch (e) {
      print('Catch error: $e');
      time = 'Could not get the time';
    }
  }

}