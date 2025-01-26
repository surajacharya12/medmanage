import 'package:flutter/material.dart';
import 'dart:async';

class DoctorTypeScroller extends StatefulWidget {
  const DoctorTypeScroller({super.key});

  @override
  _DoctorTypeScrollerState createState() => _DoctorTypeScrollerState();
}

class _DoctorTypeScrollerState extends State<DoctorTypeScroller> {
  late ScrollController _scrollController;
  late Timer _timer;

  final List<Map<String, dynamic>> _doctorTypes = [
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
    {'name': 'Infectious Disease Specialist', 'icon': 'assets/infectious.png'},
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

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _startScrolling();
  }

  void _startScrolling() {
    const duration = Duration(milliseconds: 30);
    _timer = Timer.periodic(duration, (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScrollPosition = _scrollController.offset;

        if (currentScrollPosition >= maxScrollExtent) {
          _scrollController.jumpTo(0.0);
        } else {
          _scrollController.animateTo(
            currentScrollPosition + 2.0,
            duration: duration,
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Find Doctors by Specialist',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 70,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: (_doctorTypes.length / 3).ceil(),
            itemBuilder: (context, rowIndex) {
              final startIndex = rowIndex * 3;
              final endIndex = (startIndex + 3) < _doctorTypes.length
                  ? startIndex + 3
                  : _doctorTypes.length;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: List.generate(endIndex - startIndex, (index) {
                    final doctor = _doctorTypes[startIndex + index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (doctor['icon'] is IconData)
                              Icon(
                                doctor['icon'],
                                size: 24,
                                color: Colors.blue,
                              )
                            else if (doctor['icon'] is String)
                              Image.asset(
                                doctor['icon'],
                                width: 24,
                                height: 24,
                              ),
                            const SizedBox(height: 4),
                            Text(
                              doctor['name'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
