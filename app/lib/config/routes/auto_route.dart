import 'package:auto_route/annotations.dart';
import 'package:jio_fashion_hack/config/routes/routes.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: Routes.all,
)
class $AppRouter {}
