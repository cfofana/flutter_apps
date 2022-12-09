import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
//import 'package:geocode/geocode.dart';

import 'package:geocoding/geocoding.dart';
//import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class Animal {
  final int id;
  final String name;

  Animal({required this.id, required this.name});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String lat = '';

  String? _locationValue;
  static List<Animal> animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];

  final items = animals
      .map((animal) => MultiSelectItem<Animal?>(animal, animal.name))
      .toList();
  List<Animal> selectedAnimals = [];
  List<Animal?> selectedAnimals2 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  final items2 = [];

  List<String> selectedLocationValues = [];
  List<String>? locationValues = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: (() {
                print(
                  getLocation(),
                );
              }),
              child: Text('Location'),
            ),
            Text('$_locationValue'),
            SizedBox(height: 30.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: MultiSelectDialogField(
                items: items,
                onConfirm: (results) {
                  selectedAnimals = results as List<Animal>;
                },
                chipDisplay: MultiSelectChipDisplay(),
              ),
            ),
            MultiSelectDialogField(
                items: items,
                title: Text('Location'),
                selectedColor: Colors.green,
                buttonIcon: Icon(
                  Icons.pets,
                  color: Colors.blue,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                buttonText: Text(
                  "Favorite Animals",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  selectedAnimals = results as List<Animal>;
                }),
            SizedBox(height: 30.0),
            // Multi select dialog field
            MultiSelectDialogField(
                items: items,
                title: Text('Animals'),
                selectedColor: Colors.green,
                buttonIcon: Icon(
                  Icons.pets,
                  color: Colors.blue,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                buttonText: Text(
                  "Favorite Animals",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  selectedAnimals = results as List<Animal>;
                }),
            SizedBox(height: 50.0),
            // multi select chip field
            MultiSelectChipField(
              items: items,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.8),
              ),
              selectedChipColor: Colors.blue.withOpacity(0.5),
              title: Text('Favorite Animals2'),
              initialValue: [animals[3], animals[7], animals[9]],
              headerColor: Colors.blue.withOpacity(0.5),
              selectedTextStyle: TextStyle(color: Colors.blue[800]),
              onTap: (value) {
                selectedAnimals2 = value as List<Animal?>;
                print(selectedAnimals2);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<Object> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    Position position;
    String latitude;
    String longitude;
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .timeout(
      Duration(seconds: 15),
    );
    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    print(latitude + " " + longitude);
    // GeoCode geoCode = GeoCode();
    // Future<Address> address = geoCode.reverseGeocoding(
    //     latitude: position.latitude, longitude: position.longitude);
    List<Placemark> address =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      // country, administrativeArea, isoCountryCode, locality, name, postalCode, street
      _locationValue = address[0].country;
      locationValues = [
        address[0].country!,
        address[0].administrativeArea!,
        address[0].isoCountryCode!,
        address[0].street!,
      ];
    });
    return '${position.latitude.toString()}, ${position.longitude.toString()}';
    //return position;

    // Location location = new Location();

    // bool _serviceEnabled;
    // PermissionStatus _permissionGranted;
    // LocationData locationData;

    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     return Error;
    //   }
    // }

    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     return Error;
    //   }
    // }

    // locationData = await location.getLocation();
    // var latitude = locationData.latitude;
    // var longitude = locationData.longitude;
    // // currentLocation = UserLocation(
    // //     latitude: locationData.latitude,
    // //     longitude: locationData.longitude,
    // //   );
  }
}
