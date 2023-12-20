class GptResponse {
  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;

  GptResponse(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required this.choices});

  factory GptResponse.fromJson(Map<String, dynamic> json) {
    return GptResponse(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices:
          (json['choices'] as List).map((i) => Choice.fromJson(i)).toList(),
    );
  }
}

class Choice {
  int index;
  Messages message;
  String finishReason;

  Choice(
      {required this.index, required this.message, required this.finishReason});

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      index: json['index'],
      message: Messages.fromJson(json['message']),
      finishReason: json['finish_reason'],
    );
  }
}

class Messages {
  String role;
  String content;

  Messages({required this.role, required this.content});

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      role: json['role'],
      content: json['content'],
    );
  }
}
