import 'package:astrology/models/astrologer/astrologer_category.dart';
import 'package:astrology/models/astrologer/astrologer_language.dart';

class Astrologer {
  int? id;
  int? user;
  String? profilePicture;
  String? fullname;
  String? gender;
  int? birthPlace;
  String? birthDate;
  String? birthTime;
  List<AstrologerLanguage>? language;
  List<AstrologerCategory>? category;
  int? yearsOfExperience;
  String? bio;
  double? rateInPercentage;
  double? videoCallingRate;
  double? audioCallingRate;
  double? chatRate;
  List<String>? jyotishGallery;

  Astrologer(
    this.id,
    this.user,
    this.profilePicture,
    this.fullname,
    this.gender,
    this.birthPlace,
    this.birthDate,
    this.birthTime,
    this.language,
    this.category,
    this.yearsOfExperience,
    this.bio,
    this.rateInPercentage,
    this.videoCallingRate,
    this.audioCallingRate,
    this.chatRate,
    this.jyotishGallery,
  );

  factory Astrologer.fromJson(Map<String, dynamic> json) {
    return Astrologer(
      json['id'],
      json['user'],
      json['profile_picture'],
      json['fullname'],
      json['gender'],
      json['birth_place'],
      json['birth_date'],
      json['birth_time'],
      (json['language'] as List<dynamic>?)
              ?.map((e) => AstrologerLanguage.fromJson(e))
              .toList() ??
          [],
      (json['category'] as List<dynamic>?)
              ?.map((e) => AstrologerCategory.fromJson(e))
              .toList() ??
          [],
      json['years_of_experience'],
      json['bio'],
      json['rate_in_percentage'] as double?,
      json['video_calling_rate'] as double?,
      json['audio_calling_rate'] as double?,
      json['chat_rate'] as double?,
      (json['jyotish_gallary'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'profile_picture': profilePicture,
      'fullname': fullname,
      'gender': gender,
      'birth_place': birthPlace,
      'birth_date': birthDate,
      'birth_time': birthTime,
      'language': language?.map((e) => e.toJson()).toList() ?? [],
      'category': category?.map((e) => e.toJson()).toList() ?? [],
      'years_of_experience': yearsOfExperience,
      'bio': bio,
      'rate_in_percentage': rateInPercentage,
      'video_calling_rate': videoCallingRate,
      'audio_calling_rate': audioCallingRate,
      'chat_rate': chatRate,
      'jyotish_gallary': jyotishGallery,
    };
  }
}
