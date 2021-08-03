import 'package:dicoding_flutter/SecondScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/hero-image_2-large.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        ),
        Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Image(
                  height: 128,
                  image: AssetImage(
                  'assets/logo.png'),)
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  "Aria Resto",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      fontFamily: "Caveat"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Explore your favorite restaurant here",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen()));
                    },
                    child: Text("Explore Now"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.all(15),
                        elevation: 10)),
              )
            ],
          )),
        )
      ]),
    );
  }
}
