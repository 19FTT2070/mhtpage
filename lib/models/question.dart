import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Question {
  final String id;
  final String question;
  final List<String> options;
  final String highlightOption;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.highlightOption,
  });

  Question copyWith({
    String? id,
    String? question,
    List<String>? options,
    String? highlightOption,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      highlightOption: highlightOption ?? this.highlightOption,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'highlightOption': highlightOption,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      question: map['question'],
      options: List<String>.from(map['options']),
      highlightOption: map['highlightOption'],
    );
  }

  factory Question.fromQueryDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final id = snapshot.id;
    data['id'] = id;
    return Question.fromMap(data);
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(id: $id, question: $question, options: $options, highlightOption: $highlightOption)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.id == id &&
        other.question == question &&
        listEquals(other.options, options) &&
        other.highlightOption == highlightOption;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    question.hashCode ^
    options.hashCode ^
    highlightOption.hashCode;
  }
}

// List<Question> question = [
//   Question(
//     id: '1',
//     question: 'I feel like I am watching myself and not being present',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '2',
//     question: 'I have been sleeping a lot',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '3',
//     question: 'I have been feeling restless',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '4',
//     question: 'I have difficulties remembering important appointments',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '5',
//     question: 'I cannot focus on simple tasks',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '6',
//     question: 'I lost interest in activities I enjoy',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '7',
//     question: 'I am indecisive',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '8',
//     question: 'I have trouble sleeping',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '9',
//     question: 'I feel overwhelmed doing my tasks',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
//   Question(
//     id: '10',
//     question: 'I feel worthless',
//     options: ['Never', 'Rarely', 'Often', 'Very Often'],
//     highlightOption: 'Never',
//   ),
// ];