import 'package:fast_ui/controllers/setting_controller.dart';
import 'package:fast_ui/views/pages/setting/util/setting_constants.dart';
import 'package:fast_ui/views/pages/setting/util/setting_fontstyle.dart';
import 'package:fast_ui/views/pages/setting/util/setting_validation.dart';
import 'package:fast_ui/views/pages/setting/util/setting_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class Setting extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  Setting({Key? key}) : super(key: key);
  final settingCtrl = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<SettingController>(builder: (_) {
          return Scaffold(
            appBar: SettingWidget().appBarLayout(
                bgColor: settingCtrl.appCtrl.appTheme.whiteColor,
                titleColor: settingCtrl.appCtrl.appTheme.titleColor,
                text: SettingFont().editProfile,
                onTap: () => settingCtrl.goToHome()),
            backgroundColor: settingCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(10),
                      horizontal: AppScreenUtil().screenWidth(15)),
                  margin:
                      EdgeInsets.only(top: AppScreenUtil().screenHeight(20)),
                  width: MediaQuery.of(context).size.width,
                  color: settingCtrl.appCtrl.appTheme.whiteColor,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //user icon
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.asset(
                              imageAssets.usersquare,
                              height: AppScreenUtil().screenHeight(90),
                            ),
                            SettingWidget().editIcon(
                                context: context,
                                primaryColor:
                                    settingCtrl.appCtrl.appTheme.primary),
                          ],
                        ),
                        const Space(0, 10),
                        //user name text layout
                        SettingFontStyle().mulishtextLayout(
                            text: 'Andrea Joanne',
                            fontSize: SettingFontSize.textSizeMedium,
                            fontWeight: FontWeight.w700,
                            color: settingCtrl.appCtrl.appTheme.titleColor),
                        const Space(0, 3),

                        //user email text layout
                        SettingFontStyle().mulishtextLayout(
                            text: 'andreajoanne@gmail.com',
                            fontSize: SettingFontSize.textSizeSmall,
                            fontWeight: FontWeight.normal,
                            color:
                                settingCtrl.appCtrl.appTheme.darkContentColor),
                        const Space(0, 20),
                        //fullname textformfiel layout
                        SettingWidget().textFieldLayout(
                          controller: settingCtrl.username,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            SettingWidget().fieldFocusChange(
                                context,
                                settingCtrl.usernameFocus,
                                settingCtrl.userFocus);
                          },
                          focusNode: settingCtrl.usernameFocus,
                          validator: (value) => SettingValidation()
                              .checkUserNameValidation(value),
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppScreenUtil().screenHeight(
                                    AppScreenUtil().screenActualWidth() > 370
                                        ? 10
                                        : 15)),
                            child: Image.asset(
                              iconAssets.profile,
                              fit: BoxFit.contain,
                              color: settingCtrl.appCtrl.appTheme.titleColor,
                              height: AppScreenUtil().screenHeight(10),
                              width: AppScreenUtil().screenWidth(10),
                            ),
                          ),
                          text: SettingFont().fullName,
                          borderColor: settingCtrl.appCtrl.appTheme.primary
                              .withOpacity(.3),
                          hintColor: settingCtrl.appCtrl.appTheme.contentColor,
                          fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
                        ),
                        const Space(0, 15),
                        //email textformfield layout
                        SettingWidget().textFieldLayout(
                          obscureText: false,
                          isLargeScreen: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: settingCtrl.email,
                          onFieldSubmitted: (value) {
                            SettingWidget().fieldFocusChange(
                                context,
                                settingCtrl.userFocus,
                                settingCtrl.passwordFocus);
                          },
                          focusNode: settingCtrl.userFocus,
                          validator: (value) =>
                              SettingValidation().checkIDValidation(value),
                          text: SettingFont().emailHint,
                          borderColor: settingCtrl.appCtrl.appTheme.primary
                              .withOpacity(.3),
                          hintColor: settingCtrl.appCtrl.appTheme.contentColor,
                          fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
                          suffixIcon: Image.asset(
                            iconAssets.atsign,
                            color: settingCtrl.appCtrl.appTheme.titleColor,
                          ),
                        ),
                        const Space(0, 15),
                        //phone textformfield layout
                        SettingWidget().textFieldLayout(
                          obscureText: false,
                          isLargeScreen: false,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          controller: settingCtrl.phone,
                          onFieldSubmitted: (value) {
                            SettingWidget().fieldFocusChange(context,
                                settingCtrl.phoneFocus, settingCtrl.dateFocus);
                          },
                          focusNode: settingCtrl.phoneFocus,
                          validator: (value) =>
                              SettingValidation().checkPhoneValidation(value),
                          text: SettingFont().phonelHint,
                          borderColor: settingCtrl.appCtrl.appTheme.primary
                              .withOpacity(.3),
                          hintColor: settingCtrl.appCtrl.appTheme.contentColor,
                          fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                right: AppScreenUtil().screenWidth(2),
                                top: AppScreenUtil().screenHeight(
                                    AppScreenUtil().screenActualWidth() > 370
                                        ? 12
                                        : 15),
                                bottom: AppScreenUtil().screenHeight(
                                    AppScreenUtil().screenActualWidth() > 370
                                        ? 12
                                        : 15)),
                            child: Image.asset(
                              iconAssets.call,
                              color: settingCtrl.appCtrl.appTheme.titleColor,
                              height: AppScreenUtil().screenHeight(10),
                            ),
                          ),
                        ),
                        const Space(0, 15),
                        //date textformfield layout
                        SettingWidget().textFieldLayout(
                          obscureText: false,
                          onTap: () => settingCtrl.selectDate(context),
                          readOnly: true,
                          isLargeScreen: false,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          controller: settingCtrl.dateCtrl,
                          onFieldSubmitted: (value) {
                            SettingWidget().fieldFocusChange(context,
                                settingCtrl.dateFocus, settingCtrl.phoneFocus);
                          },
                          focusNode: settingCtrl.dateFocus,
                          validator: (value) =>
                              SettingValidation().checkIDValidation(value),
                          text: SettingFont().dateHint,
                          borderColor: settingCtrl.appCtrl.appTheme.primary
                              .withOpacity(.3),
                          hintColor: settingCtrl.appCtrl.appTheme.contentColor,
                          fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                right: AppScreenUtil().screenWidth(2),
                                top: AppScreenUtil().screenHeight(
                                    AppScreenUtil().screenActualWidth() > 370
                                        ? 12
                                        : 15),
                                bottom: AppScreenUtil().screenHeight(
                                    AppScreenUtil().screenActualWidth() > 370
                                        ? 12
                                        : 15)),
                            child: Image.asset(
                              iconAssets.calendar,
                              color: settingCtrl.appCtrl.appTheme.titleColor,
                              height: AppScreenUtil().screenHeight(10),
                            ),
                          ),
                        ),
                        const Space(0, 15),
                        // password layout
                        SettingWidget().passwordLayout(
                            textBoxColor:
                                settingCtrl.appCtrl.appTheme.textBoxColor,
                            borderColor: settingCtrl.appCtrl.appTheme.primary,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: AppScreenUtil().screenWidth(18)),
                                  child: SettingWidget().changePassWord(
                                      color: settingCtrl
                                          .appCtrl.appTheme.titleColor),
                                ),
                                const Space(0, 5),
                                SettingWidget().textFieldLayout(
                                  isLargeScreen: false,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.none,
                                  controller: settingCtrl.password,
                                  focusNode: settingCtrl.passwordFocus,
                                  obscureText: settingCtrl.passwordVisible,
                                  validator: (value) => SettingValidation()
                                      .checkPasswordValidation(value),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      settingCtrl.toggle();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: AppScreenUtil()
                                              .screenHeight(AppScreenUtil()
                                                          .screenActualWidth() >
                                                      370
                                                  ? 10
                                                  : 15)),
                                      child: Image.asset(
                                        iconAssets.lock,
                                        height:
                                            AppScreenUtil().screenHeight(10),
                                        color: settingCtrl
                                            .appCtrl.appTheme.titleColor,
                                      ),
                                    ),
                                  ),
                                  text: SettingFont().password,
                                  borderColor:
                                      settingCtrl.appCtrl.appTheme.textBoxColor,
                                  hintColor:
                                      settingCtrl.appCtrl.appTheme.contentColor,
                                  fillcolor:
                                      settingCtrl.appCtrl.appTheme.textBoxColor,
                                ),
                              ],
                            )),
                        const Space(0, 15),
                        //Update Settings layout
                        SettingWidget().updateSettingLayout(
                            textColor: settingCtrl.appCtrl.appTheme.white,
                            color: settingCtrl.appCtrl.appTheme.primary,
                            onTap: () {
                              if (formKey.currentState!.validate()) {}
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
