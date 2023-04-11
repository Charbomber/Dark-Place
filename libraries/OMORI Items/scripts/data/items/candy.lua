local item, super = Class(HealItem, "candy")

function item:init()
    super.init(self)

    self.name = "Candy"
    self.use_name = nil

    self.type = "item"
    self.icon = nil

    self.effect = "Heals\n30HP"
    self.shop = nil
    self.description = "A child's favorite food. Sweet!\n+30HP"

    self.heal_amount = 30

    self.price = 10
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {}
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {}

    self.reactions = {
        susie = "",
        ralsei = "",
        noelle = ""
    }
end

return item