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
BarrelRoll = BarrelRoll or {}

local Constants = {}

local _constants = {
    ADDON_NAME = "BarrelRoll",
    ADDON_VERSION = "v1.0",
    ADDON_URL = "github.com/rebirthsilvermoon/BarrelRoll",
    SPELL_NAME = "Whirling Surge",
    SPELL_ID = 361584,
    DEFAULT_MOUNT_SPELL_ID = 446052,
}

do
    setmetatable(Constants, {
        __index = _constants,
        __newindex = function(_, key, value)
            error("Attempt to modify read-only constant: " .. tostring(key), 2)
        end,
        __metatable = false
    })
end

BarrelRoll.Constants = Constants
