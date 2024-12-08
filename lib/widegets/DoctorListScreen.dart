import 'package:flutter/material.dart';

class DoctorListScreen extends StatefulWidget {
  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  List<Map<String, dynamic>> doctorTypes = [
    {'name': 'Allergist', 'icon': Icons.heart_broken},
    {'name': 'Anesthesiologist', 'icon': Icons.air},
    {'name': 'Cardiologist', 'icon': Icons.favorite},
    {'name': 'Cardiothoracic Surgeon', 'icon': Icons.accessibility_new},
    {'name': 'Dentist', 'icon': 'assets/dentist.png'},
    {'name': 'Dermatologist', 'icon': Icons.face},
    {'name': 'Endocrinologist', 'icon': Icons.blind},
    {'name': 'Emergency', 'icon': Icons.flash_on},
    {'name': 'Family Medicine', 'icon': Icons.family_restroom},
    {'name': 'Gastroenterologist', 'icon': Icons.fastfood},
    {'name': 'General Practitioner', 'icon': Icons.person},
    {'name': 'General Surgeon', 'icon': 'assets/doctor.png'},
    {'name': 'Geriatrician', 'icon': Icons.accessible},
    {'name': 'Hematologist', 'icon': Icons.local_hospital},
    {'name': 'Immunologist', 'icon': Icons.health_and_safety},
    {'name': 'Infectious', 'icon': 'assets/infectious.png'},
    {'name': 'Internist', 'icon': Icons.person},
    {'name': 'Neonatologist', 'icon': Icons.nature_people},
    {'name': 'Neurologist', 'icon': Icons.headset_mic},
    {'name': 'Neurosurgeon', 'icon': 'assets/health.png'},
    {'name': 'OB/GYN', 'icon': Icons.favorite_border},
    {'name': 'Oncologist', 'icon': Icons.local_pharmacy},
    {'name': 'Ophthalmologist', 'icon': Icons.remove_red_eye},
    {'name': 'Orthopedic Surgeon', 'icon': Icons.accessibility_new},
    {'name': 'Otolaryngologist (ENT)', 'icon': Icons.hearing},
    {'name': 'Pathologist', 'icon': Icons.book},
    {'name': 'Pediatrician', 'icon': Icons.child_friendly},
    {'name': 'Physiatrist', 'icon': Icons.accessible_forward},
    {'name': 'Plastic Surgeon', 'icon': Icons.build},
    {'name': 'Podiatrist', 'icon': 'assets/podiatrist.png'},
    {'name': 'Psychiatrist', 'icon': Icons.psychology},
    {'name': 'Pulmonologist', 'icon': Icons.air},
    {'name': 'Radiologist', 'icon': Icons.camera},
    {'name': 'Rheumatologist', 'icon': Icons.health_and_safety},
    {'name': 'Surgeon', 'icon': 'assets/surgeon.png'},
    {'name': 'Thoracic Surgeon', 'icon': Icons.accessibility_new},
    {'name': 'Urologist', 'icon': Icons.umbrella},
    {'name': 'Vascular Surgeon', 'icon': Icons.local_hospital},
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredDoctorTypes = doctorTypes
        .where((doctor) =>
            doctor['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Doctor Types'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  query = text;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search doctor types...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: filteredDoctorTypes.length,
              itemBuilder: (context, index) {
                final iconData = filteredDoctorTypes[index]['icon'];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconData is IconData)
                      Icon(
                        iconData,
                        size: 50,
                        color: Colors.blue,
                      )
                    else if (iconData is String)
                      Image.asset(
                        iconData,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    SizedBox(height: 5),
                    Text(
                      filteredDoctorTypes[index]['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
