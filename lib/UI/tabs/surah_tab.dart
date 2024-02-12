import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/moel/surah.dart';


class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/data/list_surah.json');
    // print(data);// => for asyncronous present
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: _getSurahList(),
        initialData: [],
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) =>
                  _surahItem(
                      context: context, surah: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) =>
                  Divider(color: const Color(0xFFAAAAAA).withOpacity(0.35),),
              itemCount: snapshot.data!.length);
        })
    );
  }

  Widget _surahItem({required BuildContext context, required Surah surah}) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(surahNumber: surah.nomor,)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svg/nomor_vektor.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text(
                        surah.nomor.toString(),
                        style: GoogleFonts.poppins(
                            color: text,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
      );

        const SizedBox(height: 16),
        Expanded(child: Column(
          children: [
          Text(
            surah.namaLatin,
            style: GoogleFonts.poppins(
            color: text,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  surah.tempatTuru.name,
                  style: GoogleFonts.poppins(
                    color: secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                ),
                SizedBox(width: 5),
                SvgPicture.asset('/svg/Ellipse 2.svg'),
                SizedBox(width: 5),
                Text(
                  '${surah.jumlahAyat} Ayat',
                  surah.jumlahAyat.toString(),
                  style: GoogleFonts.poppins(
                    color: secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                )
              ],
            )
        ],
),
},
),

        Text(
          surah.nama,
          style: GoogleFonts.amiri(
              color: primary,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  ),
  );


  // child: Padding(
  // padding: const EdgeInsets.symmetric(vertical: 16),
  // child: Row(
  // children: [
  // Stack(
  // children: [
  // SvgPicture.asset('assets/svg/nomor_vektor.svg'),
  // Text(surah.nomor.toString())
  // ],
  // ),
  // ],
  // ),
 // )


}
