local _, yobleed = ...
local NeP = NeP

--count.friendly.buffs(Plea)
-- Counts how many units have the buff
-- USAGE: count(BUFF).buffs > = #
local GUI = {
-- GUI Header
{type = "texture",
texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\disc.blp",
width = 512,
height = 256,
offset = 90,
y = 42,
center = true},
--GENERAL
{type = 'header', text = '通用设置', align = 'center'},
{type = 'checkbox', text = '战斗外治疗', key = 'ooc_heal', width = 55, default = true},
{type = 'checkbox', text = '神级治疗', key = 'myth_heal', width = 55, default = false},
{type = 'checkbox', text = '攻击邪能炸药', key = 'myth_fel', width = 55, default = false},
{type = 'checkbox', text = '战斗外救赎', key = 'ato', width = 55, default = false},

--TOS DISPELLING
{type = 'header', text = '驱散', align = 'center'},
{type = 'text', text = '仅高级', align = 'center', color ='FF0000'},
{type = 'ruler'},{type = 'spacer'},

--Healing Options
{type = 'text', text = '治疗选项', align = 'center'},
{type = 'checkspin',text = '暗影契约', key = 'SC', check = true, spin = 80},
{type = 'checkbox', text = '使用苦修治疗', key = 'Penance', width = 55, default = false},
{type = 'spinner', text = '血量低于：', key = 'Penance_spin', width = 55, step = 5, default = 30},
{type = 'checkbox', text = '自动真言术：耀', key = 'PWR', width = 55, default = false},
{type = 'checkbox', text = '自动福音', key = 'Evang', width = 55, default = false},
{type = 'spinner', text = '血量低于70%的玩家数量', key = 'Evang_spin', width = 55, max = 40, step = 1, default = 5},
{type = 'spinner', text = '救赎', key = 'Evang2_spin', width = 55, max = 40, step = 1, default = 5},
{type = 'checkbox', text = '自动暗影魔', key = 'SF', width = 55, default = false},
{type = 'spinner', text = '血量低于70%的玩家数量', key = 'LW_spin', width = 55, max = 40, step = 1, default = 5},
{type = 'spinner', text = '救赎', key = 'LW2_spin', width = 55, max = 40, step = 1, default = 5},
{type = 'checkbox', text = '摧心魔', key = 'MB', width = 55, default = false},
{type = 'spinner', text = '法力值', key = 'MB_spin', width = 55, default = 90},
{type = 'checkbox', text = '开/关', key = 'dps_at', width = 55, default= true},
{type = 'ruler'},{type = 'spacer'},

--Cooldowns
{type = 'header', text = '当开关打开显示冷却', align = 'center'},
{type = 'checkbox', text = '为坦克使用痛苦压制', key = 'c_PSt', width = 55, default = false},
{type = 'checkbox', text = '为最低血量的使用痛苦压制', key = 'c_PSl', width = 55, default = false},
{type = 'ruler'},{type = 'spacer'},

-- GUI Moving
{type = 'header', text = '移动', align = 'center'},
{type = 'checkbox', text = '羽毛', key = 'm_AF', width = 55, default = false},
{type = 'checkbox', text = '加速盾', key = 'm_Body', width = 55, default = false},
{type = 'ruler'}, {type = 'spacer'},

--Resurrection
{type = 'header', text = '群体复活', align = 'center'},
{type = 'checkbox', text = '脱战后自动群活', key = 'rezz', width = 55, default = false},
{type = 'ruler'},{type = 'spacer'},

--TRINKETS
{type = 'header', text = '饰品', align = 'center'},
{type = 'checkbox', text = '饰品一', key = 'trinket_1', width = 55, default = false},
{type = 'checkbox', text = '饰品二', key = 'trinket_2', width = 55, default = false},
{type = 'ruler'},{type = 'spacer'},

--KEYBINDS
{type = 'header', text = '按键绑定', align = 'center'},
{type = 'text', text = 'Left Shift: PW: 真言术：耀 |Left Ctrl: 群体驱散|Alt: 暂停', align = 'center'},
{type = 'checkbox', text = '真言术：耀', key = 'k_PWB', width = 55, default = false},
{type = 'checkbox', text = '群体驱散', key = 'k_MD', width = 55, default = false},
{type = 'checkbox', text = '暂停', key = 'k_P', width = 55, default = false},
{type = 'ruler'},{type = 'spacer'},

--POTIONS
{type = 'header', text = '药剂', align = 'center'},
{type = 'text', text = '开/关', align = 'center'},
{type = 'checkspin', text = '治疗石', key = 'HS', spin = 30, check = false},
{type = 'checkspin', text = '治疗药水', key = 'AHP', spin = 30, check = false},
{type = 'checkspin', text = '活力药水', key = 'AsHP', spin = 30, check = false},
{type = 'checkspin', text = '法力药水', key = 'AMP', spin = 30, check = false},
{type = 'ruler'},{type = 'spacer'},

--Before Pull
{type = 'header', text = 'Pull Timer', align = 'center'},
{type = 'text', text = 'Before Pull.', align = 'center'},
{type = 'checkbox', text = 'Potion of Prolonged Power', key = 's_PPull', width = 55, default= false},
{type = 'checkbox', text = 'Pre-Pull Ramp', key = 'PWR_PPull', width = 55, default= false},
{type = 'ruler'}, {type = 'spacer'},

--Solo
{type = 'header', text = '单人模式', align = 'center'},
{type = 'text', text = '玩家血量值', align = 'center'},
{type = 'spinner', text = '纳鲁的赐福', key = 'full_Gift', width = 55, default = 20},
{type = 'spinner', text = '暗影愈合', key = 'full_mend', width = 55, default = 40},
{type = 'spinner', text = '真言术：盾', key = 'full_PWS', width = 55, default = 70},
{type = 'ruler'},{type = 'spacer'},

--TANK
{type = 'header', text = '坦克', align = 'center'},
{type = 'text', text = '坦克血量值', align = 'center'},
{type = 'spinner', text = '暗影愈合', key = 't_mend', width = 55, default = 40},
{type = 'ruler'},{type = 'spacer'},

--PLAYER
{type = 'header', text = '玩家', align = 'center'},
{type = 'text', text = '玩家血量值', align = 'center'},
{type = 'spinner', text = '暗影愈合', key = 'p_mend', width = 55, default = 40},

{type = 'ruler'},{type = 'spacer'},

--LOWEST
{type = 'header', text = '血量最低者', align = 'center'},
{type = 'text', text = '血量最低者血量值', align = 'center'},
{type = 'spinner', text = '真言术：盾', key = 'l_PWS', width = 55, default = 90},
{type = 'spinner', text = '暗影愈合', key = 'l_mend', width = 55, default = 40},

{type = 'ruler'},{type = 'spacer'},

--ATONEMENT
{type = 'header', text = '救赎治疗', align = 'center'},
{type = 'spinner', text = '最大挂dot数量', key = 'ato_potw', width = 55, default = 6, step = 1, max = 20},
{type = 'spinner', text = '苦修最低血量', key = 'ato_penhealth', width = 55, default = 100},
{type = 'spinner', text = '苦修救赎', key = 'ato_penato', width = 55, default = 3, step = 1, max = 20},
{type = 'spinner', text = '惩击最低血量', key = 'ato_smitehealth', width = 55, default = 100},
{type = 'spinner', text = '惩击救赎', key = 'ato_smiteato', width = 55, default = 3, step = 1, max = 20},
{type = 'ruler'},{type = 'spacer'},

}

