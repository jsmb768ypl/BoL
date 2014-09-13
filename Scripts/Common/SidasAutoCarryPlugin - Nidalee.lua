--Nidalee Reborn Plugin by Chancey and Kain, BETA
--Pounce to mouse holding spacebar
--Combos with WEQ while in Cougar (Aims pounce to enemy perfectly)
--Hit Box PROdicition for Javelin Toss
--Jungle Farming Q/W/E Cougar
--Lane Clearing with W/E Cougar
--Auto Heal Self, Allies, and Force Heal (When in cougar form)
--Auto switch to human and Q when enemy killable.
--Auto switch to cougar when close range.
--Auto switch to cougar and pounce for speed when running longer distances. Optionally show waypoints for this.
--Properly keep track of cooldowns even when in other form.
--Draw targets waypoints (where they are moving to) and line to target.
--Human Q, then cougar pounce away. Does higher Q damage.

--[[
	Version History:
		Version: 1.43:
			Added Revamped compatibility.
			Made heal only occur between auto attacks, instead of interrupting.
			Added alerting of available human spells when in cougar form.
			Fix pounce not spamming in AutoCarry mode. Now only fires when mouse distance far enough. See extras menu.
			Added toggle for mouse pounce.
			Renamed pounce in menu to Rush Pounce for distances.
			Added Revamped jungle clearing.
		Version: 1.39:
			Replaced ignite function.
			Fixed Q killsteal.
			Fixed pounce range on Q killsteal.
			Changed default hotkeys on heal and cougar.
		Version: 1.35:
			First public release.

	To Do:
--]]

if myHero.charName ~= "Nidalee" then return end

LoadVIPScript('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AE7A7C3F081BD1C307827E32D4D8093E')

--UPDATEURL=
--HASH=25570CCBDB7715FE478B1CA8FE8933B2
