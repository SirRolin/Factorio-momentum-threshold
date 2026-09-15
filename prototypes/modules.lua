local momentum = require("__sir-rolins-momentum-modules__/lib/momentum")
require("__sir-rolins-momentum-modules__/lib/module_list")
local SetupThresholdMod = momentum.SetupThresholdMod

local thresholdScaling = settings.startup["sr-mom-ramping-threshold-scaling"].value

local package = {}

-- A threshold module for every ordered pair of module list entries of the same family, e.g.
-- productivity-speed (a productivity module that turns into a speed module at 10 momentum)
-- and speed-productivity. Mixing families (e.g. a clean module with a vanilla one) is skipped,
-- which keeps the number of combinations down.
local modules = getModuleList()
for _, before in pairs(modules) do
	for _, after in pairs(modules) do
		if before ~= after and before.family == after.family then
			local name = before.name .. "-" .. after.name
			-- Both directions of a pair share one row, named after the alphabetically first one.
			local subgroup = before.name < after.name and name or (after.name .. "-" .. before.name)
			local beforeName = momentum.categoryName(before.name)
			local afterName = momentum.categoryName(after.name)
			for tier = 1, 3 do
				local b, a = before["tier" .. tier], after["tier" .. tier]
				if b and a then
					local names = {
						name = tier == 1
							and { "sr-mom-name.threshold", beforeName, afterName }
							or  { "sr-mom-name.threshold-tier", beforeName, afterName, tostring(tier) },
						description = function(i) return { "sr-mom-description.threshold", beforeName, afterName, tostring(i) } end,
					}
					-- Left half/first lights = the module it starts as, right half/second lights = what it turns into.
					local icons = momentum.getSplitTintedIcons(tier, before.baseColour, after.baseColour, before.lightColour, after.lightColour)
					-- Recipes use the shared threshold recipe settings: 1 of each base module + extras, makes 2.
					SetupThresholdMod(package, name, b.category, { b, a }, tier, icons, thresholdScaling,
						{ recipeSettings = "threshold", names = names, subgroup = subgroup })
				end
			end
		end
	end
end

data:extend(package)
