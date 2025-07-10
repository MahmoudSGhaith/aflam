import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/mainLayout/presentation/screen/home_screen/widget/more_films.dart';
import 'package:movies/mainLayout/presentation/screen/home_screen/widget/rate.dart';
import '../../../../core/assets_manger.dart';
import '../../../../core/common_widgets/CustomCarouselSlider/CustomCarouselSlider.dart';
import '../../manger/movie_cubit/movies_cubit.dart';
import '../../manger/movie_states/movie_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              image: AssetImage(AssetsManger.onBoarding6),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(image: AssetImage(AssetsManger.availableNow)),
                  SizedBox(
                    height: 400.h,
                    child: BlocBuilder<MoviesCubit, MovieStates>(
                      builder: (context, state) {
                        if (state is MovieLoadingState) {
                          return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
                        } else if (state is MovieErrorState) {
                          return Center(child: Text(state.errorMessage));
                        } else if (state is MovieSuccessState) {
                          final movies = state.movieModel.data?.movies ?? [];

                          return CarouselSlider(
                            items: movies.take(8).map((movie) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.moviesDetails,
                                    arguments: movie.id,
                                  );
                                },
                                child: Stack(
                                  children: [
                                    CustomCarouselSlider(
                                      imagePath: movie.largeCoverImage ?? '',
                                    ),
                                    Rate(
                                      left: 5.w,
                                      right: 50.w,
                                      top: 10.w,
                                      bottom: 0,
                                      imagePath: AssetsManger.star,
                                      rate: movie.rating.toString(),
                                      backgroundColor: ColorsManger.grey.withAlpha(170),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 400.h,
                              enlargeCenterPage: true,
                              viewportFraction: 0.55,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                  Image(
                    image: const AssetImage(AssetsManger.watchNow),
                    width: 400.w,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.h),
                    alignment: Alignment.centerLeft,
                    child: Text("Action", style: AppStyles.white20medium),
                  ),
                  SizedBox(height: 5.h),

                  BlocBuilder<MoviesCubit, MovieStates>(
                    builder: (context, state) {
                      if (state is MovieLoadingState) {
                        return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
                      } else if (state is MovieErrorState) {
                        return Center(child: Text(state.errorMessage));
                      } else if (state is MovieSuccessState) {
                        final movies = state.movieModel.data?.movies ?? [];

                        final actionMovies = movies.where((movie) {
                          return movie.genres?.contains("Action") ?? false;
                        }).toList();

                        print("Action count: ${actionMovies.length}");

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.h),
                          child: SizedBox(
                            height: 270.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: actionMovies.length,
                              separatorBuilder: (context, index) => SizedBox(width: 10.w),
                              itemBuilder: (context, index) {
                                return MoreFilms(
                                  imagePath: actionMovies[index].mediumCoverImage ?? '',
                                  rating: actionMovies[index].rating?.toString() ?? '0',
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),

                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
