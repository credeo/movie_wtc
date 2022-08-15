import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/providers/profile_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:movie_wtc/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  static const pageName = 'edit_profile';

  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          return Scaffold(
            backgroundColor: CustomColors.of(context).background,
            appBar: const CustomAppBar(
              hasBackButton: true,
              hasNotificationButton: true,
              isProfilePage: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 10),
                  child: Center(
                    child: SizedBox(
                      width: 68,
                      height: 68,
                      child: Image.asset(
                        'assets/icons/icon_profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                  },
                  child: Text(
                    'Change Avatar',
                    style: CustomTextStyles.of(context).regular12.apply(
                          color: CustomColors.of(context).primary,
                        ),
                  ),
                ),
                const SizedBox(height: 27),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: SizedBox(
                    height: 285,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          bottom: 25.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(53),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  CustomColors.of(context)
                                      .buttonBackgroundGradientStart,
                                  CustomColors.of(context)
                                      .buttonBackgroundGradientEnd
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            title: 'Confirm',
                            onPressed: () {
                              profileProvider.setName();
                            },
                          ),
                        ),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 34.0),
                                  child: TextField(
                                    controller: profileProvider.controller,
                                    decoration: InputDecoration(
                                      hintText: 'Change Name',
                                      hintStyle: CustomTextStyles.of(context)
                                          .regular15,
                                      prefixIconConstraints:
                                          const BoxConstraints(maxWidth: 35),
                                      prefixIcon: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                            'assets/icons/icon_profile_small.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 34.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'New Password',
                                      hintStyle: CustomTextStyles.of(context)
                                          .regular15,
                                      prefixIconConstraints:
                                          const BoxConstraints(maxWidth: 35),
                                      prefixIcon: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                            'assets/icons/icon_eye_crossed.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 34.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Confirm New Password',
                                      hintStyle: CustomTextStyles.of(context)
                                          .regular15,
                                      prefixIconConstraints:
                                          const BoxConstraints(maxWidth: 35),
                                      prefixIcon: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                            'assets/icons/icon_eye_crossed.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
