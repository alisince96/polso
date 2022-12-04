import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:polso/AppGlobal/app_global.dart';
import 'package:polso/models/user_response.dart';
import 'package:polso/screens/homepage/cubit/homepage_cubit.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  User? _userData;
  User? get user => _userData;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController suburbController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController maritalController = TextEditingController();
  TextEditingController employmentController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  File? displayPicture;
  int? forceResendCode;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  SignupCubit() : super(SignupInitial());

  //? All Methods related to signup/Login
  Future registerUser(bool isResendingCode) async {
    await Firebase.initializeApp();
    await getOtp(isResendingCode,
        '${countrycodeController.text}${phoneController.text}');
  }

  Future loginUser(String email, String password) async {
    emit(SignupLoading());
    try {
      print('test0');
      await Firebase.initializeApp();
      print('test1');
      final loggedInUserData = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('test2z');
      _userData = loggedInUserData.user;
      emit(LoggedInSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(SignupError(error: e.message.toString()));
    }
  }

  Future loginUserWithGoogle() async {
    emit(SignupLoading());
    try {
      print('test0');
      await Firebase.initializeApp();
      GoogleSignInAccount? signInAccount = await _googleSignIn.signIn();
      if (signInAccount != null) {
        final userData = UserResponse(email: signInAccount.email, password: '');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(signInAccount.email.trim())
            .set(userData.toJson());
        BlocProvider.of<HomepageCubit>(context!).currentUserResponse =
            UserResponse(email: signInAccount.email, password: '');
      }

      emit(LoggedInSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(SignupError(error: e.message.toString()));
    }
  }

  Future<void> getOtp(bool isResendingCode, String phone) async {
    try {
      emit(SignupLoading());
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.verifyPhoneNumber(
          forceResendingToken: isResendingCode == true ? forceResendCode : null,
          phoneNumber: phone,
          timeout: const Duration(seconds: 120),
          verificationCompleted: (AuthCredential authCredential) {
            debugPrint('VERIFICATION COMPLETED----------');
            emit(VerificationCompleted());
          },
          verificationFailed: (FirebaseAuthException authException) {
            debugPrint('VERIFICATION FAILED----------');
            emit(OtpError(
                error: authException.message ?? 'Something went wrong'));
          },
          codeSent: (String verificationId, int? forceResendToken) {
            forceResendCode = forceResendToken;
            debugPrint('CODE SENT----------');
            emit(OtpSent(verificationId: verificationId));
          },
          codeAutoRetrievalTimeout: (String val) {});
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message.toString());
      emit(OtpError(error: e.message.toString()));
    }
  }

  void verifyOtp(String verificationId, String smsCode) async {
    try {
      emit(SignupLoading());
      FirebaseAuth auth = FirebaseAuth.instance;
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      debugPrint(smsCode.toString());
      debugPrint(verificationId.toString());
      // Sign the user in (or link) with the credential
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      _userData = userCredential
          .user; //Saving user data for getting user personal data from firestore to show on homepage
      debugPrint('otp verified');
      debugPrint(userCredential.user?.phoneNumber);
      emit(OtpVerified());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code.toString());

      emit(OtpError(error: e.code.toString()));
    }
  }

  //! get current user data without states
  Future<UserResponse?> getCurrentUserDataFromFirestoreWithoutStates(
      String email) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> response =
          await FirebaseFirestore.instance.collection('users').doc(email).get();
      if (response.data() != null) {
        UserResponse userResponse = UserResponse.fromJson(response.data()!);
        BlocProvider.of<HomepageCubit>(context!).currentUserResponse =
            userResponse; //setting current user data for accessing globally
        return userResponse;
      }

      return null;
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      return null;
    }
  }

  registerUserToFirebase(String email, String? password) async {
    await Firebase.initializeApp();
    try {
      emit(SignupLoading());
      // String? firebaseImageUrl;
      // if (displayPicture != null) {
      //   firebaseImageUrl = await uploadPictureToFirestore(displayPicture);
      // }

      Map<String, dynamic> userData = {
        'email': email,
        'password': password,
      };
      log(userData.toString());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password!);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(email.trim())
          .set(userData);
      emit(RegisterationSuccessAndLoggedIn());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(SignupError(error: e.message.toString()));
    }
  }

  User? getCurrentUser() {
    FirebaseAuth auth = FirebaseAuth.instance;

    return _userData = auth.currentUser;
  }

  bool isLoggedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser != null ? true : false;
  }

  Future<String?> uploadPictureToFirestore(File? image) async {
    try {
      if (image != null) {
        var uploadTask = await FirebaseStorage.instance
            .ref()
            .child('images/${image.path.hashCode}')
            .putFile(image);
        String downloadUrl = await uploadTask.ref.getDownloadURL();
        return downloadUrl;
      }
      return null;
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      return null;
    }
  }
}
