import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medmanage3/screen/account.dart';
import 'package:medmanage3/widegets/profilelist.dart';

class Profilescreen extends StatefulWidget {
  final String initialUsername;
  final String initialUserEmail;

  const Profilescreen({
    super.key,
    required this.initialUsername,
    required this.initialUserEmail,
  });

  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  Uint8List? _imageData;
  late String username;
  late String userEmail;

  @override
  void initState() {
    super.initState();
    username = widget.initialUsername;
    userEmail = widget.initialUserEmail;
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: source);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      setState(() {
        _imageData = imageBytes;
      });
    }
  }

  void _showPhotoOptions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Profile Picture Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('See Profile'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: _imageData != null
                        ? Image.memory(_imageData!)
                        : Icon(Icons.person, size: 50),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Change Photo'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Choose Source'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Camera'),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.camera);
                          },
                        ),
                        ListTile(
                          title: Text('Gallery'),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.gallery);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editProfile() {
    TextEditingController usernameController =
        TextEditingController(text: username);
    TextEditingController emailController =
        TextEditingController(text: userEmail);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                // Update the state with new values
                username = usernameController.text;
                userEmail = emailController.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 8, 145),
        title: Text(
          'Account',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Navigate to the settings screen
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 22, 8, 145),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile section with image, username, and email
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _showPhotoOptions,
                        child: Container(
                          width: 50, // Size for the profile circle
                          height: 50, // Size for the profile circle
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.1),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: _imageData != null
                              ? ClipOval(
                                  child: Image.memory(
                                    _imageData!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Icon(
                                  Icons.person,
                                  size: 35, // Smaller icon size
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Space between profile and username
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  username,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  userEmail,
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        12, // Smaller font size for the email
                                    fontWeight: FontWeight.w400,
                                    color: Colors
                                        .white70, // Lighter color for email
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: _editProfile,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Reduced space before the next section
            Container(
              height: 520, // Reduced height of the container
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  SizedBox(height: 20), // Reduced spacing
                  ProfileList(
                    icon: Icons.favorite,
                    title: "My Saved",
                    color: Colors.black87,
                    onTap: () {
                      print("My Saved clicked");
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Divider(),
                  ),
                  ProfileList(
                    icon: Icons.settings,
                    title: "Profile Setting",
                    color: Colors.black87,
                    onTap: () {
                      //Navigator.push(
                      //context,
                      //MaterialPageRoute(builder: (context) => Account()),
                      //);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Divider(),
                  ),
                  ProfileList(
                    icon: Icons.content_copy,
                    title: "Appointment",
                    color: Colors.black87,
                    onTap: () {
                      print("Appointment clicked");
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Divider(),
                  ),
                  ProfileList(
                    icon: Icons.chat,
                    title: "FAQs",
                    color: Colors.black87,
                    onTap: () {
                      print("FAQs clicked");
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Divider(),
                  ),
                  ProfileList(
                    icon: Icons.payment,
                    title: "Payment Method",
                    color: Colors.black87,
                    onTap: () {
                      print("Payment Method clicked");
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Divider(),
                  ),
                  ProfileList(
                    icon: Icons.info,
                    title: "About",
                    color: Colors.black87,
                    onTap: () {
                      print("About clicked");
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Divider(),
                  ),
                  ProfileList(
                    icon: Icons.logout,
                    title: "Log out",
                    color: Colors.red,
                    onTap: () {
                      print("Log out clicked");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
