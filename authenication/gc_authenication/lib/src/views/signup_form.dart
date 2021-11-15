import 'package:flutter/material.dart';
import 'package:authenication_bloc/authenication_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc_authenication/l10n/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_authenication/src/views/phonenumber_form.dart';
import 'package:gc_core/gc_core.dart';
import 'package:gc_core/styles/styles.dart';
import '../../generated_images.dart';

class SignupForm extends StatefulWidget {
  final VoidCallback press;
  final bool autoFocus;
  final VoidCallback? pressTextField;
  final VoidCallback? pressedSignUp;
  final VoidCallback? pressFlags;
  final GlobalKey<FormBuilderState>? formKey;
  final bool isModal;
  final bool isSignup;
  const SignupForm(
      {Key? key,
      required this.press,
      this.autoFocus = false,
      this.pressTextField,
      this.pressedSignUp,
      this.pressFlags,
      this.formKey,
      this.isModal = false,
      this.isSignup = false})
      : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _isLogin = true;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _isLogin = !widget.isSignup;
  }

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewPadding.bottom;
    var showKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocBuilder<AuthenicationBloc, AuthenicationState>(
        builder: (context, state) {
      var countryCode = state.selectedCountryCode!;
      var seperate = const SizedBox(
        height: 24,
      );
      return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          padding: EdgeInsets.only(
              top: AppConsts.kDefaultPadding,
              left: AppConsts.kDefaultPadding,
              right: AppConsts.kDefaultPadding,
              bottom: bottom != 0 ? 0 : AppConsts.kDefaultPadding),
          child: _isLogin
              ? SafeArea(
                  top: false,
                  bottom: true,
                  child: Column(
                    mainAxisAlignment: widget.isModal
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.of(context).login,
                          style: CoreAppTheme.of(context).textTheme.headline4,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: AppConsts.kDefaultPadding / 2),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.isModal
                              ? S.of(context).plsLoginToUseThisFeature
                              : S.current.plsLoginByMobile,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorCategoryNews),
                        ),
                      ),
                      seperate,
                      Column(
                        children: [
                          Container(
                              constraints: const BoxConstraints(
                                minHeight: 56,
                              ),
                              child: SingleTextField(
                                autofocus: true,
                                placeholder: S.current.enterMobile,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8.5),
                                  prefixIconConstraints:
                                      BoxConstraints.tight(const Size(60, 30)),
                                  prefixIcon: GestureDetector(
                                    onTap: () {
                                      var hasFocus = widget
                                              .formKey
                                              ?.currentState
                                              ?.fields['username']
                                              ?.effectiveFocusNode
                                              ?.hasFocus ??
                                          false;
                                      if (!hasFocus) {
                                        return;
                                      }
                                      widget.pressFlags?.call();
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.rowHighLightColor,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              children: [
                                                Text(
                                                  countryCode.flag,
                                                  style: const TextStyle(
                                                      fontSize: 25),
                                                ),
                                                SvgPicture.asset(
                                                  Ic.arrowDown,
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                maxLength: 50,
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                name: 'username',
                                validator: Validator.required(context),
                              )),
                          const SizedBox(height: AppConsts.kDefaultPadding / 2),
                          Container(
                              constraints: const BoxConstraints(
                                minHeight: 56,
                              ),
                              child: Stack(
                                children: [
                                  SingleTextField(
                                    onSubmitted: (text) {
                                      widget.press();
                                    },
                                    decoration: InputDecoration(
                                        suffixIconConstraints:
                                            BoxConstraints.tight(
                                                const Size(30, 20)),
                                        suffixIcon: Container(),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 8.5)),
                                    name: 'password',
                                    placeholder: S.of(context).password,
                                    obscureText: !_showPassword,
                                    validator: Validator.required(context),
                                  ),
                                  Positioned(
                                      right: AppConsts.kDefaultPadding,
                                      top: 15,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _showPassword = !_showPassword;
                                          });
                                        },
                                        child: Icon(
                                            _showPassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: _showPassword
                                                ? Colors.grey
                                                : Colors.black),
                                      ))
                                ],
                              )),
                        ],
                      ),
                      if (!widget.isModal) Expanded(child: Container()),
                      seperate,
                      if (widget.isModal)
                        _buildButton(context, state)
                      else
                        _buildSignupText(context, state),
                      seperate,
                      if (widget.isModal)
                        _buildSignupText(context, state)
                      else
                        Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  showKeyboard ? AppConsts.kDefaultPadding : 0),
                          child: _buildButton(context, state),
                        )
                    ],
                  ))
              : PhoneNumberForm(
                  isModal: widget.isModal,
                  pressFlags: widget.pressFlags,
                  pressBack: () {
                    setState(() {
                      _isLogin = true;
                    });
                  },
                ));
    });
  }

  Widget _buildButton(BuildContext context, AuthenicationState state) {
    return BlocBuilder<AuthenicationBloc, AuthenicationState>(
      builder: (context, patientState) {
        return ButtonContainer(
          icon: widget.isModal ? null : Container(),
          isLoading: state.isLoading ?? false,
          text: Text(widget.isModal ? S.of(context).next : S.of(context).login),
          press: () {
            if (state.isLoading ?? false) {
              return;
            }
            widget.press();
          },
        );
      },
    );
  }

  Widget _buildSignupText(BuildContext context, AuthenicationState state) {
    return Container(
      height: 32,
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(S.of(context).no_account,
            style: CoreAppTheme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.midGrey, fontSize: 13)),
        BlocBuilder<AuthenicationBloc, AuthenicationState>(
          builder: (context, patientState) {
            return TextButton(
                onPressed: () {
                  if (patientState.isLoading ?? false) {
                    return;
                  }
                  setState(() {
                    _isLogin = false;
                  });
                },
                child: Text(
                  S.of(context).sign_up,
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      height: 1.1),
                ));
          },
        )
      ]),
    );
  }
}
