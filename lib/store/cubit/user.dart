import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class UserCubit extends Cubit<UserProfile?> {
  UserCubit() : super(null);

  void setUser(UserProfile user) => emit(user);
}
