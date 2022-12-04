import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polso/AppGlobal/app_global.dart';
import 'package:polso/models/meeting_response.dart';
import 'package:polso/models/stokvel_response.dart' as stokvelResponse;
import 'package:polso/models/user_response.dart';
import 'package:polso/screens/signup/cubit/signup_cubit.dart';
import 'package:uuid/uuid.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  UserResponse? currentUserResponse;
  HomepageCubit() : super(HomepageInitial());
  //! get all stokvel meetings
  Future<void> getCurrentUserDataFromFirestore() async {
    try {
      emit(HomeLoading());
      User? currentUser =
          BlocProvider.of<SignupCubit>(context!).getCurrentUser();
      if (currentUser != null) {
        DocumentSnapshot<Map<String, dynamic>> response =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser.phoneNumber)
                .get();

        UserResponse userResponse = UserResponse.fromJson(response.data()!);
        currentUserResponse =
            userResponse; //setting current user data for accessing globally
        emit(UserDataFetched(userData: userResponse));
      } else {
        emit(LoginExpire());
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      emit(HomeError(error: e.code.toString()));
    }
  }

//! Get All stokvels
  Future<void> getAllStokvels() async {
    print('-------------');
    try {
      emit(HomeLoading());
      User? currentUser =
          BlocProvider.of<SignupCubit>(context!).getCurrentUser();
      List<stokvelResponse.StokvelResponse> stokvelResponseList = [];

      if (currentUser != null) {
        //? getting stokvels,Query by created by
        QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
            .instance
            .collection('stokvels')
            .where('created_by', isEqualTo: currentUser.phoneNumber)
            .get();
        if (response.docs.isNotEmpty) {
          for (var json in response.docs) {
            stokvelResponse.StokvelResponse data =
                stokvelResponse.StokvelResponse.fromJson(json.data());
            stokvelResponseList.add(data);
          }
        }
        //? getting stokvels,Query by members phone
        QuerySnapshot<Map<String, dynamic>> checkByMemberPhoneResponse =
            await FirebaseFirestore.instance
                .collection('stokvels')
                .where("member_phones", arrayContains: currentUser.phoneNumber)
                .get();
        if (checkByMemberPhoneResponse.docs.isNotEmpty) {
          List<stokvelResponse.StokvelResponse> tempList = [];
          for (var json in checkByMemberPhoneResponse.docs) {
            stokvelResponse.StokvelResponse data =
                stokvelResponse.StokvelResponse.fromJson(json.data());
            tempList.add(data);
          }
          for (var stokvel in tempList) {
            if (stokvel.members != null) {
              if (stokvel.members!.isNotEmpty) {
                stokvelResponse.Members? selectedMember = stokvel.members
                    ?.firstWhere(
                        (element) => element.phone == currentUser.phoneNumber,
                        orElse: () => stokvelResponse.Members(memberId: '-2'));
                if (selectedMember != null) {
                  if (selectedMember.memberId != '-2') {
                    if (selectedMember.status?.toLowerCase() == 'accepted') {
                      stokvelResponseList.add(stokvel);
                    }
                  }
                }
              }
            }
          }
        }

        emit(StokvelsFetched(allStokvels: stokvelResponseList));
      } else {
        emit(LoginExpire());
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      emit(HomeError(error: e.code.toString()));
    }
  }

  Future<void> getAllStokvelsInvitations() async {
    try {
      emit(HomeLoading());
      User? currentUser =
          BlocProvider.of<SignupCubit>(context!).getCurrentUser();
      List<stokvelResponse.StokvelResponse> stokvelResponseList = [];
      if (currentUser != null) {
        //? getting stokvels,Query by members phone
        QuerySnapshot<Map<String, dynamic>> checkByMemberPhoneResponse =
            await FirebaseFirestore.instance
                .collection('stokvels')
                .where("member_phones", arrayContains: currentUser.phoneNumber)
                .get();
        if (checkByMemberPhoneResponse.docs.isNotEmpty) {
          for (var json in checkByMemberPhoneResponse.docs) {
            stokvelResponse.StokvelResponse data =
                stokvelResponse.StokvelResponse.fromJson(json.data());
            if (data.members != null) {
              if (data.members!.isNotEmpty) {
                stokvelResponse.Members? selectedMember = data.members
                    ?.firstWhere(
                        (element) => element.phone == currentUser.phoneNumber);
                if (selectedMember?.status?.toLowerCase() == 'pending') {
                  stokvelResponseList.add(data);
                }
              }
            }
          }
        }

        emit(StokvelInvitationsFetched(allStokvels: stokvelResponseList));
      } else {
        emit(LoginExpire());
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      emit(HomeError(error: e.code.toString()));
    }
  }

//! schedule new meeting
  Future<void> scheduleNewMeeting(
      {required stokvelResponse.StokvelResponse? stokvelData,
      Timestamp? startDateTimestamp,
      Timestamp? endDateTimestamp}) async {
    try {
      emit(HomeLoading());
      var meetingId = const Uuid().v4();
      Map<String, dynamic> stokvelDataForApi = {};
      if (stokvelData != null) {
        stokvelDataForApi = stokvelData.toJson();
      }
      User? currentUser =
          BlocProvider.of<SignupCubit>(context!).getCurrentUser();
      Map<String, dynamic> stokvelMemberData = {
        'created_by': currentUser?.phoneNumber,
        'meeting_id': meetingId,
        'stokvel_data': stokvelDataForApi,
        'stokvel_name': stokvelData?.stokvelName,
        'start_timestamp': startDateTimestamp?.millisecondsSinceEpoch,
        'end_timestamp': endDateTimestamp?.millisecondsSinceEpoch,
        'status': 'open'
      };

      if (currentUser != null) {
        await FirebaseFirestore.instance
            .collection('meetings')
            .doc(meetingId)
            .set(stokvelMemberData);

        emit(NewMeetingScheduled());
      } else {
        emit(LoginExpire());
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      emit(HomeError(error: e.code.toString()));
    }
  }

  //! get all stokvel meetings
  Future<void> getStokvelMeetings(
      stokvelResponse.StokvelResponse stokvelResponse) async {
    try {
      emit(HomeLoading());
      User? currentUser =
          BlocProvider.of<SignupCubit>(context!).getCurrentUser();
      if (currentUser != null) {
        QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
            .instance
            .collection('meetings')
            .where('stokvel_name', isEqualTo: stokvelResponse.stokvelName)
            .get();
        List<MeetingResponse> meetingResponseList = [];
        if (response.docs.isNotEmpty) {
          for (var json in response.docs) {
            MeetingResponse data = MeetingResponse.fromJson(json.data());
            meetingResponseList.add(data);
          }
        }
        emit(StokvelMeetingsFetched(allMeetings: meetingResponseList));
      } else {
        emit(LoginExpire());
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      emit(HomeError(error: e.code.toString()));
    }
  }

//! for search meetings via start and end dates
  void getMeetingsByTimestamp(
      {Timestamp? startDate,
      Timestamp? endDate,
      required List<MeetingResponse> allMeetingsList}) {
    List<MeetingResponse> searchedMeetings = [];
    DateTime searchStart =
        DateTime.fromMillisecondsSinceEpoch(startDate!.millisecondsSinceEpoch);
    DateTime searchEnd =
        DateTime.fromMillisecondsSinceEpoch(endDate!.millisecondsSinceEpoch);
    if (allMeetingsList.isNotEmpty) {
      searchedMeetings = allMeetingsList.where((meeting) {
        DateTime start =
            DateTime.fromMillisecondsSinceEpoch(meeting.startTimestamp ?? 0);
        DateTime end =
            DateTime.fromMillisecondsSinceEpoch(meeting.endTimestamp ?? 0);
        if (searchStart.isBefore(start) && searchEnd.isAfter(end)) {
          return true;
        }
        return false;
      }).toList();
    }
    emit(StokvelMeetingsFetched(allMeetings: searchedMeetings));
  }

//! update invitation status (accept or reject)
  Future<void> updateInvitationStatus(
      {required stokvelResponse.StokvelResponse stokvelData,
      required String status}) async {
    try {
      emit(HomeLoading());

      User? currentUser =
          BlocProvider.of<SignupCubit>(context!).getCurrentUser();
      if (stokvelData.members != null) {
        if (stokvelData.members!.isNotEmpty) {
          stokvelResponse.Members? memberWhosStatusIsUpdating;
          //getting current member data
          memberWhosStatusIsUpdating = stokvelData.members?.firstWhere(
              (element) => element.phone == currentUser?.phoneNumber);
          if (memberWhosStatusIsUpdating != null) {
            //updating member status
            memberWhosStatusIsUpdating.status = status;
            //removing old data from members list
            stokvelData.members?.removeWhere(
                (element) => element.phone == currentUser?.phoneNumber);
            //adding new member data with status updated
            stokvelData.members?.add(memberWhosStatusIsUpdating);
            Map<String, dynamic> stokvelUpdatedDataMap = stokvelData.toJson();
            //updating data on firestore
            await FirebaseFirestore.instance
                .collection('stokvels')
                .doc(stokvelData.id)
                .update(stokvelUpdatedDataMap);
            emit(StovelMemberStatusUpdated(stokvelData: stokvelData));
          }
        }
      } else {
        emit(LoginExpire());
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      emit(HomeError(error: e.code.toString()));
    }
  }

  Future<void> updateUserDisplay(
      {UserResponse? userData, required File image}) async {
    try {
      emit(HomeLoading());

      String? imageUrl = await BlocProvider.of<SignupCubit>(context!)
          .uploadPictureToFirestore(image);
      if (imageUrl != null && userData != null) {
        userData.profilePicture = imageUrl;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userData.phone)
            .update(userData.toJson());

        DocumentSnapshot<Map<String, dynamic>> response =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(userData.phone)
                .get();

        UserResponse userResponse = UserResponse.fromJson(response.data()!);
        currentUserResponse =
            userResponse; //setting current user data for accessing globally
        emit(UserDataFetched(userData: userResponse));
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      emit(HomeError(error: e.code.toString()));
    }
  }
}
