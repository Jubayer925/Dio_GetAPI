import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //variables
  List posts = [];

  //calling fetch data func when the app start
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_data();
  }

  //fetch api data using dio
  void fetch_data() async {
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/posts");
      setState(() {
        posts = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Fetch API Data",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),


      //Api data to ui
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(posts[index]['title']),
              subtitle: Text(posts[index]['body']),
              leading: Text(
                posts[index]['id'].toString(),
                style: TextStyle(fontSize: 20),
              ),
            );
          }),
    );
  }
}
