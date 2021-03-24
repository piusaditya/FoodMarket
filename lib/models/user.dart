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

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

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
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facetofeet.com%2Fk-wave%2F13779%2Fsetelah-blackpink-dua-lipa-akan-kolaborasi-dengan-member-mamamoo-ini&psig=AOvVaw2WTLfJwumpxdVZzmM6lZTh&ust=1616577069046000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMC00oWJxu8CFQAAAAAdAAAAABAD');
