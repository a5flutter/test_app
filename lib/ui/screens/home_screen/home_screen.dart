import 'package:flutter/material.dart';
import 'package:test_app/models/service_model.dart';
import 'package:test_app/theme/colors.dart';
import 'package:test_app/ui/screens/home_screen/widgets/search_input.dart';
import 'package:test_app/ui/screens/home_screen/widgets/service_card.dart';
import 'package:test_app/utils/screen_dimensions.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions.calculateMultipliers(context);
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    final List<ServiceModel> models = ServiceModel().getMockModelList();
    return Scaffold(
      backgroundColor: dirtyWhite,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(21 * wMultiplier, 17 * hMultiplier,
                    21.42 * wMultiplier, 8.5 * hMultiplier),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchInput(),
                    IconButton(
                        icon: Image.asset(
                          'assets/icons/filter.png',
                          height: 48 * hMultiplier,
                        ),
                        padding: EdgeInsets.all(0),
                        onPressed: () {})
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: models.length,
                    itemBuilder: (context, index) => ServiceCard(
                          model: models[index],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
