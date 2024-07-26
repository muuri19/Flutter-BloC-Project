import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:restaurant_api_dicoding/bloc/restaurant/restaurant_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_api_dicoding/models/restaurant.dart';
import 'package:restaurant_api_dicoding/widgets/custom_appbar.dart';
import '../common/app_color.dart';
import '../common/app_text_style.dart';

class RestaurantListPage extends StatefulWidget {
  static const routeName = '/model1';

  const RestaurantListPage({super.key});

  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  final RestaurantBloc _restaurantBloc = RestaurantBloc();

  @override
  void initState() {
    _restaurantBloc.add(GetListRestaurant());
    super.initState();
  }

  Future<void> _refreshRestaurants() async {
    _restaurantBloc.add(GetListRestaurant());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppbar(title: 'Model 1'),
      body: _buildListRestaurant(),
    );
  }

  Widget _buildListRestaurant() {
    return BlocProvider(
      create: (context) => _restaurantBloc,
      child: BlocListener<RestaurantBloc, RestaurantState>(
        listener: (context, state) {
          if (state is RestaurantError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                backgroundColor: Theme.of(context).primaryColor,
                content: Text(
                  'Please Check Your Connection!',
                  style: AppTextStyles.caption.copyWith(color: Colors.white),
                ),
                behavior: SnackBarBehavior.floating,
                elevation: 30,
              ),
            );
          }
        },
        child: BlocBuilder<RestaurantBloc, RestaurantState>(
            builder: (context, state) {
          if (state is RestaurantInitial) {
            return _buildLoading();
          } else if (state is RestaurantLoading) {
            return _buildLoading();
          } else if (state is RestaurantLoaded) {
            return RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: Colors.white,
              onRefresh: _refreshRestaurants,
              child: _buildCard(context, state.restaurantModel),
            );
          } else if (state is RestaurantError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/no-internet.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Data not found / Connection issue',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  Widget _buildCard(BuildContext context, RestaurantModel model) {
    const imageUrl = 'https://restaurant-api.dicoding.dev/images/small/';
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: AppColors.primaryColor,
      child: ListView.builder(
        itemCount: model.restaurants!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xff021526)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
                child: Row(children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(
                              '$imageUrl/${model.restaurants![index].pictureId}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.restaurants![index].name}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.secondaryColor,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${model.restaurants![index].city}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.accentColor1,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                model.restaurants![index].rating.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ])),
          );
        },
      ),
    );
  }

  Widget _buildLoading() => Center(
          child: LoadingAnimationWidget.halfTriangleDot(
        color: AppColors.primaryColor,
        size: 50,
      ));
}
