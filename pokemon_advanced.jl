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

#more types
struct Flying <: AbstractType end
struct Psychic <: AbstractType end
struct Bug <: AbstractType end
struct Rock <: AbstractType end
struct Ghost <: AbstractType end
struct Dragon <: AbstractType end

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
eff(atk::Flying, def::Flying) = normally_effective
eff(atk::Bug, def::Bug) = normally_effective
eff(atk::Rock, def::Rock) = normally_effective
eff(atk::Ghost, def::Ghost) = super_effective
eff(atk::Dragon, def::Dragon) = super_effective

#Instances = no_effect
eff(atk::Electric, def::Ground) = no_effect
eff(atk::Normal, def::Ghost) = no_effect
eff(atk::Normal, def::Ghost) = no_effect
eff(atk::Ghost, def::Normal) = no_effect
eff(atk::Ground, def::Flying) = no_effect
eff(atk::Ghost, def::Psychic) = no_effect

#Excpetions
#Normal(atk)
eff(atk::Normal, def::Rock) = not_very_effective

#Fire(atk)
eff(atk::Fire, def::Grass) = super_effective
eff(atk::Fire, def::Ice) = super_effective
eff(atk::Fire, def::Bug) = super_effective
eff(atk::Fire, def::Water) = not_very_effective
eff(atk::Fire, def::Rock) = not_very_effective
eff(atk::Fire, def::Dragon) = not_very_effective

#Water(atk)
eff(atk::Water, def::Fire) = super_effective
eff(atk::Water, def::Ground) = super_effective
eff(atk::Water, def::Grass) = not_very_effective
eff(atk::Water, def::Rock) = not_very_effective
eff(atk::Water, def::Dragon) = not_very_effective

#Electric(atk)
eff(atk::Electric, def::Water) = super_effective
eff(atk::Electric, def::Flying) = super_effective
eff(atk::Electric, def::Grass) = not_very_effective
eff(atk::Electric, def::Dragon) = not_very_effective

#Grass(atk)
eff(atk::Grass, def::Water) = super_effective
eff(atk::Grass, def::Ground) = super_effective
eff(atk::Grass, def::Rock) = super_effective
eff(atk::Grass, def::Fire) = not_very_effective
eff(atk::Grass, def::Poison) = not_very_effective
eff(atk::Grass, def::Flying) = not_very_effective
eff(atk::Grass, def::Bug) = not_very_effective
eff(atk::Grass, def::Dragon) = not_very_effective

#Ice(atk)
eff(atk::Ice, def::Grass) = super_effective
eff(atk::Ice, def::Ground) = super_effective
eff(atk::Ice, def::Flying) = super_effective
eff(atk::Ice, def::Dragon) = super_effective
eff(atk::Ice, def::Water) = not_very_effective

#Fighting(atk)
eff(atk::Fighting, def::Ice) = super_effective
eff(atk::Fighting, def::Normal) = super_effective
eff(atk::Fighting, def::Rock) = super_effective
eff(atk::Fighting, def::Poison) = not_very_effective
eff(atk::Fighting, def::Psychic) = not_very_effective
eff(atk::Fighting, def::Flying) = not_very_effective
eff(atk::Fighting, def::Bug) = not_very_effective

#Poison(atk)
eff(atk::Poison, def::Grass) = super_effective
eff(atk::Poison, def::Bug) = super_effective
eff(atk::Poison, def::Ground) = not_very_effective
eff(atk::Poison, def::Rock) = not_very_effective
eff(atk::Poison, def::Ghost) = not_very_effective

#Ground(atk)
eff(atk::Ground, def::Fire) = super_effective
eff(atk::Ground, def::Electric) = super_effective
eff(atk::Ground, def::Poison) = super_effective
eff(atk::Ground, def::Rock) = super_effective
eff(atk::Poison, def::Grass) = not_very_effective
eff(atk::Poison, def::Bug) = not_very_effective

#Flying(atk)
eff(atk::Flying, def::Grass) = super_effective
eff(atk::Flying, def::Fighting) = super_effective
eff(atk::Flying, def::Bug) = super_effective
eff(atk::Flying, def::Electric) = not_very_effective
eff(atk::Flying, def::Rock) = not_very_effective

#Psychic(atk)
eff(atk::Psychic, def::Fighting) = super_effective
eff(atk::Psychic, def::Poison) = super_effective


#Bug(atk)
eff(atk::Bug, def::Ice) = super_effective
eff(atk::Bug, def::Poison) = super_effective
eff(atk::Bug, def::Psychic) = super_effective
eff(atk::Bug, def::Fire) = not_very_effective
eff(atk::Bug, def::Fighting) = not_very_effective
eff(atk::Bug, def::Flying) = not_very_effective
eff(atk::Bug, def::Ghost) = not_very_effective

#Rock(atk)
eff(atk::Rock, def::Fire) = super_effective
eff(atk::Rock, def::Grass) = super_effective
eff(atk::Rock, def::Flying) = super_effective
eff(atk::Rock, def::Bug) = super_effective
eff(atk::Rock, def::Fighting) = not_very_effective
eff(atk::Rock, def::Ground) = not_very_effective

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