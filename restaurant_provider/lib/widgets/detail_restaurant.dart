import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_provider/components/drink_list.dart';
import 'package:restaurant_provider/components/food_list.dart';
import 'package:restaurant_provider/data/enum/result_state.dart';
import 'package:restaurant_provider/data/models/restaurant.dart';
import 'package:restaurant_provider/provider/restaurant_detail_provider.dart';

class DetailRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const DetailRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return _buildLoading();
      } else if (state.state == ResultState.hasData) {
        return Scaffold(
          appBar: AppBar(
            title: Text(restaurant.name),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          restaurant.name,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icon-location.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(restaurant.city),
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icon-rating.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(restaurant.rating.toString()),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    restaurant.description,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FoodList(restaurants: state.result.restaurant),
                  DrinkList(restaurants: state.result.restaurant)
                ],
              ),
            ),
          ),
        );
      } else if (state.state == ResultState.noData) {
        return Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/no-data.png', height: 170),
                const Text(
                  'Restaurant Not Found!',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      } else if (state.state == ResultState.error) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon-no-internet.png', height: 170),
              const Text(
                'Sorry, an error occurred in the connection!',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      } else {
        return const Center(child: Text(''));
      }
    });
  }

  Widget _buildLoading() => Center(
          child: LoadingAnimationWidget.halfTriangleDot(
        color: Colors.blue,
        size: 50,
      ));
}
