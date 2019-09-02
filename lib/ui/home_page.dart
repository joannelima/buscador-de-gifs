import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String _search;
  int _offset = 0 ;

Future<Map> _getGifs() async{
    http.Response response;
    if(_search == null){
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=2rf5AC2r6mxAltI58EU33hK2WRgzR22R&limit=20&rating=G");
    }else{
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=2rf5AC2r6mxAltI58EU33hK2WRgzR22R&q=$_search&limit=20&offset=$_offset&rating=G&lang=pt");
    }

    return json.decode(response.body);

  } 
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif"),
      ),
      body: Container(),
    );
  }
}