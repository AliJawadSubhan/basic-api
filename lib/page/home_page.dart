import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String strResponse = '';

  Future getResponse() async {
    http.Response response = await http
        .get(Uri.parse("https://www.thegrowingdeveloper.org/apiview?id=1"));

    setState(() {
      strResponse = response.body;
    });
  }

  @override
  void initState() {
    getResponse();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text("API"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          strResponse.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
