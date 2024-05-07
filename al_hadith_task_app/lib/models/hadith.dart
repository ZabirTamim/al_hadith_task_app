
class Hadith {
  int? hadithId;
  int? bookId;
  int? chapterId;
  int? sectionId;
  String? narrator;
  String? bn;
  String? ar;
  String? arDiacless;
  String? note;
  int? gradeId;
  String? grade;
  String? gradeColor;

  Hadith({
    this.hadithId,
    this.bookId,
    this.chapterId,
    this.sectionId,
    this.narrator,
    this.bn,
    this.ar,
    this.arDiacless,
    this.note,
    this.gradeId,
    this.grade,
    this.gradeColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'hadith_id': hadithId,
      'book_id': bookId,
      'chapter_id': chapterId,
      'section_id': sectionId,
      'narrator': narrator,
      'bn': bn,
      'ar': ar,
      'ar_diacless': arDiacless,
      'note': note,
      'grade_id': gradeId,
      'grade': grade,
      'grade_color': gradeColor,
    };
  }

  Hadith.fromMap(Map<String, dynamic> map) {
    hadithId = map['hadith_id'];
    bookId = map['book_id'];
    chapterId = map['chapter_id'];
    sectionId = map['section_id'];
    narrator = map['narrator'];
    bn = map['bn'];
    ar = map['ar'];
    arDiacless = map['ar_diacless'];
    note = map['note'];
    gradeId = map['grade_id'];
    grade = map['grade'];
    gradeColor = map['grade_color'];
  }
}
