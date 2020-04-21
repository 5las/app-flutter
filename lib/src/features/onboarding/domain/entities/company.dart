import 'package:app_5las/src/data/models/branches_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Company extends Equatable{

  int id;
  String name;
  String logo_url;
  bool available;
  List<BranchesModel> branches;

  Company({
    @required this.id,
    @required this.name,
    @required this.logo_url,
    @required this.available,
    @required this.branches,
});

  @override
  // TODO: implement props
  List<Object> get props => [id,name,logo_url,available,branches];

}