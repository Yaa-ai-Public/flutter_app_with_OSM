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
  @override
  Widget build(BuildContext context) {
    final length = MediaQuery.of(context).size;
    return new Scaffold(
      body:
          FlutterMap(options: MapOptions(center: new LatLng(28.3949, 84.1240)), layers: [
        TileLayerOptions(
            minZoom: 1,
            maxZoom: 10,
            backgroundColor: Colors.white,
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(28.3949, 84.1240),
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
