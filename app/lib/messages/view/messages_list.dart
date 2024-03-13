import 'package:app/messages/bloc/messages_bloc.dart';
import 'package:app/messages/view/send_widget.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../conversations/model/conversation_info.dart';
import '../../repository/repository.dart';
import 'message_row.dart';

class MessagesList extends StatefulWidget {
  final ConversationInfo _conversationInfo;

  const MessagesList(
    this._conversationInfo, {
    super.key,
  });

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  late MessagesBloc _bloc;
  final _listenable = IndicatorStateListenable();
  late EasyRefreshController _controller;

  bool _shrinkWrap = false;
  double? _viewportDimension;

  @override
  void initState() {
    super.initState();
    _bloc =
        MessagesBloc(context.read<SyncRepository>(), widget._conversationInfo)
          ..add(const MessagesEvent.started());
    _listenable.addListener(_onHeaderChange);
    _controller = EasyRefreshController(
        controlFinishLoad: true, controlFinishRefresh: true);
  }

  @override
  void dispose() {
    _listenable.removeListener(_onHeaderChange);
    _bloc.close();
    _controller.dispose();
    super.dispose();
  }

  void _onHeaderChange() {
    final state = _listenable.value;
    if (state != null) {
      final position = state.notifier.position;
      _viewportDimension ??= position.viewportDimension;
      final shrinkWrap = state.notifier.position.maxScrollExtent == 0;
      if (_shrinkWrap != shrinkWrap &&
          _viewportDimension == position.viewportDimension) {
        setState(() {
          _shrinkWrap = shrinkWrap;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BlocProvider(
      create: (context) => _bloc,
      child: Column(
        children: [
          Expanded(
              child: BlocConsumer<MessagesBloc, MessagesState>(
            listener: (context, state) {
              switch (state.syncState?.startStatus) {
                case RemoteDataStatusUndetermined():
                case null:
                  _controller.finishLoad(IndicatorResult.none);
                case RemoteDataStatusLoading():
                  _controller.callLoad();
                case RemoteDataStatusComplete():
                  _controller.finishLoad(IndicatorResult.noMore);
                case RemoteDataStatusFailed():
                  _controller.finishLoad(IndicatorResult.fail);
              }
            },
            builder: (context, state) {
              return EasyRefresh(
                controller: _controller,
                clipBehavior: Clip.none,
                onLoad: () {
                  context
                      .read<MessagesBloc>()
                      .add(const MessagesEvent.loadPast());
                },
                onRefresh: () {},
                // Actually on the bottom because list is reversed
                header: ListenerHeader(
                  listenable: _listenable,
                  triggerOffset: 100000,
                  clamping: false,
                ),
                // Actually on the top because list is reversed
                footer: const ClassicFooter(
                  triggerOffset: 50,
                  clamping: false,
                  position: IndicatorPosition.above,
                  infiniteOffset: null,
                  processedDuration: Duration.zero,
                  dragText: 'Pull to load',
                  armedText: 'Release ready',
                  readyText: 'Loading...',
                  processingText: 'Loading...',
                  processedText: 'Succeeded',
                  noMoreText: 'No more',
                  failedText: 'Failed',
                  messageText: 'Last updated at %T',
                ),

                // BuilderFooter(
                //     triggerOffset: 40,
                //     clamping: false,
                //     position: IndicatorPosition.above,
                //     infiniteOffset: null,
                //     processedDuration: Duration.zero,
                //     builder: (context, state) {
                //       return Stack(
                //         children: [
                //           SizedBox(
                //             height: state.offset,
                //             width: double.infinity,
                //           ),
                //           Positioned(
                //             bottom: 0,
                //             left: 0,
                //             right: 0,
                //             child: Container(
                //               alignment: Alignment.center,
                //               width: double.infinity,
                //               height: 40,
                //               child: SpinKitCircle(
                //                 size: 24,
                //                 color: themeData.colorScheme.primary,
                //               ),
                //             ),
                //           )
                //         ],
                //       );
                //     }),
                child: CustomScrollView(
                    shrinkWrap: _shrinkWrap,
                    reverse: true,
                    clipBehavior: Clip.none,
                    slivers: [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (_, k) => MessageRow(chatMessage: state.messages[k]),
                        childCount: state.messages.length,
                      )),
                    ]),
              );
            },
          )),
          SendWidget(widget._conversationInfo.conversationId),
        ],
      ),
    );
  }
}
