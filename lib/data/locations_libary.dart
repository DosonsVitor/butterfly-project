import 'package:butterfly_project/domain/libary.dart';
import 'package:dio/dio.dart';

class LocationLibary {
  Future<List<Libary>> getLocations(double lat, double lng) async {
    try {
      var response = await Dio().get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&rankby=distance&type=library&key=AIzaSyDyv-SSE2Xm3piPO1vc7huGL-Lyv_7BDaY');
      return (response.data['results'] as List).map((e) {
        return Libary.fromJson(e);
      }).toList();
    } catch (e) {
      return List.empty();
    }
  }
}
