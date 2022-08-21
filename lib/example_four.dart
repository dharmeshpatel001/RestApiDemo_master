import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Course"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUserApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: const CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index]['id'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['name'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['username'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['email'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['phone'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['website'].toString()),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(data[index]['address']['street'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['address']['suite'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['address']['city'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['address']['zipcode'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['address']['geo']['lat'].toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['address']['geo']['lng'].toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}
