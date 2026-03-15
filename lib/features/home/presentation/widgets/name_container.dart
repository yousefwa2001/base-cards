import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/icon_label.dart';
import '../blocs/user_name_cubit/user_name_cubit.dart';

class NameContainer extends StatelessWidget {
  const NameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<UserNameCubit, String>(
        builder: (context, name) {
          return Container(
            width: 130.sp,
            height: 130.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(),
            ),
            child: Center(
              child: IconLabel(icon: const Icon(Icons.person), text: name),
            ),
          );
        },
      ),
    );
  }
}
