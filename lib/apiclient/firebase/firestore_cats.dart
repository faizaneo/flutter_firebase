import 'package:cat_app/model/cat_model.dart';

void featuredCatsFilter(List<Cat> featuredCatsDocs, List<Cat> catDocs) {
  catDocs.forEach((cat) {
    if (cat.featured == true) {
      featuredCatsDocs.add(cat);
    }
  });
}

void favCatsFilter(List<Cat> favCatsDocs, List<Cat> catDocs) {
  catDocs.forEach((cat) {
    if (cat.isFavourite == true) {
      favCatsDocs.add(cat);
    }
  });
}
