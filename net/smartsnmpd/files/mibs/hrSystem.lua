-- 
-- This file is part of SmartSNMP
-- Copyright (C) 2014, Credo Semiconductor Inc.
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-- 

local mib = require "smartsnmp"
local io = require "io"

local getHrSystemUptime = function()
	local procfs_uptime = io.lines("/proc/uptime")()
	local uptime, _ = procfs_uptime:match("^(.-) (.-)$")
	return uptime * 100
end

local hrSystemUptime = 1

hrSystem = {
    [hrSystemUptime]         = mib.ConstTimeticks(getHrSystemUptime),
}

return hrSystem
