import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Messageallwidget extends StatelessWidget {
  final String Maintext;
  final String subtext;
  final String image;
  final String time;
  final String message_count;

  const Messageallwidget({
    required this.Maintext,
    required this.subtext,
    required this.image,
    required this.message_count,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: height * 0.1,
            width: width * 0.8,
            color: Colors.white,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: height * 0.09,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(image),
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 4,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          Maintext,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          subtext,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Text(time),
                        const SizedBox(height: 10),
                        Container(
                          height: 14,
                          width: 14,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 2, 134, 117),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              message_count,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
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
    );
  }
}
