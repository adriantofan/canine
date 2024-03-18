import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_client_message.freezed.dart';
part 'api_client_message.g.dart';

@Freezed(unionKey: 'kind', unionValueCase: FreezedUnionCase.pascal)
class ClientMessage with _$ClientMessage {
  const factory ClientMessage() = ClientMessageInvalid;

  @FreezedUnionValue('sync')
  const factory ClientMessage.sync() = SyncMessage;

  factory ClientMessage.fromJson(Map<String, dynamic> json) =>
      _$ClientMessageFromJson(json);
}

//TODO: write tests for all cases to not break the contract
