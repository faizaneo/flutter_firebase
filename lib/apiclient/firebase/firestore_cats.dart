import 'package:cat_app/model/cat_model.dart';

void featuredCatsMap(List<Cat> featuredCatsDocs, List<Cat> catDocs) {
  catDocs.forEach((cat) {
    if (cat.featured == true) {
      featuredCatsDocs.add(cat);
    }
  });
}
