import 'package:flutter/cupertino.dart';

import '../../../config/routes/route_names.dart';

class HomeCases{
  static navigateToSearchPage (BuildContext context) {
    Navigator.pushNamed(context,RouteNames.searchPage);
}

}