import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:prakmobilres/model/DetailModel.dart';
import 'package:prakmobilres/apiSources.dart';

class DetailAgentView extends StatefulWidget {
  final String uuid;
  final String name;

  DetailAgentView({Key? key, required this.uuid, required this.name});

  @override
  State<DetailAgentView> createState() => _DetailAgentView();
}

class _DetailAgentView extends State<DetailAgentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent[200],
      ),
      body: _buildDetailAgent(),
    );
  }

  Widget _buildDetailAgent(){
    return Container(
      child: FutureBuilder(
          future: ApiSo.detailAgent(widget.uuid),
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
                DetailAgentModel detailAgentModel = DetailAgentModel.fromJson(snapshot.data);
                if (detailAgentModel.data == null) {
                  print("not good");
                  return _buildError();
                }
                return _buildSuccess(detailAgentModel);
              } catch (e) {
                print(e);
                print("not cool");
                return _buildError();
              }
            } else return _buildError();
          }
      ),
    );
  }

  Widget _buildSuccess(DetailAgentModel detailAgentModel){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 300,
              child: Image.network(
                detailAgentModel!.data!.fullPortrait ?? "",
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "${detailAgentModel!.data!.displayName} ${detailAgentModel!.data!.developerName}" ?? "",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                  ),
                )
            ),

            Text("Role", style: TextStyle(fontWeight: FontWeight.w700)),
            Text(detailAgentModel.data!.description ?? ""),

            // )
          ],
        ),
      ),
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

  Future<void> _launchUrl(url) async {
    final Uri _url = Uri.parse(url);

    if(!await launchUrl(_url)){
      throw Exception("Could not launch $_url");
    }
  }
}


