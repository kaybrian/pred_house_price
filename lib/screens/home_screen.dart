import 'package:flutter/material.dart';
import 'package:predicthouseprice/screens/age_screen.dart';
import 'package:predicthouseprice/screens/bed_room_count.dart';
import 'package:predicthouseprice/screens/center_distance.dart';
import 'package:predicthouseprice/screens/floor.dart';
import 'package:predicthouseprice/screens/metro_distance.dart';
import 'package:predicthouseprice/screens/net_square.dart';
import 'package:predicthouseprice/screens/predicted_price.dart';
import 'package:predicthouseprice/screens/welcome_screen.dart';
import 'package:predicthouseprice/service.dart/predict.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var current_screen = 0;
  int bedRooms = 0;
  double netSquare = 0;
  double centerDistance = 0.0;
  double metroDistance = 0.0;
  int floor = 0;
  int age = 0;

  final backendService = BackendService();

  void setBedRooms(int bedRooms) {
    setState(() {
      this.bedRooms = bedRooms;
    });
  }

  void setNetSquare(double netSquare) {
    setState(() {
      this.netSquare = netSquare;
    });
  }

  void setCenterDistance(double centerDistance) {
    setState(() {
      this.centerDistance = centerDistance;
    });
  }

  void setMetroDistance(double metroDistance) {
    setState(() {
      this.metroDistance = metroDistance;
    });
  }

  void setFloor(int floor) {
    setState(() {
      this.floor = floor;
    });
  }

  void setAge(int age) {
    setState(() {
      this.age = age;
    });
  }

  void makePrediction() async {
    debugPrint(
      bedRooms.toString() +
          " " +
          netSquare.toString() +
          " " +
          centerDistance.toString() +
          " " +
          metroDistance.toString() +
          " " +
          floor.toString() +
          " " +
          age.toString(),
    );

    try {
      final response = await backendService.sendHouseData(
        bedroomCount: bedRooms,
        netSquare: netSquare,
        centerDistance: centerDistance,
        metroDistance: metroDistance,
        floor: floor,
        age: age,
      );

      if (response != null) {
        // Handle the response here
        print('Predicted price: $response');
      } else {
        // Handle error case where response is null
        print('Prediction failed');
      }
    } catch (e) {
      // Handle error case
      print('Error: $e');
    }
  }

  late List<Widget> screens; // Declare the screens list here

  void changeScreen(int index) {
    setState(() {
      current_screen = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the screens list in the initState method
    screens = [
      WelcomeScreen(
        changeScreen: changeScreen,
      ),
      BedRoomCount(
        changeScreen: changeScreen,
        setBedRooms: setBedRooms,
      ),
      NetSquare(changeScreen: changeScreen, setNetSquare: setNetSquare),
      CenterDistance(
          changeScreen: changeScreen, setCenterDistance: setCenterDistance),
      MetroDistance(
          changeScreen: changeScreen, setMetroDistance: setMetroDistance),
      FloorScreen(changeScreen: changeScreen, setFloor: setFloor),
      AgeScreen(changeScreen: changeScreen, setAge: setAge),
      PredictedPice(changeScreen: changeScreen, makePrediction: makePrediction),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: screens[current_screen],
    );
  }
}
