import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                      },
                      child: IntrinsicWidth(
                        child: Column(
                          children: [
                            Center(
                              child: SizedBox(
                                width: 68,
                                height: 68,
                                child: Image.asset(
                                  'assets/icons/icon_profile_medium.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'edit_profile_avatar'.tr(),
                              style:
                                  CustomTextStyles.of(context).regular12.apply(
                                        color: CustomColors.of(context).primary,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 27),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: SizedBox(
                      height: 310,
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
                              title: 'edit_confirm'.tr(),
                              onPressed: () {
                                profileProvider.setName();
                                context.pop();
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
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: 'edit_profile_name'.tr(),
                                      hintStyle: CustomTextStyles.of(context)
                                          .regular15,
                                      prefixIconConstraints:
                                          const BoxConstraints(maxWidth: 35),
                                      prefixIcon: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                            'assets/icons/icon_profile_small.png'),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: CustomColors.of(context)
                                              .inactive
                                              .withOpacity(0.5),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 34.0),
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: 'edit_profile_new_pass'.tr(),
                                      hintStyle: CustomTextStyles.of(context)
                                          .regular15,
                                      prefixIconConstraints:
                                          const BoxConstraints(maxWidth: 35),
                                      prefixIcon: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                            'assets/icons/icon_eye_crossed.png'),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: CustomColors.of(context)
                                              .inactive
                                              .withOpacity(0.5),
                                          width: 1,
                                        ),
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
                                      hintText:
                                          'edit_profile_confirm_pass'.tr(),
                                      hintStyle: CustomTextStyles.of(context)
                                          .regular15,
                                      prefixIconConstraints:
                                          const BoxConstraints(maxWidth: 35),
                                      prefixIcon: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                            'assets/icons/icon_eye_crossed.png'),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: CustomColors.of(context)
                                              .inactive
                                              .withOpacity(0.5),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
