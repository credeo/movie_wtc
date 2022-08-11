import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

class MovieSearchBottomSheet extends StatefulWidget {
  final void Function(String)? onCategoryChanged;
  final void Function(String)? onDurationChanged;
  final void Function(String)? onProductionYearChanged;

  const MovieSearchBottomSheet({
    super.key,
    this.onCategoryChanged,
    this.onDurationChanged,
    this.onProductionYearChanged,
  });

  @override
  State<MovieSearchBottomSheet> createState() => _MovieSearchBottomSheetState();
}

class _MovieSearchBottomSheetState extends State<MovieSearchBottomSheet> {
  String _category = 'Any';
  String _duration = 'Any';

  final List<DropdownMenuItem<String>> _categories = [
    const DropdownMenuItem(
      value: 'Any',
      child: Text('Any'),
    ),
    const DropdownMenuItem(
      value: 'Romance',
      child: Text('Romance'),
    ),
    const DropdownMenuItem(
      value: 'Comedy',
      child: Text('Comedy'),
    ),
    const DropdownMenuItem(
      value: 'Horror',
      child: Text('Horror'),
    ),
    const DropdownMenuItem(
      value: 'Action',
      child: Text('Action'),
    ),
    const DropdownMenuItem(
      value: 'Mystery',
      child: Text('Mystery'),
    )
  ];

  final List<DropdownMenuItem<String>> _durations = [
    const DropdownMenuItem(
      value: 'Any',
      child: Text('Any'),
    ),
    const DropdownMenuItem(
      value: '60',
      child: Text('<60min'),
    ),
    const DropdownMenuItem(
      value: '120',
      child: Text('60-120min'),
    ),
    const DropdownMenuItem(
      value: '121',
      child: Text('>120min'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                  'search_filters'.tr(),
                  style: CustomTextStyles.of(context).semiBold18,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Image.asset('assets/icons/icon_close.png'),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: CustomColors.of(context).searchDivider,
            ),
            const SizedBox(height: 13),
            getDropButtonRowString(
              context,
              'Category',
              _categories,
              onChanged: (String? newCategory) {
                setState(() {
                  _category = newCategory ?? 'Any';
                });
                widget.onCategoryChanged?.call(newCategory == 'Any' ? '' : newCategory!);
              },
            ),
            getDropButtonRowString(
              context,
              'Duration',
              _durations,
              onChanged: (String? newDuration) {
                setState(() {
                  _duration = newDuration ?? 'Any';
                });
                widget.onDurationChanged?.call(newDuration == 'Any' ? '' : newDuration!);
              },
            ),
            getDropButtonRowInt(context, 'Production year', onChanged: (year) {
              setState(() {});
              widget.onProductionYearChanged?.call(year.isEmpty ? '' : year);
            }),
          ],
        ),
      ),
    );
  }

  Widget getDropButtonRowString(
    BuildContext context,
    String title,
    List<DropdownMenuItem<String>> list, {
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: CustomColors.of(context).searchBackground),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                title.toUpperCase(),
                style: CustomTextStyles.of(context).semiBold16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  alignment: Alignment.centerRight,
                  hint: Text(
                    'Any',
                    style: CustomTextStyles.of(context).regular16.apply(
                          color: CustomColors.of(context).primary,
                        ),
                  ),
                  items: list,
                  value: title == 'Category' ? _category : _duration,
                  style: CustomTextStyles.of(context).regular16.apply(
                        color: CustomColors.of(context).primary,
                      ),
                  icon: const Text(''),
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getDropButtonRowInt(
    BuildContext context,
    String title, {
    required void Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: CustomColors.of(context).searchBackground),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                title.toUpperCase(),
                style: CustomTextStyles.of(context).semiBold16,
              ),
            ),
            SizedBox(
              width: 50,
              child: TextField(
                onChanged: onChanged,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintText: 'Any',
                  hintStyle: CustomTextStyles.of(context).regular16.apply(color: CustomColors.of(context).primary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
