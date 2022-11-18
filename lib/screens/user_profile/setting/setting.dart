import 'package:flutter/material.dart';

class SettingsOnePage extends StatelessWidget {
  static final String path = "lib/settings.dat";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
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
                color: Color(0xFAAA9090),
                child: ListTile(
                  onTap: () {
                    //open edit pofile
                  },
                  title: Text(
                    "Thinh",
                    style: TextStyle(
                      color: Color.fromARGB(251, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //    leading: CircleAvatar(backgroundColor: CachedNetworkImageProvider(avatars[0]),
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
                      color: Colors.black,
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
                      color: Colors.green,
                    ),
                    title: Text("Forgot Password"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      //open forgot password
                    },
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.location_pin, color: Colors.green),
                    title: Text("Change Address"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      //open change address
                    },
                  )
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
                activeColor: Colors.green,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text("Received Notifications"),
                onChanged: (value) {},
              ),
            ],
          )),
          Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
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
