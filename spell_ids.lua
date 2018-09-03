local _, yobleed = ...

--包含三系所有技能列表 包括PVP技能 基础技能 工会银行等乱七八糟的技能
yobleed.Spell_wow801_Priest_Discipline=
{
  ["Evangelism"]               = 246287,                    --福音
  ["Power Word: Radiance"]     = 194509,                    --真言术：耀
  ["Penance"]                  = 47540,                     --苦修
  ["Purify"]                   = 527,                       --纯净术
  ["Shadow Covenant"]          = 204065,                    --暗影盟约
  ["Mind Control"]             = 205364,                    --精神控制
  ["Smite"]                    = 585,                       --惩击
  ["Shadow Mend"]              = 186263,                    --暗影愈合
  ["Rapture"]                  = 47536,                     --全神贯注
  ["Fade"]                     = 586,                       --渐隐术
  ["Power Word: Solace"]       = 129250,                    --真言术：慰
  ["Power Word: Shield"]       = 17,                        --真言术：盾
  ["Desperate Prayer"]         = 19236,                     --绝望祷言
  ["Resurrection"]             = 2006,                      --复活术
  ["Luminous Barrier"]         = 271466,                    --微光屏障
  ["Power Word: Fortitude"]    = 21562,                     --真言术：韧
  ["Mass Resurrection"]        = 212036,                    --群体复活
  ["Holy Nova"]                = 132157,                    --神圣新星
  ["Body and Soul"]            = 65081,                     --身心合一技能ID64129，BUFFID：65081
  ["Pain Suppression"]         = 33206,                     --痛苦压制
  ["Mind Vision"]              = 2096,                      --心灵视界
  ["Psychic Scream"]           = 8122,                      --心灵尖啸
  ["Mass Dispel"]              = 32375,                     --群体驱散
  ["Leap of Faith"]            = 73325,                     --信仰飞跃
  ["Shadowfiend"]              = 34433,                     --暗影魔
  ["Purge the Wicked"]         = 204197,                    --净化邪恶
  ["Dispel Magic"]             = 528,                       --驱散魔法
  ["Levitate"]                 = 1706,                      --漂浮术
  ["Atonement"]                = 194384,                    --救赎buffID，被动技能ID是81749
  ["Focused Will"]             = 45243,                     --专注意志被动技能，buff是45242
  ["Power of the Dark Side"]   = 198068,                    --阴暗面之力 被动技能ID buffID 198069
  ["Angelic Feather"]          = 121536,                    --天堂之羽
  ["Blood Plague"]             = 55078,                     --血之疫病
  ["Outbreak"]                 = 196782,
  ["Virulent Plague"]          = 191587,                    --血之疫病 196782 191587


  --通用
  ["Drink"]                    = 274914,                    --喝水

  
}
yobleed.Spell_wow801_Priest_Holy = 
{
  --职业技能
  ["Leap of Faith"]            = 73325,                     --信仰飞跃
  ["Holy Word: Sanctify"]      = 34861,                     --圣言术：灵
  ["Holy Word: Chastise"]      = 88625,                     --圣言术：罚
  ["Holy Word: Serenity"]      = 2050,                      --圣言术：静
  ["Resurrection"]             = 2006,                      --复活术
  ["Guardian Spirit"]          = 47788,                     --守护之魂
  ["Symbol of Hope"]           = 64901,                     --希望象征
  ["Fade"]                     = 586,                       --渐隐术
  ["Psychic Scream"]           = 8122,                      --心灵尖啸
  ["Mind Vision"]              = 2096,                      --心灵视界
  ["Flash Heal"]               = 2061,                      --快速治疗
  ["Renew"]                    = 139,                       --恢复
  ["Smite"]                    = 585,                       --惩击
  ["Prayer of Mending"]        = 33076,                     --愈合祷言
  ["Shackle Undead"]           = 9484,                      --束缚亡灵
  ["Heal"]                     = 2060,                      --治疗术
  ["Prayer of Healing"]        = 596,                       --治疗祷言
  ["Levitate"]                 = 1706,                      --漂浮术
  ["Power Word: Fortitude"]    = 21562,                     --真言术：韧
  ["Holy Fire"]                = 14914,                     --神圣之火
  ["Holy Nova"]                = 132157,                    --神圣新星
  ["Divine Hymn"]              = 64843,                     --神圣赞美诗
  ["Mind Control"]             = 605,                       --精神控制
  ["Purify"]                   = 527,                       --纯净术
  ["Desperate Prayer"]         = 19236,                     --绝望祷言
  ["Mass Resurrection"]        = 212036,                    --群体复活
  ["Mass Dispel"]              = 32375,                     --群体驱散
  ["Dispel Magic"]             = 528,                       --驱散魔法
  ["Focused Will"]             = 45243,                     --专注意志被动技能，buff是45242
  ["Spirit of Redemption"]     = 20711,                     --救赎之魂
  ["Mastery: Echo of Light"]   = 77485,                     --精通：圣光回响



  --天赋技能
  ["Enlightenment"]             = 193155,                    --启迪
  ["Trail of Light"]            = 200128,                    --光明尾迹
  ["Enduring Renewal"]          = 200153,                    --持久恢复

  ["Angel's Mercy"]             = 238100,                    --天使之慈
  ["Perseverance"]              = 235189,                    --祈告
  ["Angelic Feather"]           = 121536,                    --天堂之羽

  ["Cosmic Ripple"]             = 238136,                    --宇宙涟漪
  ["Guardian Angel"]            = 200209,                    --守护天使
  ["Afterlife"]                 = 196707,                    --死后余生

  ["Psychic Voice"]             = 196704,                    --心灵之声
  ["Censure"]                   = 200199,                    --谴罚
  ["Shining Force"]             = 204263,                    --闪光力场

  ["Surge of Light"]            = 109186,                    --圣光涌动
  ["Binding Heal"]              = 32546,                     --联结治疗
  ["Circle of Healing"]         = 204883,                    --治疗之环

  ["Benediction"]               = 193157,                    --祈福
  ["Divine Star"]               = 110744,                    --神圣之星
  ["Halo"]                      = 120517,                    --光晕

  ["Light of the Naaru"]        = 196985,                    --纳鲁之光
  ["Apotheosis"]                = 200183,                    --神圣化身
  ["Holy Word: Salvation"]      = 265202,                    --圣言术：赎
  --PVP技能
}
  

