import 'dart:async';
import 'dart:convert';
import 'package:butterfly_project/data/locations_libary.dart';
import 'package:butterfly_project/domain/libary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_location/search_map_location.dart';
import 'package:search_map_location/utils/google_search/place.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  bool search = true;
  late double lat;
  late double lng;
  late List<Libary> libaries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bibliotecas"),
      ),
      body: search
          ? Center(
              child: SearchLocation(
              apiKey: "AIzaSyDyv-SSE2Xm3piPO1vc7huGL-Lyv_7BDaY",
              placeholder: "Pesquisar",
              language: 'pt',
              onSelected: (Place place) {
                getLibaries(place);
              },
            ))
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, lng),
                zoom: 14.4746,
              ),
              markers: getMarkes(libaries),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
    );
  }

  getLibaries(Place place) async {
    final data = ((await place.geolocation)!.fullJSON);
    lat = (data['geometry']['location']['lat']);
    lng = (data['geometry']['location']['lng']);
    LocationLibary get = LocationLibary();
    libaries = await get.getLocations(lat, lng);
    setState(() {
      search = false;
    });
  }

  getMarkes(List<Libary> libaries) {
    return libaries.map((e) {
      return Marker(markerId: MarkerId(e.name), position: LatLng(e.lat, e.lng));
    }).toSet();
  }
}
