import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_api_dicoding/bloc/thema/theme_event.dart';
import 'package:restaurant_api_dicoding/bloc/thema/theme_state.dart';
import 'package:restaurant_api_dicoding/bloc/thema/theme_bloc.dart';
import 'package:restaurant_api_dicoding/widgets/custom_appbar.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/setting';

  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Setting'),
      body: SingleChildScrollView(
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return SwitchListTile(
              title: const Text('Dark Mode'),
              value: state.themeMode == ThemeMode.dark,
              onChanged: (value) {
                context.read<ThemeBloc>().add(ToggleTheme());
              },
            );
          },
        ),
      ),
    );
  }
}
