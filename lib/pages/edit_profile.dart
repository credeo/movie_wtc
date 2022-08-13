import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  static const pageName = 'edit_profile';
  //static const pageNameFromProfile = 'edit_profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      appBar: const CustomAppBar(
        isProfilePage: true,
        hasBackButton: true,
        hasNotificationButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/icons/icon_profile_big.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Change Avatar',
              style: CustomTextStyles.of(context)
                  .regular12
                  .apply(color: CustomColors.of(context).primary),
            ),
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 285,
                    margin: const EdgeInsets.only(left: 22, right: 18, top: 27),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(53),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CustomColors.of(context).tabbarGradientStart,
                          CustomColors.of(context).tabbarGradientEnd,
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 6.65,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: CustomColors.of(context).primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fixedSize: const Size(151, 50),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Confirm',
                      style: CustomTextStyles.of(context).semiBold16,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 40),
                    cellTextField(
                      context,
                      'assets/icons/icon_profile_small.png',
                      'Change Name',
                    ),
                    const SizedBox(height: 11),
                    cellTextField(
                      context,
                      'assets/icons/icon_eye_crossed.png',
                      'New Password',
                    ),
                    const SizedBox(height: 11),
                    cellTextField(
                      context,
                      'assets/icons/icon_eye_crossed.png',
                      'Confirm New Password',
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget cellTextField(BuildContext context, String imagePath, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 56),
    child: TextField(
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(maxWidth: 35),
        prefixIcon: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(imagePath),
        ),
        hintText: hintText,
        hintStyle: CustomTextStyles.of(context).regular15,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: CustomColors.of(context).underlineProfile,
          ),
        ),
      ),
    ),
  );
}
