import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: what3words(),
    );
  }
}

class what3words extends StatefulWidget {
  const what3words({Key key}) : super(key: key);

  @override
  _what3wordsState createState() => _what3wordsState();
}

class _what3wordsState extends State<what3words> {
  double long = 49.5;
  double lat = -0.90;
  LatLng point = LatLng(49.5, -0.09);
  var location = [];

  @override
  Widget build(BuildContext context) {
    final length = MediaQuery.of(context).size;
    return new Scaffold(
      body: Stack(
        children: [
          FlutterMap(
              options: MapOptions(

                  zoom: 5.0,
                  center: point,),
              layers: [
                TileLayerOptions(
                    backgroundColor: Colors.white,
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(49.025, -0.09),
                    builder: (ctx) => Icon(
                      Icons.pin_drop,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(49.00252, -0.00090),
                    builder: (ctx) => Icon(
                      Icons.pin_drop,
                      size: 50,
                      color: Colors.blue,
                    ),
                  )
                ]),
              ]),
        ],
      ),

      body:
          FlutterMap(options: MapOptions(center: new LatLng(27.69384, 85.31411)), layers: [
        TileLayerOptions(
            minZoom: 1,
            maxZoom: 18,
            backgroundColor: Colors.white,
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(27.69384, 85.31411),
            builder: (ctx) => Icon(
              Icons.pin_drop,
              size: 50,
              color: Colors.red,
            ),
          )
        ]),
      ]),

    );
  }
}
