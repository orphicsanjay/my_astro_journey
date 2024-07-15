import 'package:astrology/pages/astrologer/astroger_options_widget.dart';
import 'package:astrology/pages/astrologer/astrologer_list_card.dart';
import 'package:astrology/providers/astrologer_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/dashed_underline_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AstrologerListPage extends StatefulWidget {
  const AstrologerListPage({super.key});

  @override
  State<AstrologerListPage> createState() => _AstrologerListPageState();
}

class _AstrologerListPageState extends State<AstrologerListPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final astrologerProvider = Provider.of<AstrologerProvider>(context);
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Astrologers",
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        // padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: AstrologerOptionsWidget(
                  astrologerList: astrologerProvider.astrologerList,
                  onTap: (value) {},
                ),
              ),
              Container(
                height: 1,
                width: size.width,
                color: ColorUtil.colorGrey,
              ),
              const AstrologerListCard(),
              const AstrologerListCard(),
              const AstrologerListCard(),
              const AstrologerListCard(),
            ],
          ),
        ),
      ),
    );
  }
}
