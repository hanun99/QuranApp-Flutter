import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/UI/tabs/hijb_tab.dart';
import 'package:quranapp/UI/tabs/page_tab.dart';
import 'package:quranapp/UI/tabs/para_tab.dart';
import 'package:quranapp/UI/tabs/surah_tab.dart';
import 'package:quranapp/global.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.white,
      body: DefaultTabController(
      length: 4,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child:
      NestedScrollView(
       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

      SliverToBoxAdapter(
       child: _salam(),
    ),
      SliverAppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        pinned: true,
        shape: Border(
          bottom: BorderSide(
            width: 2,
            color: primary.withOpacity(.1),
        ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: _tab(),
        ),
       )
      ],
    body: const TabBarView(
      children: [
        SurahTab(),
        ParaTab(),
        PageTab(),
        HijbTab()
      ],
    )
    ),
    ),
    ),
    );
  }

  TabBar _tab(){
    return TabBar(tabs: [
      _tabItem(label: 'Surah'),
      _tabItem(label: 'Para'),
      _tabItem(label: 'Page'),
      _tabItem(label: 'Hijb'),
    ],
      indicator: UnderlineTabIndicator(
        borderSide:
            BorderSide(
                width: 5,
                color: primary,
            ),
        insets: const
            EdgeInsets.symmetric(horizontal: 60),
      ),
    );
  }

Tab _tabItem({required String label}) =>
      Tab(
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
      );

  Column _salam() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
      'Assalamualaikum',
      style: GoogleFonts.poppins(
        color : secondary,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    const SizedBox(
      height: 4,
    ),
    Text(
      'Hanun Hafizhoh',
      style: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      ),
    ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
    ],
    );
  }

  Stack _lastRead() {
    return Stack(children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFDF98FA),
                Color(0xFF9055FF)
              ])),

    ),
      Positioned(
        bottom: 0,
        right: 0,
        child: SvgPicture.asset('/svg/banner_quran.svg')),
    Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    SvgPicture.asset('/svg/icons/last_read.svg'),
    const SizedBox(
    width: 8,
    ),
          Text(
              'Last Read',
               style: GoogleFonts.poppins(
                 color: Colors.white,
                 fontSize: 14,
                 fontWeight: FontWeight.w600
               ),
          )
            ],
          ),
      const SizedBox(height: 20,),
      Text(
        'Al-Fatihah',
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 4,),
      Text(
        'Ayah No: 1',
        style: GoogleFonts.poppins(
            color: Colors.white
                ),
               ),
             ],
           ),
         )
       ],
    );
  }

  AppBar _appBar() => AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(
            onPressed: (() => {}),
            icon: SvgPicture.asset('/svg/menu_icon.svg')
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          'Quran App',
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: (() => {}),
            icon: SvgPicture.asset('/svg/search_icon.svg'))
            ],
        ),
  );


  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    items: [
      _bottomNavigationBarItem(icon: '/svg/icon.svg', label: 'Quran'),
      _bottomNavigationBarItem(icon: '/svg/light.svg', label: 'Lightbulb'),
      _bottomNavigationBarItem(icon: '/svg/pray.svg', label: 'Prayer'),
      _bottomNavigationBarItem(icon: '/svg/doa.svg', label: 'Doa'),
      _bottomNavigationBarItem(icon: '/svg/bookmark.svg', label: 'Bookmark'),

    ],);

  BottomNavigationBarItem _bottomNavigationBarItem({required String icon, required String label}) =>
BottomNavigationBarItem(
    icon: SvgPicture.asset(
    icon,
      color: secondary,
    ),
  activeIcon: SvgPicture.asset(
    icon,
    color: primary,
  ),
  label: label,
    );




}
