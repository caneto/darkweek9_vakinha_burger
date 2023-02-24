import 'package:delivery_app/app/core/helpers/enviroment/enviroments.dart';
import 'package:flutter/material.dart';
import 'app/dw9_delivery_app.dart';

Future<void> main() async {
  await Environments.loadEnvs();

  runApp( const Dw9DeliveryApp() );
}