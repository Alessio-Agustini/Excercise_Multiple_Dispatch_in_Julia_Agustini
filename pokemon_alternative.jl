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

#Defining a global fuction eff for every chase 
function eff(atk::AbstractType, def::AbstractType) 
    if atk::AbstractType == def::AbstractType
       if atk::AbstractType == Normal()
            return normally_effective
       elseif atk::AbstractType == Fighting()
            return normally_effective
        elseif atk::AbstractType == Ground()
            return normally_effective
       else
            return not_very_effective
       end
    elseif if atk::AbstractType == Normal()
        return not_very_effective
    elseif if atk::AbstractType == Fire()
        if def::AbstractType == Water()
            return not_very_effective
        elseif def::AbstractType == Grass() || def::AbstractType == Ice()
            return super_effective
        else 
            return normally_effective
        end
    elseif if atk::AbstractType == Water()
        if def::AbstractType == Grass()
            return not_very_effective
        elseif def::AbstractType == Fire() || def::AbstractType == Ground()
            return super_effective
        else 
            return normally_effective
        end
    elseif if atk::AbstractType == Electric()
        if def::AbstractType == Water()
            return not_very_effective
        elseif def::AbstractType == Grass()
            return super_effective
        elseif def::AbstractType == Ground()
            return no_effect
        else 
            return normally_effective
        end
    elseif if atk::AbstractType == Grass() 
        if def::AbstractType == Fire() || def::AbstractType == Poison()
            return not_very_effective
        elseif def::AbstractType == Water() || def::AbstractType == Ground()
            return super_effective
        else 
            return normally_effective
        end
    elseif if atk::AbstractType == Ice() 
        if def::AbstractType == Fire() || def::AbstractType == Water()
            return not_very_effective
        elseif def::AbstractType == Grass() || def::AbstractType == Ground()
            return super_effective
        else 
            return normally_effective
        end
    elseif if atk::AbstractType == Fighting() 
        if def::AbstractType == Poison()
            return not_very_effective
        elseif def::AbstractType == Normal() || def::AbstractType == Ice()
            return super_effective
        else 
            return normally_effective
        end
    elseif if atk::AbstractType == Poison() 
        if def::AbstractType == Ground()
            return not_very_effective
        elseif def::AbstractType == Grass()
            return super_effective
        else 
            return normally_effective
        end
    elseif if atk::AbstractType == Ground() 
        if def::AbstractType == Grass()
            return not_very_effective
        elseif def::AbstractType == Fire() || def::AbstractType == Electric() || def::AbstractType == Poison()
            return super_effective
        else 
            return normally_effective
        end
    else
        return "error"
    end
end
end
end
end
end
end
end
end
end
end

#defining eff_string
function eff_string(atk::AbstractType, def::AbstractType)
    if eff(atk, def) == super_effective
        return "The attack was super effective"
    elseif eff(atk, def) == normally_effective
        return "The attack was normally effective"
    else
        return "The attack was not effective..."
    end
end

#define Attack function
function attack(atk::AbstractType, def::AbstractType)
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
eff(Ground(), Ground())

eff_string(Fighting(), Normal())
eff_string(Normal(), Water())
eff_string(Water(), Water())
eff_string(Normal(), Normal())
eff_string(Fire(), Electric())
eff_string(Electric(), Ground())

attack(Fighting(), Normal())
attack(Normal(), Water())
attack(Water(), Water())
attack(Normal(), Normal())
attack(Fire(), Electric())
attack(Electric(), Ground())