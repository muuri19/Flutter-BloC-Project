import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppbar(title: 'Model 1'),
      body: _buildListRestaurant(),
    );
  }

  Widget _buildListRestaurant() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
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
              return _buildCard(context, state.restaurantModel);
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
                    Text(
                      'Data not found / Connection issue',
                      style: AppTextStyles.heading2,
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, RestaurantModel model) {
    const imageUrl = 'https://restaurant-api.dicoding.dev/images/small/';
    return ListView.builder(
      itemCount: model.restaurants!.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          isThreeLine: true,
          leading: Container(
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        '$imageUrl/${model.restaurants![index].pictureId}'),
                    fit: BoxFit.cover)),
          ),
          title: Text(
            '${model.restaurants![index].name}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.accentColor2,
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
          ),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildLoading() => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ));
}
