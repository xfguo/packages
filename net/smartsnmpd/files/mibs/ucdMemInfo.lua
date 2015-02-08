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

local getUcdMemInfo = function()
	local meminfo = {
		MemTotal = true,
		MemFree = true,
		-- MemShared was deprecated by new kernel
		-- and for 2.6 kernel it will be always ZERO
		MemShared = 0,
		Buffers = true,
		Cached = true,
	}

	for line in io.lines("/proc/meminfo") do
		local k, v
		k, v = line:match("(.+):%s*(%d+)")
		if meminfo[k] ~= nil then
			meminfo[k] = tonumber(v)
		end
	end
	return meminfo
end

local getUcdMemInfoFactory = function(k)
	-- TODO: cache the results
	return function ()
		local meminfo = getUcdMemInfo()
		return meminfo[k]
	end
end

local memTotalReal	= 5
local memAvailReal	= 6
local memShared		= 13
local memBuffer		= 14
local memCached		= 15

local ucdMemInfo = {
    [memTotalReal]	= mib.ConstInt(getUcdMemInfoFactory('MemTotal')),
    [memAvailReal]	= mib.ConstInt(getUcdMemInfoFactory('MemFree')),
    [memShared]		= mib.ConstInt(getUcdMemInfoFactory('MemShared')),
    [memBuffer]		= mib.ConstInt(getUcdMemInfoFactory('Buffers')),
    [memCached]		= mib.ConstInt(getUcdMemInfoFactory('Cached')),
}

return ucdMemInfo
