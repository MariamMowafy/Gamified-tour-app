
class DataModel {
   int id;
   String firstName;
   String lastName;
   String birthDate;
   String gender;
   String? language;
   String phone;
   String email;
   String password;
   String userRole;
   String? likedtours;
   String address;

   //passwordController = TextEditingController();

  //String get emailAddress=>emailController.text;

  DataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.gender,
    this.language,
    required this.phone,
    required this.email,
    required this.password,
    required this.userRole,
    this.likedtours,
    required this.address
  });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(
      id : json["id"],
      firstName : json["first_name"],
      lastName : json['last_name'],
      birthDate : json['birth'],
      gender : json['gender'],
      //language : json["language"],
      phone : json["phone"],
      email: json['email'],
      password: json['password'],
      userRole: json["job"],
      //likedtours : json['likedtours'],
      address: json["address"],
    );

}
  }

