local ffi = require"ffi"
local cairo = require"cairo"

local lib = {}

lib.loadpng = function(path)
	local sr = cairo.load_png(path)
	if sr then
		local bmp = sr:bitmap()
		local pixels = ffi.cast('uint8_t*', bmp.data)
		return pixels,bmp,sr
	else
		return sr
	end
end

lib.savepng = function(path,sr)
	local f,err,status = sr:save_png(path)
	if f then
		return true
	else
		warn("savepng function")
		warn(err,status)
		return false
	end
end

return lib