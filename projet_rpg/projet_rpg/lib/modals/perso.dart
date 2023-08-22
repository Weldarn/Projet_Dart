import 'dart:math';

class Personnage {
  final String name;
  int life;
  int mana;
  int roundforAttackSpe = 0;

  Personnage({required this.name, required this.life, required this.mana});

  bool canAttackSpe() {
    return roundforAttackSpe >= 5;
  }

  void useMana() {
    if (mana > 0) {
      print(
          '$name utilise la magie et récupère ${(0.5 * life).toInt()} points de vie!');
      life += (0.5 * life).toInt();
      mana = 0;
    }
  }

  bool isDead() {
    return life <= 0;
  }

  void regenMana() {
    mana += 2;
    if (mana > 10) {
      mana = 10;
    }
  }

  void attack(Personnage ennemie) {
    if (life <= (0.3 * 100)) {
      useMana();
    } else if (canAttackSpe()) {
      final damages = Random().nextInt(10) + 1;
      print(
          "$name utilise son attaque spécial et inflige $damages dégats à ${ennemie.name} deux fois !");
      ennemie.life -= (2 * damages).toInt();
      roundforAttackSpe = 0;
    } else {
      final damages = Random().nextInt(10) + 1;
      print('$name attaque et inflige $damages dégats à ${ennemie.name}!');
      ennemie.life -= damages;
    }
    roundforAttackSpe++;
  }
}

bool coinToss() {
  return Random().nextBool();
}
