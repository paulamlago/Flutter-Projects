import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';
import 'location_detail.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Locations', style: Styles.navBarTitle)),
      body: ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: _listViewItemBuilder, // itemBuilder is a callback, it expects a function definition
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var location = this.locations[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: () => _navigationToLocationDetail(context, location),
    );
  }

  void _navigationToLocationDetail(BuildContext context, Location location) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => //Single expression sintax
              LocationDetail(location),
        ));
  }

  Widget _itemThumbnail(Location location) {
    return Container(
        constraints: BoxConstraints.tightFor(width: 100),
        child: Image.network(location.url, fit: BoxFit.fitWidth));
  }

  Widget _itemTitle(Location location) {
    return Text('-> ${location.name}', style: Styles.headerLarge);
  }
}
