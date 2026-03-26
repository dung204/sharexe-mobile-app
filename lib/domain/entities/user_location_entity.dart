import 'package:equatable/equatable.dart';

class UserLocationEntity extends Equatable {
  const UserLocationEntity({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  @override
  List<Object> get props => [latitude, longitude];
}
