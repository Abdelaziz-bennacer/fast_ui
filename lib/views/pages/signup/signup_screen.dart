import 'package:fast_ui/controllers/signup_controller.dart';
import 'package:fast_ui/views/pages/signup/util/signup_constants.dart';
import 'package:fast_ui/views/pages/signup/util/signup_fontstyle.dart';
import 'package:fast_ui/views/pages/signup/util/signup_validation.dart';
import 'package:fast_ui/views/pages/signup/util/signup_widget.dart';
import 'package:fast_ui/widgets/common/icon_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  var signupCtrl = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<SignupController>(
          builder: (controller) => Scaffold(
            backgroundColor: signupCtrl.appCtrl.appTheme.primary,
            body: SizedBox(
                height: AppScreenUtil().screenActualHeight(),
                child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowIndicator();
                      return false;
                    },
                    child: Stack(
                      children: [
                        //background Image layout
                        SignupWidget().signupBackGroundImage(
                            imageAssets.backgroundImage, context),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            //white body container layout
                            SignupWidget().bodyContainer(
                                color: signupCtrl.appCtrl.appTheme.whiteColor,
                                context: context,
                                child: SingleChildScrollView(
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Form(
                                        key: formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //logo image layout
                                                signupCtrl.appCtrl.isTheme
                                                    ? Image.asset(
                                                        imageAssets.themeLogo,
                                                        fit: BoxFit.contain,
                                                        height: AppScreenUtil()
                                                            .screenHeight(20),
                                                      )
                                                    : Image.asset(imageAssets
                                                        .smallLogoImage),
                                                const Space(0, 18),

                                                //description text layout
                                                SignupFontStyle()
                                                    .nunitotextLayout(
                                                        text: SignupFont()
                                                            .description,
                                                        color:
                                                            signupCtrl
                                                                .appCtrl
                                                                .appTheme
                                                                .darkContentColor,
                                                        fontSize:
                                                            textSizeSMedium),
                                                const Space(0, 20),

                                                //register account text layout
                                                SignupFontStyle()
                                                    .mulishtextLayout(
                                                        text: SignupFont()
                                                            .registerAccount,
                                                        color: signupCtrl
                                                            .appCtrl
                                                            .appTheme
                                                            .titleColor,
                                                        fontSize:
                                                            textSizeMedium,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                const Space(0, 16),

                                                //fullname textformfiel layout
                                                SignupWidget().textFieldLayout(
                                                  controller:
                                                      signupCtrl.username,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  onFieldSubmitted: (value) {
                                                    SignupWidget()
                                                        .fieldFocusChange(
                                                            context,
                                                            signupCtrl
                                                                .usernameFocus,
                                                            signupCtrl
                                                                .emailFocus);
                                                  },
                                                  focusNode:
                                                      signupCtrl.usernameFocus,
                                                  validator: (value) =>
                                                      SignupValidation()
                                                          .checkUserNameValidation(
                                                              value),
                                                  suffixIcon: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical:
                                                            AppScreenUtil()
                                                                .screenHeight(
                                                                    10)),
                                                    child: Image.asset(
                                                      iconAssets.profile,
                                                      fit: BoxFit.contain,
                                                      color: signupCtrl.appCtrl
                                                          .appTheme.titleColor,
                                                      height: AppScreenUtil()
                                                          .screenHeight(10),
                                                      width: AppScreenUtil()
                                                          .screenWidth(10),
                                                    ),
                                                  ),
                                                  text: SignupFont().fullName,
                                                  borderColor: signupCtrl
                                                      .appCtrl.appTheme.primary
                                                      .withOpacity(.3),
                                                  hintColor: signupCtrl.appCtrl
                                                      .appTheme.contentColor,
                                                  fillcolor: signupCtrl.appCtrl
                                                      .appTheme.textBoxColor,
                                                ),
                                                const Space(0, 13),

                                                //email textformfiel layout
                                                SignupWidget().textFieldLayout(
                                                  controller: signupCtrl.email,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  onFieldSubmitted: (value) {
                                                    SignupWidget()
                                                        .fieldFocusChange(
                                                            context,
                                                            signupCtrl
                                                                .emailFocus,
                                                            signupCtrl
                                                                .passwordFocus);
                                                  },
                                                  focusNode:
                                                      signupCtrl.emailFocus,
                                                  validator: (value) =>
                                                      SignupValidation()
                                                          .checkIDValidation(
                                                              value),
                                                  text: SignupFont().emailHint,
                                                  suffixIcon: Image.asset(
                                                      iconAssets.atsign,
                                                      color: signupCtrl.appCtrl
                                                          .appTheme.titleColor),
                                                  borderColor: signupCtrl
                                                      .appCtrl.appTheme.primary
                                                      .withOpacity(.3),
                                                  hintColor: signupCtrl.appCtrl
                                                      .appTheme.contentColor,
                                                  fillcolor: signupCtrl.appCtrl
                                                      .appTheme.textBoxColor,
                                                ),
                                                const Space(0, 13),
                                              ],
                                            ),

                                            //email password layout
                                            SignupWidget().textFieldLayout(
                                              controller: signupCtrl.password,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              textInputAction:
                                                  TextInputAction.none,
                                              obscureText:
                                                  signupCtrl.passwordVisible,
                                              focusNode:
                                                  signupCtrl.passwordFocus,
                                              validator: (value) =>
                                                  SignupValidation()
                                                      .checkPasswordValidation(
                                                          value),
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    signupCtrl.toggle();
                                                  },
                                                  child: Image.asset(
                                                      signupCtrl.passwordVisible
                                                          ? iconAssets.hide
                                                          : iconAssets.view,
                                                      color: signupCtrl
                                                          .appCtrl
                                                          .appTheme
                                                          .titleColor)),
                                              text: SignupFont().password,
                                              borderColor: signupCtrl
                                                  .appCtrl.appTheme.primary
                                                  .withOpacity(.3),
                                              hintColor: signupCtrl.appCtrl
                                                  .appTheme.contentColor,
                                              fillcolor: signupCtrl.appCtrl
                                                  .appTheme.textBoxColor,
                                            ),
                                            const Space(0, 20),

                                            //signup button layout
                                            SignupWidget().signUpButton(
                                                color: signupCtrl
                                                    .appCtrl.appTheme.primary,
                                                context: context,
                                                fontColor: signupCtrl.appCtrl
                                                    .appTheme.whiteColor,
                                                onTap: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    signupCtrl.signInClick(
                                                        context: context);
                                                  }
                                                }),
                                            const Space(0, 25),

                                            //already account widget
                                            SignupWidget().alreadyAccountWidget(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                color: signupCtrl.appCtrl
                                                    .appTheme.darkContentColor),
                                            const Space(0, 25),

                                            //signup with text layout
                                            SignupWidget().loginWithLayout(
                                                color: signupCtrl.appCtrl
                                                    .appTheme.contentColor,
                                                fontColor: signupCtrl
                                                    .appCtrl.appTheme.primary),
                                            const Space(0, 35),

                                            //continoue with phone layout
                                            IconButtonWidget(
                                              lefMargin: 0,
                                              rightMargin: 0,
                                              icon: iconAssets.mobileIcon,
                                              textWidget: SignupFontStyle()
                                                  .mulishtextLayout(
                                                      text: SignupFont()
                                                          .continueWithPhone,
                                                      color: signupCtrl.appCtrl
                                                          .appTheme.titleColor,
                                                      fontSize: textSizeMedium,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              type: SignupFont().phone,
                                            ),
                                            const Space(0, 15),

                                            //continoue with google layout
                                            IconButtonWidget(
                                              onTap: () =>
                                                  signupCtrl.googleLogin(),
                                              lefMargin: 0,
                                              rightMargin: 0,
                                              icon: iconAssets.google,
                                              textWidget: SignupFontStyle()
                                                  .mulishtextLayout(
                                                      text: SignupFont()
                                                          .continueWithGoogle,
                                                      color: signupCtrl.appCtrl
                                                          .appTheme.titleColor,
                                                      fontSize: textSizeMedium,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              type: SignupFont().google,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            //continue as guest text layout
                            SignupWidget().continueAsGuest(
                                color: signupCtrl.appCtrl.appTheme.titleColor)
                          ],
                        )
                      ],
                    ))),
          ),
        ),
      );
    });
  }
}
