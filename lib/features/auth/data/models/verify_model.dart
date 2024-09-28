class VerificationResponse {
  final String message;
  // final Map<String, dynamic> data;

  VerificationResponse({
    required this.message,
    // required this.data,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) {
    return VerificationResponse(
      message: json['message'] as String,
      // data: json['data'] as Map<String, dynamic>,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      // 'data': data,
    };
  }
}