local exeOnLoad = function()
-- Rotation loaded message.
print('|cff58FAF4 Priest:|r|cff58FAF4DISCIPLINE|r')
print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

NeP.Interface:AddToggle({
key = 'ramp',
name = 'Spike Damage',
text = '开/关升华救赎来应对接下来的伤害',
icon = 'Interface\\ICONS\\ability_mage_massinvisibility', --toggle(ramp)
})

NeP.Interface:AddToggle({
key = 'xDPS',
name = 'Solo',
text = '开/关 单人模式',
icon = 'Interface\\ICONS\\ability_priest_darkarchangel', --toggle(xDPS)
})

NeP.Interface:AddToggle({
key = 'disp',
name = 'Dispell',
text = '开/关驱散',
icon = 'Interface\\ICONS\\spell_holy_dispelmagic', --toggle(disp)
})


NeP.Interface:AddToggle({
key = 'control',
name = 'Dominant Mind',
text = '开/关 NPC控制',
icon = 'Interface\\ICONS\\spell_shadow_charm', --toggle(control)
})
end

--邪能炸药
local Felexplosive = {
{{
{'Purge the Wicked', 'id(120651) & range <= 40 & !debuff', 'enemies'},
{'Penance', 'id(120651) & range <= 40' , 'enemies'},
{'Shadow Word: Pain', '!talent(6,1) & id(120651) & range <= 40 & !debuff', 'enemies'}, --天赋已修正
{'Power Word: Solace', 'id(120651) & range <= 40', 'enemies'},
},'lowest.health >= 65 & UI(myth_fel) & enemies.infront'},
}


