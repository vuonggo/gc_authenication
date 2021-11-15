import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc_authenication/generated_images.dart';
import 'package:gc_authenication/l10n/generated/l10n.dart';
import 'package:gc_authenication/src/policy_screen.dart';
import 'package:phone_number/phone_number.dart';
import 'package:gc_core/gc_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authenication_bloc/authenication_bloc.dart';

class _F {
  static const username = 'username';
}

final _formKey = GlobalKey<FormBuilderState>();
final _phoneNumberField = GlobalKey<FormBuilderFieldState>();

class PhoneNumberForm extends StatelessWidget {
  final VoidCallback? pressBack;
  final VoidCallback? pressFlags;
  final bool isModal;
  const PhoneNumberForm(
      {Key? key, this.pressBack, this.pressFlags, this.isModal = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewPadding.bottom;
    var seperate = const SizedBox(
      height: 24,
    );
    return BlocBuilder<AuthenicationBloc, AuthenicationState>(
        builder: (context, state) {
      var countryCode = state.selectedCountryCode!;
      return FormBuilder(
          key: _formKey,
          child: SafeArea(
            top: false,
            bottom: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.of(context).sign_up,
                          style: CoreAppTheme.of(context).textTheme.headline4,
                        )),
                    if (!isModal)
                      Container(
                        padding: const EdgeInsets.only(
                            top: AppConsts.kDefaultPadding / 2),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.current.plsSignUpByMobile,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorCategoryNews),
                        ),
                      ),
                    seperate,
                    Container(
                        constraints: const BoxConstraints(minHeight: 56),
                        child: SingleTextField(
                          autofocus: true,
                          key: _phoneNumberField,
                          placeholder: S.of(context).enterMobile,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8.5),
                              prefixIconConstraints:
                                  BoxConstraints.tight(const Size(60, 30)),
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  var hasFocus = _formKey
                                          .currentState
                                          ?.fields[_F.username]
                                          ?.effectiveFocusNode
                                          ?.hasFocus ??
                                      false;
                                  if (!hasFocus) {
                                    return;
                                  }
                                  pressFlags?.call();
                                },
                                child: Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                            color: AppColors.rowHighLightColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            Text(
                                              countryCode.flag,
                                              style:
                                                  const TextStyle(fontSize: 25),
                                            ),
                                            SvgPicture.asset(
                                              Ic.arrowDown,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              )),
                          maxLength: 50,
                          keyboardType: const TextInputType.numberWithOptions(),
                          name: _F.username,
                          validator: Validator.required(context),
                        )),
                  ],
                ),
                if (!isModal) Expanded(child: Container()),
                seperate,
                if (isModal)
                  _buildButton(context, state)
                else
                  _buildLoginText(context, state),
                seperate,
                if (isModal)
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    alignment: Alignment.bottomCenter,
                    child: _policy(context),
                  ),
                if (isModal)
                  _buildLoginText(context, state)
                else
                  _buildButton(context, state),
                if (bottom != 0)
                  const SizedBox(height: AppConsts.kDefaultPadding)
              ],
            ),
          ));
    });
  }

  Widget _buildButton(BuildContext context, AuthenicationState state) {
    return ButtonContainer(
      icon: isModal ? null : Container(),
      isLoading: state.isLoading ?? false,
      text: Text(isModal ? S.of(context).next : S.current.sign_up),
      press: () {
        if (state.isLoading ?? false) {
          return;
        }
        onRegister(context);
      },
    );
  }

  Widget _buildLoginText(BuildContext context, AuthenicationState state) {
    return Container(
      height: 32,
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(S.of(context).had_a_account,
            style: CoreAppTheme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.midGrey, fontSize: 13)),
        TextButton(
            onPressed: () {
              onBack();
            },
            child: Text(
              S.of(context).login,
              style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  height: 1.1),
            ))
      ]),
    );
  }

  Widget _policy(BuildContext context) {
    final textSpans = <InlineSpan>[];
    final text = S.of(context).policy('#a', '#b');
    final regex = RegExp(r'\#(\w+)|@(\w+)');
    final Iterable<Match> matches = regex.allMatches(text);
    var style = CoreAppTheme.of(context).textTheme.bodyText2!.copyWith(
        fontSize: 13 * MediaQuery.of(context).textScaleFactor,
        color: AppColors.grey,
        fontWeight: FontWeight.w400);
    var start = 0;
    for (final match in matches) {
      textSpans.add(TextSpan(text: text.substring(start, match.start)));
      if (match.group(1) == 'a') {
        textSpans.add(WidgetSpan(
            child: GestureDetector(
                onTap: () => {PolicyScreen.show(context)},
                child: Text(S.of(context).rules,
                    style: style.copyWith(
                        decoration: TextDecoration.underline)))));
      } else if (match.group(1) == 'b') {
        textSpans.add(TextSpan(text: S.of(context).galaxyCare, style: style));
      }

      start = match.end;
    }
    textSpans.add(TextSpan(text: text.substring(start, text.length)));
    return Text.rich(
      TextSpan(children: textSpans),
      style: style,
      textAlign: TextAlign.center,
    );
  }

  void onRegister(BuildContext context) async {
    var validated = _formKey.currentState?.validate() ?? false;
    if (validated == false) {
      return;
    }
    var state = context.read<AuthenicationBloc>().state.selectedCountryCode!;
    if (validated) {
      var phoneNumber = _phoneNumberField.currentState?.value ?? '';
      var isValid =
          await PhoneNumberUtil().validate(phoneNumber ?? '', state.code);
      if (isValid) {
        var phone =
            await PhoneNumberUtil().parse(phoneNumber, regionCode: state.code);
        context.read<AuthenicationBloc>().add(RequestOTPAction(
            phone: phone.e164.replaceFirst('+', ''),
            callback: (error) {
              if (error != null) {
                Popup.showError(context, message: error);
              } else {
                checkOTP();
              }
            }));
      } else {
        _phoneNumberField.currentState?.invalidate(S.current.invalidPhone);
      }
    }
  }

  void checkOTP() {
    getIt
        .get<NavigationService>()
        .goTo(deeplink: DeeplinkConstant.otp, arguments: isModal);
  }

  void onBack() {
    pressBack?.call();
    //getIt.get<NavigationService>().goback();
  }
}
