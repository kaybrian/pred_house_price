import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:predicthouseprice/screens/center_distance.dart';

class NetSquare extends StatefulWidget {
  final Function(int) changeScreen;
  final Function(double) setNetSquare;

  const NetSquare({
    super.key,
    required this.changeScreen,
    required this.setNetSquare,
  });

  @override
  State<NetSquare> createState() => _NetSquareState();
}

class _NetSquareState extends State<NetSquare> {
  final TextEditingController _controller = TextEditingController();

  void _netSquare() {
    String inputText = _controller.text.trim();
    if (inputText.isNotEmpty) {
      double sqrmeters = double.tryParse(inputText) ?? 10.0;
      widget.setNetSquare(sqrmeters);
      widget.changeScreen(3);
    } else {
      // Show error message or indication to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a valid number',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
      // For example, you can change the border color of the TextField to red
      setState(() {
        _controller.clear(); // Clear the TextField
      });
    }
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
                  'Net Square Meters (Net Sqm):',
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
                  'Net square meters refer to the total usable interior space within the housing unit, excluding common areas like corridors and stairwells. It quantifies the size of the property',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 70, 69, 69),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  labelText: 'Enter number of square meters eg 1000 sqm',
                  hintText: 'Enter number of square meters eg 1000 sqm',
                  prefixIcon: const Icon(Icons.square_foot),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(181, 0, 0, 0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(181, 0, 0, 0),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _controller.text = value;
                  });
                },
              ),
            ),
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
                  _netSquare();
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
