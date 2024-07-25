import 'package:flutter/material.dart';
import 'package:restaurant_api_dicoding/common/app_color.dart';
import 'package:restaurant_api_dicoding/common/app_text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

const CustomAppbar({ super.key, required this.title });

  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text(title, style: AppTextStyles.heading1
                .copyWith(color: AppColors.onPrimaryColor)),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.primaryColor,
    );
  }
  
  @override
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}