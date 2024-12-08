import 'package:flutter/material.dart';
import 'package:medmanage3/screen/ambulance.dart';
import 'package:medmanage3/screen/diseasesscreen.dart';
import 'package:medmanage3/screen/doctorscreen.dart';
import 'package:medmanage3/screen/finddoctor.dart';
import 'package:medmanage3/screen/hospitalscreen.dart';
import 'package:medmanage3/screen/medicinescreen.dart';
import 'package:medmanage3/screen/reminder.dart';
import 'package:medmanage3/widegets/banner.dart';
import 'package:medmanage3/widegets/doctor_type.dart';
import 'package:page_transition/page_transition.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  bool isPressed = false;

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
                'assets/sign.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        toolbarHeight: 130,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
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
                    _buildIconWithLabel(
                        'assets/hospital.png', 'Hospital', HospitalScreen()),
                    _buildIconWithLabel(
                        'assets/abnormal.png', 'Diseases', DiseasesScreen()),
                    _buildIconWithLabel(
                        'assets/doctor1.png', 'Doctor', DoctorScreen()),
                    _buildIconWithLabel(
                        'assets/reminder.png', 'Reminder', Reminder()),
                    _buildIconWithLabel(
                        'assets/medicine.png', 'Medicine', MedicineScreen()),
                    _buildIconWithLabel(
                        'assets/ambulance.png', 'Ambulance', AmbulanceScreen()),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SlideshowBanner(),
              SizedBox(height: 20),
              DoctorType(),
              SizedBox(height: 20),
            ],
          ),
        ),
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
