import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  List users = [];
  bool isLoading = true;

  Future<void> fetchUsers() async {
    final response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      users = jsonDecode(response.body);
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          "API Integration",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: isLoading
          ? ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
                title: Container(
                  height: 16,
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: 8),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 14, color: Colors.white),
                    SizedBox(height: 6),
                    Container(height: 14, width: 150, color: Colors.white),
                    SizedBox(height: 6),
                    Container(height: 14, width: 100, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber.shade50,
                child: Text(
                  user["name"][0],
                  style: TextStyle(color: Colors.black),
                ),
              ),
              title: Text(
                user["name"],
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user["username"],
                      style: TextStyle(color: Colors.black)),
                  Text(user["email"],
                      style: TextStyle(color: Colors.black)),
                  Text(user["phone"],
                      style: TextStyle(color: Colors.black)),
                  Text(user["address"]["street"],
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
