import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common_button.dart';

class SubtractButton extends StatelessWidget {
  const SubtractButton({
    super.key,
    required this.onPressed,
  });

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: onPressed,
      text: AppLocalizations.of(context)!.addOrderSubButtonText,
    );
  }
}
