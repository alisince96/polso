import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';
import 'package:polso/CommonWidgets/CustomTextField.dart';
import 'package:polso/CommonWidgets/RoundButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:polso/screens/signup/cubit/signup_cubit.dart';

class Login extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SignupCubit? signupCubit;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? selectedCode;
  List<String> codeList = ['+27', '+92', '+266'];
  bool showPass = true;
  String? verificationId;
  @override
  void initState() {
    signupCubit = BlocProvider.of<SignupCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
        } else if (state is OtpSent) {
          verificationId = state.verificationId ?? '';
          debugPrint('Veri Id:${verificationId.toString()}');
        } else if (state is OtpError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is SignupError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading,
          child: Scaffold(
            body: Container(
              height: deviceHeight(context),
              decoration: const BoxDecoration(color: AppConsts.white),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceHeight(context) * 0.12,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: deviceHeight(context) * 0.3,
                        width: deviceWidth(context) * 0.9,
                      ),
                    ),
                    // const AutoSizeText(
                    //   'polso polso',
                    //   style: AppConsts.blackBold,
                    //   presetFontSizes: [40],
                    // ),
                    // const AutoSizeText.rich(
                    //   TextSpan(
                    //       text: 'Stokvel',
                    //       style: AppConsts.blackNormal15,
                    //       children: [
                    //         TextSpan(
                    //           text: ' saving ',
                    //           style: AppConsts.greenNormal15,
                    //         ),
                    //         TextSpan(
                    //           text: 'solution',
                    //           style: AppConsts.blackNormal15,
                    //         )
                    //       ]),
                    //   presetFontSizes: [20],
                    // ),
                    SizedBox(
                      height: deviceHeight(context) * 0.05,
                    ),
                    const AutoSizeText(
                      'Gload to see you!',
                      style: AppConsts.greyishNormal,
                      textAlign: TextAlign.center,
                      presetFontSizes: [16],
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.02,
                    ),
                    const AutoSizeText(
                      'Sign in to your account to continue',
                      style: AppConsts.greyishNormal,
                      textAlign: TextAlign.center,
                      presetFontSizes: [13],
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.07,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.05),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'Phone Number',
                          style: AppConsts.greyNormal15,
                          presetFontSizes: [16],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.04),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: deviceHeight(context) * 0.02),
                            child: SizedBox(
                              height: 55,
                              width: deviceWidth(context) * 0.2,
                              child: Card(
                                  elevation: 0.0,
                                  color: AppConsts.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: AppConsts.greyish
                                              .withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      iconDisabledColor: AppConsts.greyish,
                                      iconEnabledColor: AppConsts.black,
                                      dropdownColor: Colors.white,
                                      iconSize: 30.0,
                                      items: codeList.map((map) {
                                        return DropdownMenuItem(
                                          value: map,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Text(
                                                  map,
                                                  style:
                                                      AppConsts.blackNormal15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                            (selectedCode == null)
                                                ? '+27'
                                                : selectedCode ?? '',
                                            style: AppConsts.blackNormal15),
                                      ),
                                      onChanged: (String? val) {
                                        setState(() {
                                          selectedCode = val ?? '';
                                        });
                                      },
                                      value: selectedCode,
                                    ),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: phoneController,
                              width: deviceWidth(context) * 0.72,
                              horizontalMargin: 5,
                              hintText: 'Phone Number',
                              hintStyle: AppConsts.greyishNormal,
                              maxLength: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: deviceWidth(context) * 0.05),
                    //   child: const Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: AutoSizeText(
                    //       'Password',
                    //       style: AppConsts.greyNormal15,
                    //       presetFontSizes: [16],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: deviceHeight(context) * 0.01,
                    // ),
                    // CustomTextField(
                    //   controller: passController,
                    //   hintText: 'Password',
                    //   hintStyle: AppConsts.greyishNormal,
                    //   isObsecure: showPass,
                    //   suffixIcon: InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           showPass = !showPass;
                    //         });
                    //       },
                    //       child: const Icon(Icons.remove_red_eye)),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: deviceWidth(context) * 0.05),
                    //   child: Align(
                    //     alignment: Alignment.centerRight,
                    //     child: InkWell(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) =>
                    //                     const ChangePassword()));
                    //       },
                    //       child: const AutoSizeText(
                    //         'Forget password?',
                    //         style: AppConsts.greyNormal15,
                    //         presetFontSizes: [16],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    RoundButton(
                      buttonColor: AppConsts.greenish,
                      buttonHeight: deviceHeight(context) * 0.07,
                      buttonWidth: deviceWidth(context),
                      horizontalMargin: deviceWidth(context) * 0.05,
                      borderWidth: 0.0,
                      fontSize: const [18],
                      onPressed: () async {
                        if (selectedCode == null || selectedCode == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please select country code')));
                        } else if (phoneController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter phone number')));
                        } else {}
                      },
                      text: 'Sign In',
                      textStyle: AppConsts.whiteNormal25,
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
