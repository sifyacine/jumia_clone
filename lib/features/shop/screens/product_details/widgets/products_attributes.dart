
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 6,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
