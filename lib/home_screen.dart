import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/PostModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        // postList.clear();
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api Course"),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("Loading"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Title",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                // Text("Title",style: Theme.of(context).textTheme.titleLarge,),
                                Text(
                                    postList[index].title.toString()),
                                SizedBox(height: 5,),
                                Text('Description',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                // Text('Description',style: Theme.of(context).textTheme.titleMedium,),
                                Text(
                                    postList[index].body.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}
