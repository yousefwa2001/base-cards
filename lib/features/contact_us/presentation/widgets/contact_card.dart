import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/contact_item.dart';
import 'avatar.dart';
import 'icon_btn.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.item});
  final ContactItem item;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: item.phone));
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("${t.copied}: ${item.phone}")));
        }
      },
      child: Container(
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: AppColors.whiteOut,
          borderRadius: BorderRadius.circular(16.r),

          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              offset: const Offset(0, 6),
              color: Colors.black.withValues(alpha: .06),
            ),
          ],
        ),
        child: Row(
          children: [
            Avatar(initials: _initials(item.name)),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.semiBold16(color: AppColors.black),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    item.phone,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.semiBold16(color: AppColors.black),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            IconBtn(
              icon: Icons.copy_rounded,
              tooltip: t.copy,
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: item.phone));
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(t.copied)));
                }
              },
            ),
            SizedBox(width: 8.w),
            IconBtn(
              icon: FontAwesomeIcons.whatsapp,
              iconColor: AppColors.green,
              tooltip: 'WhatsApp',
              onTap: () async {
                final phone = item.phone.replaceFirst(RegExp(r'^0'), '+962');

                final uri = Uri.parse('https://wa.me/$phone');

                if (!await launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw 'Could not open WhatsApp for $phone';
                }
              },
            ),
            SizedBox(width: 8.w),
            IconBtn(
              icon: Icons.phone_rounded,
              tooltip: t.call,
              onTap: () async {
                final uri = Uri.parse('tel:${item.phone}');

                if (!await launchUrl(uri)) {
                  throw 'Could not call ${item.phone}';
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r"\s+"));
    if (parts.isEmpty) return "?";
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts[0].substring(0, 1) + parts[1].substring(0, 1)).toUpperCase();
  }
}
