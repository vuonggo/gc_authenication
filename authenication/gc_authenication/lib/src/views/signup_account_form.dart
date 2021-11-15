import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gc_authenication/gc_authenication.dart';
import 'package:gc_authenication/l10n/generated/l10n.dart';
import 'package:gc_core/gc_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_core/widgets/form/button_form_container.dart';
import 'package:authenication_bloc/authenication_bloc.dart';

class _F {
  static const username = 'username';
  static const password = 'password';
  static const rePassword = 're_password';
}

final _formKey = GlobalKey<FormBuilderState>();

class SignUpAccountForm extends StatefulWidget {
  const SignUpAccountForm({Key? key}) : super(key: key);

  @override
  _SignUpAccountFormState createState() => _SignUpAccountFormState();
}

class _SignUpAccountFormState extends State<SignUpAccountForm> {
  bool _showPassword = false;
  bool _showRepeatPassword = false;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(bottom: 8.0);
    const paddingSession = EdgeInsets.only(
        top: 16,
        left: AppConsts.kDefaultPadding,
        right: AppConsts.kDefaultPadding);
    const passwordRegEx = r'^(?=.*?[A-Z]).{8,}$';

    return BlocBuilder<AuthenicationBloc, AuthenicationState>(
        builder: (context, state) {
      return FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Container(
                      margin: paddingSession,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).createPassword,
                        style: CoreAppTheme.of(context).textTheme.headline4,
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          left: AppConsts.kDefaultPadding),
                      alignment: Alignment.centerLeft,
                      child: Text(S.of(context).limitPassword,
                          style: const TextStyle(
                              color: AppColors.colorCategoryNews,
                              fontWeight: FontWeight.w400))),
                  const SizedBox(
                    height: AppConsts.kDefaultPadding,
                  ),
                  Padding(
                    padding: paddingSession,
                    child: Column(
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minHeight: 56,
                          ),
                          padding: padding,
                          child: Stack(
                            children: [
                              SingleTextField(
                                textInputAction: TextInputAction.next,
                                placeholder: S.of(context).password,
                                name: _F.password,
                                obscureText: !_showPassword,
                                maxLength: 50,
                                textAlignVertical: TextAlignVertical.top,
                                onTap: () {},
                                decoration: InputDecoration(
                                    suffixIconConstraints: BoxConstraints.tight(
                                        const Size(30, 20)),
                                    suffixIcon: Container(),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8.5)),
                                validator: FormBuilderValidators.compose(
                                  [
                                    Validator.required(context),
                                    FormBuilderValidators.match(
                                        context, passwordRegEx,
                                        errorText: S
                                            .of(context)
                                            .password_validate_msg),
                                  ],
                                ),
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
                          ),
                        ),
                        Container(
                            constraints: const BoxConstraints(
                              minHeight: 56,
                            ),
                            child: Stack(children: [
                              SingleTextField(
                                  onSubmitted: (_) {
                                    if (state.isLoading ?? false) {
                                      return;
                                    }
                                    onRegister(context);
                                  },
                                  placeholder: S.of(context).retype_password,
                                  name: _F.rePassword,
                                  obscureText: !_showRepeatPassword,
                                  textInputAction: TextInputAction.done,
                                  maxLength: 50,
                                  decoration: InputDecoration(
                                      suffixIconConstraints:
                                          BoxConstraints.tight(
                                              const Size(30, 20)),
                                      suffixIcon: Container(),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8.5)),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      Validator.required(context),
                                      (val) {
                                        var password = _formKey.currentState
                                                ?.fields['password']?.value ??
                                            '';
                                        if (val != password) {
                                          return S
                                              .of(context)
                                              .repassword_validate_msg;
                                        } else {
                                          return null;
                                        }
                                      }
                                    ],
                                  )),
                              Positioned(
                                  right: AppConsts.kDefaultPadding,
                                  top: 15,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showRepeatPassword =
                                            !_showRepeatPassword;
                                      });
                                    },
                                    child: Icon(
                                        _showRepeatPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: _showRepeatPassword
                                            ? Colors.grey
                                            : Colors.black),
                                  ))
                            ])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            SafeArea(
              child: Padding(
                  padding: AppConsts.kMarginAll,
                  child: ButtonFormContainer(
                    icon: Container(),
                    isLoading: state.isLoading ?? false,
                    text: Text(S.of(context).complete),
                    press: () {
                      if (state.isLoading ?? false) {
                        return;
                      }
                      onRegister(context);
                    },
                  )),
            )
          ],
        ),
      );
    });
  }

  void onRegister(BuildContext context) {
    var validated = _formKey.currentState?.validate() ?? false;
    if (validated == false) {
      return;
    }
    if (validated) {
      var password = _formKey.currentState?.fields['password']?.value ?? '';
      context.read<AuthenicationBloc>().add(RegisterAction(
          password: password,
          callback: (error) {
            if (error != null) {
              Popup.showError(context, message: error);
            } else {
              requestLogin(context);
            }
          }));
    }
  }

  void requestLogin(BuildContext context) {
    var state = context.read<AuthenicationBloc>().state;
    var password = _formKey.currentState?.fields['password']?.value ?? '';
    signIn(
      context,
      username: state.phoneNumber,
      password: password,
    );
  }
}
