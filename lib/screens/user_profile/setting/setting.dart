import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/backend_SignIn_SignUp/strings.dart';
import 'package:sfuverce_app/custom-icons/custom-icons.dart';
import 'package:sfuverce_app/screens/user_profile/setting/edit_profile.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';
import 'package:sfuverce_app/screens/user_profile/user.dart';

class SettingsOnePage extends StatelessWidget {
  static final String path = "lib/settings.dat";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            iconSize: 30.0,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserScreen()));
            }),
        title: Text(
          'Setting',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                color: Color.fromARGB(255, 24, 79, 175),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => EditProfilePage()),
                    );
                  },
                  title: Text(
                    "Edit profile",
                    style: TextStyle(
                      color: Color.fromARGB(251, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // leading: CircleAvatar(backgroundColor: CachedNetworkImageProvider(avatars[0]),
                  //  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      color: Colors.indigo,
                    ),
                    title: Text("Change Password"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      //open change password
                    },
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.password,
                      color: Colors.indigo,
                    ),
                    title: Text("Forgot Password"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      //open forgot password
                    },
                  ),
                  // _buildDivider(),
                  // ListTile(
                  //   leading: Icon(Icons.location_pin, color: Colors.indigo),
                  //   title: Text("Change Address"),
                  //   trailing: Icon(Icons.keyboard_arrow_right),
                  //   onTap: () {
                  //     //open change address
                  //   },
                  // )
                ]),
              ),
              const SizedBox(height: 20.0),
              Text("Notification Settings",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo)),
              SwitchListTile(
                dense: true,
                activeColor: Colors.blue,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text("Received Notifications"),
                onChanged: (value) {},
              ),
              SwitchListTile(
                dense: true,
                activeColor: Colors.blue,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text("Received Newsletter"),
                onChanged: null,
              ),
              SwitchListTile(
                dense: true,
                activeColor: Colors.blue,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text("Received Offer Notifications"),
                onChanged: ((value) {}),
              ),
              SwitchListTile(
                dense: true,
                activeColor: Colors.blue,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text("Received App Update "),
                onChanged: null,
              ),
              const SizedBox()
            ],
          )),
          Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.logout, color: Colors.indigo),
              ))
        ],
      ),
    );
  }

  Container _buildDivider() => _buildDiverder();

  Container _buildDiverder() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    );
  }
}
