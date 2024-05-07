
class Section {
  int? id;
  int? bookId;
  int? chapterId;
  int? sectionId;
  String? title;
  String? preface;
  int? number;

  Section({this.id, this.bookId, this.chapterId, this.sectionId, this.title, this.preface, this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'book_id': bookId,
      'chapter_id': chapterId,
      'section_id': sectionId,
      'title': title,
      'preface': preface,
      'number': number,
    };
  }

  Section.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    bookId = map['book_id'];
    chapterId = map['chapter_id'];
    sectionId = map['section_id'];
    title = map['title'];
    preface = map['preface'];
    number = map['number'];
  }
}
