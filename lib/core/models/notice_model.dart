class NoticeResponse {
  final String status;
  final String message;
  final List<Notice> data;
  final NoticeMeta meta;

  NoticeResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory NoticeResponse.fromJson(Map<String, dynamic> json) {
    return NoticeResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)?.map((item) => Notice.fromJson(item as Map<String, dynamic>)).toList() ?? [],
      meta: NoticeMeta.fromJson(json['meta'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((notice) => notice.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class Notice {
  final int id;
  final String noticeNumber;
  final String noticeDate;
  final String englishNotice;
  final String punjabiNotice;
  final String? noticeAttachment;
  final String? noticeRemarks;
  final String status;
  final NoticeInstitution institution;
  final NoticeSession session;
  final String? createdBy;
  final String createdAt;
  final String updatedAt;

  Notice({
    required this.id,
    required this.noticeNumber,
    required this.noticeDate,
    required this.englishNotice,
    required this.punjabiNotice,
    this.noticeAttachment,
    this.noticeRemarks,
    required this.status,
    required this.institution,
    required this.session,
    this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json['id'] ?? 0,
      noticeNumber: json['notice_number'] ?? '',
      noticeDate: json['notice_date'] ?? '',
      englishNotice: json['english_notice'] ?? '',
      punjabiNotice: json['punjabi_notice'] ?? '',
      noticeAttachment: json['notice_attachment'],
      noticeRemarks: json['notice_remarks'],
      status: json['status'] ?? '',
      institution: NoticeInstitution.fromJson(json['institution'] ?? {}),
      session: NoticeSession.fromJson(json['session'] ?? {}),
      createdBy: json['created_by'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notice_number': noticeNumber,
      'notice_date': noticeDate,
      'english_notice': englishNotice,
      'punjabi_notice': punjabiNotice,
      'notice_attachment': noticeAttachment,
      'notice_remarks': noticeRemarks,
      'status': status,
      'institution': institution.toJson(),
      'session': session.toJson(),
      'created_by': createdBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class NoticeInstitution {
  final int id;
  final String? institutionName;
  final String shortName;

  NoticeInstitution({
    required this.id,
    this.institutionName,
    required this.shortName,
  });

  factory NoticeInstitution.fromJson(Map<String, dynamic> json) {
    return NoticeInstitution(
      id: json['id'] ?? 0,
      institutionName: json['institution_name'],
      shortName: json['short_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'institution_name': institutionName,
      'short_name': shortName,
    };
  }
}

class NoticeSession {
  final int id;
  final String sessionName;
  final String startDate;
  final String endDate;

  NoticeSession({
    required this.id,
    required this.sessionName,
    required this.startDate,
    required this.endDate,
  });

  factory NoticeSession.fromJson(Map<String, dynamic> json) {
    return NoticeSession(
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

class NoticeMeta {
  final int total;
  final int institutionId;
  final String statusFilter;

  NoticeMeta({
    required this.total,
    required this.institutionId,
    required this.statusFilter,
  });

  factory NoticeMeta.fromJson(Map<String, dynamic> json) {
    return NoticeMeta(
      total: json['total'] ?? 0,
      institutionId: json['institution_id'] ?? 0,
      statusFilter: json['status_filter'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'institution_id': institutionId,
      'status_filter': statusFilter,
    };
  }
}
