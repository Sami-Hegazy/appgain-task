import 'package:appgain_task/core/utils/firebase_api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

connectivityCheck() async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.wifi)) {
    await Firebase.initializeApp();
    await FireBaseApi().initNotification();
  } else if (connectivityResult.contains(ConnectivityResult.other)) {
  } else if (connectivityResult.contains(ConnectivityResult.none)) {
    Fluttertoast.showToast(
      msg: "Please Check Your Network Connection",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
