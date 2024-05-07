

class Hadith {
  int? id;
  String? title;
  String? titleAr;
  int? numberOfHadis;
  String? abvrCode;
  String? bookName;
  String? bookDescr;

  Hadith({this.id, this.title, this.titleAr, this.numberOfHadis, this.abvrCode, this.bookName, this.bookDescr});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['title_ar'] = titleAr;
    map['number_of_hadis'] = numberOfHadis;
    map['abvr_code'] = abvrCode;
    map['book_name'] = bookName;
    map['book_descr'] = bookDescr;
    return map;
  }

  Hadith.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    titleAr = map['title_ar'];
    numberOfHadis = map['number_of_hadis'];
    abvrCode = map['abvr_code'];
    bookName = map['book_name'];
    bookDescr = map['book_descr'];

  }
}