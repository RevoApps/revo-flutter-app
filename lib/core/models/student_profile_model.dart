class StudentProfileResponse {
  final String status;
  final String message;
  final StudentProfileData data;

  StudentProfileResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StudentProfileResponse.fromJson(Map<String, dynamic> json) {
    return StudentProfileResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: StudentProfileData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class StudentProfileData {
  final int id;
  final String studentName;
  final String fatherName;
  final String motherName;
  final String dateOfBirth;
  final String gender;
  final String mobile;
  final String admissionNumber;
  final String admissionDate;
  final String admissionSession;
  final String? category;
  final String? religion;
  final String? aadhar;
  final String? remarks;
  final Institution institution;
  final Station station;
  final Session session;
  final User user;
  final Detail detail;

  StudentProfileData({
    required this.id,
    required this.studentName,
    required this.fatherName,
    required this.motherName,
    required this.dateOfBirth,
    required this.gender,
    required this.mobile,
    required this.admissionNumber,
    required this.admissionDate,
    required this.admissionSession,
    this.category,
    this.religion,
    this.aadhar,
    this.remarks,
    required this.institution,
    required this.station,
    required this.session,
    required this.user,
    required this.detail,
  });

  factory StudentProfileData.fromJson(Map<String, dynamic> json) {
    return StudentProfileData(
      id: json['id'] ?? 0,
      studentName: json['student_name'] ?? '',
      fatherName: json['father_name'] ?? '',
      motherName: json['mother_name'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      gender: json['gender'] ?? '',
      mobile: json['mobile'] ?? '',
      admissionNumber: json['admission_number'] ?? '',
      admissionDate: json['admission_date'] ?? '',
      admissionSession: json['admission_session'] ?? '',
      category: json['category'],
      religion: json['religion'],
      aadhar: json['aadhar'],
      remarks: json['remarks'],
      institution: Institution.fromJson(json['institution'] ?? {}),
      station: Station.fromJson(json['station'] ?? {}),
      session: Session.fromJson(json['session'] ?? {}),
      user: User.fromJson(json['user'] ?? {}),
      detail: Detail.fromJson(json['detail'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_name': studentName,
      'father_name': fatherName,
      'mother_name': motherName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'mobile': mobile,
      'admission_number': admissionNumber,
      'admission_date': admissionDate,
      'admission_session': admissionSession,
      'category': category,
      'religion': religion,
      'aadhar': aadhar,
      'remarks': remarks,
      'institution': institution.toJson(),
      'station': station.toJson(),
      'session': session.toJson(),
      'user': user.toJson(),
      'detail': detail.toJson(),
    };
  }
}

class Institution {
  final int id;
  final String? institutionName;

  Institution({
    required this.id,
    this.institutionName,
  });

  factory Institution.fromJson(Map<String, dynamic> json) {
    return Institution(
      id: json['id'] ?? 0,
      institutionName: json['institution_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'institution_name': institutionName,
    };
  }
}

class Station {
  final int id;
  final String stationName;

  Station({
    required this.id,
    required this.stationName,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['id'] ?? 0,
      stationName: json['station_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'station_name': stationName,
    };
  }
}

class Session {
  final int id;
  final String rollNumber;
  final String studentType;
  final String status;
  final String? profileImage;
  final String? openingBalance;
  final Section section;
  final SessionInfo sessionInfo;

  Session({
    required this.id,
    required this.rollNumber,
    required this.studentType,
    required this.status,
    this.profileImage,
    this.openingBalance,
    required this.section,
    required this.sessionInfo,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'] ?? 0,
      rollNumber: json['roll_number'] ?? '',
      studentType: json['student_type'] ?? '',
      status: json['status'] ?? '',
      profileImage: json['profile_image'],
      openingBalance: json['opening_balance'],
      section: Section.fromJson(json['section'] ?? {}),
      sessionInfo: SessionInfo.fromJson(json['session_info'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roll_number': rollNumber,
      'student_type': studentType,
      'status': status,
      'profile_image': profileImage,
      'opening_balance': openingBalance,
      'section': section.toJson(),
      'session_info': sessionInfo.toJson(),
    };
  }
}

class Section {
  final int id;
  final String sectionName;
  final Class classInfo;

  Section({
    required this.id,
    required this.sectionName,
    required this.classInfo,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'] ?? 0,
      sectionName: json['section_name'] ?? '',
      classInfo: Class.fromJson(json['class'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'section_name': sectionName,
      'class': classInfo.toJson(),
    };
  }
}

class Class {
  final int id;
  final String className;

  Class({
    required this.id,
    required this.className,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'] ?? 0,
      className: json['class_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'class_name': className,
    };
  }
}

class SessionInfo {
  final int id;
  final String sessionName;
  final String startDate;
  final String endDate;

  SessionInfo({
    required this.id,
    required this.sessionName,
    required this.startDate,
    required this.endDate,
  });

  factory SessionInfo.fromJson(Map<String, dynamic> json) {
    return SessionInfo(
      id: json['id'] ?? 0,
      sessionName: json['session_name'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'session_name': sessionName,
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}

class Detail {
  final String? bloodGroup;
  final String? height;
  final String? weight;
  final String? currentAddress;
  final String? currentCity;
  final String? currentPincode;
  final String? permanentAddress;
  final String? permanentCity;
  final String? permanentPincode;

  Detail({
    this.bloodGroup,
    this.height,
    this.weight,
    this.currentAddress,
    this.currentCity,
    this.currentPincode,
    this.permanentAddress,
    this.permanentCity,
    this.permanentPincode,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      bloodGroup: json['blood_group'],
      height: json['height'],
      weight: json['weight'],
      currentAddress: json['current_address'],
      currentCity: json['current_city'],
      currentPincode: json['current_pincode'],
      permanentAddress: json['permanent_address'],
      permanentCity: json['permanent_city'],
      permanentPincode: json['permanent_pincode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blood_group': bloodGroup,
      'height': height,
      'weight': weight,
      'current_address': currentAddress,
      'current_city': currentCity,
      'current_pincode': currentPincode,
      'permanent_address': permanentAddress,
      'permanent_city': permanentCity,
      'permanent_pincode': permanentPincode,
    };
  }
}
