import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/pages/coming_soon.dart';
import 'package:movie_wtc/pages/downloads.dart';
import 'package:movie_wtc/pages/home.dart';

class TabContainer extends StatelessWidget {
  static const pageName = 'home';

  const TabContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Home(),
            ComingSoon(),
            Downloads(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: CustomColors.of(context).primary, width: 3.0),
              insets: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 71.0),
            ),
            unselectedLabelColor: CustomColors.of(context).inactive,
            labelColor: CustomColors.of(context).primary,
            labelStyle: CustomTextStyles.of(context).regular12,
            tabs: const [
              Tab(
                iconMargin: EdgeInsets.only(bottom: 4),
                icon: ImageIcon(
                  AssetImage('assets/icons/icon_home.png'),
                ),
                text: 'Home',
              ),
              Tab(
                iconMargin: EdgeInsets.only(bottom: 4),
                icon: ImageIcon(AssetImage('assets/icons/icon_coming_soon.png')),
                text: 'Coming soon',
              ),
              Tab(
                iconMargin: EdgeInsets.only(bottom: 4),
                icon: ImageIcon(AssetImage('assets/icons/icon_downloads.png')),
                text: 'Downloads',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
