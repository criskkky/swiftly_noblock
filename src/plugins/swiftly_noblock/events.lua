events:on("OnPluginStart", function()
  for i=0, playermanager:GetPlayerCap() - 1 do 
      local player = GetPlayer(i)
      if player and player:IsFirstSpawn() == 0 then
          local entity = entities:Create("player:" .. i)
          entity:SetCollisionGroup(CollisionGroup.Dissolving)
          player:vars():Set("noblock", 1)
      end
  end
end)

events:on("OnPlayerSpawn", function(playerid)
  local player = GetPlayer(playerid)
  if not player then return end
  if player:IsFirstSpawn() == 1 then return end
  
  NextTick(function()
      local entity = entities:Create("player:"..playerid)
      entity:SetCollisionGroup(CollisionGroup.Dissolving)
      player:vars():Set("noblock", 1)
  end)
end)

events:on("OnPluginStop", function()
  for i=0, playermanager:GetPlayerCap() - 1 do 
      local player = GetPlayer(i)
      if player and player:IsFirstSpawn() == 0 then
          local entity = entities:Create("player:" .. i)
          entity:SetCollisionGroup(CollisionGroup.Default)
          player:vars():Set("noblock", 0)
      end
  end
end)