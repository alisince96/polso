// class StokvelMemberResponse {
//   String? stokvelName;
//   String? stokvelId;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? memberId;
//   String? phone;
//   String? comments;
//   String? role;
//   String? status;
//   String? whatsapp;

//   StokvelMemberResponse.fromJson(Map<String, dynamic> json) {
//     stokvelName = json['stokvel_name'];
//     role = json['role'];
//     firstName = json['first_name'];
//     comments = json['comments'];
//     lastName = json['last_name'];
//     email = json['email'];
//     memberId = json['member_id'];
//     whatsapp = json['whatsapp'];
//     stokvelId = json['stokvel_id'];
//     status = json['status'];
//     phone = json['phone'];
//   }
//   StokvelMemberResponse.toJson() {
//     Map<String, dynamic> json = {};
//     json['stokvel_name'] = stokvelName;
//     json['role'] = role;
//     json['first_name'] = firstName;
//     json['last_name'] = lastName;
//     json['email'] = stokvelName;
//     json['phone'] = role;
//     json['comments'] = stokvelName;
//     json['member_id'] = role;
//     json['stokvel_id'] = stokvelName;
//     json['status'] = role;
//     json['whatsapp'] = stokvelName;
//   }
// }

// class Rules {
//   String? interestRate;
//   String? interestType;

//   Rules.fromJson(Map<String, dynamic> json) {
//     interestRate = json['interest_rate'];
//     interestType = json['interest_type'];
//   }
//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> json = {};
//     json['interest_rate'] = interestRate;
//     json['interest_type'] = interestType;
//     return json;
//   }
// }

// class Members {
//   String? firstName;
//   String? lastName;
//   String? role;
//   String? status;
//   String? memberId;
//   String? whatsapp;
//   String? phone;
//   String? email;
//   String? comments;
//   String? stokvelId;
//   String? stokvelName;

//   Members.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     role = json['role'];
//     memberId = json['member_id'];
//     status = json['status'];
//     whatsapp = json['whatsapp'];
//     phone = json['phone'];
//     email = json['email'];
//     comments = json['comments'];
//     stokvelName = json['stokvel_name'];
//     stokvelId = json['stokvel_id'];
//   }
//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> json = {};
//     json['first_name'] = firstName;
//     json['last_name'] = lastName;
//     json['role'] = role;
//     json['member_id'] = memberId;
//     json['status'] = status;
//     json['whatsapp'] = whatsapp;
//     json['phone'] = phone;
//     json['email'] = email;
//     json['comments'] = comments;
//     json['stokvel_name'] = stokvelName;
//     json['stokvel_id'] = stokvelId;
//     return json;
//   }
// }
