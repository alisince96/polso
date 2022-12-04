part of 'homepage_cubit.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class HomeLoading extends HomepageState {}

class HomeError extends HomepageState {
  final String? error;
  HomeError({this.error});
}

class StokvelsFetched extends HomepageState {
  final List<stokvelResponse.StokvelResponse>? allStokvels;
  StokvelsFetched({this.allStokvels});
}

class StokvelInvitationsFetched extends HomepageState {
  final List<stokvelResponse.StokvelResponse>? allStokvels;
  StokvelInvitationsFetched({this.allStokvels});
}

class StokvelMeetingsFetched extends HomepageState {
  final List<MeetingResponse>? allMeetings;
  StokvelMeetingsFetched({this.allMeetings});
}

class NoStokvelYet extends HomepageState {}

class LoginExpire extends HomepageState {}

class NewMeetingScheduled extends HomepageState {}

class StovelMemberStatusUpdated extends HomepageState {
  final stokvelResponse.StokvelResponse? stokvelData;
  StovelMemberStatusUpdated({this.stokvelData});
}

class UserDataFetched extends HomepageState {
  final UserResponse? userData;
  UserDataFetched({this.userData});
}
