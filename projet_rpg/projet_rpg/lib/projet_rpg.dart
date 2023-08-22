import 'package:projet_rpg/modals/perso.dart';

void main() {
  final player1 = Personnage(name: 'Marco', life: 50, mana: 10);
  final player2 = Personnage(name: 'Filrouge', life: 50, mana: 10);

  bool turnPlayer1 = coinToss();
  if (turnPlayer1) {
    print('${player1.name} commence!');
  } else {
    print('${player2.name} commence!');
  }

  while (!player1.isDead() && !player2.isDead()) {
    if (turnPlayer1) {
      player1.attack(player2);
      player1.regenMana();
    } else {
      player2.attack(player1);
      player2.regenMana();
    }

    turnPlayer1 = !turnPlayer1;
  }

  if (player1.isDead()) {
    print("${player2.name} gagne !");
  } else {
    print("${player1.name} gagne !");
  }
}
