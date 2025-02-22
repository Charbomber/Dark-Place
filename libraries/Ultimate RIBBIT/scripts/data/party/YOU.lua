local character, super = Class(PartyMember, "YOU")

function character:init()
    super.init(self)

    -- Display name
    self.name = "YOU"

    self.ribbit = true

    -- Actor (handles overworld/battle sprites)
    self:setActor("YOU")
    self:setLightActor("YOU_lw")

    -- Display level (saved to the save file)
    self.level = 1
    -- Default title / class (saved to the save file)
    self.title = "Frog\nPotential heros.\nThe pression's on!"

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 2
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {1, 0, 0}

    -- Whether the party member can act / use spells
    self.has_act = true
    self.has_spells = false

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "Y-Action"

    -- Current health (saved to the save file)
    self.health = 90

    -- Base stats (saved to the save file)
    self.stats = {
        health = 90,
        attack = 10,
        defense = 2,
        magic = 0
    }
    -- Max stats from level-ups
    self.max_stats = {
        health = 120
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/guitar"

    -- Equipment (saved to the save file)
    self:setWeapon("vee")
    --self:setArmor(1, "realshield")

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/guilt_tripping"
    self.lw_armor_default = "light/ignorance"

    -- Character color (for action box outline and hp bar)
    self.color = {0, 1, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.5, 1, 1}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {0, 162/255, 232/255}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0, 0, 1}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {0.5, 1, 1}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/you/head"
    -- Path to head icons used in battle
    self.head_icons = "party/you/icon"
    -- Name sprite
    self.name_sprite = "party/you/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = {2, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil
end

function character:onPowerSelect(menu)
    if Utils.random() < 0.03 then
        menu.kris_dog = true
    else
        menu.kris_dog = false
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 and menu.kris_dog then
        local frames = Assets.getTexture("ui/menu/gofuck_urself")
        love.graphics.print("gofuck urself", x, y)
        love.graphics.draw(frames, x+120, y+35, 0, 2, 2)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
        return true
    end
end

return character