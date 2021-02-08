import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
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
                  "https://pbs.twimg.com/profile_images/1246394388277858304/SfitsPi8_400x400.jpg",
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
                        "Paula Muñoz Lago",
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
              mobilePhoneListTile(),
              mobilePhoneListTile(),
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

  Widget mobilePhoneListTile() {
    return ListTile(
      leading: Icon(Icons.call),
      title: Text("+34 6XXXXXXXX"),
      subtitle: Text("mobile"),
      trailing: IconButton(
        icon: Icon(Icons.message),
        onPressed: () {},
      ),
    );
  }

  Widget emailListTile() {
    return ListTile(
        leading: Icon(Icons.email),
        title: Text("paulamunozlago@gmail.com"),
        subtitle: Text("personal"));
  }

  Widget addressListTile() {
    return ListTile(
      leading: Icon(Icons.location_pin),
      title: Text("Madrid"),
      subtitle: Text("Spain"),
      trailing: IconButton(
        icon: Icon(Icons.directions),
        onPressed: () {},
      ),
    );
  }
}
