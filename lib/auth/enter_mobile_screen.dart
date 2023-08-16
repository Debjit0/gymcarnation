import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:gymcarnation/views/widgets/video_player_widget.dart';
import 'package:pinput/pinput.dart';

class EnterMobileScreen extends StatefulWidget {
  const EnterMobileScreen({super.key});

  @override
  State<EnterMobileScreen> createState() => _EnterMobileScreenState();
}

class _EnterMobileScreenState extends State<EnterMobileScreen> {
  bool isOTP = false;
  FocusNode _focus = FocusNode();

  String countryCode = '+91';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                          ? const Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: 48,
                                  child: Pinput(
                                    length: 6,
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
                        onTap: () {
                          if (!isOTP) {
                            isOTP = true;
                            setState(() {});
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
