import 'package:flutter/material.dart';
class TaskModel {
  String id;
  String title;
  String descreiption;
  int date;
  String userId;
  bool status;

TaskModel({ this.id='',
  required this.title,
  required this.descreiption,
  required this.date,
  required this.userId,
  required this.status});
  TaskModel.fromJson(Map<String,dynamic>json)
      :this(
    id: json['id'],
    title: json['title'],
    descreiption: json['descreiption'],
    date: json['date'],
    userId: json['userId'],
    status: json['status'],
  );
    Map<String,dynamic> toJson(){
    return{
      "id":id,
      "title":title,
      "descreiption":descreiption,
      "date":date,
      "userId":userId,
      "status":status,
    };
    }
}