import 'package:Profile_page/models/profile.dart';

import '../models/profile.dart';

class MockProfile extends Profile {
  static final profile = Profile(
      imageUrl:
          "https://pbs.twimg.com/profile_images/1246394388277858304/SfitsPi8_400x400.jpg",
      name: "Paula Muñoz Lago",
      email: "paulamunozlago@gmail.com",
      phoneNumbers: ['+34XXXXXXXXX', '+346XXXXXXXX'],
      location: ['Madrid', 'Spain']);

  static Profile fetch() {
    return profile;
  }
}
