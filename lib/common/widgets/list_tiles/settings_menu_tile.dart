import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/personalization/controllers/local_controller.dart';
import '../../../utils/constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTab;

  const TSettingsMenuTile(
      {Key? key,
        required this.icon,
        required this.title,
        required this.subtitle,
        this.trailing, this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColors.primaryColor,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: trailing,
      onTap: onTab,
    );
  }
}


class LanguageChangerTile extends StatefulWidget {
  @override
  _LanguageChangerTileState createState() => _LanguageChangerTileState();
}

class _LanguageChangerTileState extends State<LanguageChangerTile> {
  String _selectedLanguage = 'en'; // Default language
  final LocaleController localeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TSettingsMenuTile(
      icon: Icons.language,
      title: 'Language',
      subtitle: 'Select your preferred language',
      trailing: DropdownButton<String>(
        value: _selectedLanguage,
        items: [
          DropdownMenuItem(value: 'en', child: Text('English')),
          DropdownMenuItem(value: 'fr', child: Text('Français')),
          DropdownMenuItem(value: 'ar', child: Text('العربية')),
        ],
        onChanged: (value) {
          setState(() {
            _selectedLanguage = value!;
            localeController.changeLocale(value);
          });
        },
      ),
      onTab: () {
        // Optional: Handle tap event if needed
      },
    );
  }
}
