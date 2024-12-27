set_xmakever("2.9.7")
set_project("vision-simple")

-- language version
set_languages("clatest", "cxx23")
-- compiler float mode
set_fpmodels("fast")
-- basic
add_vectorexts("sse", "sse2", "sse3", "ssse3", "sse4.1", "sse4.2", "f16c", "avx", "avx2")
-- add_vectorexts("all")
if is_mode("release") then
    set_optimize("fastest")
    set_symbols("hidden")
    set_warnings("none")
    set_strip("all")
    add_defines("VISION_SIMPLE_RELEASE")
	if is_plat("windows") then
    	set_runtimes("MD")
	end
elseif is_mode("debug") or is_mode("releasedbg") then
    set_optimize("none")
    set_symbols("debug")
    set_warnings("all")
    add_defines("VISION_SIMPLE_DEBUG")
    --set_warnings("all", "error")
	if is_plat("windows") then
    	set_runtimes("MDd")
	end
end
-- platform flags
if is_os("windows") then
	add_ldflags("/LTCG")
	add_defines(
			"_CRT_SECURE_NO_WARNINGS",
			"_UNICODE",
			"UNICODE",
			"_CONSOLE",
			"NOMINMAX",
			"NOGDI",
			"WIN32_LEAN_AND_MEAN",
			"_WIN32_WINNT=0x0A00"
	)
	add_cxxflags("/d1trimfile:$(curdir)\\")
	add_cxxflags("/experimental:deterministic")
	add_ldflags("/PDBALTPATH:%_PDB%")
	add_cxxflags("/Zc:preprocessor")
	add_cxxflags("/Zc:__cplusplus")
	add_cxxflags("/utf-8")
	add_ldflags("/MAP")
	if is_mode("releasedbg") then
		add_defines("_ALLOW_ITERATOR_DEBUG_LEVEL_MISMATCH")
	end
elseif is_os("linux") then
	add_cxxflags("-mf16c")
	add_rpathdirs("./")
	-- add_syslinks("c++")
	-- add_cxxflags("-stdlib=libc++", {tools = "clang"})
	-- add_cxxflags("-fexperimental-library", {tools = "clang"})
end
includes("xmake/setup.lua")