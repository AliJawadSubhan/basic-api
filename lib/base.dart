


import 'package:flutter/material.dart';
import 'package:restsingh/page/home_page.dart';
import 'package:restsingh/page/list_string_api.dart';
import 'package:restsingh/page/real_response.dart';

class ApiApp extends StatelessWidget {
  const ApiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RealJsonResponse(),
    );
  }
}
