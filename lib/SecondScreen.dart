import 'package:dicoding_flutter/DetailScreen.dart';
import 'package:dicoding_flutter/Model/Restaurants.model.dart';
import 'package:dicoding_flutter/Services/FetchService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List _restaurant = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    FetchService.getRestaurant().then((value) {
      _restaurant = value.restaurants;
      loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          "Aria",
          style: TextStyle(
              fontFamily: "Caveat", fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2))),
                  child: Text(
                    "Explore",
                    style: TextStyle(
                        fontFamily: "SourceSansPro",
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
            ),
            Flexible(
              child: (loading == true)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      // ignore: unnecessary_null_comparison
                      itemCount: _restaurant == null ? 0 : _restaurant.length,
                      itemBuilder: (context, index) {
                        RestaurantElement resto = _restaurant[index];
                        return Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 4,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailScreen(resto.id)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image(
                                          image: NetworkImage(
                                              'https://restaurant-api.dicoding.dev/images/small/${resto.pictureId}'),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Text(
                                                  resto.name,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "SourceSansPro",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                )),
                                            Text(
                                              resto.description,
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontFamily: "SourceSansPro",
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
