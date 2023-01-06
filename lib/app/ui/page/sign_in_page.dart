import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paras_test/app/cubit/account/account_cubit.dart';
import 'package:paras_test/app/cubit/account/account_state.dart';
import 'package:paras_test/app/ui/component/button.dart';
import 'package:paras_test/app/ui/component/text.dart';
import 'package:paras_test/router/router.gr.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<AccountCubit, AccountState>(
      listener: (_, state) {
        if (state is ErrorSignInState) {
          Fluttertoast.showToast(msg: state.message);
        }
        
        if (state is SuccessSignInState) {
          Fluttertoast.showToast(msg: 'Sign In Success');
          context.router.navigate(const DashboardRoute());
          context.router.removeLast();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: UiKitText('Welcome', type: UiKitTextType.header2),
              ),
              const UiKitText('Paras app test using The Movie DB'),
              Expanded(
                  child: Center(
                    child: Image.asset('assets/illustration/ilus_login.png'),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 150),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/ic_google.svg', width: 40, height: 40),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: UiKitButton(
                            text: 'Sign in with google',
                            onPressed: () {
                              BlocProvider.of<AccountCubit>(context)
                                  .doSignIn();
                            },
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}