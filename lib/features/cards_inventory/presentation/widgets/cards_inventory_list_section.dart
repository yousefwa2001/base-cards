import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/l10n_extension.dart';
import '../../../cards/domain/entities/card_entity.dart';
import '../bloc/cards_inventory_bloc.dart';
import 'available_cards_summary.dart';
import 'card_inventory_container.dart';

class CardsInventoryListSection extends StatelessWidget {
  const CardsInventoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return BlocBuilder<CardsInventoryBloc, CardsInventoryState>(
      builder: (invContext, state) {
        if (state is CardsInventoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CardsInventoryError) {
          return Center(child: Text(state.message));
        }

        if (state is CardsInventoryEmpty) {
          return Center(child: Text(t.noCardsFound));
        }

        if (state is CardsInventorySuccess) {
          final category = state.category;
          final region = state.region;
          final value = state.value;
          final availableCount = state.cards.where((e) => !e.isSold).length;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.h,
            children: [
              AvailableCardsSummary(
                availableCount: availableCount,
                category: category,
                region: region,
                value: value,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.cards.length,
                separatorBuilder: (_, _) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final CardEntity card = state.cards[index];
                  final bool sold = card.isSold;

                  return CardInventoryContainer(card: card, sold: sold);
                },
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
