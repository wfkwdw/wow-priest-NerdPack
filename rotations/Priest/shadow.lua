local _, yobleed = ...
local NeP = NeP

--[[TO DO:
count.buff/debuff() with count.enemies/friendly.buff/debuff()
counts how many have the buff/debuff
Vampiric Touch:
enemyndebuff(Vampiric Touch) FAKEUNIT
Shadow Word: Pain  :
enemyndebuff(Shadow Word: Pain) FAKEUNIT
Shadow Word: Death :
Lowestenemy FAKEUNIT
]]--

local GUI = {
  -- GUI Header
  {
    type = 'texture',
    texture = 'Interface\\AddOns\\Nerdpack-Yobleed\\media\\shadow.blp',
    width = 512,
    height = 256,
    offset = 90,
    y = 42,
    center = true
  },

  -- GENERAL
  {type = 'header', text = 'General', align = 'center'},
  {type = 'checkbox', text = 'Shadow Mend OOC', key = 'shadowmend', default= false},
  {type = 'text', text = 'Mythic +', align = 'center'},
  {type = 'checkbox', text = 'Target Fel Explosives', key = 'myth_fel', default= false},
  {type = 'text', text = 'Before Pull', align = 'center'},
  {type = 'checkbox', text = 'Potion of Prolonged Power', key = 's_pull', default= false},
  {type = 'checkbox', text = 'Mind Blast', key = 'pull_MB', default = false},
  {type = 'text', text = 'Movement', align = 'center'},
  {type = 'checkbox', text = 'Body and Soul', key = 'm_Body', default = false},
  {type = 'spinner', text = 'Mass SWP - Units', key = 'SWP_UNITS', align = 'left', width = 55, step = 1, default = 4},
  {type = 'ruler'}, {type = 'spacer'},

  -- COOLDOWNS
  {type = 'header', text = 'Cooldowns if Toggled', align = 'center'},
  {type = 'checkbox', text = 'Hero Potion of Prolonged Power', key = 's_PP', default= false},
  {type = 'text', text = 'Trinkets', align = 'center'},
  {type = 'checkbox', text = 'Charm of the Rising Tide', key = 'tide', step = 1, default = false, max = 50},
  {type = 'spinner', text = '=>', key = 'tidespin', default = 35},
  {type = 'spinner', text = '', key = 's_GotNspin', default = 40},
  {type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', default = false},
  {type = 'checkbox', text = 'Bottom Trinket', key = 'trinket_2', default = false},
  {type = 'text', text = 'Power Infusion', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_PI', default= false},
  {type = 'spinner', text = 'Target <= 35%', key = 'dps_PIspin1', align = 'left', step = 1, default = 15},
  {type = 'spinner', text = 'Target > 35%', key = 'dps_PIspin2', align = 'left', step = 1, default = 15},
  {type = 'text', text = 'Shadowfiend/Mindbender', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_fiend', default= false},
  {type = 'spinner', text = 'Stacks', key = 'dps_SFspin', align = 'left', step = 1, default = 22},
  {type = 'text', text = 'Void Torrent', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_void', default= false},
  {type = 'text', text = 'Dispersion', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_D', default= false},
  {type = 'spinner', text = 'Insanity', key = 'dps_Dinsanityspin', align = 'left', max = 50, step = 5, default = 45},
  {type = 'spinner', text = 'Target <= 35%', key = 'dps_Dspin', align = 'left', min = 15, max = 50, step = 1, default = 44},
  {type = 'spinner', text = 'Target > 35%', key = 'dps_D2spin', align = 'left', min = 15, max = 50, step = 1, default = 30},
  {type = 'text', text = 'Arcane Torrent', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_at', default= true},
  {type = 'checkspin',text = 'Light\'s Judgment - Units', key = 'LJ', spin = 4, step = 1, max = 20, check = true, desc = '|cff00FF96World Spell usable on Argus.|r'},
  {type = 'ruler'}, {type = 'spacer'},

  -- GUI Survival & Potions
  {type = 'header', text = 'Survival & Potions', align = 'center'},
  {type = 'checkbox', text = 'Fade', key = 's_F', default= false},
  {type = 'checkbox', text = 'Power Word: Shield', key = 's_PWS', default = false},
  {type = 'spinner', text = '', key = 's_PWSspin', default = 40},
  {type = 'checkbox', text = 'Shadow Mend', key = 's_mend', default = false},
  {type = 'spinner', text = '', key = 's_mendspin', default = 40},
  {type = 'checkbox', text = 'Dispersion', key = 's_D', default = false},
  {type = 'spinner', text = '', key = 's_Dspin', align = 'left', default = 20},
  {type = 'checkbox', text = 'Gift of the Naaru', key = 's_GotN', default = false},
  {type = 'spinner', text = '', key = 's_GotNspin', default = 40},
  {type = 'checkspin', text = 'Healthstone', key = 'HS', spin = 30, check = false},
  {type = 'checkspin', text = 'Ancient Healing Potion', key = 'AHP', spin = 30, check = false},
  {type = 'checkspin', text = 'Astral Healing Potion', key = 'AsHP', spin = 30, check = false},
  {type = 'ruler'},{type = 'spacer'},
  {type = 'ruler'}, {type = 'spacer'},

  -- GUI Party Support
  {type = 'header', text = 'Party Support', align = 'center'},
  {type = 'checkbox', text = 'Gift of the Naaru', key = 'sup_GotN', default = false},
  {type = 'spinner', text = '', key = 'sup_GotNspin', default = 20},
  {type = 'checkbox', text = 'Power Word: Shield', key = 'sup_PWS', default = false},
  {type = 'spinner', text = '', key = 'sup_PWSspin', default = 20},

  -- GUI Keybinds
  {type = 'header', text = 'Keybinds', align = 'center'},
  {type = 'text', text = 'Left Shift: AOE|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
  {type = 'checkbox', text = 'Force AOE', key = 'k_AOE', default = false},
  {type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', default = false},
  {type = 'checkbox', text = 'Pause', key = 'k_P', default = false},
  {type = 'ruler'}, {type = 'spacer'},
}

local exeOnLoad = function()
  -- Rotation loaded message.
  print('|cff6c00ff ----------------------------------------------------------------------|r')
  print('|cff6c00ff --- |rPriest: |cff6c00ffSHADOW|r')
  print('|cff6c00ff --- |rSupported Talents:ToF,Body&Soul,Mind Bomb, LI, LoS, Tier 5 & 6 & 7')
  print('|cff6c00ff --- |cffff6800Mangaza\'s Madness & Norgannon\'s Foresight|r Supported')
  print('|cff6c00ff ----------------------------------------------------------------------|r')
  print('|cff6c00ff --- |rQuestions or Issues? @Yobleed NeP discord channel')
  print('|cff6c00ff ----------------------------------------------------------------------|r')
  print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

  NeP.Interface:AddToggle({
    -- Mind Bomb toggle only active with AoE.
    key = 'abc',
    name = 'Mind Bomb AoE',
    text = 'Enable/Disable: Mind Bomb in rotation.',
    icon = 'Interface\\ICONS\\Spell_shadow_mindbomb',
  })

  NeP.Interface:AddToggle({
		key = 'xSWP',
		name = 'Shadow Word: Pain Mass DoT',
		text = 'Use Shadow Word: Pain on several mobs. (Changable within settings).',
		icon = 'Interface\\Icons\\spell_shadow_shadowwordpain',
	})

  NeP.Interface:AddToggle({
    -- Surrender to Madness toggle.
    key = 's2m',
    name = 'Surrender to Madness',
    text = 'Enable/Disable: Automatic S2M',
    icon = 'Interface\\ICONS\\Achievement_boss_generalvezax_01',
  })

  NeP.Interface:AddToggle({
key = 'control',
name = 'Dominant Mind',
text = 'ON/OFF NPC taming',
icon = 'Interface\\ICONS\\spell_shadow_charm', --toggle(control)
})

end

local SWP_MASS = {
	{'Shadow Word: Pain', 'range<41&combat&alive&count.enemies.debuffs<UI(SWP_UNITS)&debuff.duration<3', 'enemies'}
}

local Mythic = {
  {'!Void Eruption', 'id(120651) & range <= 40 & infront', 'enemies'},
  {'!Shadow Word: Death', 'id(120651) & range <= 40', 'enemies'},
  {'!Mind Blast', 'id(120651) & range <= 40 & infront' , 'enemies'},
  {'Shadow Word: Pain', 'id(120651) & range <= 40 & !debuff(Shadow Word: Pain)', 'enemies'},
  {'Mind Flay', 'id(120651) & range <= 40 & debuff(Shadow Word: Pain) & infront', 'enemies'},
}

local Zeks = {
  --Shadow Word Death with Zek's Exterminatus
  {'!Shadow Word: Death', 'equipped(144438) & !player.buff(Voidform) & player.spell(Mind Blast).cooldown > gcd', 'target'},
  {'!Shadow Word: Death', 'equipped(144438) & player.spell(Void Eruption).cooldown > gcd & player.spell(Mind Blast).cooldown > gcd & player.buff(Voidform)', 'target'},
}
local Survival = {
  -- Fade usage if enabled in UI.
  {'Fade', 'player.aggro & UI(s_F)'},
  -- Power Word: Shield usage if enabled in UI.
  {'Power Word: Shield', 'player.health <= UI(s_PWSspin) & UI(s_PWS)', 'player'},
  --Shadow Mend usage if enabled in UI.
  {'Shadow Mend', 'UI(s_mend) & health <= UI(s_menspin)', 'player'},
  -- Dispersion usage if enabled in UI.
  {'!Dispersion', 'player.health <= UI(s_Dspin) & UI(s_D)'},
  -- Gift of the Naaru usage if enabled in UI.
  {'Gift of the Naaru', 'player.health <= UI(s_GotNspin) & UI(s_GotN)'},
}

local Potions = {
  -- Potion of Prolonged Power usage if enabled in UI.
  {'#142117', 'player.hashero & !player.buff(Potion of Prolonged Power) & UI(s_PP)'},
--Health Stone.
{'#5512', 'item(5512).usable&item(5512).count>0&player.health<=UI(HS_spin)&UI(HS_check)', 'player'},
--Ancient Healing Potion.
{'#127834', 'item(127834).usable&item(127834).count>0&player.health<=UI(AHP_spin)&UI(AHP_check)'},
--Astral Healing Potion.
{'#152615', 'item(152615).usable&item(152615).count>0&player.health<=UI(AsHP_spin)&UI(AsHP_check)'},
}

local Trinkets = {
  -- Top Trinket usage if enabled in UI.
  {'#trinket1', 'UI(trinket_1)', 'target'},
  -- Bottom Trinket usage if enabled in UI.
  {'#trinket2', 'UI(trinket_2)', 'target'},
}

local Keybinds = {
  --Forcing AOE
  {{
    {'!Void Eruption', ' & UI(k_AOE) & !player.buff(Voidform)', 'target'},
    {'!Shadow Crash', '!moving', 'target.ground'},
    {'!Shadow Word: Pain', '!debuff & UI(k_AOE)', {'target', 'mouseover'}},
    {'!Mind Flay', 'debuff(Shadow Word: Pain) & UI(k_AOE)', 'target'},
  }, 'keybind(lshift)'},
  --Mass Dispel on Mouseover target Left Control when checked in UI.
  {'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
  -- Pause on Left-Alt if enabled in UI.
  {'%pause', 'keybind(lalt) & UI(k_P)'},
}

local Movement = {
  -- Body and Soul usage if enabled in UI.
  {'!Power Word: Shield', 'talent(2,2) & UI(m_Body) ', 'player'},
}

local Support = {
  -- Gift of the Naaru usage if enabled in UI.
  {'!Gift of the Naaru', 'lowest.health <= UI(sup_GotNspin) & UI(sup_GotN)', 'lowest'},
  -- Power Word: Shield usage if enabled in UI.
  {'!Power Word: Shield', 'lowest.health <= UI(sup_PWSspin) & UI(sup_PWS)', 'lowest'},
}

local Interrupts = {
  -- Silence selected target.
  {'!Silence'},
  -- Arcane Torrent if within 8 yard range of selected target when Silence is on cooldown.
  {'!Arcane Torrent', 'target.range <= 8 & spell(Silence).cooldown > gcd & !lastgcd(Silence)'},
}

local Surrender = {
  --Surrender to Madness if player has talent and BOSS is dying within 1:40 (100 stacks) and toggled.
  {'!Surrender to Madness', 'talent(7,3) & target.deathin <= 100 & toggle(s2m) & !player.buff(Surrender to Madness) & target.boss & boss.exists'},
  -- S2M when in Xavius Dreamstate.
  {'!Surrender to Madness', 'talent(7,3) & player.debuff(Dream Simulacrum) & toggle(s2m) & !player.buff(Surrender to Madness)'},
}

local Insight = {
  -- Mind Blast when buffed with Shadowy Insight only when Voidbolt is on CD.
  {'!Mind Blast', '!player.spell(Void Eruption).cooldown == 0','target'},
}

local Emergency = {
  --Dispersion when SWD charges are 0 and VoiT is on CD and insanity below or equal to 20%.
  {'!Dispersion', 'player.spell(Shadow Word: Death).charges < 1 & !spell(Void Torrent).cooldown > 0 & player.insanity <= 20 & !talent(7,1) & !talent(7,2) & UI(dps_D)'},
  --Arcane Torrent if SWD on cd or not usable, dispersion is on CD and insanity is low
  {'!Arcane Torrent', 'UI(dps_at) & player.insanity <= 35 & {!spell(Shadow Word: Death).cooldown > 0 || !target.health <= 35} & !spell(Dispersion).cooldown > 0'},
  --Power Infusion if talent active and VF stacks are 70 or higher if SWD charges are 0 and insanity is 50% or below.
  {'!Power Infusion', 'talent(6,1) & player.buff(voidform).count >= 80 & spell(Shadow Word: Death).charges < 1 & player.insanity <= 60 & UI(dps_PI)'},
}

local cooldowns = {
  --Torrent on CD.
  {'!Void Torrent', 'player.spell(Void Eruption).cooldown > 0 & UI(dps_void) & player.buff(Voidform).count > 3 & set_bonus(T19) == 4', 'target'},
  {'!Void Torrent', 'UI(dps_void) & !set_bonus(T19) == 4', 'target'},
  --Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target below or equal to 35% health.
  {'!Power Infusion', 'talent(6,1) & player.buff(Surrender to Madness) & player.buff(Voidform).count >= 50 & player.insanity >= 50 & !spell(Void Eruption).cooldown == 0 & !spell(Void Torrent).cooldown == 0 & !spell(Dispersion).cooldown == 0 & UI(dps_PI)', 'player'},
  --Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target below or equal to 35% health.
  {'Power Infusion', 'talent(6,1) & !player.buff(Surrender to Madness) & player.buff(Voidform).count >= UI(dps_PIspin1) & target.health <= 35 & UI(dps_PI)', 'player'},
  --Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target above or 35% health.
  {'Power Infusion', 'talent(6,1) & !player.buff(Surrender to Madness) & player.buff(Voidform).count >= UI(dps_PIspin2) & target.health > 35 & UI(dps_PI)', 'player'},
  {'!#147002', 'equipped(147002) & player.buff(Voidform) & player.spell(Void Torrent).cooldown ~= 0 & player.buff(Voidform).count >= UI(tidespin) & UI(tide)'},
  --Mindbender if talent is active on CD in S2M.
  {'!Mindbender', 'talent(6,3) & player.buff(Surrender to Madness)'},
  --Mind Bender if talent is active and not in S2M if VF stacks are above 5.
  {'!Mindbender', 'talent(6,3) & !player.buff(Surrender to Madness) & player.buff(Voidform).count >= UI(dps_SFspin) & UI(dps_fiend)', 'target'},
  --Shadowfiend if Void Bolt is on CD and VF stacks are above 10 when Power Infusion talent is not active.
  {'!Shadowfiend', '!player.spell(Void Eruption).cooldown == 0 & player.buff(Voidform).count >= UI(dps_SFspin) & !talent(6,1) & UI(dps_fiend)', 'target'},
  --Shadowfiend if PI and above 40% insanity.
  {'!Shadowfiend', 'player.buff(Power Infusion) & player.buff(Voidform).count >= UI(dps_SFspin) & UI(dps_fiend)'},
  {'Light\'s Judgment', 'UI(LJ_check)&range<61&area(15).enemies>=UI(LJ_spin)', 'enemies.ground'}
}

local AOE = {
  {{
    {'Vampiric Touch', 'ttd >= 7 & distance <= 40 & combat & !player.lastcast(Vampiric Touch) & !debuff', 'enemies'},
    {'Shadow Word: Pain', '!debuff & !talent(6,2) & distance <= 40 & combat', 'enemies'},
  }, 'player.buff(Voidform) & {!player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0||!player.insanity == 100}'},
  --Shadow Crash on CD.
  {'Shadow Crash', 'area(8).enemies >= 2 & player.buff(Voidform) & !target.moving & spell(Void Eruption).cooldown > 0', 'target.ground'},
}

local ST = {
  --Void Eruption if VT on target is 6seconds or higher and SWP on target and no S2M.
  {'!Void Eruption', 'debuff(Vampiric Touch).duration > 4 & !player.buff(Surrender to Madness) & debuff(Vampiric Touch) & debuff(Shadow Word: Pain)','target'},
  --SWD when target below 35
  {'!Shadow Word: Death', '!player.insanity >= 65 & !player.channeling(Void Eruption)','target'},
  --Misery.
  {'Vampiric Touch', '!debuff(Shadow Word: Pain) & talent(6,2) & !player.lastcast(Vampiric Touch)','target'},
  --Mind Blast if player is channeling Mind Flay.
  {'!Mind Blast', 'player.channeling(Mind Flay)','target'},
  {'Mind Blast', 'equipped(Mangaza\'s Madness) & debuff(Vampiric Touch) & debuff(Shadow Word: Pain)', 'target'},
  --Mind Blast on CD.
  {'Mind Blast', '!equipped(Mangaza\'s Madness)','target'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'Shadow Word: Pain', 'debuff.duration < 3 & !talent(6,2)','target'},
  {'Vampiric Touch', '!player.lastcast(Vampiric Touch) & !debuff','target'},
  {'Mind Flay', nil,'target'},
}

local lotv = {
  {{
    {'!Shadow Word: Death', '!player.spell(Void Eruption).cooldown == 0 & player.moving', 'target'},
    {'!Shadow Word: Death', '{!player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 & player.spell(Shadow Word: Death).charges > 1} || {!player.channeling(Mind Blast) & !player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 }', 'target'},
    {'!Shadow Word: Death', '!player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 & !player.channeling(Void Eruption)', 'target'},
  }, '!target.area(10).enemies >= 4'},
  --Dispersion if VF stacks are above or equal to UI value and checked and SWD charges are 0 and if insanity is below 20% and Target Health is below or equal to 35% health.
  {'!Dispersion', 'player.buff(Voidform).count >= UI(dps_Dspin) & UI(dps_D) & spell(Shadow Word: Death).charges < 1 & player.insanity <= UI(dps_Dinsanityspin) & target.health <= 35 & !player.spell(Void Torrent).cooldown == 0','target'},
  --Dispersion if VF stacks are above or equal to UI value and checked and if insanity is below 20% and Target Health is above 35% health.
  {'!Dispersion', 'player.buff(Voidform).count >= UI(dps_D2spin) & UI(dps_D) & !player.buff(Surrender to Madness) & player.insanity <= UI(dps_Dinsanityspin) & target.health > 35 & !player.spell(Void Torrent).cooldown == 0','target'},
  --Void Bolt on CD not interrupting casting MB.
  {'!Void Eruption', '!player.channeling(Mind Blast)','target'},
  --Mind Flay if Dots are up and VB and MB are on CD.
  {'Mind Flay', 'area(8).enemies >= 4 & debuff(Shadow Word: Pain)','target'},
  --Mind Blast on CD if VB is on CD.
  {'Mind Blast', '!player.spell(Void Eruption).cooldown <= gcd & debuff(Vampiric Touch) & debuff(Shadow Word: Pain) & equipped(Mangaza\'s Madness)','target'},
  {'Mind Blast', '!player.spell(Void Eruption).cooldown <= gcd & !equipped(Mangaza\'s Madness)','target'},
  --Mind Blast if player is channeling Mind Flay.
  {'!Mind Blast', 'player.channeling & !player.spell(Void Eruption).cooldown <= gcd & !area(10).enemies >= 4 ','target'},
  --Misery.
  {'!Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & !player.lastcast(Vampiric Touch)','target'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'Shadow Word: Pain', 'debuff.duration < 3 & {!talent(6,2)||player.moving}','target'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'Vampiric Touch', '!player.lastcast(Vampiric Touch) & !debuff','target'},
  {'Mind Flay', nil,'target'},
}


local inCombat = {
  {'Shadowform', '!player.buff(Voidform) & !player.buff(Shadowform) & !player.lastcast(Shadowform)', 'player'},
  {'!/stopcasting','debuff(Quake).any.duration <= gcd & debuff(Quake).any','player'}, --Quaking 
  {'Mind Bomb','toggle(abc) & target.area(8).enemies >= 3'},--Mind Control
  {'Mind Control', 'talent(3,3) & !creatureType(Demon) & !creatureType(Mechanical) & !creatureType(Undead) & !creatureType(Aberration) & combat & toggle(control) & !boss','enemies'},
  {Movement,'player.movingfor >= 1 & !player.buff(Voidform) || {player.buff(Voidform) & !spell(Void Eruption).cooldown == 0}'},
  {SWP_MASS,'toggle(xSWP)'},
  {Surrender},
  {Mythic,'partycheck == 2 & UI(myth_fel)'},
  {Emergency},
  {Potions},
  {Survival,'player.health < 100 & !player.buff(Surrender to Madness)'},
  {Support,'!player.buff(Surrender to Madness) '},
  {cooldowns,'toggle(cooldowns) & player.buff(Voidform)'},
  {Zeks},
  {Insight,'player.buff(Shadowy Insight) & {{talent(7,1) & !player.insanity >= 65} || {talent(7,3) ||talent(7,2) & !player.insanity == 100}} || {player.moving & !player.buff(Surrender to Madness)}'},
  {Keybinds},
  {Trinkets},
  {Interrupts, 'toggle(interrupts) & target.interruptAt(70) & target.infront & target.range <= 30'},
  {AOE,'toggle(AOE) & range <= 40'},
  {lotv,'player.buff(Voidform)'},
  {ST,'!player.buff(Voidform)'},
}

local outCombat = {
  {'!/stopcasting','debuff(Quake).any.duration <= gcd & debuff(Quake).any','player'}, --Quaking 
  {'Shadow Mend', 'UI(shadowmend) & health < 90', 'player'},
  -- Potion of Prolonged Power usage before pull if enabled in UI.
  {'#142117', 'pull_timer >= 1 & pull_timer < 4 & UI(s_pull)'},
  -- Mind Blast before Pull.
  {'8092', 'pull_timer >= 1 & pull_timer <= 1.2 & UI(pull_MB)'},
  {'Shadowform', '!player.buff(Shadowform) & !player.lastcast(Shadowform)','player'},
  --No Body and Soul from Class Hall.
  {Movement, 'player.movingfor >= 1 & !player.buff(Body and Soul) & !inareaid == 1040'},
}

NeP.CR:Add(258, {
  name = '|cff6c00ff [Yobleed]|r Priest - |cff6c00ffShadow|r',
  ic = {{inCombat, '!player.channeling(Void Torrent)'}},
  ooc = outCombat,
  gui = GUI,
  gui_st = {title='Yobleed\'s Priest Pack: Shadow', width='512', height='256', color='6c00ff'},
  load = exeOnLoad,
  ids = yobleed.spell_ids
})
