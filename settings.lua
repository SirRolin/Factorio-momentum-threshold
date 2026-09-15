local momentumSettings = require("__sir-rolins-momentum-modules__/lib/settings")

local settingsPackage = {
    {
        type = "double-setting",
        name = "sr-mom-ramping-threshold-scaling",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.8,
        maximum_value = 3.0
    }
}

-- Shared by every threshold module, added on top of the two base modules each one is made from.
momentumSettings.addRecipeSettings(settingsPackage, "threshold", "Threshold mod", {
    items = {
        { item = "electronic-circuit", amount = 2 },
        { item = "advanced-circuit",   amount = 1 },
    },
})

data:extend(settingsPackage)
