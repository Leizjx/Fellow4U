import 'package:flutter/material.dart';

class MyTripsPage extends StatefulWidget {
  const MyTripsPage({super.key});

  @override
  State<MyTripsPage> createState() => _MyTripsPageState();
}

class _MyTripsPageState extends State<MyTripsPage> {
  static const Color primaryColor = Color(0xff16c1a3);
  int _selectedTab = 0;

  final List<Map<String, String>> currentTrips = const [
    {
      "title": "Dragon Bridge Trip",
      "image": "assets/icons/dn1.png",
      "location": "Da Nang, Vietnam",
      "date": "Jan 30, 2020",
      "time": "13:00 - 15:00",
      "guide": "Tuan Tran",
      "guideImage": "assets/icons/tuantran.png",
      "isFinished": "false",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildTabBar(),
            _buildTripsList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/dbh.png'),
              fit: BoxFit.cover,
            ),
          ),
          height: 200,
        ),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.black.withOpacity(0.4),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Trips",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    final tabs = ["Current Trips", "Next Trips", "Past Trips", "Wish List"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: List.generate(
            tabs.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedTab == index
                        ? primaryColor
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: _selectedTab == index ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTripsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(currentTrips.length, (index) {
          final trip = currentTrips[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image with Mark Finished
                  Stack(
                    children: [
                      Image.asset(
                        trip['image']!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.check, size: 16, color: Colors.grey),
                              SizedBox(width: 6),
                              Text(
                                "Mark Finished",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              trip['location']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Trip Details
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    trip['title']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        trip['date']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        trip['time']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        trip['guide']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(trip['guideImage']!),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: primaryColor,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.info_outline, color: primaryColor),
                                SizedBox(width: 6),
                                Text(
                                  "Detail",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey[400],
      showUnselectedLabels: true,
      elevation: 10,
      currentIndex: 1,
      onTap: (index) {
        if (index == 0) {
          Navigator.pop(context);
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: "My Trips",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: "Notify",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }
}
