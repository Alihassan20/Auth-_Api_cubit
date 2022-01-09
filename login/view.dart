import 'package:e_commerce_project/feature/login/cubit.dart';
import 'package:e_commerce_project/feature/login/state.dart';
import 'package:e_commerce_project/feature/sign_up/view.dart';
import 'package:e_commerce_project/navigate/navigator.dart';
import 'package:e_commerce_project/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';
import '../../core/validate.dart';
import '../../widget/custom_textform.dart';
import '../../widget/snack_bar.dart';
import '../home/view.dart';
import 'controller.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: sizeFromHeight(context, 2.10),
            color: kPrimaryColor,
            child: Stack(
              children: [
                Image.asset(
                  'Image/elip.png',
                  fit: BoxFit.fitWidth,
                  width: sizeFromWidth(context, 1),
                ),
                Center(
                    child: Image.asset(
                  'Image/circle.png',
                  width: sizeFromWidth(context, 4),
                )),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: sizeFromHeight(context, 2.5)),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Form(
                  key: cubit.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                              )),
                              Text(
                                "   LOGIN   ",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormByField(
                          key:const Key ('E_mail'),
                          inputTxt: TextInputType.emailAddress,
                          hint: "E_mail0",
                          color: Colors.black12.withOpacity(0.1),
                          validator: Validator.email,
                          onSaved: (v) => cubit.email = v!,
                        ),
                        const SizedBox(height: 20),
                        TextFormByField(
                          key:const Key ('Password0'),
                          inputTxt: TextInputType.number,
                          hint: "Password",
                          color: Colors.black12.withOpacity(0.1),
                          validator: Validator.password,
                          onSaved: (v) => cubit.password = v!,
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder(
                            bloc:cubit ,
                            builder: (context,state) =>
                            state is LoginLoading
                                ?const CupertinoActivityIndicator()
                                : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Container(
                                height: 50,
                                child: RaisedButton(
                                    color: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    elevation: 2,
                                    onPressed:cubit.Login,
                                    child: const Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                              ),
                            )


                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                            left: sizeFromWidth(context, 1.6),
                            top: 15
                          ),
                          child: GestureDetector(
                            onTap: (){},
                            child:const  Text(
                              "Forgot Password ?",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        const  SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't Have Email ?",style: TextStyle(fontWeight: FontWeight.w500),),
                            TextButton(onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> SignUp()));
                            }, child: const Text("SignUp",style: TextStyle(color: kPrimaryColor),))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
