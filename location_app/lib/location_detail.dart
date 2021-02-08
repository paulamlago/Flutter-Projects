import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationDetail extends StatelessWidget {
  final Location loc;

  LocationDetail(this.loc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(loc.name, style: Styles.navBarTitle)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(loc),
        )
      );
  }

  List<Widget> _renderBody(Location location){
    var result = List<Widget>();
    result.add(_bannerImage(location.url, 130.0));
    result.addAll(_renderFacts(location));

    return result;
  }

  List<Widget> _renderFacts(Location location) {
    var result = List<Widget>();
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }

    return result;
  }

  Widget _sectionTitle(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(text,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, color: Colors.black))
      );
  }

  Widget _sectionText(String text) {
    return Container(padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
      child: Text(text)
    );
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth));
  }
}
