class LoginResponseModel {
  final String status;
  final String message;
  final LoginData data;

  const LoginResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: (json['status'] ?? '') as String,
      message: (json['message'] ?? '') as String,
      data: LoginData.fromJson((json['data'] ?? <String, dynamic>{}) as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class LoginData {
  final LoginUser user;
  final String token;
  final String tokenType;

  const LoginData({
    required this.user,
    required this.token,
    required this.tokenType,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: LoginUser.fromJson((json['user'] ?? <String, dynamic>{}) as Map<String, dynamic>),
      token: (json['token'] ?? '') as String,
      tokenType: (json['token_type'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': user.toJson(),
      'token': token,
      'token_type': tokenType,
    };
  }
}

class LoginUser {
  final int id;
  final String name;
  final String phone;
  final String email;
  final int institutionId;
  final String institutionName;
  final List<String> role;
  final int sessionId;
  final String sessionName;

  const LoginUser({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.institutionId,
    required this.institutionName,
    required this.role,
    required this.sessionId,
    required this.sessionName,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] ?? '') as String,
      phone: (json['phone'] ?? '') as String,
      email: (json['email'] ?? '') as String,
      institutionId: (json['institution_id'] as num?)?.toInt() ?? 0,
      institutionName: (json['institution_name'] ?? '') as String,
      role: (json['role'] as List?)?.map((e) => e.toString()).toList() ?? const <String>[],
      sessionId: (json['session_id'] as num?)?.toInt() ?? 0,
      sessionName: (json['session_name'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'institution_id': institutionId,
      'institution_name': institutionName,
      'role': role,
      'session_id': sessionId,
      'session_name': sessionName,
    };
  }
}
