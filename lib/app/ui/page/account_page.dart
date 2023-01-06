import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paras_test/app/cubit/account/account_cubit.dart';
import 'package:paras_test/app/cubit/account/account_state.dart';
import 'package:paras_test/app/ui/component/account/item_menu.dart';
import 'package:paras_test/app/ui/component/button.dart';
import 'package:paras_test/app/ui/component/outlined_button.dart';
import 'package:paras_test/domain/uimodel/account.dart';
import 'package:paras_test/router/router.gr.dart';

import '../component/text.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountPageState();

}

class _AccountPageState extends State<AccountPage> {

  @override
  void initState() {
    BlocProvider.of<AccountCubit>(context)
      .getAccount();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<AccountCubit, AccountState>(
      listenWhen: (_, state) {
        return state is ErrorGetAccountState;
      },
      listener: (_, state) {
        if (state is ErrorGetAccountState) {
          Fluttertoast.showToast(msg: state.message);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              BlocBuilder<AccountCubit, AccountState>(
                  builder: (_, state) {
                    AccountUiModel? model;

                    if (state is SuccessGetAccountState) {
                      model = state.data;
                    }

                    return SizedBox(
                      height: 150,
                      child: Stack(
                        children: [
                          Container(
                            height: 110,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black54,
                                  Colors.white,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Expanded(child: Container()),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(model?.photoUrl ?? '')
                                          ),
                                          color: Colors.grey[300]
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          UiKitText(model?.name ?? '', type: UiKitTextType.header2, isEllipsized: false),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10, right: 20),
                                            child: UiKitText(model?.email ?? '', type: UiKitTextType.caption1),
                                          )
                                        ],
                                      )
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: UiKitText('Menu', type: UiKitTextType.title1),
              ),
              UiKitItemMenu(
                text: 'About this app',
                icon: Icons.info,
                onClick: () {
                  _showAboutThisApp();
                },
              ),
              UiKitItemMenu(
                text: 'Sign out',
                icon: Icons.logout,
                onClick: () {
                  _showConfirmSignOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _showAboutThisApp() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const UiKitText('About this app', type: UiKitTextType.title1),
          content: const UiKitText(
            'This application was created to fulfill an assignment test which contains content from themoviebd.org',
            isEllipsized: false
          ),
          actions: [
            UiKitButton(
              text: 'Close',
              onPressed: () {
                Navigator.pop(ctx);
              }
            )
          ],
        );
      }
    );
  }

  _showConfirmSignOut() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const UiKitText('Confirm', type: UiKitTextType.title1),
          content: const UiKitText('Are you sure want to sign out?'),
          actions: [
            UiKitOutlinedButton(
              text: 'Cancel',
              onPressed: () {
                Navigator.pop(ctx);
              },
            ),
            UiKitButton(
              text: 'Yes',
              onPressed: () {
                BlocProvider.of<AccountCubit>(context)
                    .doSignOut();

                context.router.navigate(const SignInRoute());
                context.router.removeLast();

                Navigator.pop(ctx);
              },
            )
          ],
        );
      }
    );
  }
}