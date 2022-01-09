import 'package:e_commerce_project/feature/login/view.dart';
import 'package:e_commerce_project/feature/sign_up/cubit.dart';
import 'package:e_commerce_project/feature/sign_up/state.dart';
import 'package:e_commerce_project/navigate/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';
import '../../core/validate.dart';
import '../../widget/custom_textform.dart';
import '../../widget/snack_bar.dart';
import '../home/view.dart';
import '../otp/view.dart';
import 'controller.dart';

class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: sizeFromHeight(context, 3.2),
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
                      height: sizeFromHeight(context, 6),
                )),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: sizeFromHeight(context, 4.7)),
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
                        vertical: 2, horizontal: 13),
                    child: ListView(
                      children: [
                        const SizedBox(height: 13),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                              )),
                              Text(
                                "   SIGN UP   ",
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
                        const SizedBox(height: 13),
                        TextFormByField(
                          inputTxt: TextInputType.text,
                          hint: "User Name",
                          color: Colors.black12.withOpacity(0.1),
                          validator: Validator.name,
                          onSaved: (v) => cubit.userName = v!,
                        ),
                        const SizedBox(height: 13),
                        TextFormByField(
                          inputTxt: TextInputType.emailAddress,
                          hint: "E-Mail",
                          color: Colors.black12.withOpacity(0.1),
                          validator: Validator.email,
                          onSaved: (v) => cubit.email = v!,
                        ),
                        const SizedBox(height: 13),
                        TextFormByField(
                          inputTxt: TextInputType.number,
                          hint: "Enter Mobile",
                          color: Colors.black12.withOpacity(0.1),
                          validator: Validator.number,
                          onSaved: (v) => cubit.mobile = v!,
                        ),
                        const SizedBox(height: 13),
                        TextFormByField(
                          inputTxt: TextInputType.number,
                          hint: "Password",
                          color: Colors.black12.withOpacity(0.1),
                          validator: Validator.password,
                          onSaved: (v) => cubit.password = v!,
                        ),
                        const SizedBox(height: 13),
                        TextFormByField(
                          inputTxt: TextInputType.number,
                          hint: "Confirm Password",
                          color: Colors.black12.withOpacity(0.1),
                          validator: Validator.confirmPassword,
                          onSaved: (v) => cubit.password = v!,
                        ),
                        const SizedBox(height: 13),

                        BlocBuilder(
                          bloc:cubit ,
                          builder: (context,state) =>
                            state is SignUpLoading
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
                                    onPressed:cubit.signUp,
                                    child: const Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                              ),
                            )


                        ),
                        const  SizedBox(height: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Do You Have Email ?",style: TextStyle(fontWeight: FontWeight.w500),),
                            TextButton(onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Login()));

                            }, child: const Text("LOGIN",style: TextStyle(color: kPrimaryColor),))
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
