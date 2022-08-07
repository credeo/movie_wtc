import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/pages/tab_container.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatelessWidget {
  static const pageName = 'detail-page';

  const DetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).secondaryBackground,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leftIcon: LeftIcon.backArrow,
        rightIcon: RightIcon.search,
        backButton: () {
          context.goNamed(TabContainer.pageName);
        },
      ),
    );
  }
}
