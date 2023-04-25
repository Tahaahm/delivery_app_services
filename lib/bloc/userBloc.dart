import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:perfect_app_delivery/bloc/bloc.dart';
import 'package:perfect_app_delivery/models/product.dart';

class UserBloc extends Bloc {
  final userController = StreamController<List<ProductsModel>>.broadcast();

  @override
  void dispose() {
    userController.close();
  }
}

UserBloc userBloc = UserBloc();
