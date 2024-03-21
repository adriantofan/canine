import 'package:app/messages/bloc/draft_conversation_cubit.dart';
import 'package:app/messages/bloc/send_bloc.dart';
import 'package:app/messages/model/draft_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class SendWidget extends StatelessWidget {
  final DraftMessage? message;
  SendWidget(this.message) : super(key: ValueKey(message));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendBloc(),
      child: const _SendField(),
    );
  }
}

class _SendField extends StatefulWidget {
  const _SendField();

  @override
  State<_SendField> createState() => _SendFieldState();
}

class _SendFieldState extends State<_SendField> {
  late final TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
    _inputController.addListener(() {
      context.read<SendBloc>().add(
            SendEvent.textChanged(_inputController.text),
          );
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        width: double.infinity,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(
              color: Color(0xFFE5E5EA),
            ),
          ),
          color: themeData.colorScheme.onInverseSurface,
        ),
        child: BlocConsumer<SendBloc, SendState>(
          buildWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state.status == FormzSubmissionStatus.success) {
              _inputController.clear();
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                TextField(
                  minLines: 1,
                  maxLines: 4,
                  textAlignVertical: TextAlignVertical.top,
                  controller: _inputController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      right: 42,
                      left: 16,
                      top: 18,
                    ),
                    hintText: 'message',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                // custom suffix btn
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: state.status == FormzSubmissionStatus.inProgress
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          )
                        : SvgPicture.asset(
                            "assets/icons/send.svg",
                            // colorFilter: ColorFilter.mode(
                            //   context.select<ChatController, bool>(
                            //           (value) => value.isTextFieldEnable)
                            //       ? const Color(0xFF007AFF)
                            //       : const Color(0xFFBDBDC2),
                            //   BlendMode.srcIn,
                            // ),
                          ),
                    onPressed: state.isValid &&
                            state.status != FormzSubmissionStatus.inProgress
                        ? () {
                            context.read<SendBloc>().add(
                                  SendEvent.send(context
                                      .read<DraftConversationCubit>()
                                      .sendMessage),
                                );
                          }
                        : null, //context.read<ChatController>().onFieldSubmitted,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
