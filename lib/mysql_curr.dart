import 'dart:async';
import 'package:mysql1/mysql1.dart';
import 'dart:io';
import 'dart:convert';

List dataCurr = [];
// var data;
sqlCurr() async {

  // dataCurr = [];
  var s = ConnectionSettings(
    user: "admin",
    password: "adminadmin",
    host: "database-2.clx9hdjaqqiv.us-east-1.rds.amazonaws.com",
    port: 3306,
    db: "image_recognition",

  );

  // create a connection
  print("Opening connection ...");
  var conn = await MySqlConnection.connect(s);
  print("Opened connection!");

  var results = await conn.query('select * from things_now;');

  print(results.toList()[0]);

  for (var row in results.toList()){
    try{
      var tmp = [row['name'],row['probability'],row['box_points'].toString().substring(1,row['box_points'].toString().length - 1).split(','),row['num_stamp'],row['time_stamp']];
      dataCurr.add(tmp);
      print(tmp);
    } catch (e){
      print('error $e');
    }
  }
  print(dataCurr.length);
  // dataCurr.removeAt(0);
  conn.close();

}