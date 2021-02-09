//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'mocks/mock_profile.dart';
import 'my_theme.dart';

enum APP_THEME { LIGHT, DARK }

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<MyApp> {
  final Profile profile = MockProfile.fetch();
  var currentTheme = APP_THEME.LIGHT;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Profile Page',
        theme: currentTheme == APP_THEME.DARK
            ? MyAppThemes.appThemeDark()
            : MyAppThemes.appThemeLight(),
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.star_border),
                onPressed: () {
                  print("Contact starred");
                },
              )
            ],
          ),
          body: bodyBuilder(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.threesixty),
            onPressed: () {
              setState(() {
                currentTheme == APP_THEME.DARK
                    ? currentTheme = APP_THEME.LIGHT
                    : currentTheme = APP_THEME.DARK;
              });
            },
          ),
        ));
  }

  Widget bodyBuilder() {
    return ListView(
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
                child: Theme(
              data: ThemeData(iconTheme: IconThemeData(color: Colors.blue)),
              child: profileActionItems(),
            )),
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

  Widget profileActionItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildCallButton(),
        buildTextButton(),
        buildVideoButton(),
        buildEmailButton(),
        buildPayButton(),
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
