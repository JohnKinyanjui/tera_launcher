import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:tera_launcher/components/app_holder.dart';

class SearchComponent extends StatelessWidget {
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: IconButton(
              icon: Icon(
                FluentSystemIcons.ic_fluent_store_regular,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: IconButton(
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
