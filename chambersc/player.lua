-- When a client loots a 
--  Copper Seal of Subversion,
--  Silver Seal of Subversion, or a 
--  Gold Seal of Subversion;
-- Send a signal to the Master of Destruction so he can
-- tally up the points associated with the various seals
-- to opperate he event.
function event_loot(e)
  if (e.item:GetID() == 52171) then
    -- Coper Seal of Subversion 
    eq.signal(306001, 1);
  elseif (e.item:GetID() == 52172) then
    -- Silver Seal of Subversion
    eq.signal(306001, 2);
  elseif (e.item:GetID() == 52173) then
    -- Gold Seal of Subversion
    eq.signal(306001, 3);
  end
end

function event_zone(e)
  eq.signal(306019, 9);
end

function event_enter_zone(e)
  local cg = eq.get_qglobals(e.self);
  if (cg["mpg_raid_trial_won"] ~= nil and cg['mpg_raid_trial_won'] ~= 0) then
    eq.debug('mpg_raid_trial_won: ' .. tostring(cg['mpg_raid_trial_won']) );
    local mpg_helper = require("mpg_helper");
    mpg_helper.RaidAnguishAccess(e.self, cg['mpg_raid_trial_won']);
    eq.target_global('mpg_raid_trial_won', '0', 'S1', 0, e.self:CharacterID(), 0);
  end
end
