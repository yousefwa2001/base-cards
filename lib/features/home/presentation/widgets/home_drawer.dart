import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/di/locator.dart';
import 'package:base_cards/app/router/app_router.gr.dart';
import 'package:base_cards/core/storage/secure_storage_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/user_role_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/icon_label.dart';
import '../../domain/entities/card_category_entity.dart';
import '../../../../core/widgets/language_lable.dart';
import 'logout_lable.dart';
import 'name_container.dart';
import 'purchase_history_lable.dart';

class HomeDrawer extends StatelessWidget {
  final List<CardCategoryEntity> categories;
  const HomeDrawer({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return FutureBuilder(
      future: context.isSupplier,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const SizedBox();
        }
        final bool isSupplier = snapshot.data!;
        return Drawer(
          backgroundColor: AppColors.whiteOut,
          width: 240.w,
          child: Padding(
            padding: context.paddingSymmetric(vertical: 20.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.h,
              children: [
                // user name container
                const NameContainer(),
                // language lable
                const LanguageLable(),

                // purchase history
                if (isSupplier) ...[
                  // cards Inventory
                  IconLabel(
                    icon: const Icon(Icons.book_outlined),
                    text: t.cardsInventory,

                    onTap: () {
                      context.router.push(
                        CardsInventoryRoute(categories: categories),
                      );
                    },
                  ),
                  //shops
                  IconLabel(
                    icon: const Icon(Icons.add_shopping_cart),
                    text: t.shops,
                    onTap: () {
                      context.router.push(const ShopsRoute());
                    },
                  ),
                ] else ...[
                  const PurchaseHistoryLable(),
                  IconLabel(
                    icon: const Icon(Icons.wallet_membership_sharp),
                    text: t.transactions,
                    onTap: () async {
                      context.router.push(
                        TransactionsRoute(
                          shopId:
                              await getIt<SecureStorageApi>().getUid() ?? '',
                        ),
                      );
                    },
                  ),
                  IconLabel(
                    icon: const Icon(Icons.contact_phone_outlined),
                    text: t.contactUs,
                    onTap: () async {
                      context.router.push(const ContactUsRoute());
                    },
                  ),
                ],

                // logout
                const LogoutLable(),
              ],
            ),
          ),
        );
      },
    );
  }
}
