// // ignore_for_file: library_private_types_in_public_api

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// const String getUsersUrl = 'https://localhost:44387/api/Users/';

// class User {
//   final int id;
//   final String username;
//   final String password;
//   final String phoneNumber;
//   final double? longitude;
//   final double? latitude;
//   final List<String>? feedback;
//   final List<String>? pharamaysProducts;
//   User({
//     required this.id,
//     required this.username,
//     required this.password,
//     required this.phoneNumber,
//     this.longitude,
//     this.latitude,
//     this.feedback,
//     this.pharamaysProducts,
//   });
// }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: UserListScreen(),
//     );
//   }
// }

// class UserListScreen extends StatefulWidget {
//   const UserListScreen({super.key});

//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }

// class _UserListScreenState extends State<UserListScreen> {
//   late List<User> userList = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchUserList();
//   }

//   Future<void> fetchUserList() async {
//     try {
//       final response = await Dio().get(getUsersUrl);
//       final data = response.data;

//       List<User> users = [];

//       for (var user in data) {
//         users.add(User(
//           id: user['id'],
//           username: user['username'],
//           password: user['password'],
//           phoneNumber: user['phonenumber'],
//           latitude: user['latitude'],
//           longitude: user['longitude'],
//           feedback: user['feedback'],
//           pharamaysProducts: user['pharamaysProducts'],
//         ));
//       }

//       setState(() {
//         userList = users;
//       });
//     } catch (error) {
//       print('Error fetching user list: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User List'),
//       ),
//       // ignore: unnecessary_null_comparison
//       body: userList == null
//           ? const Center(
//               child:
//                CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: userList.length,
//               itemBuilder: (context, index) {
//                 return UserCard(user: userList[index]);
//               },
//             ),
//     );
//   }
// }

// class UserCard extends StatelessWidget {
//   final User user;

//   UserCard({required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: ListTile(
//         title: Text('ID: ${user.id}'),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Username: ${user.username}'),
//             Text('Password: ${user.password}'),
//             Text('Phone Number: ${user.phoneNumber}'),
//             Text('Longitude: ${user.longitude}'),
//             Text('Latitude: ${user.latitude}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
