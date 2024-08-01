import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/rating_and_comment/rating_close_button.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class RatingCommentSheet extends StatefulWidget {
  const RatingCommentSheet({super.key});

  @override
  State<RatingCommentSheet> createState() => _RatingCommentSheetState();
}

class _RatingCommentSheetState extends State<RatingCommentSheet> {
  int rating = 0;
  final commentController = TextEditingController();
  String selectedOption = '';

  udpateSelectedRating(String value) {
    selectedOption = value;
    setState(() {});
  }

  String ratingText() {
    switch (rating) {
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
    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorUtil.colorWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const RatingCloseButton(),
              Text(
                ratingText(),
                style: StyleUtil.style24DeepPurple,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              buildRatingStars(),
              const SizedBox(height: 16),
              buildAdditionalOptions(),
              const SizedBox(height: 16),
              buildCommentWidget(),
              const SizedBox(height: 16),
              CustomButton(
                onTap: () {
                  //     final comment = commentController.text;
                  //     final newRating = rating;
                },
                title: "Rate",
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildCommentWidget() {
    return TextField(
      controller: commentController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Comment',
        alignLabelWithHint: true,
        filled: true,
        fillColor: ColorUtil.colorProfileLightGrey,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        labelStyle: StyleUtil.style14DarkBlue,
        focusColor: ColorUtil.colorOrange,
        hintStyle: StyleUtil.style14Grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: ColorUtil.colorGrey, width: 1.0), // Grey border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: ColorUtil.colorOrange,
              width: 2.0), // Orange border color on focus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: ColorUtil.colorGrey,
              width: 1.0), // Grey border color when enabled
        ),
      ),
      maxLines: 5,
    );
  }

  Widget buildAdditionalOptions() {
    return Wrap(
      children: <Widget>[
        buildOptionButton('Late'),
        buildOptionButton('Ask for Extra Fee'),
        buildOptionButton('Impolite'),
        buildOptionButton('Friendly'),
      ],
    );
  }

  Widget buildOptionButton(String option) {
    return GestureDetector(
      onTap: () {
        udpateSelectedRating(option);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selectedOption.toLowerCase() == option.toLowerCase()
              ? ColorUtil.colorOrange
              : ColorUtil.colorProfileGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          option,
          style: selectedOption.toLowerCase() == option.toLowerCase()
              ? StyleUtil.style14White
              : StyleUtil.style14Black,
        ),
      ),
    );
  }

  Widget buildRatingStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star,
            size: 40,
            color: index < rating
                ? ColorUtil.colorOrange
                : ColorUtil.colorProfileGrey,
          ),
          onPressed: () {
            setState(() {
              rating = index + 1;
            });
          },
        );
      }),
    );
  }
}
