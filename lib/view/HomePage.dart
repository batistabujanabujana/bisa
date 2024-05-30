import 'package:flutter/material.dart';
import 'package:prakmobilres/view/ListAgen.dart';
import 'package:prakmobilres/view/ListMap.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Main Page JOsss",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent[200],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // print("clicked");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListAgent(),
                      ));
                },
                child: Card(
                  color: Colors.red,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 152, vertical: 5.1),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 152, vertical: 5.1),
                        child: Text(
                          "Agents",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              InkWell(
                onTap: () {
                  // print("clicked");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListMap(),
                      ));
                },
                child: Card(
                  color: Colors.red,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 160, vertical: 5),
                        child: Icon(
                          Icons.map,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 160, vertical: 5),
                        child: Text(
                          "Maps",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
