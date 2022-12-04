class UserResponse {
  String? country;
  String? address;
  String? gender;
  String? city;
  String? lastName;
  String? profilePicture;
  String? educationalStatus;
  String? personalGoal;
  String? building;
  String? maritalStatus;
  String? password;
  String? province;
  String? phone;
  String? dob;
  String? suburb;
  String? employmentStatus;
  String? postalCode;
  String? firstName;
  String? email;

  UserResponse(
      {this.country,
      this.address,
      this.gender,
      this.city,
      this.lastName,
      this.profilePicture,
      this.educationalStatus,
      this.personalGoal,
      this.building,
      this.maritalStatus,
      this.password,
      this.province,
      this.phone,
      this.dob,
      this.suburb,
      this.employmentStatus,
      this.postalCode,
      this.firstName,
      this.email});

  UserResponse.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    address = json['address'];
    gender = json['gender'];
    city = json['city'];
    lastName = json['last_name'];
    profilePicture = json['profile_picture'];
    educationalStatus = json['educational_status'];
    personalGoal = json['personal_goal'];
    building = json['building'];
    maritalStatus = json['marital_status'];
    password = json['password'];
    province = json['province'];
    phone = json['phone'];
    dob = json['dob'];
    suburb = json['suburb'];
    employmentStatus = json['employment_status'];
    postalCode = json['postal_code'];
    firstName = json['first_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['address'] = address;
    data['gender'] = gender;
    data['city'] = city;
    data['last_name'] = lastName;
    data['profile_picture'] = profilePicture;
    data['educational_status'] = educationalStatus;
    data['personal_goal'] = personalGoal;
    data['building'] = building;
    data['marital_status'] = maritalStatus;
    data['password'] = password;
    data['province'] = province;
    data['phone'] = phone;
    data['dob'] = dob;
    data['suburb'] = suburb;
    data['employment_status'] = employmentStatus;
    data['postal_code'] = postalCode;
    data['first_name'] = firstName;
    data['email'] = email;
    return data;
  }
}
