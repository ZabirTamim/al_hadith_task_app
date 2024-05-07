
class Chapter {
  int? id;
  int? chapterId;
  int? bookId;
  String? title;
  int? number;
  String? hadisRange;
  String? bookName;

  Chapter({this.id, this.chapterId, this.bookId, this.title, this.number, this.hadisRange, this.bookName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chapter_id': chapterId,
      'book_id': bookId,
      'title': title,
      'number': number,
      'hadis_range': hadisRange,
      'book_name': bookName,
    };
  }

  Chapter.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    chapterId = map['chapter_id'];
    bookId = map['book_id'];
    title = map['title'];
    number = map['number'];
    hadisRange = map['hadis_range'];
    bookName = map['book_name'];
  }
}
