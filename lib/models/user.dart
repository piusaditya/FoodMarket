part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String token;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      address: data['address'],
      houseNumber: data['houseNumber'],
      phoneNumber: data['phoneNumber'],
      city: data['city'],
      picturePath: data['profile_photo_url']);

  User copyWith({
    int id,
    String name,
    String email,
    String address,
    String hosuseNumber,
    String phoneNumber,
    String city,
    String picturePath,
  }) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          address: address ?? this.address,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          city: city ?? this.city,
          picturePath: picturePath ?? this.picturePath);

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
    id: 1,
    name: 'Gemblung',
    address: 'Gatak',
    city: 'Bantul',
    houseNumber: '358',
    phoneNumber: '085614045',
    email: 'gemblung@banget.com',
    picturePath:
        //'https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg');
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dua-lipa-attends-varietys-2nd-annual-hitmakers-brunch-at-news-photo-1604677508.?crop=1xw:0.87967xh;center,top&resize=640:*');
