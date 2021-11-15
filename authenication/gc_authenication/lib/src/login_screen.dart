import 'package:authenication_bloc/authenication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gc_authenication/l10n/generated/l10n.dart';
import 'package:gc_authenication/src/views/signup_form.dart';
import 'package:gc_core/gc_core.dart';
import 'package:phone_number/phone_number.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authenication_repository/entities/country_code/country_code_entity.dart';
import '../gc_authenication.dart';

final _formKey = GlobalKey<FormBuilderState>();

class LoginScreen extends StatelessWidget {
  final bool isModal;
  final bool isSignup;
  const LoginScreen({Key? key, this.isModal = false, this.isSignup = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isModal ? _buildModal(context) : _buildScreen(context);
  }

  Widget _buildModal(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    final overlay = Positioned.fill(
      child: GestureDetector(
        onTap: () => pressedOutside(context),
        child: Container(
          color: Colors.black38,
        ),
      ),
    );
    return Stack(
      children: [
        Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              toolbarHeight: 0,
              automaticallyImplyLeading: !isModal,
              iconTheme: Theme.of(context)
                  .appBarTheme
                  .iconTheme
                  ?.copyWith(color: Colors.black),
            ),
            body: Container(
              padding: EdgeInsets.only(
                  top: AppConsts.kDefaultPadding, bottom: bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Stack(
                        children: [overlay],
                      )),
                  Stack(children: [
                    overlay,
                    FormBuilder(
                        key: _formKey,
                        child: SignupForm(
                          isModal: isModal,
                          formKey: _formKey,
                          pressFlags: () {
                            pressFlags(context);
                          },
                          press: () => requestLogin(context),
                        ))
                  ])
                ],
              ),
            )),
        Container(
          height: AppConsts.kDefaultPadding,
          color: Colors.black38,
        )
      ],
    );
  }

  Widget _buildScreen(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: Theme.of(context)
              .appBarTheme
              .iconTheme
              ?.copyWith(color: Colors.black),
        ),
        body: Container(
          padding:
              EdgeInsets.only(top: AppConsts.kDefaultPadding, bottom: bottom),
          child: FormBuilder(
              key: _formKey,
              child: SignupForm(
                isModal: isModal,
                isSignup: isSignup,
                formKey: _formKey,
                pressFlags: () {
                  pressFlags(context);
                },
                press: () => requestLogin(context),
              )),
        ));
  }

  void pressedOutside(BuildContext context) {
    if (isModal) {
      getIt.get<NavigationService>().goback();
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      _formKey.currentState?.reset();
    }
  }

  void requestLogin(BuildContext context) async {
    var state = context.read<AuthenicationBloc>().state;
    var validated = _formKey.currentState?.validate() ?? false;
    if (validated == false) {
      return;
    }
    String username = _formKey.currentState?.fields['username']?.value;
    String password = _formKey.currentState?.fields['password']?.value;
    var isValid = await PhoneNumberUtil()
        .validate(username, state.selectedCountryCode!.code);
    if (isValid) {
      var phone = await PhoneNumberUtil()
          .parse(username, regionCode: state.selectedCountryCode!.code);
      signIn(context,
          username: phone.e164.replaceFirst('+', ''), password: password);
    } else {
      _formKey.currentState?.invalidateField(
          name: 'username', errorText: S.current.invalidPhone);
    }
  }

  void pressFlags(BuildContext context) async {
    var state = context.read<AuthenicationBloc>().state;
    var items = state.countryCode
        .map((e) => GeoBottomItem(text: e.name, value: e))
        .toList();
    var item = await GeoBottomSheet.show<CountryCodeEntity>(context,
        items: items,
        title: S.current.chooseCountry,
        showSearchBar: true,
        builder: (item) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConsts.kDefaultPadding, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.value.flag,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: AppConsts.kDefaultPadding / 2),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${item.text} (${item.value.dialCode})',
                          maxLines: 2,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: AppConsts.kDefaultPadding,
                ),
              ],
            )));
    if (item != null) {
      context.read<AuthenicationBloc>().add(SelectCountryCode(item: item));
    }
  }
}
