import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SendField extends StatelessWidget {
  const SendField({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5E5EA),
            ),
          ),
        ),
        child: Stack(
          children: [
            TextField(
              // focusNode: context.read<ChatController>().focusNode,
              // onChanged: context.read<ChatController>().onFieldChanged,
              // controller: context.read<ChatController>().textEditingController,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
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
                icon: SvgPicture.asset(
                  "assets/icons/send.svg",
                  // colorFilter: ColorFilter.mode(
                  //   context.select<ChatController, bool>(
                  //           (value) => value.isTextFieldEnable)
                  //       ? const Color(0xFF007AFF)
                  //       : const Color(0xFFBDBDC2),
                  //   BlendMode.srcIn,
                  // ),
                ),
                onPressed:
                    null, //context.read<ChatController>().onFieldSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
