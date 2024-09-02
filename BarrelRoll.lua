-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- The MIT License (MIT)                                                                                                                                         --
--                                                                                                                                                               --
-- Copyright © 2024 Rebirth Silvermoon (rebirth.silvermoon@outlook.com)                                                                                             --
--                                                                                                                                                               --
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”),            --
-- to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,            --
-- and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:                    --
--                                                                                                                                                               --
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.                                --
--                                                                                                                                                               --
-- THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,           --
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, -- 
-- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.    --
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
print("BarrelRoll addon initializing...")
print("Addon Name: " .. BarrelRoll.Constants.ADDON_NAME)
print("Addon Version: " .. BarrelRoll.Constants.ADDON_VERSION)

-- Create the main frame for handling events
BarrelRoll.Frame = CreateFrame("Frame", "BarrelRollFrame")
BarrelRoll.Frame:SetScript("OnEvent", function(self, event, ...) BarrelRoll[event](BarrelRoll, event, ...) end)
BarrelRoll.Frame:RegisterEvent("ADDON_LOADED")
BarrelRoll.Frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

function BarrelRoll:ADDON_LOADED(event, addonName)
    if addonName == "BarrelRoll" then
        print("BarrelRoll addon loaded successfully.")
    end
end

local function IsMountedOnDelversDirigible()
    local isMounted = false

    AuraUtil.ForEachAura("player", "HELPFUL", nil, function(name, icon, ...)
        local mountID = select(8, ...)
        if mountID == BarrelRoll.Constants.DEFAULT_MOUNT_SPELL_ID then
            isMounted = true  -- Set to true if the correct mount is found
            return true  -- Exit the loop early if the mount is found
        end
    end)

    return isMounted
end

function BarrelRoll:UNIT_SPELLCAST_SUCCEEDED(event, unit, ...)
    if unit == "player" then
        local spellID = select(2, ...)
        if spellID == BarrelRoll.Constants.SPELL_ID and IsMountedOnDelversDirigible() then
            PlaySoundFile("Interface\\AddOns\\BarrelRoll\\media\\do_barrel_roll.ogg", "Master")
        end
    end
end