--欢天喜地 什么玩意儿》？
local Rapture = {
{'Penance', 'player.buff(Penitent)','target'},
{'Power Word: Shield', '!buff(Power Word: Shield)', {'lowest1','lowest2','lowest3','lowest4','lowest5','lowest6'}},
}


local PWR = {
{'Power Word: Radiance', 'area(30,65).heal >= 3 & !buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & advanced', {'lowest(tank)','lowest'}},
{'Power Word: Radiance', 'player.area(40,65).heal >= 3 & health <= 65 & !buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & !advanced', {'lowest(tank)','lowest'}},
{'Power Word: Radiance', 'area(30,85).heal >= 3 & !buff(Atonement) & player.spell(Power Word: Radiance).charges == 2 & advanced',{'lowest(tank)','lowest'}},  
{'Power Word: Radiance', 'player.area(40,85).heal >= 3 & health <= 85 & !buff(Atonement} & player.spell(Power Word: Radiance).charges == 2 & !advanced',{'lowest(tank)','lowest'}},
}

--CD好了就用的东西？
local Cooldowns = {
--Automatic Shadowfiend.
{'!Shadowfiend', 'UI(SF) & !talent(3,2) || partycheck == 2','target'}, --天赋已修正
--摧心魔 if mana is below or if 90%.
{'Mindbender', 'talent(3,2) & player.mana <= UI(MB_spin) & UI(MB)', 'target'}, --天赋已修正
--痛苦压制 if tank health is below or equal to 20% and checked.
{'!Pain Suppression', 'UI(c_PSt) & tank.health <= 20', 'tank'},
--痛苦压制 if lowest health is below or equal to 20% and checked.
{'!Pain Suppression', 'UI(c_PSl) & lowest.health <= 20', 'lowest'},
--Automatic usage of 福音.
--天赋已修正
{'!Evangelism', 'talent(7,3) & UI(Evang) & area(40,70).heal >= UI(Evang_spin) & buff(Sins of the Many).count >= UI(Evang2_spin) & lowest.buff(Atonement)','player'},

}

--饰品使用
local Trinkets = {
--Top Trinket usage if UI enables it.
{'#trinket1', 'UI(trinket_1)'},
--Bottom Trinket usage if UI enables it.
{'#trinket2', 'UI(trinket_2)'},
}

