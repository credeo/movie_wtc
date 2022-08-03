import 'package:flutter/material.dart';

//cupertino button-iOS like
import 'package:flutter/cupertino.dart';

import 'package:movie_wtc/widgets/custom_app_bar.dart';

import 'package:provider/provider.dart';
import '../extensions/custom_colors.dart';
import '../extensions/custom_text_styles.dart';

import 'package:movie_wtc/providers/download_provider.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DownloadProvide(),
      child: Consumer<DownloadProvide>(
          builder: (context, downloadsProvider, child) {
        return Column(
          children: [
            SafeArea(child: CustomAppBar()),
            Row(
              children: [
                Text(
                  'Downloads',
                  style: CustomTextStyles.of(context).semiBold18,
                ),
                CupertinoButton(
                  child: Image.asset('assets/icons/icon_trash_bin.png'),
                  onPressed: () {
                    print('trash');
                  },
                ),
              ],
            ),
            Row(
              children: [
                CupertinoButton(
                    child: Image.asset('assets/icons/icon_checked_setting.png'),
                    onPressed: () {
                      print('checked');
                    }),
                Text(
                  'Smart Downloads',
                  style: CustomTextStyles.of(context).regular12,
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [],
        ),
      ],
    );
  }
}
