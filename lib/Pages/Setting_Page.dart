import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TextStyle headerStyle = TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(blurRadius: 10, color: Colors.black45, offset: Offset(2,1))],
    );

    TextStyle namePhoneStyle = TextStyle(
      color: Colors.white,
      fontSize: 22,
      shadows: [Shadow(blurRadius: 10, color: Colors.black45, offset: Offset(2, 1))],
    );

    TextStyle optionStyle = TextStyle(
      color: Colors.grey,
      fontSize: 20,
    );


    Color switchColor = Color(0xFF71CDD7);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4BD8BB),
              Color(0xFF71CDD7),
              Color(0xFF5DAFCA)],
            stops: [0.1, 0.5, 0.7],          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Settings', style: headerStyle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: namePhoneStyle),
                  SizedBox(height: 8),
                  Text('Phone number', style: namePhoneStyle),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text('Edit account'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.grey[800],
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 32),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  children: [
                    settingOption(context, 'Notifications', Icons.notifications, optionStyle),
                    settingOption(context, 'Location', Icons.location_on, optionStyle),
                    settingOption(context, 'Ratings', Icons.star, optionStyle),
                    settingOption(context, 'Log out', Icons.exit_to_app, optionStyle),
                    Divider(),
                    settingSwitchOption(
                        context,
                        'Language',
                        Icons.language, // Language icon
                        switchColor,
                        optionStyle
                    ),
                    settingOption(context, 'About us', Icons.info_outline, optionStyle),
                    settingSwitchOption(
                        context,
                        'App mode',
                        Icons.brightness_4, // App mode icon
                        switchColor,
                        optionStyle
                    ),                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingOption(BuildContext context, String title, IconData icon, TextStyle style) {
    return ListTile(
      title: Text(title, style: style),
      leading: Icon(icon, color: Color(0xFF71CDD7)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {
      },
    );
  }

  Widget settingSwitchOption(BuildContext context, String title, IconData icon, Color switchColor,  TextStyle style) {
    return SwitchListTile(
      title: Text(title, style: style),
      value: true,
      onChanged: (newValue) {
      },
      activeColor: switchColor,
      secondary: Icon(icon, color: Color(0xFF71CDD7)),
    );
  }
}
