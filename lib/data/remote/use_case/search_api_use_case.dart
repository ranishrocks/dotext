import '../../../entities/braille_info_page_entity.dart';

class SearchApiUseCase {
  Future<List<TextBraillePair>> searchKeyword(String keyword) async {
    return [
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816, 0x2816, 0x2816, 0x2816, 0x2816])),
      TextBraillePair(text: "녕", braille: String.fromCharCodes([0x2823, 0x282B])),
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816])),
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816])),
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816])),
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816])),
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816])),
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816])),
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816])),
    ];
  }
}