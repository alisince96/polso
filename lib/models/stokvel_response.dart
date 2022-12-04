class StokvelResponse {
  String? stokvelName;
  String? role;
  String? address;
  String? suburb;
  String? registerDate;
  String? id;
  Rules? rules;
  List<Members>? members;
  List<String>? memberPhones;
  String? createdBy;
  String? createdByName;
  String? createdByEmail;
  int? createdAt;
  String? picture;

  StokvelResponse.fromJson(Map<String, dynamic> json) {
    stokvelName = json['stokvel_name'];
    role = json['role'];
    address = json['address'];
    picture = json['picture'];
    suburb = json['suburb'];
    registerDate = json['register_date'];
    createdBy = json['created_by'];
    createdByName = json['created_by_name'];
    createdByEmail = json['created_by_email'];
    createdAt = json['created_at'];
    id = json['id'];
    rules = json['rules'] != null ? Rules.fromJson(json['rules']) : null;
    if (json['members'] != null) {
      members = [];
      json['members'].forEach((v) {
        members!.add(Members.fromJson(v));
      });
    }
    if (json['member_phones'] != null) {
      memberPhones = [];
      json['member_phones'].forEach((v) {
        memberPhones!.add(v);
      });
    }
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['stokvel_name'] = stokvelName;
    json['role'] = role;
    json['address'] = address;
    json['suburb'] = suburb;
    json['created_at'] = createdAt;
    json['created_by'] = createdBy;
    json['created_by_name'] = createdByName;
    json['created_by_email'] = createdByEmail;
    json['register_date'] = registerDate;
    json['picture'] = picture;
    json['id'] = id;
    if (rules != null) {
      json['rules'] = rules?.toJson();
    }
    if (members != null) {
      json['members'] = members!.map((v) => v.toJson()).toList();
    }
    if (memberPhones != null) {
      json['member_phones'] = memberPhones!.map((v) => v).toList();
    }
    return json;
  }
}

class Rules {
  String? interestType;
  String? meetingFrequency;
  String? maxLoan;
  bool? allowLoan;
  String? purpose;
  String? notMadeSavings;
  String? notPaying;
  bool? allowPenalty;
  String? minLoan;
  String? minTerm;
  String? lateArrival;
  String? loanDuration;
  bool? socialFund;
  String? excusedAbsence;
  bool? environmentFund;
  String? dayOfMeeting;
  String? interestRate;
  String? absent;
  String? maxLoanEligibilty;
  String? delayLoan;

  Rules(
      {this.interestType,
      this.meetingFrequency,
      this.maxLoan,
      this.allowLoan,
      this.purpose,
      this.notMadeSavings,
      this.notPaying,
      this.allowPenalty,
      this.minLoan,
      this.minTerm,
      this.lateArrival,
      this.loanDuration,
      this.socialFund,
      this.excusedAbsence,
      this.environmentFund,
      this.dayOfMeeting,
      this.interestRate,
      this.absent,
      this.maxLoanEligibilty,
      this.delayLoan});

  Rules.fromJson(Map<String, dynamic> json) {
    interestType = json['interest_type'];
    meetingFrequency = json['meeting_frequency'];
    maxLoan = json['max_loan'];
    allowLoan = json['allow_loan'];
    purpose = json['purpose'];
    notMadeSavings = json['not_made_savings'];
    notPaying = json['not_paying'];
    allowPenalty = json['allow_penalty'];
    minLoan = json['min_loan'];
    minTerm = json['min_term'];
    lateArrival = json['late_arrival'];
    loanDuration = json['loan_duration'];
    socialFund = json['social_fund'];
    excusedAbsence = json['excused_absence'];
    environmentFund = json['environment_fund'];
    dayOfMeeting = json['day_of_meeting'];
    interestRate = json['interest_rate'];
    absent = json['absent'];
    maxLoanEligibilty = json['max_loan_eligibilty'];
    delayLoan = json['delay_loan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['interest_type'] = interestType;
    data['meeting_frequency'] = meetingFrequency;
    data['max_loan'] = maxLoan;
    data['allow_loan'] = allowLoan;
    data['purpose'] = purpose;
    data['not_made_savings'] = notMadeSavings;
    data['not_paying'] = notPaying;
    data['allow_penalty'] = allowPenalty;
    data['min_loan'] = minLoan;
    data['min_term'] = minTerm;
    data['late_arrival'] = lateArrival;
    data['loan_duration'] = loanDuration;
    data['social_fund'] = socialFund;
    data['excused_absence'] = excusedAbsence;
    data['environment_fund'] = environmentFund;
    data['day_of_meeting'] = dayOfMeeting;
    data['interest_rate'] = interestRate;
    data['absent'] = absent;
    data['max_loan_eligibilty'] = maxLoanEligibilty;
    data['delay_loan'] = delayLoan;
    return data;
  }
}

class Members {
  String? firstName;
  String? lastName;
  String? role;
  String? status;
  String? memberId;
  String? whatsapp;
  String? phone;
  String? email;
  String? comments;
  Members({this.memberId});
  Members.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
    memberId = json['member_id'];
    status = json['status'];
    whatsapp = json['whatsapp'];
    phone = json['phone'];
    email = json['email'];
    comments = json['comments'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['role'] = role;
    json['member_id'] = memberId;
    json['status'] = status;
    json['whatsapp'] = whatsapp;
    json['phone'] = phone;
    json['email'] = email;
    json['comments'] = comments;
    return json;
  }
}
