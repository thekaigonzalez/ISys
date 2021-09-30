--- ISys.lua
--- contains ISys helper functions for building ISys extensions

--- Low level split & higher level split
--- Kux source code used
function lsplit(s, delimiter)
    result = {}
    
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
     table.insert(result, match);
    end
   
    return result;
   end
   function split(string)
    local tblt = {}
   
    local lns = lsplit(string, " ");
   
    i = 0
    
    for _,V in ipairs(lns) do
     tblt[i] = V;
     i = i + 1
    end
    return tblt
end