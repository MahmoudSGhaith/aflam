import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';

import '../../../manger/movie_cubit/movies_details_cubit.dart';
import '../../../manger/movie_states/movie_states.dart';
import '../../../manger/movie_states/movies_details_states.dart';
import '../widget/cast_information.dart';
import '../widget/genres_details.dart';
import '../widget/rate.dart';
import '../widget/title.dart';

class MoviesDetails extends StatelessWidget {
  final int movieId;
  const MoviesDetails({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(
        RepositoryProvider.of(context),
      )..getMovieDetails(movieId),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                AssetsManger.save,
                height: 35.h,
              ),
            ),
            SizedBox(width: 15.w),
          ],
        ),
        body: BlocBuilder<MovieDetailsCubit, MovieStates>(
          builder: (context, state) {
            if (state is MovieLoadingState) {
              return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
            } else if (state is MovieDetailsWithCastState) {
              final movie = state.movieDetails;
              final castList = state.castList;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Poster + Play Button
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          movie.largeCoverImage ?? '',
                          width: double.infinity,
                          height: 250.h,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              Container(color: Colors.grey, height: 250.h),
                        ),
                        Image.asset(
                          'assets/play.png',
                          width: 100.w,
                          height: 100.h,
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    // Title & Year
                    Text(
                      movie.titleLong ?? '',
                      style: AppStyles.white20medium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      movie.year?.toString() ?? '',
                      style: AppStyles.white20bold.copyWith(
                        color: ColorsManger.white60,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 10.h),

                    // Watch Button
                    CustomCupertinoButton(
                      backgroundColor: ColorsManger.red,
                      borderColor: ColorsManger.red,
                      onPress: () {
                        // تشغيل الفيلم
                      },
                      text: "Watch",
                    ),

                    SizedBox(height: 10.h),

                    // Rating + Runtime
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Rate(
                          left: 0,
                          right: 10.w,
                          top: 10.w,
                          bottom: 0,
                          imagePath: 'assets/star.png',
                          rate: movie.rating?.toString() ?? "N/A",
                          backgroundColor: ColorsManger.grey.withAlpha(170),
                        ),
                        Rate(
                          left: 0,
                          right: 10.w,
                          top: 10.w,
                          bottom: 0,
                          imagePath: 'assets/clock.png',
                          rate: "${movie.runtime ?? 'N/A'} min",
                          backgroundColor: ColorsManger.grey.withAlpha(170),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    // Summary
                    const MoviesDetailsTitle(title: "Summary"),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Text(
                        movie.descriptionFull ?? "No description",
                        style: AppStyles.white16bold,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Genres
                    const MoviesDetailsTitle(title: "Genres"),
                    SizedBox(height: 10.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: movie.genres
                            ?.map((genre) => GenresDetails(text: genre))
                            .toList() ??
                            [],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Cast
                    const MoviesDetailsTitle(title: "Cast"),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: castList
                            .map(
                              (cast) => CastInformation(
                            imagePath: cast.imagePath ?? '',
                            actressName: cast.actressName ?? 'Unknown',
                            characterDetails: cast.characterName ?? 'Unknown',
                          ),
                        )
                            .toList(),
                      ),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              );
            } else if (state is MovieErrorState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
