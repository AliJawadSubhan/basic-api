import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RealJsonResponse extends StatefulWidget {
  const RealJsonResponse({Key? key}) : super(key: key);

  @override
  State<RealJsonResponse> createState() => _RealJsonResponseState();
}

// https://www.thegrowingdeveloper.org/apiview?id=2
class _RealJsonResponseState extends State<RealJsonResponse> {
  List facts = [];
  Map mapResponse = {};
  fetchResponse() async {
    http.Response resp = await http
        .get(Uri.parse("https://www.thegrowingdeveloper.org/apiview?id=2"));
    setState(() {
      mapResponse = jsonDecode(resp.body);
      facts = mapResponse['facts'];
    });
  }

  @override
  void initState() {
    fetchResponse();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: const Text("API"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mapResponse['category'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: facts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      facts[index]['title'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