--快捷键绑定
local Keybinds = {
{{
  --真言术耀
{'Power Word: Radiance', '!buff(Atonement)', {'lowest','friendly'}}, --真言术耀
{'Power Word: Shield', '!buff(Atonement)',{'lowest','friendly'}},},'keybind(lshift) & UI(k_PWB)'},
{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
{'%pause', 'keybind(lalt)& UI(k_P)'},
}

--药水管理
local Potions = {
  --治疗石 5512.
  {'#5512', 'item(5512).usable&item(5512).count>0&player.health<=UI(HS_spin)&UI(HS_check)'},
  --海滨治疗药水.
  {'#152494', 'item(152494).usable&item(152494).count>0&player.health<=UI(AHP_spin)&UI(AHP_check)'},
  --海滨活力药水.
  {'#163082', 'item(163082).usable&item(163082).count>0&player.health<=UI(AsHP_spin)&UI(AsHP_check)'},
  --海滨法力药水.
  {'#152495', 'item(152495).usable&item(152495).count>0&player.mana<=UI(AMP_spin)&UI(AMP_check)'},
}

--升腾系列？
local Rampup = {
--Spreading Atonement before DPS if checked.
{'!Evangelism', 'buff(Sins of the Many).count >= 12  & partycheck == 3','player'},
{'!Evangelism', 'buff(Sins of the Many).count == 5  & partycheck == 2','player'},
{'Power Word: Radiance', '!buff(Atonement)', {'lowest','friendly'}},
{'Power Word: Shield', '!buff(Atonement)',{'lowest','friendly'}},

}


local Solo = {

{'Power Word: Radiance', 'partycheck == 2 & area(30).friendly >= 4 & target.is(target) & target.health.actual >= 617526 & buff(Sins of the Many).count < 5', 'player'},

--PWS if player health is below or if UI value.
{'Power Word: Shield', 'Health <= UI(full_PWS) & !buff(Power Word: Shield)', 'player'},
--Schism on cooldown 教派分歧.
--天赋已更新
{'Schism', "talent(1,3) & {!player.moving || player.buff(Norgannon's Foresight)}", 'target'},
--Shadowfiend on CD if toggled.
{'Shadowfiend', '!talent(3,2)', 'target'},
--Shadow Mend if player health is below or if UI value.
{'Shadow Mend', "player.health <= UI(full_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'player'},
--Purge the Wicked if talent and not on target. 
--净化邪恶 天赋已更新
{'Purge the Wicked', ' talent(6,1) & !debuff(Purge the Wicked) & !player.spell(Penance).cooldown == 0 & range <= 40 & combat & toggle(AOE)', 'enemies'},
{'Purge the Wicked', 'talent(6,1) & !debuff(Purge the Wicked)', 'target'},
--Shadow Word: Pain if not on target.
{'Shadow Word: Pain', '!talent(6,1) & !debuff(Shadow Word: Pain) & range <= 40 & combat & !player.spell(Penance).cooldown < gcd & toggle(AOE) & {{ttd >= 20 & partycheck = 3}||partycheck ~= 3}', 'enemies'},
{'Shadow Word: Pain', '!talent(6,1) & !debuff(Shadow Word: Pain)', 'target'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
--苦修
{'Penance', '{target.debuff(Purge the Wicked) || target.debuff(Shadow Word: Pain)} & infront', 'target'},
--真言术：慰 天赋已更新
{'Power Word: Solace', 'talent(3,3)', 'target'},
--Divine Star if mobs are 3 or more.
--神圣之星 天赋已更新
{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
--Divine Star if moving.
{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 1 & moving'},
--Smite on CD.
{'Smite', 'infront', 'target'},
}

--救赎管理
--下面功能天赋已更新
local Atonement = {
--Purge the Wicked if talent and not on target.
{'Purge the Wicked', ' talent(6,1) & !debuff(Purge the Wicked) & count(Purge the Wicked).enemies.debuffs < UI(ato_potw) & !player.spell(Penance).cooldown == 0 & range <= 40 & combat & !player.spell(Penance).cooldown < gcd & toggle(AOE) & {{ttd >= 20 & partycheck = 3}||partycheck ~= 3}', 'enemies'},
{'Purge the Wicked', ' talent(6,1) & !debuff(Purge the Wicked)', 'target'},
--Shadow Word: Pain if not on target.
{'Shadow Word: Pain', '!talent(6,1) & !debuff(Shadow Word: Pain) & count(Shadow Word: Pain).enemies.debuffs < UI(ato_potw) & range <= 40 & combat & !player.spell(Penance).cooldown < gcd & toggle(AOE) & {{ttd >= 20 & partycheck = 3}||partycheck ~= 3}', 'enemies'},
{'Shadow Word: Pain', '!talent(6,1) & !debuff(Shadow Word: Pain)', 'target'},
--Schism on cooldown.
{'Schism', "talent(1,3) & {!moving || player.buff(Norgannon's Foresight)}", 'target'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', '{target.debuff(Purge the Wicked)||!talent(6,1)} & count(Atonement).friendly.buffs >= UI(ato_penato) & lowest.health <= UI(ato_penhealth)', 'target'},
--Power Word: Solace on cooldown if talent.
{'Power Word: Solace', 'talent(3,3)', 'target'},
--Divine Star if mobs are 3 or more.
{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
--Mind Control
{'Mind Control', 'talent(4,2) & !creatureType(Demon) & !creatureType(Mechanical) & !creatureType(Undead) & !creatureType(Aberration) & combat & toggle(control) & !boss','enemies'},
--Smite on CD.
{'Smite', 'infront & count(Atonement).friendly.buffs >= UI(ato_smiteato) & lowest.health <= UI(ato_smitehealth)', 'target'}, --& {{partycheck = 3 & player.buff(Sins of the Many).count >= 5}||partycheck ~= 3}

}

local Tankpred = {
--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'lowest(tank).health.predicted <= UI(t_mend) & lowest(tank).buff(Atonement) & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health.predicted <= UI(t_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest(tank)'},
}

local Tank = {
--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'lowest(tank).health <= UI(t_mend) & lowest(tank).buff(Atonement) & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health <= UI(t_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest(tank)'},
}

local Playerpred = {
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'player.health.predicted <= UI(p_mend) & player.buff(Atonement) & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health.predicted <= UI(p_mend) & {!moving || buff(Norgannon's Foresight)}", 'player'},
--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
{'Halo','talent(6,3) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
{'Divine Star', 'talent(6,2) & player.area(24, 90).heal.infront >= 3 & toggle(AOE) & !toggle(xDPS)'},


}

local Player = {
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'player.health<= UI(p_mend) & player.buff(Atonement) & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health <= UI(p_mend) & {!moving || buff(Norgannon's Foresight)}", 'player'},
--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
{'Halo','talent(6,3) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
{'Divine Star', 'talent(6,2) & player.area(24, 90).heal.infront >= 3 & toggle(AOE) & !toggle(xDPS)'},


}

local Lowestpred = {
--Shadow Covenant if lowest and 5 or more at 30yds are below 90%.
{'Shadow Covenant', 'area(30,90).heal >= 5 & !debuff(Shadow Covenant) & !count(Shadow Covenant).friendly.debuffs >= 10 & UI(SC_check) & health <= UI(SC_spin)','lowestp'},
--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
--Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
{'Power Word: Shield', 'health <= UI(l_PWS) & !buff(Power Word: Shield) & !is(player)', 'lowest'},
--Penance Emergency Healing if Checked.
{'Penance', 'health <= UI(Penance_spin) & infront & UI(Penance)', 'lowestp'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'lowestp.health <= UI(l_mend) & lowestp.buff(Atonement) & !lowestp.health <= 30 & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health <= UI(l_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowestp'},


--Power Word: Shield on CD if not Atonement on 6 people max.
{'Power Word: Shield', '!buff(Atonement)', {'lowest(tank)', 'lowest1', 'lowest2', 'lowest3', 'lowest4', 'lowest5'}},
}

local Lowest = {
--Shadow Covenant if lowest and 3 or more at 30yds are below 90%.
{'Shadow Covenant', 'area(30,90).heal >= 3 & !debuff(Shadow Covenant) & !count(Shadow Covenant).friendly.debuffs >= 4 & UI(SC_check) & health <= UI(SC_spin)','lowest'},
--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
--Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
{'Power Word: Shield', 'health <= UI(l_PWS) & !buff(Power Word: Shield) & !is(player)', 'lowest'},
--Penance Emergency Healing if Checked.
{'Penance', 'health <= UI(Penance_spin) & infront & UI(Penance)', 'lowest'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'lowest.health <= UI(l_mend) & lowest.buff(Atonement) & !lowest.health <= 30 & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health <= UI(l_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest'},


--Power Word: Shield on CD if not Atonement on 6 people max.
{'Power Word: Shield', '!buff(Atonement)', {'lowest(tank)', 'lowest1', 'lowest2', 'lowest3', 'lowest4', 'lowest5'}},
}

local Mythic = {
{'!Pain Suppression', 'health <= 20', {'tank','lowest'}},

{'!Evangelism', 'talent(7,3) & player.area(40,70).heal >= 2 & buff(Sins of the Many).count >= 4 & lowest.buff(Atonement)','player'},
{'!Shadowfiend', "player.spell(!talent(3,2)",'target'},
{'Power Word: Radiance', 'area(30,85).heal >= 3 & health <= 85 & !buff(Atonement) & advanced & player.spell(Power Word: Radiance).charges == 2', 'lowest'},
{'Power Word: Radiance', 'player.area(40,85).heal >= 3 & health <= 85 & !buff(Atonement) & !advanced & player.spell(Power Word: Radiance).charges == 2', 'lowest'},
{'Power Word: Radiance', 'area(30,85).heal >= 3 & lowest.health <= 85 & !buff(Atonement) & advanced & player.spell(Power Word: Radiance).charges < 2 & !player.lastcast(Power Word: Radiance)', 'lowest'},
{'Power Word: Radiance', 'player.area(40,85).heal >= 3 & health <= 85 & !buff(Atonement) & !advanced & player.spell(Power Word: Radiance).charges < 2 & !player.lastcast(Power Word: Radiance)', 'lowest'},
{'Power Word: Radiance', 'pull_timer <= 6 & pull_timer >= 3 & range <= 40', 'lowest'},
{'Shadow Covenant', 'area(30,90).heal >= 3 & !debuff(Shadow Covenant) & !count(Shadow Covenant).friendly.debuffs >= 4 & UI(SC_check) & health <= UI(SC_spin)', 'lowest'},
{'Power Word: Shield', 'health <= 90 & !buff(Power Word: Shield)', 'lowest'},
{'Penance', 'player.health <= 65 & player.buff(Atonement) & infront', 'target'},
{'Shadow Mend', "health <= 65 & {!moving || buff(Norgannon's Foresight)}", 'player'},
{'Penance', 'lowest.health <= 65 & lowest.buff(Atonement) & infront', 'target'},
{'Shadow Mend', "health <= 70 & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest'},

}
local Moving = {
--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
--羽毛使用条件：1.界面开启了羽毛功能 2.我无毛buff 3.我在移动
{'Angelic Feather', 'player.movingfor >= 4 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player.ground'},
-- Body and Soul usage if enabled in UI. 添加个条件，救赎时间<=8
{'Power Word: Shield', 'talent(2,1) & play.buff(Atonement).duration <=8 & !player.buff(Body and Soul) & player.movingfor >= 1 & UI(m_Body) & !player.channeling(Penance)', 'player'},
}

--团队模式处理
local Raid = {
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
{Tankpred,'tank.health.predicted < 50 & tank.exists'},
{Playerpred,'player.health.predicted <= 50'},
{Lowestpred,'lowestp.health <100'},
}

--队伍处理
local Party = {
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
{Tank,'tank.health < 50 & tank.exists'},
{Player,'player.health<= 45'},
{Lowest,'lowest.health <100'},
}

local ST = {
{Raid,'partycheck == 3'},
{Party, 'partycheck == 2'},
}

--拉怪前吃个延时之力 目前分析到这里180818
local Beforepull = {
{'#142117', '{pull_timer <= 3 & & pull_timer >= 1 & UI(s_PPull) & !UI(PWR_PPull) & !buff(Potion of Prolonged Power)}||{{ pull_timer >= 1 & pull_timer <= {5 + gcd}} & UI(s_PPull) & UI(PWR_PPull) & !buff(Potion of Prolonged Power)}','player'},
{Rampup, 'pull_timer <= 20 & UI(PWR_PPull)'},
{'Power Word: Shield', 'pull_timer <= 2 &  pull_timer >= 1 & !tank.buff(Power Word: Shield)', 'tank'},
}

local Stopcasting = {
{'!/stopcasting','debuff(Quake).any.duration <= gcd & debuff(Quake).any','player'}, --Quaking 
}


local OutOfCombat={
  --友好的功能：看见谁血不多奶两口
  --buff监测
  --死人监测
  --血量低于设置值自动下马
  --自动驱散
  --低血量刷血
  --低血量吃糖 吃药
  --
}


local SelfProtection={
  
}



local inCombat2={
--根据条件使用物品
  --治疗石 5512. 当我个人血量低于设置值且我有治疗石的时候使用治疗石
  {'#5512', 'item(5512).usable&item(5512).count>0&player.health<=UI(HS_spin)&UI(HS_check)'},
  --海滨治疗药水. 当我个人血量低于设置值且我有大红的时候使用治疗石
  {'#152494', 'item(152494).usable&item(152494).count>0&player.health<=UI(AHP_spin)&UI(AHP_check)'},
  --海滨活力药水.
  {'#163082', 'item(163082).usable&item(163082).count>0&player.health<=UI(AsHP_spin)&UI(AsHP_check)'},
  --海滨法力药水.当我个人蓝量低于设置值且我有大蓝的时候使用大蓝
  {'#152495', 'item(152495).usable&item(152495).count>0&player.mana<=UI(AMP_spin)&UI(AMP_check)'},
--根据条件保命
--根据条件驱散
--根据条件加血
--根据条件救赎加血
--[[救赎的治疗构成：
1.救赎转化的伤害治疗
2.惩击的吸收
3.盾的吸收
]]
--进攻

}











local inCombat = {


{Stopcasting},
{Potions},
{Cooldowns},
{'!Purify', 'toggle(disp) & player.spell(Purify).cooldown == 0 & purify & area(8).friendly == 1 & UI(disp_ang) & range <= 40', 'friendly'},
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
{'fade', '{target.inmelee || player.area(2).enemies >= 1} & player.aggro & !partycheck == 1'},
{'Psychic Scream', 'player.spell(Fade).cooldown > 0 & player.aggro & !toggle(xDPS) & player.area(8).enemies >= 1 & partycheck ~= 2'},
{'Shining Force', 'spell(Fade).cooldown > 0 & spell(Psychic Scream).cooldown > 0 & area(10).enemies >= 1 & aggro & !toggle(xDPS) & partycheck ~= 2', 'player'},
{'!Shining Force', 'toggle(interrupts) & target.interruptAt(70) & target.range > 10 & !lowest.health <= UI(l_mend)', 'tank'},
{'!Shining Force', 'toggle(interrupts) & target.interruptAt(70) & target.range <= 10 & !lowest.health <= UI(l_mend)', 'player'},
{'Arcane Torrent', 'player.mana < 97 & UI(dps_at)', 'player'},
{Felexplosive},
{Keybinds},
{Trinkets},
{Rapture, 'player.buff(Rapture)'}, --全神贯注
{{
{Moving, 'player.moving'},         --战斗中移动buff处理
{Rampup, 'toggle(ramp)'},          --预救赎
{Solo, 'toggle(xDPS)'},            --单人模式处理
{PWR, 'UI(PWR) & !tank.health <= 30'},   --真言术耀处理
{Mythic, 'partycheck == 2 & UI(myth_heal)'}, 
{ST, '!UI(myth_heal)'},
},'!player.buff(Rapture)'},
{Atonement, '!lowest.health <= UI(l_mend) || {UI(myth_heal) & !lowest.health <= 65}'},
}
























local outCombat = {

{'!/stopcasting','debuff(Quake).any.duration <= gcd & debuff(Quake).any','player'}, --Quaking 
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
{'%ressdead(Mass Resurrection)', 'UI(rezz)'},
{Beforepull,'pull_timer >= 1'},
{Keybinds},
{Moving, 'player.moving & !UI(ato) & !inareaid == 1040'},
  --给自己加个耐
{'Power Word: Fortitude','!buff(Power Word: Fortitude)','player'},
{'!Evangelism', 'buff(Sins of the Many).count >= 12  & partycheck == 3 & pull_timer <= 20 & pull_timer >= 1 & UI(PWR_PPull)','player'},
{'!Evangelism', 'buff(Sins of the Many).count == 5 & partycheck == 2 & pull_timer <= 20 & pull_timer >= 1 & UI(PWR_PPull)','player'},
{Mythic, 'partycheck == 2 & UI(myth_heal)'},
{{
{'Shadow Mend', "lowest.health <= 90 & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest'},
},'UI(ooc_heal)||UI(myth_heal)'},
{{
{'Power Word: Shield', '!tank.buff(Power Word: Shield)', 'tank'},
{Moving, 'player.moving'},

}, 'UI(ato)||UI(myth_heal)'},
{Mythic, 'partycheck == 2 & UI(myth_heal)'},
}

local blacklist = {
     debuff = {name = "Misery"},
}

NeP.CR:Add(256, {
  --wow_ver = "8.01", -- Optional!
  --nep_ver = "1.11", -- Optional!
  name = '|cff58FAF4 [Yobleed]|r Priest - |cff58FAF4Discipline|r',
  ic = inCombat,
  ooc = outCombat,
  gui = GUI,
  gui_st = {title='Yobleed\'s Priest Pack: Discipline', width='512', height='256', color='58FAF4'},
  load = exeOnLoad,
  ids = yobleed.spell_ids,
  blacklist = blacklist
})
