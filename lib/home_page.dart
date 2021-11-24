import 'package:flutter/material.dart';
import 'package:netdemo/services/http_service.dart';
import 'model/post_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _apiCreatePost(Post post) {
    Network.POST(Network.API_LIST, Network.paramsCreate(post))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiUpdatePost(Post post) {
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }
  void _apiDeletePost(Post post) {
    Network.DEL(
            Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    var post = new Post(id: 1, title: "dump", body: "online", userId: 1);
    _apiDeletePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }
}
