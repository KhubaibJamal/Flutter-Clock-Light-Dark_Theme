import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clock_flutter/Providers/theme_provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      activeColor: Colors.grey,
      activeTrackColor: Colors.white,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String textTitle;
  final VoidCallback onPress;

  CustomButton({required this.textTitle, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        textTitle,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 25,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
