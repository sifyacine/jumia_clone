import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  String _selectedLanguage = 'English'; // Default language

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  _updateLanguage('English');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('French'),
                onTap: () {
                  _updateLanguage('French');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Arabic'),
                onTap: () {
                  _updateLanguage('Arabic');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  void _showAppVersionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('The app version is ${_packageInfo.version}'),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text("Help"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: isDark ? TColors.dark : TColors.light,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat, size: 20.0, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text("Contact us directly", style: TextStyle(fontSize: 16.0, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
                TSectionHeading(title: 'About Us', textColor: Colors.grey),
                SizedBox(height: 8.0),
                _buildSectionContainer(
                  children: [
                    TSettingsMenuTile(
                      title: 'HTA Services',
                      onTab: () { Get.to(() => Container()); },
                    ),
                    TSettingsMenuTile(
                      title: 'terms and conditions',
                      onTab: () { Get.to(() => Container()); },
                    ),
                    TSettingsMenuTile(
                      title: 'Helping Center',
                      onTab: () { Get.to(() => Container()); },
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                TSectionHeading(title: 'Settings', textColor: Colors.grey),
                SizedBox(height: 8.0),
                _buildSectionContainer(
                  children: [
                    TSettingsMenuTile(
                      title: 'Notifications',
                      onTab: () { Get.to(() => Container()); },
                    ),
                    TSettingsMenuTile(
                      title: 'Language',
                      subtitle: _selectedLanguage,
                      onTab: () { _showLanguageBottomSheet(); },
                    ),
                    TSettingsMenuTile(
                      title: 'App version: ${_packageInfo.version}',
                      onTab: () { _showAppVersionSnackBar(); },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Container(
      color: isDark ? Colors.black : Colors.white,
      child: Column(
        children: children,
      ),
    );
  }
}
