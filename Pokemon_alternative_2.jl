effectivity_matrix = [ 1 1 1 1 1 1 1 1 1;
                       1 1/2 1/2 1 2 2 1 1 1;
                       1 2 1/2 1 1/2 1 1 1 2;
                       1 1 2 1/2 1/2 1 1 1 0;
                       1 1/2 2 1 1/2 1 1 1/2 2;
                       1 1/2 1/2 1 2 1/2 1 1 2;
                       2 1 1 1 1 2 1 1/2 1;
                       1 1 1 1 2 1 1 1/2 1/2;
                       1 2 1 2 1/2 1 1 2 1]

@enum PokeType begin
  Normal = 1
  Fire
  Water
  Electric
  Grass
  Ice
  Fighting
  Poison
  Ground
end

function eff(atk::PokeType, def::PokeType)
    effectivity = effectivity_matrix[Int(atk), Int(def)]
    if effectivity == 1
        return "was normally effective."
    elseif  effectivity == 2
        return "was super effective!!"
    elseif effectivity == 1/2
        return "was not very effective 🙁"
    else
        return "had no effect.."
    end
end
function attack(atk, def)
    "A $atk Pokemon attacks a $def Pokemon! The attack $(eff(atk, def))"
end

attack(Normal, Normal)
attack(Fire, Water)
attack(Electric, Ground)
attack(Ice, Grass)
