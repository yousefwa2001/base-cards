import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/di/locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_exception.dart';
import '../../../../core/dialogs/show_error_dialog.dart';
import '../../../../core/dialogs/show_success_dialog.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/storage/secure_storage_api.dart';
import '../../../../core/widgets/base_page.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../card_values/domain/entities/card_value_entity.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';
import '../blocs/add_card_bloc/add_card_bloc.dart';
import '../widgets/add_card_form.dart';

@RoutePage()
class AddCardPage extends StatefulWidget implements AutoRouteWrapper {
  final CardCategoryEntity category;
  final RegionEntity region;
  final CardValueEntity value;

  const AddCardPage({
    super.key,
    required this.category,
    required this.region,
    required this.value,
  });

  @override
  State<AddCardPage> createState() => _AddCardPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<AddCardBloc>(), child: this);
  }
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController cardCodeController = TextEditingController();
  final TextEditingController serialNumberController = TextEditingController();
  final TextEditingController expiryMonthController = TextEditingController();
  final TextEditingController expiryYearController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    cardCodeController.dispose();
    serialNumberController.dispose();
    expiryMonthController.dispose();
    expiryYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return BlocListener<AddCardBloc, AddCardState>(
      listener: (context, state) {
        if (state is AddCardSuccess) {
          showSuccessDialog(context: context, message: t.addCardSuccessTitle);
          cardCodeController.clear();
          serialNumberController.clear();
          expiryMonthController.clear();
          expiryYearController.clear();
        } else if (state is AddCardError) {
          String errorMessage = '';
          if (state.message.contains(AppException.codeAlreadyExists)) {
            errorMessage = t.cardCodeAlreadyExists;
          } else {
            errorMessage = state.message;
          }
          showErrorDialog(context: context, message: errorMessage);
        }
      },
      child: Stack(
        children: [
          BasePage(
            title: t.addCard,
            body: AddCardForm(
              cardCodeController: cardCodeController,
              serialNumberController: serialNumberController,
              expiryMonthController: expiryMonthController,
              expiryYearController: expiryYearController,
              formKey: _formKey,
            ),
          ),
          Positioned(
            bottom: 30.h,
            right: 25.w,
            child: BlocBuilder<AddCardBloc, AddCardState>(
              builder: (context, state) {
                return CustomButton(
                  text: t.addCard,
                  isLoading: state is AddCardLoading,
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) {
                      return;
                    }
                    context.read<AddCardBloc>().add(
                      AddCardRequested(
                        cardCode: cardCodeController.text,
                        serialNumber: serialNumberController.text,
                        category: widget.category,
                        expiryMonth: int.tryParse(expiryMonthController.text),
                        expiryYear: int.tryParse(expiryYearController.text),
                        region: widget.region,
                        value: widget.value,
                        uid: await getIt<SecureStorageApi>().getUid() ?? "",
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
