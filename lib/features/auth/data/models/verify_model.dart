class VerificationResponse {
  final String status;
  final String message;

  VerificationResponse({
    required this.status,
    required this.message,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) {
    return VerificationResponse(
      status: json['status'] as String,
      message: json['data']['message'] as String, 
    );
  }
}