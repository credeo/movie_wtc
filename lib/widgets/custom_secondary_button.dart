import 'package:flutter/cupertino.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

class CustomSecondaryButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onPressed;

  const CustomSecondaryButton({
    super.key,
    required this.title,
    required this.iconPath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoButton(
        onPressed: onPressed,
        child: Column(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: CustomTextStyles.of(context).regular12,
              /*  maxLines: 1,
              overflow: TextOverflow.ellipsis,
              >1 line
               */
            ),
          ],
        ),
      ),
    );
  }
}
