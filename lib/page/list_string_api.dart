import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListString extends StatefulWidget {
  const ListString({Key? key}) : super(key: key);

  @override
  State<ListString> createState() => _ListStringState();
}

class _ListStringState extends State<ListString> {
  List res = [];

  fetchData() async {
    http.Response response = await http
        .get(Uri.parse("https://www.thegrowingdeveloper.org/apiview?id=4"));
    setState(() {
      res = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchData();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child:
                res == null ? CircularProgressIndicator() :
            ListView.builder(
                itemCount: res.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      res[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
