import 'package:climate_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:climate_app/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

const apiKey = 'f850bcffc50bc707c426344007e1ffea';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey'
            as Uri);
    var weatherData = await networkHelper.getData();

  print("gggggggggggggggggg");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData,);
      }));

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // child: TextButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const LocationScreen()),
        //     );
        //   },
        //   child: const Text('Click me'),
        // ),
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
          duration: Duration(seconds: 5),
        ),
      ),
    );
  }
}
