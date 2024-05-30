import 'package:flutter/material.dart';
import 'package:prakmobilres/apiSources.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/MapModel.dart';


class ListMap extends StatefulWidget {
  ListMap({super.key});

  @override
  State<ListMap> createState() => _ListMapView();
}

class _ListMapView extends State<ListMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Maps",
            style: TextStyle(
                color: Colors.white
            ),

          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent[200],
        ),
        body: _buildListFoods()

    );
  }

  Widget _buildListFoods(){
    return Container(
      child: FutureBuilder(
          future: ApiSo.loadMaps(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // print(snapshot);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoading();
            }
            else if (snapshot.hasError){
              return _buildError();
            }
            else if (snapshot.hasData){
              if (snapshot.data == null) {
                return _buildError();
              }
              try{
                MapModel mapModel = MapModel.fromJson(snapshot.data);
                if (mapModel.data == null || mapModel.data!.isEmpty) {
                  // print(snapshot.data);
                  print("null list");
                  return _buildError();
                }

                return _buildSuccess(mapModel);
              } catch (e) {
                return _buildError();
              }
            } else return _buildError();
          }
      ),
    );
  }

  Widget _buildSuccess(MapModel mapModel){
    // print("length ${foodsModel.meals!.length}");
    return GridView.builder(
      itemBuilder: (context, index) {

        return CardItem(map: mapModel.data! [index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: mapModel.data!.length,
    );
  }

  Widget _buildError() {
    return Text("Error");
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}




class CardItem extends StatelessWidget {
  final Maps map;

  CardItem({Key? key, required this.map});

  //
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {

          _launchUrl(map.displayIcon);
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: Image.network(
                    width: 301,
                    height: 301,
                    map.displayIcon ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 15,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  map.displayName ?? "",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 15,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  map.coordinates ?? "null",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    final Uri _url = Uri.parse(url);

    if(!await launchUrl(_url)){
      throw Exception("Could not launch $_url");
    }
  }
}