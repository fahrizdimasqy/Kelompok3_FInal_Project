import 'package:final_project_kelompok3/about.dart';
import 'package:final_project_kelompok3/meals.dart';
import 'package:final_project_kelompok3/meals_detail.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
// import 'dart:async';
import 'package:http/http.dart' as http;
// import 'package:async/async.dart';

void main() => runApp(MaterialApp(
      title: "Kelompok3",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = "https://www.themealdb.com/api/json/v1/1/categories.php";
  MealsHub mealsHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    mealsHub = MealsHub.fromJson(decodedJson);
    print(mealsHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SiMeal"),
        backgroundColor: Colors.cyan,
      ),
      body: mealsHub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: mealsHub.categories
                  .map((ml) => Padding(
                        padding: EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MealDetail(
                                          categories: ml,
                                        )));
                          },
                          child: Hero(
                            tag: ml.strCategoryThumb,
                            child: Card(
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                ml.strCategoryThumb))),
                                  ),
                                  Text(ml.strCategory,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Kelompok3"),
              accountEmail: Text("kelompok@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.cyan),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new About()));
              },
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
