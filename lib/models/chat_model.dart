import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  String messageContent;
  String messageType;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });

  @override
  List<Object?> get props => [
        messageContent,
        messageType,
      ];
}
