class AddPatientBody {
  // ignore: non_constant_identifier_names
  String user_id;
  // ignore: non_constant_identifier_names
  String first_name;
  // ignore: non_constant_identifier_names
  String last_name;
  // ignore: non_constant_identifier_names
  String date_of_birth;
  String gender;
  // ignore: non_constant_identifier_names
  String blood_group;
  String weight;
  String height;
  String phone;
  String relationshipe;

  AddPatientBody({
    // ignore: non_constant_identifier_names
    this.user_id,
    // ignore: non_constant_identifier_names
    this.first_name,
    // ignore: non_constant_identifier_names
    this.last_name,
    // ignore: non_constant_identifier_names
    this.date_of_birth,
    this.gender,
    // ignore: non_constant_identifier_names
    this.blood_group,
    this.weight,
    this.height,
    this.phone,
    this.relationshipe,
  });

  AddPatientBody.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    date_of_birth = json['date_of_birth'];
    gender = json['gender'];
    blood_group = json['blood_group'];
    weight = json['weight'];
    height = json['height'];
    phone = json['phone'];
    relationshipe = json['relationshipe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = user_id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['date_of_birth'] = date_of_birth;
    data['gender'] = gender;
    data['blood_group'] = blood_group;
    data['weight'] = weight;
    data['height'] = height;
    data['phone'] = phone;
    data['relationshipe'] = relationshipe;
    return data;
  }
}
