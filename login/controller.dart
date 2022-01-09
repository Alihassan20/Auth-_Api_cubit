import 'package:dio/dio.dart';
import 'package:e_commerce_project/feature/login/state.dart';
import 'package:e_commerce_project/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/dio_helper.dart';
import '../../core/route.dart';
import '../../core/storage.dart';
import '../../widget/snack_bar.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit of(context) => BlocProvider.of(context);

  String? email;
  String? password;
  final formKey = GlobalKey<FormState>();

  Future<void>  Login() async {
    if (!formKey.currentState!.validate()) return ;
    formKey.currentState!.save();
    emit(LoginLoading());
    final body = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };
    try {
      final response = await DioHelper.post('signInWithPassword', data: body);
      if (response.statusCode == 200) {
        await AppStorage.cacheUserData(email: email!,
            apiToken: response.data['idToken'],
            uid: response.data['localId']);
        MagicRouter.navigateAndPopAll(DrawerScreen());
      } else {
        showSnackBar(
            response.data['error']['message'].toString(), isError: true);
        print(response.data['error']['message']);
        print("1");
      }
    } on DioError catch (e) {
      showSnackBar(e.message, isError: true);
      print(e);
      print("2");
    } catch (e) {
      showSnackBar(e.toString(), isError: true);
      print(e);
      print("2");
    }
    emit(LoginInit());
  }
}