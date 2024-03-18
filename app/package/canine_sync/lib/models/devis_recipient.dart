import 'package:freezed_annotation/freezed_annotation.dart';

part 'devis_recipient.freezed.dart';
part 'devis_recipient.g.dart';

@freezed
class DevisRecipient with _$DevisRecipient {
  factory DevisRecipient({
    required String firstName,
    required String lastName,
    required String phone,
    String? email,
  }) = _DevisRecipient;

  factory DevisRecipient.fromJson(Map<String, dynamic> json) =>
      _$DevisRecipientFromJson(json);
}
