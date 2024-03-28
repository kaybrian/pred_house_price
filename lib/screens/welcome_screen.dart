import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:predicthouseprice/screens/bed_room_count.dart';

class WelcomeScreen extends StatelessWidget {
    final Function(int) changeScreen;


  const WelcomeScreen({
    super.key,
    required this.changeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'images/homepage.jpg',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                'House Price Prediction',
                style: GoogleFonts.notoSerif(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(181, 0, 0, 0),
                  letterSpacing: 1.3,
                ),
                textAlign: TextAlign.center,
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
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 7.0),
                child: Text(
                  'Founded in 2024, we give you the prefect house predictions ever, rather than just the price.',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 70, 69, 69),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60, vertical: 20.0),
                ),
                onPressed: () {
                  changeScreen(1);
                },
                child: const Text('Make a prediction'),
              ),
            ),
            const Spacer(),
          ],
        ),
      
    );
  }
}
