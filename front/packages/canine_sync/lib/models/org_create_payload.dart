import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_create_payload.freezed.dart';
part 'org_create_payload.g.dart';

@freezed
class OrgCreatePayload with _$OrgCreatePayload {
  const factory OrgCreatePayload({
    required String name,
    required String email,
    required String phone,
    required String firstName,
    required String lastName,
    required String password,
  }) = _WorkspaceCreatePayload;

  factory OrgCreatePayload.fromJson(Map<String, dynamic> json) =>
      _$OrgCreatePayloadFromJson(json);
}
