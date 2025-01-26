import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:medmanage3/screen/ambulance.dart';
import 'package:medmanage3/screen/diseasesscreen.dart';
import 'package:medmanage3/screen/doctorscreen.dart';
import 'package:medmanage3/screen/finddoctor.dart';
import 'package:medmanage3/screen/hospitalscreen.dart';
import 'package:medmanage3/screen/medicinescreen.dart';
import 'package:medmanage3/screen/reminder.dart';
import 'package:medmanage3/widegets/banner.dart';
import 'package:medmanage3/screen/chatbot_screen.dart';
import 'package:medmanage3/widegets/doctor_type.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Find Your Desire\nHealth Solution",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 254),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: Container(
              width: 60,
              height: 60,
              child: Image.asset(
                'assets/icon/sign.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        toolbarHeight: 130,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // DoctorType widget placed above the search field
                  DoctorTypeScroller(),
                  SizedBox(height: 20),

                  // TextField for search
                  TextField(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: Finddcoctor(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.none,
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Search doctor, drugs...",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildIconWithLabel('assets/icon/hospital.png',
                            'Hospital', HospitalScreen()),
                        _buildIconWithLabel('assets/icon/abnormal.png',
                            'Diseases', DiseasesScreen()),
                        _buildIconWithLabel(
                            'assets/doctor1.png', 'Doctor', DoctorScreen()),
                        _buildIconWithLabel(
                            'assets/icon/reminder.png', 'Reminder', Reminder()),
                        _buildIconWithLabel('assets/icon/medicine.png',
                            'Medicine', MedicineScreen()),
                        _buildIconWithLabel('assets/icon/ambulance.png',
                            'Ambulance', AmbulanceScreen()),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SlideshowBanner(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Animated Chatbot Icon
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                bottom: 50 + _animation.value,
                right: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/icon/chatbot.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: ChatbotScreen(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithLabel(
      String imagePath, String label, Widget destinationScreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: destinationScreen,
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
