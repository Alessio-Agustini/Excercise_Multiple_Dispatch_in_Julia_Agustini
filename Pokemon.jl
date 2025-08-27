#definning structures
abstract type AbstractType end
struct Normal <: AbstractType end
struct Fire <: AbstractType end
struct Water <: AbstractType end
struct Electric <: AbstractType end
struct Grass <: AbstractType end
struct Ice <: AbstractType end
struct Fighting <: AbstractType end
struct Poison <: AbstractType end
struct Ground <: AbstractType end

#definning const
const no_effect = 0
const not_very_effective = 1/2
const normally_effective = 1
const super_effective = 2


#Defining eff
#default if not defined = normally_effective (most cases) 
eff(atk::AbstractType, def::AbstractType) = normally_effective

#general case in which self aginst self = not_very_effective (probably there is a way to generalize this)
eff(atk::AbstractType, def::AbstractType) where AbstractType<:AbstractType = not_very_effective

#excpection for Normal, Fighting, Ground
eff(atk::Normal, def::Normal) = normally_effective
eff(atk::Fighting, def::Fighting) = normally_effective
eff(atk::Ground, def::Ground) = normally_effective

#only instance = no_effect
eff(atk::Electric, def::Ground) = no_effect

#Excpetions
#Fire(atk)
eff(atk::Fire, def::Grass) = super_effective
eff(atk::Fire, def::Ice) = super_effective
eff(atk::Fire, def::Water) = not_very_effective

#Water(atk)
eff(atk::Water, def::Fire) = super_effective
eff(atk::Water, def::Ground) = super_effective
eff(atk::Water, def::Grass) = not_very_effective

#Electric(atk)
eff(atk::Electric, def::Water) = super_effective
eff(atk::Electric, def::Grass) = not_very_effective

#Grass(atk)
eff(atk::Grass, def::Water) = super_effective
eff(atk::Grass, def::Ground) = super_effective
eff(atk::Grass, def::Fire) = not_very_effective
eff(atk::Grass, def::Poison) = not_very_effective

#Ice(atk)
eff(atk::Ice, def::Grass) = super_effective
eff(atk::Ice, def::Ground) = super_effective
eff(atk::Ice, def::Fire) = not_very_effective
eff(atk::Ice, def::Water) = not_very_effective

#Fighting(atk)
eff(atk::Fighting, def::Ice) = super_effective
eff(atk::Fighting, def::Poison) = not_very_effective
eff(atk::Fighting, def::Normal) = super_effective


#Poison(atk)
eff(atk::Poison, def::Grass) = super_effective
eff(atk::Poison, def::Ground) = not_very_effective

#Ground(atk)
eff(atk::Ground, def::Fire) = super_effective
eff(atk::Ground, def::Electric) = super_effective
eff(atk::Ground, def::Poison) = super_effective
eff(atk::Poison, def::Grass) = not_very_effective

#defining eff_string
function eff_string(atk::AbstractType, def::AbstractType)
    if eff(atk, def) == 2
        return println("The attack was super effective")
    elseif eff(atk, def) == 1
        return println("The attack was normally effective")
    else
        return println("The attack was not effective...")
end
end

#define Attack function
function Attack(atk::AbstractType, def::AbstractType)
println("The type of the attacking pókemon is: $(typeof(atk))")
println("The type of the defending pókemon is: $(typeof(def))")
println("Due to the types of the pokemon the attacking pokemon would deal the amount of damage multiplied by $(eff(atk, def))")
println(eff_string(atk, def))
end


#tests
eff(Fighting(), Normal())
eff(Normal(), Water())
eff(Water(), Water())
eff(Normal(), Normal())
eff(Fire(), Electric())
eff(Electric(), Ground())


eff_string(Fighting(), Normal())
eff_string(Normal(), Water())
eff_string(Water(), Water())
eff_string(Normal(), Normal())
eff_string(Fire(), Electric())
eff_string(Electric(), Ground())

Attack(Fighting(), Normal())
Attack(Normal(), Water())
Attack(Water(), Water())
Attack(Normal(), Normal())
Attack(Fire(), Electric())
Attack(Electric(), Ground())

