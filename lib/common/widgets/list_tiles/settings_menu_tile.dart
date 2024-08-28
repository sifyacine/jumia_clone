import 'package:flutter/material.dart';
import '../../../utils/helpers/helper_functions.dart';

class TSettingsMenuTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subtitle; // Subtitle is nullable
  final Widget? trailing;
  final VoidCallback? onTab;

  const TSettingsMenuTile({
    Key? key,
    this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return ListTile(
      leading: icon != null
          ? Icon(
        icon!,
        size: 24,
        color: isDark? Colors.white :Colors.black,
      )
          : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle!,
        style: Theme.of(context).textTheme.bodySmall,
      )
          : null, // Conditionally display subtitle
      trailing: trailing,
      onTap: onTab,
    );
  }
}
