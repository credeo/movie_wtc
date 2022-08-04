import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

Future buildBootomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: CustomColors.of(context).bottomSheetBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.9, tileMode: TileMode.decal),
          child: SizedBox(
            height: 363,
            child: Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Smart Downloads Feature',
                      style: CustomTextStyles.of(context).semiBold18,
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/icon_close.png'),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: CustomColors.of(context).tabbarGradientStart,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'downloads_next_ep_title'.tr(),
                            style: CustomTextStyles.of(context).semiBold16,
                          ),
                          CupertinoSwitch(
                            value: true,
                            onChanged: (bool newValue) {},
                          ),
                        ],
                      ),
                      //SizedBox(height: 8),
                      SizedBox(
                        width: 269,
                        child: Text(
                          'downloads_next_ep_text'.tr(),
                          style: CustomTextStyles.of(context).regular12,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Divider(
                  height: 1,
                  color: CustomColors.of(context).tabbarGradientStart,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'downloads_for_you_title'.tr(),
                            style: CustomTextStyles.of(context).semiBold16,
                          ),
                          CupertinoSwitch(
                            value: false,
                            onChanged: (bool newValue) {},
                          ),
                        ],
                      ),
                      //SizedBox(height: 8),
                      SizedBox(
                        width: 269,
                        child: Text(
                          'downloads_for_you_text'.tr(),
                          style: CustomTextStyles.of(context).regular12,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
