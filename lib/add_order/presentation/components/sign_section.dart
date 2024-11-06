import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';

import '../../../router/path_constants.dart';
import '../../../utils/app_colors.dart';
import '../bloc/add_order_bloc.dart';
import '../bloc/add_order_event.dart';

class SignSection extends StatelessWidget {
  const SignSection({super.key, required this.state});

  final AddOrderState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade400,
      child: Row(
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                context.pushNamed(PathConstants.signaturePage).then((value) {
                  if (value != null) {
                    context
                        .read<AddOrderBloc>()
                        .add(SignatureImageAdded(bytes: (value as Uint8List)));
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Text(
                  "Tap to sign",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(PathConstants.signaturePage).then((value) {
                if (value != null) {
                  context
                      .read<AddOrderBloc>()
                      .add(SignatureImageAdded(bytes: (value as Uint8List)));
                }
              });
            },
            child: SizedBox(
              height: 80,
              child: state.bytes != null
                  ? Image.memory(
                      state.bytes!,
                      height: 100,
                      width: 200,
                    )
                  : Container(
                      height: 100,
                      width: 200,
                      color: Colors.white,
                    ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {},
              child: const Icon(
                Icons.check,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
