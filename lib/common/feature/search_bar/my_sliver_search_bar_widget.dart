import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/feature/search_bar/my_sliver_app_bar_delegate.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';

class MySliverSearchBarWidget extends StatelessWidget {
  MySliverSearchBarWidget({
    super.key,
    required this.viewOnSubmitted,
    required this.suggestionsBuilder,
  });

  final Function(String) viewOnSubmitted;

  final _onChanged = ValueNotifier<String>("");

  final Future<List<Widget>> Function(
    BuildContext context,
    SearchController searchController,
  ) suggestionsBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MySliverAppBarDelegate(
        minHeight: 60.h,
        maxHeight: 60.h,
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: SearchAnchor(
            viewTrailing: [
              IconButton(
                onPressed: () => viewOnSubmitted(_onChanged.value),
                icon: const Icon(Icons.search),
              )
            ],
            dividerColor: Colors.transparent,
            viewOnSubmitted: viewOnSubmitted,
            viewOnChanged: (value) => _onChanged.value = value,
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                elevation: const WidgetStatePropertyAll<double>(5.0),
                controller: controller,
                focusNode: FocusNode(),
                padding: WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.h)),
                onTap: () {
                  controller.openView();
                },
                onTapOutside: (event) {
                  FocusScopeNode focusNode = FocusScope.of(context);
                  if (focusNode.hasPrimaryFocus) {
                    focusNode.unfocus();
                  }
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder: suggestionsBuilder,
          ),
        ),
      ),
    );
  }
}
