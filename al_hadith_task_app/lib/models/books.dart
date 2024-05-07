
class Books {
  int? id;
  String? title;
  String? titleAr;
  int? numberOfHadis;
  String? abvrCode;
  String? bookName;
  String? bookDescr;

  Books({this.id, this.title, this.titleAr, this.numberOfHadis, this.abvrCode, this.bookName, this.bookDescr});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'title_ar': titleAr,
      'number_of_hadis': numberOfHadis,
      'abvr_code': abvrCode,
      'book_name': bookName,
      'book_descr': bookDescr,
    };
  }

  Books.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    titleAr = map['title_ar'];
    numberOfHadis = map['number_of_hadis'];
    abvrCode = map['abvr_code'];
    bookName = map['book_name'];
    bookDescr = map['book_descr'];
  }
}
