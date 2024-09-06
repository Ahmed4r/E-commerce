import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  static const String routeName = "homepage";
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/Group 5.png',
                color: Color(0xff004182),
                fit: BoxFit.cover,
                scale: 3,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'what do you search for?',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          prefixIconColor: Color(0xff004182),
                          border: InputBorder.none,
                        ),
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff80A0C1)),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 8), // Add space between TextField and IconButton
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined),
                    color: Color(0xff004182), // Adjust icon color if needed
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
