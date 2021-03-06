-- Copyright (c) 2008 Christopher Wellons <mosquitopsu@gmail.com>
-- 
-- Permission to use, copy, modify, and distribute this software for
-- any purpose with or without fee is hereby granted, provided that
-- the above copyright notice and this permission notice appear in all
-- copies.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
-- WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
-- AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
-- CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
-- OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
-- NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
-- CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

collatz_len = { 1 }

setmetatable (collatz_len, {
   __index = function (name, n)
      if (math.mod (n, 2) == 0) then
         name[n] = name[n/2] + 1;
      else
         name[n] = name[3 * n + 1] + 1;
      end
         return name[n] 
   end
})

function check_range (n, m)
   local largest = 0
   
   for i = n, m do
      local len = collatz_len[i]

      if len > largest then
	 largest = len
      end
      
   end
   
   return largest
end

while not io.stdin.eof do
   n, m = io.stdin:read("*number", "*number")
   
   -- check for eof
   if n == nil or m == nil then
      break
   end
   
   print (n .. " " .. m .. " " .. check_range(n, m))
end