yobleed.spell_ids = {
  ["Power of the Dark Side"]   = 198068, --被动技能ID buffID 198069
  ["Mangaza\'s Madness"]       = 132864,
  ["Shadow Word: Pain"]        = 589,
  ["The Val'kyr"]              = 126695,
  ["Ascension"]                = 161862,
  ["Holy Word: Chastise"]      = 88625,   --圣言术：罚
  ["Psychic Voice"]            = 196704,
  ["Surge of Light"]           = 109186,
  ["Void Eruption"]            = 228260,
  ["Reaper of Souls"]          = 199853,
  ["Glyph of Shackle Undead"]  = 57986,
  ["Surrendered Soul"]         = 212570,
  ["Glyph of the Sha"]         = 147776,
  ["Circle of Healing"]        = 204883,
  ["Legacy of the Void"]       = 193225,
  ["Arcane Torrent"]           = 232633,
  ["Clarity of Will"]          = 152118,
  ["Void Lord"]                = 199849,
  ["Mind Spike Detonation"]    = 217676,
  ["Twist of Fate"]            = 109142,
  ["Heal"]                     = 2060,       --治疗术
  ["Divine Hymn"]              = 64843,       --神圣赞美诗
  ["Guardian Spirit"]          = 47788,       --守护之魂
  ["Discipline Priest"]        = 137032,
  ["Shadowy Friends"]          = 126797,
  ["Mind Spike"]               = 73510,
  ["Mind Flay"]                = 193473,
  ["Fortress of the Mind"]     = 193195,
  ["Shadow Crash"]             = 205385,
  ["Shadow Word: Void"]        = 205351,
  ["Schism"]                   = 214621,
  ["Mind Bomb"]                = 205369,
  ["Powerheal 4000 Lens"]      = 41321,
  ["Mysticism"]                = 89745,
  ["Apotheosis"]               = 200183,      --神圣化身
  ["Void Torrent"]             = 205065,
  ["Inspired Hymns"]           = 148074,
  ["Silence"]                  = 15487,
  ["Shadow Priest"]            = 137033,
  ["Flash Heal"]               = 2061,          --快速治疗
  ["Divinity"]                 = 197031,
  ["Piety"]                    = 197034,
  ["Powerheal 9000 Lens"]      = 46108,
  ["Serendipity"]              = 63733,
  ["Holy Fire"]                = 14914,         --神圣之火
  ["Gift of the Naaru"]        = 59544,
  ["Mania"]                    = 193173,
  ["Void Ray"]                 = 205371,
  ["Light's Wrath"]            = 207948,
  ["Shadow"]                   = 107905,
  ["Benediction"]              = 193157,
  ["Holy Word: Serenity"]      = 2050,      --圣言术：静
  ["Spirit Shell"]             = 114908,
  ["Void Bolt"]                = 231688,
  ["Enduring Renewal"]         = 200153,
  ["Censure"]                  = 200199,
  ["Shadowform"]               = 232698,
  ["Shining Force"]            = 204263,
  ["Spirit of Redemption"]     = 215769,
  ["Enlightenment"]            = 193155,
  ["Afterlife"]                = 196707,
  ["Heavens"]                  = 112660,
  ["Auspicious Spirits"]       = 155271,
  ["Light of the Naaru"]       = 196985,
  ["Insanity"]                 = 194251,
  ["Glyph of Shadow"]          = 107906,
  ["Shadowy Insight"]          = 162452,
  ["Body and Mind"]            = 214121,
  ["Shadowy Apparitions"]      = 78203,
  ["Masochism"]                = 193063,
  ["Guardian Angel"]           = 200209,
  ["Glyph of the Heavens"]     = 120581,
  ["Sin and Punishment"]       = 131556,
  ["San'layn"]                 = 199855,
  ["Shadow Word: Death"]       = 231689,
  ["Renew"]                    = 139,         --恢复
  ["Power Infusion"]           = 10060,
  ["Sha"]                      = 148071,
  ["Echo of Light"]            = 77489,
  ["Shadowy Apparition"]       = 148859,
  ["Grace"]                    = 200309,
  ["Glyph of Inspired Hymns"]  = 147072,
  ["Trail of Light"]           = 200128,
  ["Mindbender"]               = 200174,
  ["Binding Heal"]             = 32546,
  ["Light of T'uure"]          = 208065,
  ["Voidform"]                 = 228264,
  ["Castigation"]              = 193134,
  ["Angelic Feather"]          = 121536,    --天堂之羽
  ["Priest"]                   = 137030,
  ["Vampiric Touch"]           = 34914,
  ["Purify Disease"]           = 213634,
  ["Surrender to Madness"]     = 193223,
  ["Mind Sear"]                = 208232,
  ["Misery"]                   = 238558,
  ["Halo"]                     = 120517,
  ["Holy Word: Sanctify"]      = 34861,       --圣言术：灵
  ["Contrition"]               = 197419,
  ["Vampiric Embrace"]         = 15286,
  ["Mind Blast"]               = 8092,
  ["The Penitent"]             = 200347,
  ["Symbol of Hope"]           = 64901,        --希望象征
  ["Invoke the Naaru"]         = 196705,
  ["Shackle Undead"]           = 9484,          --束缚亡灵
  ["Dispersion"]               = 47585,
  ["Prayer of Mending"]        = 33076,
  ["Dominant Mind"]            = 205367,
  ["Prayer of Healing"]        = 596,
  ["Power Word: Barrier"]      = 81782,
  ["Plea"]                     = 212100,
  ["Shield Discipline"]        = 197045,
  ["Lingering Insanity"]       = 197937,
  ["Shadowcrawl"]              = 63619,
  ["Id"]                       = 205477,
  ["Holy Priest"]              = 137031,
  ["Glyph of the Val'kyr"]     = 126094,
  ["Glyph of Shadowy Friends"] = 126745,
  ["Divine Star"]              = 110744,
  ["Guiding Hand"]             = 242622,
  ["Evangelism"]               = 246287,                    --福音
  ["Power Word: Radiance"]     = 194509,                    --真言术：耀
  ["Penance"]                  = 47540,                     --苦修
  ["Purify"]                   = 527,                       --纯净术
  ["Shadow Covenant"]          = 204065,                    --暗影盟约
  ["Mind Control"]             = 205364,                    --精神控制
  ["Smite"]                    = 585,                       --惩击
  ["Shadow Mend"]              = 186263,                    --暗影愈合
  ["Rapture"]                  = 47536,                     --全神贯注
  ["Fade"]                     = 586,                       --渐隐术
  ["Greater Fade"]             = 213602,                    --强化渐隐术
  ["Power Word: Solace"]       = 129250,                    --真言术：慰
  ["Power Word: Shield"]       = 17,                        --真言术：盾
  ["Desperate Prayer"]         = 19236,                     --绝望祷言
  ["Resurrection"]             = 2006,                      --复活术
  ["Luminous Barrier"]         = 271466,                    --微光屏障
  ["Power Word: Fortitude"]    = 21562,                     --真言术：韧
  ["Mass Resurrection"]        = 212036,                    --群体复活
  ["Holy Nova"]                = 132157,                    --神圣新星
  ["Body and Soul"]            = 65081,                     --身心合一技能ID64129，BUFFID：65081
  ["Pain Suppression"]         = 33206,                     --痛苦压制
  ["Mind Vision"]              = 2096,                      --心灵视界
  ["Psychic Scream"]           = 8122,                      --心灵尖啸
  ["Mass Dispel"]              = 32375,                     --群体驱散
  ["Leap of Faith"]            = 73325,                     --信仰飞跃
  ["Shadowfiend"]              = 34433,                     --暗影魔
  ["Purge the Wicked"]         = 204197,                    --净化邪恶
  ["Dispel Magic"]             = 528,                       --驱散魔法
  ["Levitate"]                 = 1706,                      --漂浮术
  ["Atonement"]                = 194384,                    --救赎buffID，被动技能ID是81749
  ["Focused Will"]             = 45243,                     --专注意志被动技能，buff是45242 
                   
}
