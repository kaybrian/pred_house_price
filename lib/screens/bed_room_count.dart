import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:predicthouseprice/models/HouseData.dart';
import 'package:predicthouseprice/screens/net_square.dart';

class BedRoomCount extends StatefulWidget {
    final Function(int) changeScreen;
    final Function(int) setBedRooms;

  const BedRoomCount({
    super.key,
    required this.changeScreen,
    required this.setBedRooms,
  });

  @override
  State<BedRoomCount> createState() => _BedRoomCountState();
}

class _BedRoomCountState extends State<BedRoomCount> {
  final TextEditingController _controller = TextEditingController();

  void _bedRoomCount(BuildContext context) {
    String inputText = _controller.text.trim();
    if (inputText.isNotEmpty) {
      int bedroomCount = int.tryParse(inputText) ?? 1;
      widget.setBedRooms(bedroomCount);
      widget.changeScreen(2);
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
                    'images/bedrooms.jpg',
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
                    'Bedroom Count',
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
                    'This attribute represents the number of bedrooms in the housing unit. It is used in predicting the price of the house.',
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 40.0),
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Enter Bedroom Count (e.g. 3 or 4)',
                        hintText: 'Enter number of bedroom in the house',
                        prefixIcon: const Icon(Icons.bedroom_parent),
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
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(238, 255, 5, 5),
                            ))),
                    onChanged: (value) {
                      setState(() {
                        _controller.text = value;
                      });
                    }),
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
                    _bedRoomCount(context);
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
