local LibDispellable = LibStub('LibDispellable-1.0')

NeP.FakeUnits:Add('CanDispell', function(spell)
    local tempTable = {}
    for _, Obj in pairs(NeP.OM:GetRoster()) do
      if LibDispellable:CanDispelWith(Obj.key, NeP.Core:GetSpellID(spell)) then
        tempTable[#tempTable+1] = {
                key = Obj.key,
                health = Obj.health
            }
        end
    end
    table.sort( tempTable, function(a,b) return a.health < b.health end )
    return tempTable[num] and tempTable[num].key
end)
