class AccountModel {
  final String? id;
  final String email;
  final String password;

  AccountModel({required this.id, required this.email, required this.password});

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {if (id != null) 'id': id, 'email': email, 'password': password};
  }
}
