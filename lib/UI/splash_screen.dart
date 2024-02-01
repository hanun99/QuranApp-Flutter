import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/global.dart';
import 'package:quranapp/UI/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16), //-> EdgeInsets.symmetric -> for padding top and bottom
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //-> untuk alignment / rata tengah untuk teksnya | -> main untuk
            crossAxisAlignment: CrossAxisAlignment.center,// cross untuk antar element
            children: [
              Text(
                'Quran App',
                style: GoogleFonts.poppins(
                  color : primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Learn Quran and Recite once everyday',
                style : GoogleFonts.poppins(
                color : secondary,
                fontSize : 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primary,
                  ),
                  child:
                  SvgPicture.asset('svg/splash.svg'),
                ),
                  Positioned(
                    left: 0,
                    bottom: -30,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: button,
                          ),
                          child: Text(
                            'Get started',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
               ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
