import 'dart:math';

void main() {
  Random r = Random();
  for (var i = 0; i < 8; i++) {
    var randomBool = r.nextBool();
    print(randomBool);
  }
}
