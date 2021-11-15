import 'dart:async';
import 'package:authenication_bloc/authenication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_authenication/l10n/generated/l10n.dart';
import 'package:gc_core/gc_core.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _controller = TextEditingController();
  bool _submitted = false;
  @override
  Widget build(BuildContext context) {
    const vP = SizedBox(
      height: 24,
    );
    return BlocBuilder<AuthenicationBloc, AuthenicationState>(
        builder: (context, state) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            iconTheme: Theme.of(context)
                .appBarTheme
                .iconTheme
                ?.copyWith(color: Colors.black),
          ),
          body: SafeArea(
              child: Padding(
            padding: AppConsts.kMarginAll,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(S.of(context).confirm,
                          style: CoreAppTheme.of(context).textTheme.headline4),
                      Text(
                        S.of(context).inputPhone,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColors.colorCategoryNews),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                if (state.isLoading == true)
                  const Loading(
                    height: 300,
                  )
                else
                  PinFieldAutoFill(
                    controller: _controller,
                    currentCode: _controller.text,
                    onCodeChanged: (code) {
                      if (code?.length == 6 && !_submitted) {
                        _submitted = true;
                        FocusScope.of(context).unfocus();
                        confirm(context, state);
                      }
                      return code;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: BoxLooseDecoration(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: AppColors.primary),
                      radius: const Radius.circular(12),
                      bgColorBuilder: const FixedColorBuilder(AppColors.white),
                      strokeColorBuilder:
                          const FixedColorBuilder(AppColors.neutral400),
                    ),
                    cursor: Cursor(
                      width: 2,
                      height: 20,
                      color: AppColors.primary,
                      radius: const Radius.circular(1),
                      enabled: true,
                    ),
                  ),
                vP,
                Expanded(child: Container()),
                AlignWrap(
                  spacing: 3,
                  runSpacing: 0,
                  widgets: [
                    Text(
                      S.of(context).dontReceiveOTP,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: AppColors.grey),
                    ),
                    ResentButton(
                        expired: state.otpExpired,
                        press: () {
                          resend(context, state);
                        })
                  ],
                  align: Alignment.bottomCenter,
                ),
              ],
            ),
          )));
    });
  }

  void confirm(BuildContext context, AuthenicationState state) {
    if (_controller.text.length == 6) {
      context.read<AuthenicationBloc>().add(CheckOTPAction(
          otp: _controller.text,
          callback: (String? error) {
            _submitted = false;
            if (error != null) {
              Popup.showError(context, message: error);
              _controller.text = '';
            } else {
              getIt
                  .get<NavigationService>()
                  .goTo(deeplink: DeeplinkConstant.signUpAccount);
            }
          }));
    }
  }

  void resend(BuildContext context, AuthenicationState state) {
    var request = RequestOTPAction(
        phone: state.phoneNumber,
        callback: (String? error) {
          if (error != null) {
            Popup.showError(context, message: error);
          }
        });
    context.read<AuthenicationBloc>().add(request);
  }
}

class ResentButton extends StatefulWidget {
  final int expired;
  final VoidCallback press;
  const ResentButton({Key? key, required this.press, required this.expired})
      : super(key: key);

  @override
  _ResentButtonState createState() => _ResentButtonState();
}

class _ResentButtonState extends State<ResentButton> {
  late Timer _timer;
  late int _start;

  void startTimer() {
    _start = widget.expired;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_start > 0) {
          return;
        }
        startTimer();
        widget.press();
      },
      child: Text(
          _start == 0
              ? S.of(context).resend
              : '${S.of(context).resend}($_start)',
          style: const TextStyle(
              color: AppColors.primary, fontWeight: FontWeight.bold)),
    );
  }
}
