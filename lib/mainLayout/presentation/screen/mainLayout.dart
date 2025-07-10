import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/mainLayout/presentation/screen/profile_screen/profile_screen.dart';
import 'package:movies/mainLayout/presentation/screen/search_screen/search_screen.dart';
import 'package:movies/mainLayout/presentation/screen/explore_screen/explore_screen.dart';
import 'package:movies/mainLayout/presentation/screen/home_screen/home_screen.dart';
import '../../../core/colors_manger.dart';
import '../../../core/di/di.dart';
import '../manger/movie_cubit/movies_cubit.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  List<Widget> get tabs => [
    BlocProvider(
      create: (context) => getIt<MoviesCubit>()..getAllMovies(),
      child: const HomeScreen(),
    ),
    const SearchScreen(),
    const ExploreScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManger.black,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: buildBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            selectedIndex == 0
                ? AssetsManger.selectedHome
                : AssetsManger.unSelectedHome,
            width: 24,
            height: 24,
          ),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            selectedIndex == 1
                ? AssetsManger.selectedSearch
                : AssetsManger.unSelectedSearch,
            width: 24,
            height: 24,
          ),
          label: AppLocalizations.of(context)!.search,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            selectedIndex == 2
                ? AssetsManger.selectedExplore
                : AssetsManger.unSelectedExplore,
            width: 24,
            height: 24,
          ),
          label: AppLocalizations.of(context)!.explore,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            selectedIndex == 3
                ? AssetsManger.selectedProfile
                : AssetsManger.unSelectedProfile,
            width: 24,
            height: 24,
          ),
          label: AppLocalizations.of(context)!.profile,
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
