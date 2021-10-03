import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunshine/constants.dart';
import 'package:sunshine/screen/dashboard/history_data2.dart';
import 'package:sunshine/screen/dashboard/map_display.dart';
import 'package:sunshine/screen/mainhomePage/mainhomePage.dart';
import 'editprofile.dart';
import 'Widgets/BottomNavItem.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsTwoPage();
  }
}

class SettingsTwoPage extends StatefulWidget {
  @override
  _SettingsTwoPageState createState() => _SettingsTwoPageState();
}

class _SettingsTwoPageState extends State<SettingsTwoPage> {
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade600,
  );

  bool _emailNotify = true;
  bool _pushNotify = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: CupertinoColors.black,
        ),
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFFF5CEB8),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        height: 56,
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              title: "Home",
              svgScr: "icons/icons/homepage.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => mainhomePage()),
                );
              },
              isActive: false,
            ),
            BottomNavItem(
              title: "Data",
              svgScr: "icons/icons/history.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryData2()),
                );
              },
              isActive: false,
            ),
            BottomNavItem(
              title: "Today",
              svgScr: "icons/icons/calendar.svg",
              press: () {},
              isActive: false,
            ),
            BottomNavItem(
              title: "Settings",
              svgScr: "icons/icons/Settings.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                );
              },
              isActive: true,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: CircularProfileAvatar(
                      "https://st.depositphotos.com/2101611/3925/v/600/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg"),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Roger Wong",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "Malaysia",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Card(
              elevation: 8,
              child: ListTile(
                title: Text(
                  "Languages",
                  style: GoogleFonts.montserrat(),
                ),
                subtitle: Text(
                  "English US",
                  style: greyTExt,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.red,
                ),
                onTap: () {},
              ),
            ),
            Card(
              elevation: 6,
              child: ListTile(
                title: Text(
                  "Profile Settings",
                  style: GoogleFonts.montserrat(),
                ),
                subtitle: Text(
                  "Roger Wong",
                  style: greyTExt,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.red,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditPage()));
                },
              ),
            ),
            Card(
              elevation: 4,
              child: SwitchListTile(
                activeColor: Color(0xFFF2BEA1),
                title: Text(
                  "Email Notifications",
                  style: GoogleFonts.montserrat(),
                ),
                subtitle: Text(
                  _emailNotify ? "On" : "Off",
                  style: greyTExt,
                ),
                value: _emailNotify,
                onChanged: (val) {
                  setState(() {
                    _emailNotify = val;
                  });
                },
              ),
            ),
            Card(
              elevation: 4,
              child: SwitchListTile(
                activeColor: Color(0xFFF2BEA1),
                title: Text(
                  "Push Notifications",
                  style: GoogleFonts.montserrat(),
                ),
                subtitle: Text(
                  _pushNotify ? "On" : "Off",
                  style: greyTExt,
                ),
                value: _pushNotify,
                onChanged: (val) {
                  setState(() {
                    _pushNotify = val;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                "Logout",
                style: GoogleFonts.montserrat(color: Colors.redAccent),
              ),
              trailing: Icon(
                Icons.login,
                color: Colors.red,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
