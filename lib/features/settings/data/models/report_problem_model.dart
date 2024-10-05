class ProblemResponse {
  final String message;
  final Problem problem;

  ProblemResponse({
    required this.message,
    required this.problem,
  });

  factory ProblemResponse.fromJson(Map<String, dynamic> json) {
    return ProblemResponse(
      message: json['message'],
      problem: Problem.fromJson(json['problem']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'problem': problem.toJson(),
    };
  }
}

class Problem {
  final String description;
  final String? image;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  Problem({
    required this.description,
    this.image,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      description: json['discreption'],
      image: json['image'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'discreption': description,
      'image': image,
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'id': id,
    };
  }
}
