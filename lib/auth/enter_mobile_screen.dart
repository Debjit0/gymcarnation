import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:gymcarnation/checkUserStatus/checkUserStatus.dart';
import 'package:gymcarnation/utils/routers.dart';
import 'package:gymcarnation/views/widgets/video_player_widget.dart';
import 'package:pinput/pinput.dart';

class EnterMobileScreen extends StatefulWidget {
  const EnterMobileScreen({super.key});

  @override
  State<EnterMobileScreen> createState() => _EnterMobileScreenState();
}

class _EnterMobileScreenState extends State<EnterMobileScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNo="";
  bool isOTP = false;
  var code = "";
  String verId = "";
  //GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _focus = FocusNode();

  String countryCode = '+91';
  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _countryPicker = FlCountryCodePicker(
      countryTextStyle: Theme.of(context).textTheme.bodyMedium,
      searchBarDecoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: Colors.white,
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            VideoPlayerWidget(videoPath: 'assets/gymcarnationLogin1.mp4'),
            Positioned.fill(
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: SizedBox(
                  width: width * .6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //heading
                      Text(
                        'Enter Your Mobile Number',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      //textformfield
                      TextFormField(
                        focusNode: _focus,
                        onChanged: (value) {
                          phoneNo = value;
                          print(phoneNo);
                          isOTP = false;
                          setState(() {});
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon:

                              //country code
                              InkWell(
                            onTap: () async {
                              var code = await _countryPicker.showPicker(
                                context: context,
                                scrollToDeviceLocale: true,
                                initialSelectedLocale: 'in',
                                fullScreen: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.grey.withOpacity(.4),
                              );

                              countryCode = code!.dialCode;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 16),
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: _focus.hasFocus
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                countryCode,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),

                      //otp
                      isOTP
                          ?  Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: 48,
                                  child: Pinput(
                                    length: 6,
                                    onChanged: (value) {
                                      code = value;
                                    },
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 16,
                      ),

                      //button
                      InkWell(
                        onTap: () async{
                          if (isOTP==false) {
                            if (phoneNo!="") {
                                print("Executed");
                                print("${countryCode + phoneNo}");
                                try {
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber:
                                        "${countryCode + phoneNo}",
                                    verificationCompleted:
                                        (PhoneAuthCredential credential) {},
                                    verificationFailed:
                                        (FirebaseAuthException e) {},
                                    codeSent: (String verificationId,
                                        int? resendToken) {
                                      verId = verificationId;
                                      
                                      
                                    },
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {},
                                  );
                                } catch (e) {
                                  print(e);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(
                                        child: Text(e.toString()),
                                      ),
                                    ),
                                  );
                                }
                              }
                            isOTP = true;
                            setState(() {});
                            
                          }
                          else if(isOTP==true){
                            print("Executed2");
                            if(code!=""){
                              try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verId,
                                      smsCode: code);
                              // Sign the user in (or link) with the credential
                              await auth.signInWithCredential(credential);
                              nextPageOnly(
                                  context: context, page: CheckUserStatus(phone: "${countryCode + phoneNo}",));
                            } catch (e) {
                              print('verify error');
                              print(e);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(e.toString()),
                                 ),
                                ),
                              );
                            }
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            isOTP ? 'Verify' : 'Get OTP',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
