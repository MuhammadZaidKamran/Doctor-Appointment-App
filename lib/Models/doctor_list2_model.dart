// ignore_for_file: non_constant_identifier_names


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorListModel {
  // ignore: duplicate_ignore
  // ignore: non_constant_identifier_names
  String? Name;
  String? Faculty;
  // ignore: duplicate_ignore
  // ignore: non_constant_identifier_names
  String? Rating;
  String? Date;
  String? Day;
  String? Time;
  String? Description;
  AssetImage ProfilePic;
  dynamic diseaseList;
  dynamic applicationList;

  DoctorListModel(this.ProfilePic, this.Name, this.Faculty, this.Rating, this.Date, this.Day, this.Time,this.Description,this.diseaseList,this.applicationList);

}