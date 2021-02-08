import 'location_fact.dart';

class Location {
  // Location's atributes:
  final String name; // final: you can't redefine it again!
  final String url;
  final List<LocationFact> facts;
  Location({this.name, this.url, this.facts});
}
