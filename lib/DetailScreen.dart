import 'package:dicoding_flutter/Services/FetchService.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen(this.id, {Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List _categories = [];
  List _foods = [];
  List _drinks = [];
  List _customerReview = [];
  var _restaurant;
  bool isLoad = true;
  @override
  void initState() {
    super.initState();
    FetchService.getDetail(widget.id).then((value) {
      _restaurant = value.restaurant;
      _categories = _restaurant.categories;
      _foods = _restaurant.menus.foods;
      _drinks = _restaurant.menus.drinks;
      _customerReview = _restaurant.customerReviews;
      isLoad = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(300),
            child: AppBar(
              brightness: Brightness.dark,
              flexibleSpace: (isLoad == true)
              ? 
              Center(child:CircularProgressIndicator())
              :
              Stack(
                children: [
                  Container(
                  height: 350,                
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://restaurant-api.dicoding.dev/images/large/${_restaurant.pictureId}",)
                    ,)
                    ),
                    Container(
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7)
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_restaurant.name, style: TextStyle(
                            fontFamily: "SourceSansPro",
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: 
                          Text(_restaurant.city,style: TextStyle(
                            fontFamily: "SourceSansPro",
                            fontSize: 16,
                            color: Colors.white,))
                          ,),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: 
                          Text(_restaurant.address,style: TextStyle(
                            fontFamily: "SourceSansPro",
                            fontSize: 16,
                            color: Colors.white,))
                          ,)
                        ],
                      ),
                    )
                    ]
              ),
              bottom: TabBar(
                indicator: BoxDecoration(
                  color:Colors.transparent,
                  border: Border(
                    top: BorderSide(
                    color: Colors.white,
                    width: 3.0
                    )
                    )
                ),
                tabs: [
                  Tab(text: "Description"),
                  Tab(text: "Review"),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            (isLoad == true)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding: EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 40,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(_restaurant.rating.toString()))
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  fontFamily: "SourceSansPro",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 10),
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                // ignore: unnecessary_null_comparison
                                itemCount: (_categories == null)
                                    ? 0
                                    : _categories.length,
                                itemBuilder: (context, index) {
                                  var category = _categories[index];
                                  return Text("- " + category.name);
                                }),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontFamily: "SourceSansPro",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                        Text(
                          _restaurant.description,
                          maxLines: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Menu",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 5),
                          child: Text(
                            "Foods :",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 10),
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                // ignore: unnecessary_null_comparison
                                itemCount: (_foods == null) ? 0 : _foods.length,
                                itemBuilder: (context, index) {
                                  var food = _foods[index];
                                  return Text("- "+food.name);
                                }),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10, left: 5),
                          child: Text(
                            "Drinks :",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 10),
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                // ignore: unnecessary_null_comparison
                                itemCount: (_drinks == null) ? 0 : _drinks.length,
                                itemBuilder: (context, index) {
                                  var drink = _drinks[index];
                                  return Text("- "+drink.name);
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                  // ignore: unnecessary_null_comparison
                  itemCount: (_customerReview == null) ? 0 : _customerReview.length,
                  itemBuilder: (context, index) {
                    var costumer = _customerReview[index];
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                costumer.name,
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                costumer.date,
                                style: TextStyle(fontSize: 10),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(costumer.review))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ])),
    );
  }
}
