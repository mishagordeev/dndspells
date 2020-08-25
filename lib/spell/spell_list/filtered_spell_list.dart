import 'package:dndspells/character_class/character_class.dart';
import 'package:dndspells/spell/spell.dart';

List<Spell> filterSpellList (List<Spell> spells, CharacterClass characterClass, int level) {

  List<Spell> filteredSpellList = [];

      for (int i = 0; i < spells.length; i++) {
        Spell spell = spells[i];

        if (spell.availableFor.contains(characterClass.name) && level == spell.level) {
          filteredSpellList.add(spell);
        }
      }
  return filteredSpellList;
}