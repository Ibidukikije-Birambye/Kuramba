import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/current_theme.dart';

import '../../widgets/cards/custom_card.dart';
import '../../widgets/labeled_divider.dart';

class ThemeSettingsView extends StatelessWidget {
  static const routeName = '/theme_settings_view';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> availableThemeColors =
        Provider.of<CurrentTheme>(
      context,
      listen: false,
    ).availableThemeColors;
    final List<Map<String, dynamic>> availableThemeModes =
        Provider.of<CurrentTheme>(
      context,
      listen: false,
    ).availableThemeModes;
    final ThemeColor currentThemeColor =
        Provider.of<CurrentTheme>(context).currentThemeColor;
    final ThemeMode currentThemeMode =
        Provider.of<CurrentTheme>(context).currentThemeMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a Theme',
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: LabeledDivider('Appearence'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: CustomCard(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      availableThemeModes[index]['name'],
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing:
                        currentThemeMode == availableThemeModes[index]['value']
                            ? Icon(Icons.check_rounded)
                            : null,
                    onTap: () => Provider.of<CurrentTheme>(
                      context,
                      listen: false,
                    ).setThemeMode(availableThemeModes[index]['value']),
                  ),
                  separatorBuilder: (context, _) => const Divider(
                    height: 0,
                  ),
                  itemCount: availableThemeModes.length,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: LabeledDivider('Theme'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: CustomCard(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      availableThemeColors[index]['name'],
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: currentThemeColor ==
                            availableThemeColors[index]['value']
                        ? Icon(Icons.check_rounded)
                        : null,
                    onTap: () => Provider.of<CurrentTheme>(
                      context,
                      listen: false,
                    ).setThemeColor(
                      availableThemeColors[index]['value'],
                    ),
                  ),
                  separatorBuilder: (context, _) => const Divider(),
                  itemCount: availableThemeColors.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
