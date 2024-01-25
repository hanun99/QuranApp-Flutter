import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/global.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center, //-> untuk alignment / rata tengah untuk teksnya | -> main untuk
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
              Text(
                'Learn Quran and Recite once everyday',
                style : GoogleFonts.poppins(
                color : secondary,
                fontSize : 18,
                ),
              ),
              Stack(
                children: [
                Container(
                  height: 450,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primary,
                  ),
                  child: SvgPicture.asset('assets/svg/splash.svg'),
                ),
                  Positioned(
                    left: 0,
                    bottom: 0,
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
                            horizontal: 50,
                            vertical: 50,
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
