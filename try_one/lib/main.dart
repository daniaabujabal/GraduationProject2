// import 'dart:async';
// import 'dart:convert';
//import 'dart:ffi';

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// import 'package:http/http.dart' as http;

// Future<Album> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

const String username = "daniahFlutter";
const String password = "testtest";
const String phonenumber = "12345678901";
const String apiUrl = 'https://10.0.2.2:44387/api/Users';
const String getUsersUrl = 'https://10.0.2.2:44387/api/Users/';

class User {
  int? id;
  String? username;
  String? password;
  String? phonenumber;
  double? longitude;
  double? latitude;
  List<String>? feedback;
  List<String>? pharamaysProducts;
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.phonenumber,
    this.longitude,
    this.latitude,
    this.feedback,
    this.pharamaysProducts,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    phonenumber = json['phonenumber'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    feedback = json['feedback'];
    pharamaysProducts = json['pharamaysProducts'];
  }
}
//final responsee= await dio.post('http://176.29.218.128:44387/api/Users/register')
// final response =
//     await http.post(url, headers: {"Content-Type": "application/json"});

void postData() async {
  final dio = Dio();
  try {
    final client = http.Client();
    var url = Uri.parse(apiUrl);
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
      // body: jsonEncode({
      //   "username": username,
      //   "password": password,
      //   "phonenumber": phonenumber
      // }),
    );
    client.close();

    // final response = await dio.post(
    //   apiUrl,
    //   options: Options(headers: {'Content-Type': 'application/json'}),
    //   data: {
    //     "username": username,
    //     "password": password,
    //     "phonenumber": phonenumber,
    //   },
    // );
    print(
        'Resopones header ${response.headers},Response body: ${response.body}, Code is ${response.statusCode}, response ${response}');
  } catch (e) {
    print('Error: $e');
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late List<User> userList = [];

  @override
  void initState() {
    super.initState();
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    try {
      final response = await Dio().get(getUsersUrl);
      final data = response.data;

      List<User> users = [];

      for (var user in data) {
        users.add(User(
          id: user['id'],
          username: user['username'],
          password: user['password'],
          phonenumber: user['phonenumber'],
          latitude: user['latitude'],
          longitude: user['longitude'],
          feedback: user['feedback'],
          pharamaysProducts: user['pharamaysProducts'],
        ));
      }

      setState(() {
        userList = users;
      });
    } catch (error) {
      print('Error fetching user list: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: userList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return UserCard(user: userList[index]);
              },
            ),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: UserListScreen(),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    //futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              postData();
            },
            child: const Text('make post request'),
          ),
          // child: FutureBuilder<Album>(
          //   future: futureAlbum,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(snapshot.data!.title);
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }

          // By default, show a loading spinner.
          //return const CircularProgressIndicator();
          // },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('ID: ${user.id}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('username: ${user.username}'),
            Text('password: ${user.password}'),
            Text('Phone Number: ${user.phonenumber}'),
            Text('Longitude: ${user.longitude}'),
            Text('Latitude: ${user.latitude}'),
          ],
        ),
      ),
    );
  }
}
