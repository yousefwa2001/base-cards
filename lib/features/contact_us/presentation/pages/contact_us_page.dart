import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';

import 'package:base_cards/core/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/contact_item.dart';
import '../widgets/contact_card.dart';
import '../widgets/header_card.dart';

@RoutePage()
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    const contacts = [
      ContactItem(name: "Yousef", phone: "0795940651"),
      ContactItem(name: "Mohammed", phone: "0798589041"),
    ];

    return BasePage(
      title: t.contactUs,
      body: Column(
        children: [
          HeaderCard(
            title: t.quickContacts,
            subtitle: t.tapAContactToCopyTheNumber,
          ),
          SizedBox(height: 14.h),
          ...contacts.map(
            (c) => Padding(
              padding: context.paddingDir(bottom: 12),
              child: ContactCard(item: c),
            ),
          ),
        ],
      ),
    );
  }
}
