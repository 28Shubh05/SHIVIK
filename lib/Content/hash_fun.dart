import 'package:movie_app/Content/movieDetailsContent.dart';

class HashedTag {
  final double hashName;
  final double tagValue;

  HashedTag({
    required this.hashName,
    required this.tagValue
  });
}

  List<HashedTag> getHashedTags(List<ContentTag> tags , {int p = 33 , int m = 1000000007}){
    return tags.map((tag) {
      // Compute the polynomial hash for the tag name
      int hashValue = 0;
      int powerOfP = 1;

      for (int i = 0; i < tag.tagName.length; i++) {
        hashValue = (hashValue + tag.tagName.codeUnitAt(i) * powerOfP) % m;
        powerOfP = (powerOfP * p) % m;
      }

      // Convert to double in range [0,1) and create HashedTag object
      return HashedTag(
        hashName: hashValue / m,
        tagValue: tag.tagValue,
      );
    }).toList();
  }