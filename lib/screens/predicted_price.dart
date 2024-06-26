import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PredictedPice extends StatefulWidget {
  final Function(int) changeScreen;
  final Future<double> Function() makePrediction; // Change the return type

  const PredictedPice({
    super.key,
    required this.changeScreen,
    required this.makePrediction,
  });

  @override
  State<PredictedPice> createState() => _PredictedPiceState();
}

class _PredictedPiceState extends State<PredictedPice> {
  double? predictedprice;

  void _goHome() {
    widget.changeScreen(0);
  }

  @override
  void initState() {
    super.initState();
    // Call the makePrediction function when the screen is initialized
    widget.makePrediction().then((value) {
      setState(() {
        predictedprice = value;
      });
    }).catchError((error) {
      // Handle error if prediction fails
      print('Prediction failed: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'images/homepage.jpg',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Predicted Price of House',
                  style: GoogleFonts.notoSerif(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(181, 0, 0, 0),
                    letterSpacing: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Divider(
                height: 10.0,
                thickness: 1.0,
                color: Color.fromARGB(36, 50, 50, 50),
                indent: 40.0,
                endIndent: 40.0,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Predicted house Price:',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 70, 69, 69),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6.0),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'USD: ${predictedprice?.toStringAsFixed(2)} dollars',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 70, 69, 69),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 20.0,
                  ),
                ),
                onPressed: () {
                  _goHome();
                },
                child: const Text('Go home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
