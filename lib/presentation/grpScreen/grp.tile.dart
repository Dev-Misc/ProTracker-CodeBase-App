import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scretask/app/constants/app.colors.dart';
import 'package:scretask/presentation/widgets/snackbar.widget.dart';

Widget grpTile(
    {required BuildContext context,
    required String name,
    required String desc}) {
  return GestureDetector(
    onTap: () 
    {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackUtil.stylishSnackBar(
          text: "Something Went Wrong",
          context: context,
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(
        color: AppColors.backColorList[Random().nextInt(
          AppColors.backColorList.length,
        )],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            desc,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}
