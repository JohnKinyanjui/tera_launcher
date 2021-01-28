import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:tera_launcher/components/app_holder.dart';
import 'package:tera_launcher/settings/app_config/MyAppSettings.dart';
import 'package:tera_launcher/settings/app_config/setting_page.dart';

class SearchComponent extends StatelessWidget {
  final MyAppSettings settings;

  const SearchComponent({Key key, this.settings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppHolder(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: IconButton(
              icon: Icon(
                FluentSystemIcons.ic_fluent_search_regular,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: IconButton(
              icon: Icon(
                FluentSystemIcons.ic_fluent_store_regular,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingPage(settings: settings))),
              icon: Icon(
                FluentSystemIcons.ic_fluent_settings_regular,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
