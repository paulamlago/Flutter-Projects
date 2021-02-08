//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'mocks/mock_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Profile p = MockProfile.fetch();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(p),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Profile profile;

  ProfilePage(this.profile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            color: Colors.black,
            onPressed: () {
              print("Contact starred");
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  profile.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        profile.name,
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildCallButton(),
                    buildTextButton(),
                    buildVideoButton(),
                    buildEmailButton(),
                    buildPayButton(),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              mobilePhoneListTile(0),
              mobilePhoneListTile(1),
              emailListTile(),
              addressListTile()
            ],
          )
        ],
      ),
    );
  }

  Widget buildCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.call),
          onPressed: () {},
        ),
        Text("Call"),
      ],
    );
  }

  Widget buildTextButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.message),
          onPressed: () {},
        ),
        Text("Text"),
      ],
    );
  }

  Widget buildVideoButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.video_call),
          onPressed: () {},
        ),
        Text("Video"),
      ],
    );
  }

  Widget buildEmailButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.email),
          onPressed: () {},
        ),
        Text("Email"),
      ],
    );
  }

  Widget buildPayButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.payment),
          onPressed: () {},
        ),
        Text("Pay"),
      ],
    );
  }

  Widget mobilePhoneListTile(int index) {
    return ListTile(
      leading: Icon(Icons.call),
      title: Text(profile.phoneNumbers[index]),
      subtitle: Text("mobile"),
      trailing: IconButton(
        icon: Icon(Icons.message),
        onPressed: () {
          print(profile.phoneNumbers);
        },
      ),
    );
  }

  Widget emailListTile() {
    return ListTile(
        leading: Icon(Icons.email),
        title: Text(profile.email),
        subtitle: Text("personal"));
  }

  Widget addressListTile() {
    return ListTile(
      leading: Icon(Icons.location_pin),
      title: Text(profile.location[0]),
      subtitle: Text(profile.location[1]),
      trailing: IconButton(
        icon: Icon(Icons.directions),
        onPressed: () {
          print(profile.location);
        },
      ),
    );
  }
}
