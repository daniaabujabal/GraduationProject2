// ignore: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';
import 'package:gpgp/widgets/image_constant.dart';
//import 'Categories_Page.dart';

import 'Search_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double cardBorderRadius = 25.0;

  //int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  TextEditingController searchController = TextEditingController();

  // void _navigateToSearchPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SearchPage(searchQuery: searchController.text),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4BD8BB),
              Color(0xFF71CDD7),
              Color(0xFF5DAFCA),
            ],
            stops: [0.1, 0.23, 0.40],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Good Afternoon, Dania",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 222, 224, 232),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          ImageConstant.imgIconHeart,
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: searchController,

                decoration: InputDecoration(
                  hintText: "Search a product or a pharmacy",
                  hintStyle: const TextStyle(color: Colors.black45),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 222, 224, 232),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                //onFieldSubmitted: (_) => _navigateToSearchPage(),

                onFieldSubmitted: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(searchQuery: value),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white54.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(70.0),
                    topRight: Radius.circular(70.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(cardBorderRadius),
                                  child: Image.asset(
                                      ImageConstant.imgRectangle4,
                                      fit: BoxFit.cover),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(cardBorderRadius),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withAlpha(100),
                                        Colors.transparent
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(16.0),
                                  child: const Text(
                                    'Panadol',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(cardBorderRadius),
                                  child: Image.asset(
                                      ImageConstant.imgRectangle4149x329,
                                      fit: BoxFit.cover),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(cardBorderRadius),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withAlpha(100),
                                        Colors.transparent
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(16.0),
                                  child: const Text(
                                    'Panadol',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey[700],
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'Nearby',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print('Pharmacy clicked');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.93,
                              margin: EdgeInsets.only(
                                  left: 16, right: index == 9 ? 16 : 0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius:
                                    BorderRadius.circular(cardBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        10), // Space around the icon
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors
                                            .cyan[100], // Icon background color
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.local_pharmacy,
                                        color: Color(0xFF4CA6C2), // Icon color
                                        size: 30, // Icon size
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Pharmacy One',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color(
                                                  0xFF71CDD7), // Text color
                                            ),
                                          ),
                                          Text(
                                            '8:00 am - 11:00 pm',
                                            style: TextStyle(
                                              color: Color(0xFF71CDD7),
                                            ),
                                          ),
                                          Text(
                                            'pharmacy info pharmacy info',
                                            style: TextStyle(
                                              color: Color(0xFF71CDD7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageConstant.imgIconStar,
                            width: 24,
                            height: 24,
                            //color: Color(0xFF4CA6C2),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'Highly Rated',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10, // Number of items in the list
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print('Pharmacy clicked');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.93,
                              margin: EdgeInsets.only(
                                  left: 16, right: index == 9 ? 16 : 0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius:
                                    BorderRadius.circular(cardBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        10), // Space around the icon
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors
                                            .cyan[100], // Icon background color
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.local_pharmacy,
                                        color: Color(0xFF4CA6C2),
                                        size: 30, // Icon size
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Pharmacy One',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color(0xFF71CDD7),
                                            ),
                                          ),
                                          Text(
                                            '8:00 am - 11:00 pm',
                                            style: TextStyle(
                                              color: Color(0xFF71CDD7),
                                            ),
                                          ),
                                          Text(
                                            'pharmacy info pharmacy info',
                                            style: TextStyle(
                                              color: Color(0xFF71CDD7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
