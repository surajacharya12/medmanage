import 'package:flutter/material.dart';
import 'package:medmanage3/widegets/DoctorListScreen.dart';

class DoctorType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> doctorTypes = [
      {'name': 'Allergist', 'icon': Icons.heart_broken},
      {'name': 'Anesthesiologist', 'icon': Icons.air},
      {'name': 'Cardiologist', 'icon': Icons.favorite},
      {'name': 'Cardiothoracic Surgeon', 'icon': Icons.accessibility_new},
      {'name': 'Dentist', 'icon': 'assets/dentist.png'},
      {'name': 'Dermatologist', 'icon': Icons.face},
      {'name': 'Endocrinologist', 'icon': Icons.blind},
      {'name': 'Emergency Medicine Physician', 'icon': Icons.flash_on},
      {'name': 'Family Medicine Physician', 'icon': Icons.family_restroom},
      {'name': 'Gastroenterologist', 'icon': Icons.fastfood},
      {'name': 'General Practitioner', 'icon': Icons.person},
      {'name': 'General Surgeon', 'icon': 'assets/doctor.png'},
      {'name': 'Geriatrician', 'icon': Icons.accessible},
      {'name': 'Hematologist', 'icon': Icons.local_hospital},
      {'name': 'Immunologist', 'icon': Icons.health_and_safety},
      {
        'name': 'Infectious Disease Specialist',
        'icon': 'assets/infectious.png'
      },
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Find Doctors by Specialty',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorListScreen(),
                  ),
                );
              },
              child: Text(
                'See More',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 100, // Set a height for the horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8, // Show only the first 8 items
            itemBuilder: (context, index) {
              final iconData = doctorTypes[index]['icon'];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconData is IconData)
                      Icon(
                        iconData,
                        size: 30,
                        color: Colors.blue,
                      )
                    else if (iconData is String)
                      Image.asset(
                        iconData,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    SizedBox(height: 5),
                    Text(
                      doctorTypes[index]['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
