class MeetingResponse {
  String? stokvelName;
  int? endTimestamp;
  int? startTimestamp;
  String? meetingId;
  StokvelData? stokvelData;
  String? createdBy;
  String? status;

  MeetingResponse(
      {this.stokvelName,
      this.endTimestamp,
      this.startTimestamp,
      this.meetingId,
      this.stokvelData,
      this.createdBy,
      this.status});

  MeetingResponse.fromJson(Map<String, dynamic> json) {
    stokvelName = json['stokvel_name'];
    endTimestamp = json['end_timestamp'];
    startTimestamp = json['start_timestamp'];
    meetingId = json['meeting_id'];
    stokvelData = json['stokvel_data'] != null
        ? StokvelData.fromJson(json['stokvel_data'])
        : null;
    createdBy = json['created_by'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stokvel_name'] = stokvelName;
    data['end_timestamp'] = endTimestamp;
    data['start_timestamp'] = startTimestamp;
    data['meeting_id'] = meetingId;
    if (stokvelData != null) {
      data['stokvel_data'] = stokvelData!.toJson();
    }
    data['created_by'] = createdBy;
    data['status'] = status;
    return data;
  }
}

class StokvelData {
  String? stokvelName;
  String? role;
  String? address;
  List<String>? memberPhones;
  List<Members>? members;
  String? suburb;
  int? createdAt;
  String? registerDate;
  Rules? rules;
  String? id;
  String? createdBy;

  StokvelData(
      {this.stokvelName,
      this.role,
      this.address,
      this.memberPhones,
      this.members,
      this.suburb,
      this.createdAt,
      this.registerDate,
      this.rules,
      this.id,
      this.createdBy});

  StokvelData.fromJson(Map<String, dynamic> json) {
    stokvelName = json['stokvel_name'];
    role = json['role'];
    address = json['address'];
    memberPhones = json['member_phones'].cast<String>();
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(Members.fromJson(v));
      });
    }
    suburb = json['suburb'];
    createdAt = json['created_at'];
    registerDate = json['register_date'];
    rules = json['rules'] != null ? Rules.fromJson(json['rules']) : null;
    id = json['id'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stokvel_name'] = stokvelName;
    data['role'] = role;
    data['address'] = address;
    data['member_phones'] = memberPhones;
    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    data['suburb'] = suburb;
    data['created_at'] = createdAt;
    data['register_date'] = registerDate;
    if (rules != null) {
      data['rules'] = rules!.toJson();
    }
    data['id'] = id;
    data['created_by'] = createdBy;
    return data;
  }
}

class Members {
  String? memberId;
  String? whatsapp;
  String? role;
  String? comments;
  String? phone;
  String? lastName;
  String? firstName;
  String? email;
  String? status;

  Members(
      {this.memberId,
      this.whatsapp,
      this.role,
      this.comments,
      this.phone,
      this.lastName,
      this.firstName,
      this.email,
      this.status});

  Members.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    whatsapp = json['whatsapp'];
    role = json['role'];
    comments = json['comments'];
    phone = json['phone'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    email = json['email'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_id'] = memberId;
    data['whatsapp'] = whatsapp;
    data['role'] = role;
    data['comments'] = comments;
    data['phone'] = phone;
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['email'] = email;
    data['status'] = status;
    return data;
  }
}

class Rules {
  String? interestType;
  String? interestRate;

  Rules({this.interestType, this.interestRate});

  Rules.fromJson(Map<String, dynamic> json) {
    interestType = json['interest_type'];
    interestRate = json['interest_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['interest_type'] = interestType;
    data['interest_rate'] = interestRate;
    return data;
  }
}
