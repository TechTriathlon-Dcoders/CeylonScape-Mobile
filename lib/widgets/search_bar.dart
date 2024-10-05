import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchfield/searchfield.dart';

import '../theme/colors.dart';
import '../theme/fonts.dart';

class SearchItem {
  final String label;
  final Widget route;

  SearchItem({required this.label, required this.route});
}

class CSSearchBar extends StatefulWidget {
  final Color color;
  final double height;
  final Color fillColor;
  final String? placeholderText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final List<SearchItem> searchItems;

  const CSSearchBar({
    super.key,
    required this.searchItems,
    required this.controller,
    this.color = CeylonScapeColor.black40,
    this.height = 44,
    this.fillColor = CeylonScapeColor.black5,
    this.onChanged,
    this.placeholderText = 'Search',
  });

  @override
  State<CSSearchBar> createState() => _CSSearchBarState();
}

class _CSSearchBarState extends State<CSSearchBar> {

  bool isCrossOpen = false;

  @override
  Widget build(BuildContext context) {


    return Stack(
      children: [
        Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: CeylonScapeColor.black0
          ),
          child: SearchField(
            controller: widget.controller,
            // onSearchTextChanged: (value) {
            //   if (widget.controller.value.text.isEmpty) {
            //     setState(() {
            //       isCrossOpen = false;
            //     });
            //   } else {
            //     setState(() {
            //       isCrossOpen = true;
            //     });
            //   }
            // },
            maxSuggestionsInViewPort: 3,
            itemHeight: 50,
            hint: 'Search',
            suggestionsDecoration: SuggestionDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            searchInputDecoration: SearchInputDecoration(
              hintText: widget.placeholderText,
              // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              prefixIcon: SvgPicture.asset(
                'assets/icons/search.svg',
                height: 20,
                width: 20,
                fit: BoxFit.scaleDown
              ),
              suffixIcon: isCrossOpen
                  ? IconButton(
                icon: const Icon(
                  Icons.cancel_outlined,
                ),
                onPressed: () {
                  widget.controller.clear();
                  setState(() {
                    isCrossOpen = false;
                  });
                },
              ) : null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: CeylonScapeColor.black20)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: CeylonScapeColor.primary50)),
              hintStyle: CeylonScapeFont.highlightRegular.copyWith(
                  color: CeylonScapeColor.black30
              ),
            ),
            suggestions: widget.searchItems
                .map((e) => SearchFieldListItem(e.label,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: SearchTile(item: e))
            ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class SearchTile extends StatelessWidget {
  final SearchItem item;

  const SearchTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => item.route),
        );
      },
      dense: true,
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
            item.label,
            style: CeylonScapeFont.contentEmphasis,
        ),
      ),
    );
  }
}
