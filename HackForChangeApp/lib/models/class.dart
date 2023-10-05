// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Class {
  final String theme;
  final String mentorName;
  final String schoolYear;
  final String day;
  final String hour;

  Class({
    required this.theme,
    required this.mentorName,
    required this.schoolYear,
    required this.day,
    required this.hour,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'theme': theme,
      'mentorName': mentorName,
      'schoolYear': schoolYear,
      'day': day,
      'hour': hour,
    };
  }

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
      theme: map['theme'] as String,
      mentorName: map['mentorName'] as String,
      schoolYear: map['schoolYear'] as String,
      day: map['day'] as String,
      hour: map['hour'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Class.fromJson(String source) =>
      Class.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Class(theme: $theme, mentorName: $mentorName, schoolYear: $schoolYear, day: $day, hour: $hour)';
  }
}
