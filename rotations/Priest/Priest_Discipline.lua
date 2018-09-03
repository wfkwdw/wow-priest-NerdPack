--[[
    戒律牧加血逻辑
    队伍模式：
    优先级：healer-tank-dps
    当队伍最低血量者血量高于70，救赎治疗。低于70
    根据不同天赋自行适配

]]



local _, yobleed = ...
local NeP = NeP

local GUI = {
    -- GUI Header
    {
        type = "texture",
        texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\disc.blp",
        width = 512,
        height = 256,
        offset = 90,
        y = 42,
        center = true
    },
}

local boostSpeed =
{
    {'天堂之羽','!mounting & !falling & !buff(身心合一) & !buff(天堂之羽) & moving & talent(2,3)','player.ground'}
}

local Buff =
{
    {'真言术：韧','mana > 30 & !buff(喝水) & !player.buff(真言术：韧) & group.type == 1','player'},
    {'真言术：韧','distance < 40 & player.mana > 30 & !player.buff(喝水) & !buff(真言术：韧) & group.type ~= 1','friendly'},
}

local drinkWater =
{  
    {'/use 跃岩矿泉水','!buff(喝水) & mana<=30 & !moving & item(159867).usable & item(159867).count>0','player'},
    {'真言术：盾','buff(喝水)  & mana > 95','player'},

}


local AttackEnemies =
{
    --当我的敌人没有暗言术痛或者净化邪恶的buff 或者 净化邪恶debuff的时间小于3秒
    {'暗言术：痛','!talent(6,1) & !debuff(暗言术：痛) & distance < 40 & {is(player) || is(friendly)}','enemies'},   
    {'净化邪恶','distance < 40 & talent(6,1) & !debuff & {is(player) || is(friendly)}','enemies'},  
    {'暗言术：痛','!talent(6,1) & !debuff & distance < 40 & {is(player) || is(friendly)}','target'},   
    {'净化邪恶','distance < 40 & talent(6,1) & !debuff & {is(player) || is(friendly)}','target'},  
    {'教派分歧','distance < 40 & !debuff(教派分歧) & !moving & health > 10 & {is(player) || is(friendly)}','target'},
    {'真言术：慰','{debuff(暗言术：痛) || debuff(净化邪恶)} & distance < 40 & talent(3,3) & debuff(教派分歧) & {is(player) || is(friendly)}','enemies'}, --条件判断逻辑有问题
    {'真言术：慰','{debuff(暗言术：痛) || debuff(净化邪恶)} & distance < 40 & talent(3,3) & {is(player) || is(friendly)}','target'},
    {'摧心魔','distance < 40 & talent(3,2) & {health>10 || enemies.count > 2} & {is(player) || is(friendly)}','target'},
    {'暗影魔','distance < 40 & !talent(3,2) {target.health>10 || enemies.count > 2} & {is(player) || is(friendly)}','target'},
    {'苦修','{infront & debuff(暗言术：痛) || debuff(净化邪恶)} & distance < 40 & {is(player) || is(friendly)}','target'},
    {'惩击','{infront & debuff(暗言术：痛) || debuff(净化邪恶)} & distance < 40 & {is(player) || is(friendly)}','target'},

}

local purify_party =
{
    {'纯净术','{debuff(脑部冻结).any || debuff(衰弱怒吼).any || debuff(虚空碎裂).any || debuff(心灵撕裂).any || debuff(电化震击).any || debuff(窒息海潮).any || debuff(点火器).any || debuff(火把攻击).any|| debuff(火力压制).any} & distance < 40','friendly'},
}

local purify2 =
{
    {'纯净术','checkpurify & group.type == 1','player'},
    {'纯净术','checkpurify & group.type ~= 1','friendly'},
}

local dispell =
{
    {'驱散魔法','{buff(黑影步).any || buff(流水护甲).any || buff(吞噬虚空).any || buff(海潮涌动).any || buff(身手矫健).any || buff(治疗湍流).any || buff(海潮涌动).any || buff(心灵之火).any} & distance < 40','enemies'},
}

local inCombat_Party =
{
    {'/use 治疗石','player.health < 30 & item(5512).usable & item(5512).count>0'},
    {'/use 海滨治疗药水','player.health < 30 & item(152494).usable & item(152494).count>0'},
    {'/use 海滨活力药水','player.health < 30 & item(163082).usable & item(163082).count>0'},
    {'!绝望祷言','player.health < 40','player'},
    {'真言术：盾','!buff(救赎) & friendly.distance < 40 & friendly.health < 90','friendly'},
    {'真言术：耀','lowest.area(40,85).heal > 2  & lowest.distance < 40','lowest'},
    {'暗影愈合','lowest.health<40 & lowest.distance < 40','lowest'},
    {'苦修','lowest.health<70 & lowest.distance < 40','lowest'},
    {'痛苦压制','lowest.health < 35 & lowest.distance < 40','lowest'},
    {'真言术：障','!talent(7,2) & lowest.area(8,50).heal > =2  & lowest.distance < 40','lowest.ground'},    
}

local inCombat_Solo =
{        
    {'真言术：盾','buff(救赎).duration < 3','player'},
    {'暗影愈合','health < 75 & !moving','player'},
    {'苦修','health < 70 & {moving || buff(阴暗面之力)}','player'},
    {'!绝望祷言','health < 20','player'},
    {'!痛苦压制','health < 30','player'},    
}


local inCombat =
{
    {purify2},
    {boostSpeed},
    {'净化邪恶','distance < 40 & talent(6,1) & !debuff & is(player)','target'},  
    {inCombat_Solo,'group.type==1'},
    {inCombat_Party,'group.type~=1'},
    {AttackEnemies,'lowest.health > 30'},
    
}






local OutOfCombat_Solo =
{
    {'%dispelall'},
    {purify2},
    {Buff},
    {drinkWater},   
    --没血刷血，没蓝吃东西
    {'暗影愈合','spell(苦修).cooldown > 0 & player.health<95 & player.mana>30 & !player.moving','player'},
    {'苦修','player.health < 95 & player.mana > 30'},
    {'群体复活','ressdead'},
    
} 

local OutOfCombat_Party =
{
    {'真言术：耀','health < 90 & area(30,90).health > 2','lowest'},
    {'暗影愈合','spell(苦修).cooldown > 0 & health<95 & player.mana>30 & !player.moving','lowest'},
    {'苦修','health < 90 & player.mana > 30','lowest'},
    {'真言术：盾','!buff(救赎)','tank'},
}
local OutOfCombat =
{       
    {purify2},
    {boostSpeed},
    {OutOfCombat_Solo,'group.type == 1'},
    {OutOfCombat_Party,'group.type ~=1'},
    
}

NeP.CR:Add(
    256,
    {
        wow_ver = "8.01", -- Optional!
        --nep_ver = "1.11", -- Optional!
        name = "|cff58FAF4 [老日]|r 老年人助手 - |cff58FAF4戒律牧|r",
        ic = inCombat,
        ooc = OutOfCombat,
        gui = GUI,
        gui_st = {title = "老日的牧师助手-戒律牧", width = "512", height = "256", color = "58FAF4"},
        load = exeOnLoad,
        ids = yobleed.Spell_wow801_Priest,
        blacklist = blacklist
    }
)
