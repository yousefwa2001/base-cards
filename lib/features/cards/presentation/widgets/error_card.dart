import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/l10n_extension.dart';

class ErrorCard extends StatelessWidget {
  final String message;

  const ErrorCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.red.withValues(alpha: 0.07),
        border: Border.all(color: Colors.red.withValues(alpha: 0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error_outline, size: 20.sp, color: Colors.redAccent),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              message.isNotEmpty
                  ? localaizionMessage(context: context, message: message)
                  : context.l10n.unexpectedError,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String localaizionMessage({
    required BuildContext context,
    required String message,
  }) {
    final t = context.l10n;
    switch (message) {
      case 'insufficient-balance':
        return t.errInsufficientBalance;
      case 'no-cards':
        return t.errNoCards;
      case 'already-sold':
        return t.errAlreadySold;
      case 'invalid-card':
        return t.errInvalidCard;
      default:
        return t.unexpectedError;
    }
  }
}
