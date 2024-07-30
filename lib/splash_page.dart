import 'package:astrology/models/otp/request_otp.dart';
import 'package:astrology/pages/astrologer/astrologer_detail_page.dart';
import 'package:astrology/pages/astrologer/astrologer_list_page.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/auth/login.page.dart';
import 'package:astrology/pages/auth/otp_verified_page.dart';
import 'package:astrology/pages/auth/otp_verify_page.dart';
import 'package:astrology/pages/home/homepage.dart';
import 'package:astrology/pages/kundali/kundali_profile.dart';
import 'package:astrology/pages/user/complete_profile_page.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  handleOnTap(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(title: "", showBackButton: false),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onTap: () {
                  handleOnTap(context, const LoginPage());
                },
                title: "Login Page"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(context, const HomePage());
                },
                title: "Home Page"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(context, const CompleteProfilePage());
                },
                title: "Complete Profile"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  RequestOTP requestOTP = RequestOTP(
                      phonenumber: "9847012345", email: "", countryCode: 1);
                  handleOnTap(
                    context,
                    OTPVerifyPage(
                        isPhoneNumberSelected: true, requestOTP: requestOTP),
                  );
                },
                title: "OTP Verify Page"),
            const CustomVerticalSpacer(),
            // CustomButton(onTap: () {}, title: "OTP Verified Page"),const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(
                      context,
                      const OTPVerifiedPage(
                        isPhoneNumber: true,
                      ));
                },
                title: "OTP Verified Page"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(context, const AstrologerListPage());
                },
                title: "Astrologers List Page"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(context, const AstrologerDetailPage());
                },
                title: "Astrologer Detail Page"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(context, const KundaliProfile());
                },
                title: "Kundali Profile"),
            const CustomVerticalSpacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _showRatingAndCommentSheet(context);
      }),
    );
  }

  void _showRatingAndCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // This ensures the height is adjustable
      builder: (BuildContext context) {
        return RatingAndCommentSheet();
      },
    );
  }
}

class RatingAndCommentSheet extends StatefulWidget {
  @override
  _RatingAndCommentSheetState createState() => _RatingAndCommentSheetState();
}

class _RatingAndCommentSheetState extends State<RatingAndCommentSheet> {
  double rating = 0;
  final commentController = TextEditingController();
  String selectedOption = '';

  String ratingText() {
    switch (rating.toInt()) {
      case 1:
        return 'Awful';
      case 2:
        return 'Bad';
      case 3:
        return 'Fine';
      case 4:
        return 'Good';
      case 5:
        return 'Excellent';
      default:
        return 'Rate Us';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            ratingText(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          _buildRatingStars(),
          SizedBox(height: 16),
          _buildAdditionalOptions(),
          SizedBox(height: 16),
          TextField(
            controller: commentController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Comment',
            ),
            maxLines: 4,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final comment = commentController.text;
              final newRating = rating;
              // Handle the rating and comment
              print('Rating: $rating');
              print('Comment: $comment');
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalOptions() {
    return Wrap(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildOptionButton('Late'),
        _buildOptionButton('Ask for Extra Fee'),
        _buildOptionButton('Impolite'),
        _buildOptionButton('Friendly'),
      ],
    );
  }

  Widget _buildOptionButton(String option) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Text(option),
    );
  }

  Widget _buildRatingStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            setState(() {
              rating = index + 1.0;
            });
          },
        );
      }),
    );
  }
}
