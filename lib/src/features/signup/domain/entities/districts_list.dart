import 'package:app_5las/src/features/signup/domain/entities/district.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class DistrictsList extends Equatable {
  final List<District> districts;

  DistrictsList({@required this.districts});

  @override
  // TODO: implement props
  List<Object> get props => [districts];
}
