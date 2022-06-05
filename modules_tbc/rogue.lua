local addonName, addon = ...

if addon.playerClass == "ROGUE" then
	local config = addon.config
	local netherbladeSet = {29044, 29045, 29046, 29047, 29048}

	if config.debug then
		DEFAULT_CHAT_FRAME:AddMessage("> Loaded " .. addon.playerClass .. " TBC module" ,1,0,0)
	end

	-- Slice and Dice
	local sliceAndDiceDuration = function()
		local maxValue = 21

		-- Talent
		local rank = addon:GetTalentRank(2, 4)
		maxValue = maxValue + (maxValue * (rank * 0.15))

		-- Netherblade
		local netherbladeCount = addon:GetItemSetCount(netherbladeSet)
		if netherbladeCount > 1 then
			maxValue = maxValue + 3
		end

		return maxValue
	end

	local sliceAndDiceBar = addon:CreateBar("player", 5171, sliceAndDiceDuration, 19)

	-- Expose Armor
	local exposeArmorDuration = 30
	local exposeArmorBar = addon:CreateBar("target", 26866, exposeArmorDuration, 5)
	exposeArmorBar.colors = config.exposeArmorColor
	exposeArmorBar.label:Hide()

	-- Rupture
	local ruptureDuration = 24
	local ruptureBar = addon:CreateBar("target", 1943, ruptureDuration, 6)
	ruptureBar.colors = config.ruptureColor
	ruptureBar.label:Hide()

	-- Garrote
	local garroteDuration = 18
	local garroteBar = addon:CreateBar("target", 703, garroteDuration, 6)
	garroteBar.colors = config.garotteColor
	garroteBar.label:Hide()

	-- Cloak of Shadows
	if config.showClosBar then
		local closDuration = 5
		local closBar = addon:CreateBar("player", 31224, closDuration, 3)
		closBar.colors = config.closColor
		closBar.label:Hide()
	end

	-- Vanish
	if config.showVanishBar then
		local vanishDuration = 3
		local vanishBar = addon:CreateBar("player", 1856, vanishDuration, 3)
		vanishBar.colors = config.vanishColor
		vanishBar.label:Hide()
	end
end
