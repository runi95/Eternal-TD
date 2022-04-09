
local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file)
    if ____moduleCache[file] then
        return ____moduleCache[file]
    end
    if ____modules[file] then
        ____moduleCache[file] = ____modules[file]()
        return ____moduleCache[file]
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function() function __TS__ArrayIsArray(value)
    return (type(value) == "table") and ((value[1] ~= nil) or (next(value, nil) == nil))
end

function __TS__ArrayConcat(arr1, ...)
    local args = {...}
    local out = {}
    for ____, val in ipairs(arr1) do
        out[#out + 1] = val
    end
    for ____, arg in ipairs(args) do
        if __TS__ArrayIsArray(arg) then
            local argAsArray = arg
            for ____, val in ipairs(argAsArray) do
                out[#out + 1] = val
            end
        else
            out[#out + 1] = arg
        end
    end
    return out
end

function __TS__ArrayEntries(array)
    local key = 0
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = array[key + 1] == nil, value = {key, array[key + 1]}}
            key = key + 1
            return result
        end
    }
end

function __TS__ArrayEvery(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if not callbackfn(_G, arr[i + 1], i, arr) then
                return false
            end
            i = i + 1
        end
    end
    return true
end

function __TS__ArrayFilter(arr, callbackfn)
    local result = {}
    do
        local i = 0
        while i < #arr do
            if callbackfn(_G, arr[i + 1], i, arr) then
                result[#result + 1] = arr[i + 1]
            end
            i = i + 1
        end
    end
    return result
end

function __TS__ArrayForEach(arr, callbackFn)
    do
        local i = 0
        while i < #arr do
            callbackFn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
end

function __TS__ArrayFind(arr, predicate)
    local len = #arr
    local k = 0
    while k < len do
        local elem = arr[k + 1]
        if predicate(_G, elem, k, arr) then
            return elem
        end
        k = k + 1
    end
    return nil
end

function __TS__ArrayFindIndex(arr, callbackFn)
    do
        local i = 0
        local len = #arr
        while i < len do
            if callbackFn(_G, arr[i + 1], i, arr) then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k, len do
        if self[i + 1] == searchElement then
            return true
        end
    end
    return false
end

function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
    local len = #arr
    if len == 0 then
        return -1
    end
    local n = 0
    if fromIndex then
        n = fromIndex
    end
    if n >= len then
        return -1
    end
    local k
    if n >= 0 then
        k = n
    else
        k = len + n
        if k < 0 then
            k = 0
        end
    end
    do
        local i = k
        while i < len do
            if arr[i + 1] == searchElement then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local result = ""
    for index, value in ipairs(self) do
        if index > 1 then
            result = tostring(result) .. tostring(separator)
        end
        result = tostring(result) .. tostring(
            tostring(value)
        )
    end
    return result
end

function __TS__ArrayMap(arr, callbackfn)
    local newArray = {}
    do
        local i = 0
        while i < #arr do
            newArray[i + 1] = callbackfn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
    return newArray
end

function __TS__ArrayPush(arr, ...)
    local items = {...}
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
end

function __TS__ArrayReduce(arr, callbackFn, ...)
    local len = #arr
    local k = 0
    local accumulator = nil
    if select("#", ...) ~= 0 then
        accumulator = select(1, ...)
    elseif len > 0 then
        accumulator = arr[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k, len - 1 do
        accumulator = callbackFn(_G, accumulator, arr[i + 1], i, arr)
    end
    return accumulator
end

function __TS__ArrayReduceRight(arr, callbackFn, ...)
    local len = #arr
    local k = len - 1
    local accumulator = nil
    if select("#", ...) ~= 0 then
        accumulator = select(1, ...)
    elseif len > 0 then
        accumulator = arr[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k, 0, -1 do
        accumulator = callbackFn(_G, accumulator, arr[i + 1], i, arr)
    end
    return accumulator
end

function __TS__ArrayReverse(arr)
    local i = 0
    local j = #arr - 1
    while i < j do
        local temp = arr[j + 1]
        arr[j + 1] = arr[i + 1]
        arr[i + 1] = temp
        i = i + 1
        j = j - 1
    end
    return arr
end

function __TS__ArrayShift(arr)
    return table.remove(arr, 1)
end

function __TS__ArrayUnshift(arr, ...)
    local items = {...}
    do
        local i = #items - 1
        while i >= 0 do
            table.insert(arr, 1, items[i + 1])
            i = i - 1
        end
    end
    return #arr
end

function __TS__ArraySort(arr, compareFn)
    if compareFn ~= nil then
        table.sort(
            arr,
            function(a, b) return compareFn(_G, a, b) < 0 end
        )
    else
        table.sort(arr)
    end
    return arr
end

function __TS__ArraySlice(list, first, last)
    local len = #list
    local relativeStart = first or 0
    local k
    if relativeStart < 0 then
        k = math.max(len + relativeStart, 0)
    else
        k = math.min(relativeStart, len)
    end
    local relativeEnd = last
    if last == nil then
        relativeEnd = len
    end
    local final
    if relativeEnd < 0 then
        final = math.max(len + relativeEnd, 0)
    else
        final = math.min(relativeEnd, len)
    end
    local out = {}
    local n = 0
    while k < final do
        out[n + 1] = list[k + 1]
        k = k + 1
        n = n + 1
    end
    return out
end

function __TS__ArraySome(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if callbackfn(_G, arr[i + 1], i, arr) then
                return true
            end
            i = i + 1
        end
    end
    return false
end

function __TS__ArraySplice(list, ...)
    local len = #list
    local actualArgumentCount = select("#", ...)
    local start = select(1, ...)
    local deleteCount = select(2, ...)
    local actualStart
    if start < 0 then
        actualStart = math.max(len + start, 0)
    else
        actualStart = math.min(start, len)
    end
    local itemCount = math.max(actualArgumentCount - 2, 0)
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - actualStart
    else
        actualDeleteCount = math.min(
            math.max(deleteCount or 0, 0),
            len - actualStart
        )
    end
    local out = {}
    do
        local k = 0
        while k < actualDeleteCount do
            local from = actualStart + k
            if list[from + 1] then
                out[k + 1] = list[from + 1]
            end
            k = k + 1
        end
    end
    if itemCount < actualDeleteCount then
        do
            local k = actualStart
            while k < (len - actualDeleteCount) do
                local from = k + actualDeleteCount
                local to = k + itemCount
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k + 1
            end
        end
        do
            local k = len
            while k > ((len - actualDeleteCount) + itemCount) do
                list[k] = nil
                k = k - 1
            end
        end
    elseif itemCount > actualDeleteCount then
        do
            local k = len - actualDeleteCount
            while k > actualStart do
                local from = (k + actualDeleteCount) - 1
                local to = (k + itemCount) - 1
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k - 1
            end
        end
    end
    local j = actualStart
    for i = 3, actualArgumentCount do
        list[j + 1] = select(i, ...)
        j = j + 1
    end
    do
        local k = #list - 1
        while k >= ((len - actualDeleteCount) + itemCount) do
            list[k + 1] = nil
            k = k - 1
        end
    end
    return out
end

function __TS__ArrayToObject(array)
    local object = {}
    do
        local i = 0
        while i < #array do
            object[i] = array[i + 1]
            i = i + 1
        end
    end
    return object
end

function __TS__ArrayFlat(array, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    for ____, value in ipairs(array) do
        if (depth > 0) and __TS__ArrayIsArray(value) then
            result = __TS__ArrayConcat(
                result,
                __TS__ArrayFlat(value, depth - 1)
            )
        else
            result[#result + 1] = value
        end
    end
    return result
end

function __TS__ArrayFlatMap(array, callback)
    local result = {}
    do
        local i = 0
        while i < #array do
            local value = callback(_G, array[i + 1], i, array)
            if (type(value) == "table") and __TS__ArrayIsArray(value) then
                result = __TS__ArrayConcat(result, value)
            else
                result[#result + 1] = value
            end
            i = i + 1
        end
    end
    return result
end

function __TS__ArraySetLength(arr, length)
    if (((length < 0) or (length ~= length)) or (length == math.huge)) or (math.floor(length) ~= length) then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    do
        local i = #arr - 1
        while i >= length do
            arr[i + 1] = nil
            i = i - 1
        end
    end
    return length
end

function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

function __TS__CloneDescriptor(____bindingPattern0)
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    local configurable
    configurable = ____bindingPattern0.configurable
    local get
    get = ____bindingPattern0.get
    local set
    set = ____bindingPattern0.set
    local writable
    writable = ____bindingPattern0.writable
    local value
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = (get ~= nil) or (set ~= nil)
    local hasValueOrWritableAttribute = (writable ~= nil) or (value ~= nil)
    if hasGetterOrSetter and hasValueOrWritableAttribute then
        error("Invalid property descriptor. Cannot both specify accessors and a value or writable attribute.", 0)
    end
    if get or set then
        descriptor.get = get
        descriptor.set = set
    else
        descriptor.value = value
        descriptor.writable = writable == true
    end
    return descriptor
end

function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(_G, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(_G, target, key, descriptor) or descriptor
                    local isSimpleValue = (((desc.configurable == true) and (desc.writable == true)) and (not desc.get)) and (not desc.set)
                    if isSimpleValue then
                        rawset(target, key, desc.value)
                    else
                        __TS__SetDescriptor(
                            target,
                            key,
                            __TS__ObjectAssign({}, descriptor, desc)
                        )
                    end
                elseif desc == false then
                    result = decorator(_G, target, key, desc)
                else
                    result = decorator(_G, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(_G, target, key, paramIndex) end
end

function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. ".",
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    if target[key] ~= nil then
        target[key] = nil
        return true
    end
    return false
end

function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(
                __TS__StringAccess(iterable, index)
            )
        end
    elseif iterable.____coroutine ~= nil then
        local co = iterable.____coroutine
        while true do
            local status, value = coroutine.resume(co)
            if not status then
                error(value, 0)
            end
            if coroutine.status(co) == "dead" then
                return value
            else
                coroutine.yield(value)
            end
        end
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                return result.value
            else
                coroutine.yield(result.value)
            end
        end
    else
        for ____, value in ipairs(iterable) do
            coroutine.yield(value)
        end
    end
end

function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

function __TS__GetErrorStack(self, constructor)
    local level = 1
    while true do
        local info = debug.getinfo(level, "f")
        level = level + 1
        if not info then
            level = 1
            break
        elseif info.func == constructor then
            break
        end
    end
    return debug.traceback(nil, level)
end
function __TS__WrapErrorToString(self, getDescription)
    return function(self)
        local description = getDescription(self)
        local caller = debug.getinfo(3, "f")
        if (_VERSION == "Lua 5.1") or (caller and (caller.func ~= error)) then
            return description
        else
            return (tostring(description) .. "\n") .. self.stack
        end
    end
end
function __TS__InitErrorClass(self, Type, name)
    Type.name = name
    return setmetatable(
        Type,
        {
            __call = function(____, _self, message) return __TS__New(Type, message) end
        }
    )
end
Error = __TS__InitErrorClass(
    _G,
    (function()
        local ____ = __TS__Class()
        ____.name = ""
        function ____.prototype.____constructor(self, message)
            if message == nil then
                message = ""
            end
            self.message = message
            self.name = "Error"
            self.stack = __TS__GetErrorStack(_G, self.constructor.new)
            local metatable = getmetatable(self)
            if not metatable.__errorToStringPatched then
                metatable.__errorToStringPatched = true
                metatable.__tostring = __TS__WrapErrorToString(_G, metatable.__tostring)
            end
        end
        function ____.prototype.__tostring(self)
            return (((self.message ~= "") and (function() return (self.name .. ": ") .. self.message end)) or (function() return self.name end))()
        end
        return ____
    end)(),
    "Error"
)
for ____, errorName in ipairs({"RangeError", "ReferenceError", "SyntaxError", "TypeError", "URIError"}) do
    _G[errorName] = __TS__InitErrorClass(
        _G,
        (function()
            local ____ = __TS__Class()
            ____.name = ____.name
            __TS__ClassExtends(____, Error)
            function ____.prototype.____constructor(self, ...)
                Error.prototype.____constructor(self, ...)
                self.name = errorName
            end
            return ____
        end)(),
        errorName
    )
end

__TS__Unpack = table.unpack or unpack

function __TS__FunctionBind(fn, thisArg, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        do
            local i = 0
            while i < #boundArgs do
                table.insert(args, i + 1, boundArgs[i + 1])
                i = i + 1
            end
        end
        return fn(
            thisArg,
            __TS__Unpack(args)
        )
    end
end

____symbolMetatable = {
    __tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end
}
function __TS__Symbol(description)
    return setmetatable({description = description}, ____symbolMetatable)
end
Symbol = {
    iterator = __TS__Symbol("Symbol.iterator"),
    hasInstance = __TS__Symbol("Symbol.hasInstance"),
    species = __TS__Symbol("Symbol.species"),
    toStringTag = __TS__Symbol("Symbol.toStringTag")
}

function __TS__GeneratorIterator(self)
    return self
end
function __TS__GeneratorNext(self, ...)
    local co = self.____coroutine
    if coroutine.status(co) == "dead" then
        return {done = true}
    end
    local status, value = coroutine.resume(co, ...)
    if not status then
        error(value, 0)
    end
    return {
        value = value,
        done = coroutine.status(co) == "dead"
    }
end
function __TS__Generator(fn)
    return function(...)
        local args = {...}
        local argsLength = select("#", ...)
        return {
            ____coroutine = coroutine.create(
                function() return fn(
                    (unpack or table.unpack)(args, 1, argsLength)
                ) end
            ),
            [Symbol.iterator] = __TS__GeneratorIterator,
            next = __TS__GeneratorNext
        }
    end
end

function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not (not classTbl[Symbol.hasInstance](classTbl, obj))
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return (valueType == "table") or (valueType == "function")
end

function __TS__IteratorGeneratorStep(self)
    local co = self.____coroutine
    local status, value = coroutine.resume(co)
    if not status then
        error(value, 0)
    end
    if coroutine.status(co) == "dead" then
        return
    end
    return true, value
end
function __TS__IteratorIteratorStep(self)
    local result = self:next()
    if result.done then
        return
    end
    return true, result.value
end
function __TS__IteratorStringStep(self, index)
    index = index + 1
    if index > #self then
        return
    end
    return index, string.sub(self, index, index)
end
function __TS__Iterator(iterable)
    if type(iterable) == "string" then
        return __TS__IteratorStringStep, iterable, 0
    elseif iterable.____coroutine ~= nil then
        return __TS__IteratorGeneratorStep, iterable
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        return __TS__IteratorIteratorStep, iterator
    else
        return __TS__Unpack(
            {
                ipairs(iterable)
            }
        )
    end
end

Map = (function()
    local Map = __TS__Class()
    Map.name = "Map"
    function Map.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "Map"
        self.items = {}
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[1], value[2])
            end
        else
            local array = entries
            for ____, kvp in ipairs(array) do
                self:set(kvp[1], kvp[2])
            end
        end
    end
    function Map.prototype.clear(self)
        self.items = {}
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Map.prototype.delete(self, key)
        local contains = self:has(key)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[key]
            local previous = self.previousKey[key]
            if next and previous then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[key] = nil
            self.previousKey[key] = nil
        end
        self.items[key] = nil
        return contains
    end
    function Map.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(
            self:keys()
        ) do
            callback(_G, self.items[key], key, self)
        end
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return (self.nextKey[key] ~= nil) or (self.lastKey == key)
    end
    function Map.prototype.set(self, key, value)
        local isNewValue = not self:has(key)
        if isNewValue then
            self.size = self.size + 1
        end
        self.items[key] = value
        if self.firstKey == nil then
            self.firstKey = key
            self.lastKey = key
        elseif isNewValue then
            self.nextKey[self.lastKey] = key
            self.previousKey[key] = self.lastKey
            self.lastKey = key
        end
        return self
    end
    Map.prototype[Symbol.iterator] = function(self)
        return self:entries()
    end
    function Map.prototype.entries(self)
        local ____ = self
        local items = ____.items
        local nextKey = ____.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, items[key]}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.values(self)
        local ____ = self
        local items = ____.items
        local nextKey = ____.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = items[key]}
                key = nextKey[key]
                return result
            end
        }
    end
    Map[Symbol.species] = Map
    return Map
end)()

__TS__MathAtan2 = math.atan2 or math.atan

function __TS__Number(value)
    local valueType = type(value)
    if valueType == "number" then
        return value
    elseif valueType == "string" then
        local numberValue = tonumber(value)
        if numberValue then
            return numberValue
        end
        if value == "Infinity" then
            return math.huge
        end
        if value == "-Infinity" then
            return -math.huge
        end
        local stringWithoutSpaces = string.gsub(value, "%s", "")
        if stringWithoutSpaces == "" then
            return 0
        end
        return 0 / 0
    elseif valueType == "boolean" then
        return (value and 1) or 0
    else
        return 0 / 0
    end
end

function __TS__NumberIsFinite(value)
    return (((type(value) == "number") and (value == value)) and (value ~= math.huge)) and (value ~= -math.huge)
end

function __TS__NumberIsNaN(value)
    return value ~= value
end

____radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
function __TS__NumberToString(self, radix)
    if ((((radix == nil) or (radix == 10)) or (self == math.huge)) or (self == -math.huge)) or (self ~= self) then
        return tostring(self)
    end
    radix = math.floor(radix)
    if (radix < 2) or (radix > 36) then
        error("toString() radix argument must be between 2 and 36", 0)
    end
    local integer, fraction = math.modf(
        math.abs(self)
    )
    local result = ""
    if radix == 8 then
        result = string.format("%o", integer)
    elseif radix == 16 then
        result = string.format("%x", integer)
    else
        repeat
            do
                result = tostring(
                    __TS__StringAccess(____radixChars, integer % radix)
                ) .. tostring(result)
                integer = math.floor(integer / radix)
            end
        until not (integer ~= 0)
    end
    if fraction ~= 0 then
        result = tostring(result) .. "."
        local delta = 1e-16
        repeat
            do
                fraction = fraction * radix
                delta = delta * radix
                local digit = math.floor(fraction)
                result = tostring(result) .. tostring(
                    __TS__StringAccess(____radixChars, digit)
                )
                fraction = fraction - digit
            end
        until not (fraction >= delta)
    end
    if self < 0 then
        result = "-" .. tostring(result)
    end
    return result
end

function __TS__ObjectAssign(to, ...)
    local sources = {...}
    if to == nil then
        return to
    end
    for ____, source in ipairs(sources) do
        for key in pairs(source) do
            to[key] = source[key]
        end
    end
    return to
end

function ____descriptorIndex(self, key)
    local value = rawget(self, key)
    if value ~= nil then
        return value
    end
    local metatable = getmetatable(self)
    while metatable do
        local rawResult = rawget(metatable, key)
        if rawResult ~= nil then
            return rawResult
        end
        local descriptors = rawget(metatable, "_descriptors")
        if descriptors then
            local descriptor = descriptors[key]
            if descriptor then
                if descriptor.get then
                    return descriptor.get(self)
                end
                return descriptor.value
            end
        end
        metatable = getmetatable(metatable)
    end
end
function ____descriptorNewindex(self, key, value)
    local metatable = getmetatable(self)
    while metatable do
        local descriptors = rawget(metatable, "_descriptors")
        if descriptors then
            local descriptor = descriptors[key]
            if descriptor then
                if descriptor.set then
                    descriptor.set(self, value)
                else
                    if descriptor.writable == false then
                        error(
                            ((("Cannot assign to read only property '" .. key) .. "' of object '") .. tostring(self)) .. "'",
                            0
                        )
                    end
                    descriptor.value = value
                end
                return
            end
        end
        metatable = getmetatable(metatable)
    end
    rawset(self, key, value)
end
function __TS__SetDescriptor(target, key, desc, isPrototype)
    if isPrototype == nil then
        isPrototype = false
    end
    local metatable = ((isPrototype and (function() return target end)) or (function() return getmetatable(target) end))()
    if not metatable then
        metatable = {}
        setmetatable(target, metatable)
    end
    local value = rawget(target, key)
    if value ~= nil then
        rawset(target, key, nil)
    end
    if not rawget(metatable, "_descriptors") then
        metatable._descriptors = {}
    end
    local descriptor = __TS__CloneDescriptor(desc)
    metatable._descriptors[key] = descriptor
    metatable.__index = ____descriptorIndex
    metatable.__newindex = ____descriptorNewindex
end

function __TS__ObjectDefineProperty(target, key, desc)
    local luaKey = (((type(key) == "number") and (function() return key + 1 end)) or (function() return key end))()
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = (desc.get ~= nil) or (desc.set ~= nil)
    local descriptor
    if hasGetterOrSetter then
        if value ~= nil then
            error(
                "Cannot redefine property: " .. tostring(key),
                0
            )
        end
        descriptor = desc
    else
        local valueExists = value ~= nil
        descriptor = {
            set = desc.set,
            get = desc.get,
            configurable = (((desc.configurable ~= nil) and (function() return desc.configurable end)) or (function() return valueExists end))(),
            enumerable = (((desc.enumerable ~= nil) and (function() return desc.enumerable end)) or (function() return valueExists end))(),
            writable = (((desc.writable ~= nil) and (function() return desc.writable end)) or (function() return valueExists end))(),
            value = (((desc.value ~= nil) and (function() return desc.value end)) or (function() return value end))()
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

function __TS__ObjectEntries(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = {key, obj[key]}
    end
    return result
end

function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[1]] = value[2]
        end
    else
        for ____, entry in ipairs(entries) do
            obj[entry[1]] = entry[2]
        end
    end
    return obj
end

function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

function __TS__ObjectKeys(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = key
    end
    return result
end

function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

function __TS__ObjectValues(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = obj[key]
    end
    return result
end

function __TS__ParseFloat(numberString)
    local infinityMatch = string.match(numberString, "^%s*(-?Infinity)")
    if infinityMatch then
        return (((__TS__StringAccess(infinityMatch, 0) == "-") and (function() return -math.huge end)) or (function() return math.huge end))()
    end
    local number = tonumber(
        string.match(numberString, "^%s*(-?%d+%.?%d*)")
    )
    return number or (0 / 0)
end

__TS__parseInt_base_pattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
function __TS__ParseInt(numberString, base)
    if base == nil then
        base = 10
        local hexMatch = string.match(numberString, "^%s*-?0[xX]")
        if hexMatch then
            base = 16
            numberString = ((string.match(hexMatch, "-") and (function() return "-" .. tostring(
                __TS__StringSubstr(numberString, #hexMatch)
            ) end)) or (function() return __TS__StringSubstr(numberString, #hexMatch) end))()
        end
    end
    if (base < 2) or (base > 36) then
        return 0 / 0
    end
    local allowedDigits = (((base <= 10) and (function() return __TS__StringSubstring(__TS__parseInt_base_pattern, 0, base) end)) or (function() return __TS__StringSubstr(__TS__parseInt_base_pattern, 0, 10 + (2 * (base - 10))) end))()
    local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
    local number = tonumber(
        string.match(numberString, pattern),
        base
    )
    if number == nil then
        return 0 / 0
    end
    if number >= 0 then
        return math.floor(number)
    else
        return math.ceil(number)
    end
end

Set = (function()
    local Set = __TS__Class()
    Set.name = "Set"
    function Set.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "Set"
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local array = values
            for ____, value in ipairs(array) do
                self:add(value)
            end
        end
    end
    function Set.prototype.add(self, value)
        local isNewValue = not self:has(value)
        if isNewValue then
            self.size = self.size + 1
        end
        if self.firstKey == nil then
            self.firstKey = value
            self.lastKey = value
        elseif isNewValue then
            self.nextKey[self.lastKey] = value
            self.previousKey[value] = self.lastKey
            self.lastKey = value
        end
        return self
    end
    function Set.prototype.clear(self)
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Set.prototype.delete(self, value)
        local contains = self:has(value)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[value]
            local previous = self.previousKey[value]
            if next and previous then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[value] = nil
            self.previousKey[value] = nil
        end
        return contains
    end
    function Set.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(
            self:keys()
        ) do
            callback(_G, key, key, self)
        end
    end
    function Set.prototype.has(self, value)
        return (self.nextKey[value] ~= nil) or (self.lastKey == value)
    end
    Set.prototype[Symbol.iterator] = function(self)
        return self:values()
    end
    function Set.prototype.entries(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, key}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.values(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    Set[Symbol.species] = Set
    return Set
end)()

WeakMap = (function()
    local WeakMap = __TS__Class()
    WeakMap.name = "WeakMap"
    function WeakMap.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "WeakMap"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self.items[value[1]] = value[2]
            end
        else
            for ____, kvp in ipairs(entries) do
                self.items[kvp[1]] = kvp[2]
            end
        end
    end
    function WeakMap.prototype.delete(self, key)
        local contains = self:has(key)
        self.items[key] = nil
        return contains
    end
    function WeakMap.prototype.get(self, key)
        return self.items[key]
    end
    function WeakMap.prototype.has(self, key)
        return self.items[key] ~= nil
    end
    function WeakMap.prototype.set(self, key, value)
        self.items[key] = value
        return self
    end
    WeakMap[Symbol.species] = WeakMap
    return WeakMap
end)()

WeakSet = (function()
    local WeakSet = __TS__Class()
    WeakSet.name = "WeakSet"
    function WeakSet.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "WeakSet"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self.items[result.value] = true
            end
        else
            for ____, value in ipairs(values) do
                self.items[value] = true
            end
        end
    end
    function WeakSet.prototype.add(self, value)
        self.items[value] = true
        return self
    end
    function WeakSet.prototype.delete(self, value)
        local contains = self:has(value)
        self.items[value] = nil
        return contains
    end
    function WeakSet.prototype.has(self, value)
        return self.items[value] == true
    end
    WeakSet[Symbol.species] = WeakSet
    return WeakSet
end)()

function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace
            if ((thread == nil) and (message == nil)) and (level == nil) then
                trace = _G.__TS__originalTraceback()
            else
                trace = _G.__TS__originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local result = string.gsub(
                trace,
                "(%S+).lua:(%d+)",
                function(file, line)
                    local fileSourceMap = _G.__TS__sourcemap[tostring(file) .. ".lua"]
                    if fileSourceMap and fileSourceMap[line] then
                        return (file .. ".ts:") .. tostring(fileSourceMap[line])
                    end
                    return (file .. ".lua:") .. line
                end
            )
            return result
        end
    end
end

function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        do
            local i = 0
            while i < #iterable do
                arr[#arr + 1] = __TS__StringAccess(iterable, i)
                i = i + 1
            end
        end
    else
        for ____, item in __TS__Iterator(iterable) do
            arr[#arr + 1] = item
        end
    end
    return __TS__Unpack(arr)
end

function __TS__StringAccess(self, index)
    if (index >= 0) and (index < #self) then
        return string.sub(self, index + 1, index + 1)
    end
end

function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    return string.byte(self, index + 1) or (0 / 0)
end

function __TS__StringConcat(str1, ...)
    local args = {...}
    local out = str1
    for ____, arg in ipairs(args) do
        out = tostring(out) .. tostring(arg)
    end
    return out
end

function __TS__StringEndsWith(self, searchString, endPosition)
    if (endPosition == nil) or (endPosition > #self) then
        endPosition = #self
    end
    return string.sub(self, (endPosition - #searchString) + 1, endPosition) == searchString
end

function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if (maxLength == -math.huge) or (maxLength == math.huge) then
        error("Invalid string length", 0)
    end
    if (#self >= maxLength) or (#fillString == 0) then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = tostring(fillString) .. tostring(
            string.rep(
                fillString,
                math.floor(maxLength / #fillString)
            )
        )
    end
    return tostring(self) .. tostring(
        string.sub(
            fillString,
            1,
            math.floor(maxLength)
        )
    )
end

function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if (maxLength == -math.huge) or (maxLength == math.huge) then
        error("Invalid string length", 0)
    end
    if (#self >= maxLength) or (#fillString == 0) then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = tostring(fillString) .. tostring(
            string.rep(
                fillString,
                math.floor(maxLength / #fillString)
            )
        )
    end
    return tostring(
        string.sub(
            fillString,
            1,
            math.floor(maxLength)
        )
    ) .. tostring(self)
end

function __TS__StringReplace(source, searchValue, replaceValue)
    searchValue = string.gsub(searchValue, "[%%%(%)%.%+%-%*%?%[%^%$]", "%%%1")
    if type(replaceValue) == "string" then
        replaceValue = string.gsub(replaceValue, "%%", "%%%%")
        local result = string.gsub(source, searchValue, replaceValue, 1)
        return result
    else
        local result = string.gsub(
            source,
            searchValue,
            function(match) return replaceValue(_G, match) end,
            1
        )
        return result
    end
end

function __TS__StringSlice(self, start, ____end)
    if (start == nil) or (start ~= start) then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if (____end ~= nil) and (____end < 0) then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if (____end ~= nil) and (start > ____end) then
        start, ____end = __TS__Unpack({____end, start})
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if (____end ~= nil) and (____end < 0) then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

function __TS__StringSplit(source, separator, limit)
    if limit == nil then
        limit = 4294967295
    end
    if limit == 0 then
        return {}
    end
    local out = {}
    local index = 0
    local count = 0
    if (separator == nil) or (separator == "") then
        while (index < (#source - 1)) and (count < limit) do
            out[count + 1] = __TS__StringAccess(source, index)
            count = count + 1
            index = index + 1
        end
    else
        local separatorLength = #separator
        local nextIndex = (string.find(source, separator, nil, true) or 0) - 1
        while (nextIndex >= 0) and (count < limit) do
            out[count + 1] = __TS__StringSubstring(source, index, nextIndex)
            count = count + 1
            index = nextIndex + separatorLength
            nextIndex = (string.find(
                source,
                separator,
                math.max(index + 1, 1),
                true
            ) or 0) - 1
        end
    end
    if count < limit then
        out[count + 1] = __TS__StringSubstring(source, index)
    end
    return out
end

function __TS__StringStartsWith(self, searchString, position)
    if (position == nil) or (position < 0) then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if (length ~= length) or (length <= 0) then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

____symbolRegistry = {}
function __TS__SymbolRegistryFor(key)
    if not ____symbolRegistry[key] then
        ____symbolRegistry[key] = __TS__Symbol(key)
    end
    return ____symbolRegistry[key]
end
function __TS__SymbolRegistryKeyFor(sym)
    for key in pairs(____symbolRegistry) do
        if ____symbolRegistry[key] == sym then
            return key
        end
    end
end

function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

 end,
["src.lib.Serilog.Serilog"] = function() require("lualib_bundle");
local ____exports = {}
____exports.LogLevel = LogLevel or ({})
____exports.LogLevel.None = -1
____exports.LogLevel[____exports.LogLevel.None] = "None"
____exports.LogLevel.Verbose = 0
____exports.LogLevel[____exports.LogLevel.Verbose] = "Verbose"
____exports.LogLevel.Debug = 1
____exports.LogLevel[____exports.LogLevel.Debug] = "Debug"
____exports.LogLevel.Information = 2
____exports.LogLevel[____exports.LogLevel.Information] = "Information"
____exports.LogLevel.Warning = 3
____exports.LogLevel[____exports.LogLevel.Warning] = "Warning"
____exports.LogLevel.Error = 4
____exports.LogLevel[____exports.LogLevel.Error] = "Error"
____exports.LogLevel.Fatal = 5
____exports.LogLevel[____exports.LogLevel.Fatal] = "Fatal"
____exports.LogEventType = LogEventType or ({})
____exports.LogEventType.Text = 0
____exports.LogEventType[____exports.LogEventType.Text] = "Text"
____exports.LogEventType.Parameter = 1
____exports.LogEventType[____exports.LogEventType.Parameter] = "Parameter"
____exports.LogEvent = __TS__Class()
local LogEvent = ____exports.LogEvent
LogEvent.name = "LogEvent"
function LogEvent.prototype.____constructor(self, Type, Text, Value)
    self.Type = Type
    self.Text = Text
    self.Value = Value
end
____exports.Log = {}
local Log = ____exports.Log
do
    local _sinks
    function Log.Init(sinks)
        _sinks = sinks
    end
    local function Parse(message, ...)
        local args = {...}
        local logEvents = {}
        local matcher = string.gmatch(message, "{.-}")
        local match
        local text
        local n = 0
        local i = 0
        while (function()
            match = matcher(nil)
            return match
        end)() do
            do
                local s, e = string.find(message, match, 1, true)
                if (not s) or (not e) then
                    goto __continue6
                end
                text = __TS__StringSubstring(message, i, s - 1)
                if text ~= "" then
                    __TS__ArrayPush(
                        logEvents,
                        __TS__New(____exports.LogEvent, ____exports.LogEventType.Text, text, nil)
                    )
                end
                __TS__ArrayPush(
                    logEvents,
                    __TS__New(____exports.LogEvent, ____exports.LogEventType.Parameter, match, args[n + 1])
                )
                i = e
                n = n + 1
            end
            ::__continue6::
        end
        text = __TS__StringSubstring(message, i)
        if text ~= "" then
            __TS__ArrayPush(
                logEvents,
                __TS__New(____exports.LogEvent, ____exports.LogEventType.Text, text, nil)
            )
        end
        return logEvents
    end
    function Log.Log(level, message, ...)
        local logEvents = Parse(message, ...)
        do
            local index = 0
            while index < #_sinks do
                if _sinks[index + 1]:LogLevel() <= level then
                    _sinks[index + 1]:Log(level, logEvents)
                end
                index = index + 1
            end
        end
    end
    function Log.Fatal(message, ...)
        Log.Log(____exports.LogLevel.Fatal, message, ...)
    end
    function Log.Error(message, ...)
        Log.Log(____exports.LogLevel.Error, message, ...)
    end
    function Log.Warning(message, ...)
        Log.Log(____exports.LogLevel.Warning, message, ...)
    end
    function Log.Information(message, ...)
        Log.Log(____exports.LogLevel.Information, message, ...)
    end
    function Log.Debug(message, ...)
        Log.Log(____exports.LogLevel.Debug, message, ...)
    end
    function Log.Verbose(message, ...)
        Log.Log(____exports.LogLevel.Verbose, message, ...)
    end
end
return ____exports
 end,
["src.lib.Serilog.Sinks.StringSink"] = function() require("lualib_bundle");
local ____exports = {}
local ____Serilog = require("src.lib.Serilog.Serilog")
local LogEventType = ____Serilog.LogEventType
local LogLevel = ____Serilog.LogLevel
____exports.StringSink = __TS__Class()
local StringSink = ____exports.StringSink
StringSink.name = "StringSink"
function StringSink.prototype.____constructor(self, logLevel, printer)
    self.logLevel = logLevel
    self.printer = printer
end
function StringSink.prototype.LogLevel(self)
    return self.logLevel
end
function StringSink.prototype.Log(self, level, events)
    local message = ""
    do
        local index = 0
        while index < #events do
            local event = events[index + 1]
            if event.Type == LogEventType.Text then
                message = tostring(message) .. tostring(event.Text)
            elseif event.Type == LogEventType.Parameter then
                local whichType = type(event.Value)
                local color = ____exports.StringSink.Colors[whichType]
                if color then
                    message = tostring(message) .. ("|cff" .. tostring(color))
                end
                if ____exports.StringSink.Brackets[whichType] then
                    message = tostring(message) .. "{ "
                end
                message = tostring(message) .. tostring(event.Value)
                if ____exports.StringSink.Brackets[whichType] then
                    message = tostring(message) .. " }"
                end
                if color then
                    message = tostring(message) .. "|r"
                end
            end
            index = index + 1
        end
    end
    self.printer(
        string.format("[%s]: %s", ____exports.StringSink.Prefix[level], message)
    )
end
StringSink.Prefix = {[LogLevel.None] = "|cffffffffNON|r", [LogLevel.Verbose] = "|cff9d9d9dVRB|r", [LogLevel.Debug] = "|cff9d9d9dDBG|r", [LogLevel.Information] = "|cffe6cc80INF|r", [LogLevel.Warning] = "|cffffcc00WRN|r", [LogLevel.Error] = "|cffff8000ERR|r", [LogLevel.Fatal] = "|cffff0000FTL|r"}
StringSink.Colors = {["nil"] = "9d9d9d", boolean = "1eff00", number = "00ccff", string = "ff8000", table = "ffcc00", ["function"] = "ffcc00", userdata = "ffcc00"}
StringSink.Brackets = {["nil"] = false, boolean = false, number = false, string = false, table = true, ["function"] = true, userdata = true}
return ____exports
 end,
["src.JassOverrides.Timer"] = function() require("lualib_bundle");
local ____exports = {}
local ____Serilog = require("src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.Timer = __TS__Class()
local Timer = ____exports.Timer
Timer.name = "Timer"
function Timer.prototype.____constructor(self, t)
    self.t = t
end
function Timer.prototype.start(self, timeout, periodic, handlerFunc)
    TimerStart(
        self.t,
        timeout,
        periodic,
        function() return {
            xpcall(
                function() return handlerFunc() end,
                function(err) return Log.Fatal(err) end
            )
        } end
    )
end
function Timer.prototype.pause(self)
    PauseTimer(self.t)
end
function Timer.prototype.destroy(self)
    DestroyTimer(self.t)
end
return ____exports
 end,
["src.JassOverrides.Trigger"] = function() require("lualib_bundle");
local ____exports = {}
local ____Serilog = require("src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.Trigger = __TS__Class()
local Trigger = ____exports.Trigger
Trigger.name = "Trigger"
function Trigger.prototype.____constructor(self)
    self.nativeTrigger = CreateTrigger()
end
function Trigger.evaluateCondition(self, func)
    local answer = false
    xpcall(
        function()
            answer = func()
        end,
        function(err)
            self:printError(err)
        end
    )
    return answer
end
function Trigger.printError(self, err)
    Log.Fatal(err)
end
function Trigger.prototype.addAction(self, actionFunc)
    return TriggerAddAction(
        self.nativeTrigger,
        function() return {
            xpcall(
                function() return actionFunc() end,
                function(err) return ____exports.Trigger:printError(err) end
            )
        } end
    )
end
function Trigger.prototype.registerTimerEvent(self, timeout, periodic)
    return TriggerRegisterTimerEvent(self.nativeTrigger, timeout, periodic)
end
function Trigger.prototype.registerTimerEventSingle(self, timeout)
    return TriggerRegisterTimerEventSingle(self.nativeTrigger, timeout)
end
function Trigger.prototype.registerTimerEventPeriodic(self, timeout)
    return TriggerRegisterTimerEventPeriodic(self.nativeTrigger, timeout)
end
function Trigger.prototype.registerPlayerStateEvent(self, whichPlayer, whichState, opcode, limitval)
    return TriggerRegisterPlayerStateEvent(self.nativeTrigger, whichPlayer, whichState, opcode, limitval)
end
function Trigger.prototype.registerDeathEvent(self, whichWidget)
    return TriggerRegisterDeathEvent(self.nativeTrigger, whichWidget)
end
function Trigger.prototype.registerDialogEventBJ(self, whichDialog)
    return TriggerRegisterDialogEventBJ(self.nativeTrigger, whichDialog)
end
function Trigger.prototype.registerDialogButtonEvent(self, whichButton)
    return TriggerRegisterDialogButtonEvent(self.nativeTrigger, whichButton)
end
function Trigger.prototype.registerEnterRectSimple(self, r)
    return TriggerRegisterEnterRectSimple(self.nativeTrigger, r)
end
function Trigger.prototype.registerLeaveRectSimple(self, r)
    return TriggerRegisterLeaveRectSimple(self.nativeTrigger, r)
end
function Trigger.prototype.addCondition(self, func)
    return TriggerAddCondition(
        self.nativeTrigger,
        Condition(
            function() return ____exports.Trigger:evaluateCondition(func) end
        )
    )
end
function Trigger.prototype.addFilterFuncCondition(self, filter)
    return TriggerAddCondition(self.nativeTrigger, filter)
end
function Trigger.prototype.registerAnyUnitEventBJ(self, whichEvent)
    TriggerRegisterAnyUnitEventBJ(self.nativeTrigger, whichEvent)
end
function Trigger.prototype.registerPlayerChatEvent(self, whichPlayer, chatMessageToDetect, exactMatchOnly)
    return TriggerRegisterPlayerChatEvent(self.nativeTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly)
end
function Trigger.prototype.registerPlayerUnitEventSimple(self, whichPlayer, whichEvent)
    return TriggerRegisterPlayerUnitEventSimple(self.nativeTrigger, whichPlayer, whichEvent)
end
function Trigger.prototype.registerFrameEvent(self, whichFrameHandle, whichEvent)
    return BlzTriggerRegisterFrameEvent(self.nativeTrigger, whichFrameHandle, whichEvent)
end
function Trigger.prototype.registerPlayerSyncEvent(self, whichPlayer, prefix, fromServer)
    return BlzTriggerRegisterPlayerSyncEvent(self.nativeTrigger, whichPlayer, prefix, fromServer)
end
function Trigger.prototype.registerPlayerEventLeave(self, whichPlayer)
    return TriggerRegisterPlayerEventLeave(self.nativeTrigger, whichPlayer)
end
function Trigger.prototype.registerPlayerKeyEvent(self, whichPlayer, key, metaKey, keyDown)
    BlzTriggerRegisterPlayerKeyEvent(self.nativeTrigger, whichPlayer, key, metaKey, keyDown)
end
function Trigger.prototype.registerPlayerEvent(self, whichPlayer, whichPlayerEvent)
    return TriggerRegisterPlayerEvent(self.nativeTrigger, whichPlayer, whichPlayerEvent)
end
function Trigger.prototype.registerPlayerUnitEvent(self, whichPlayer, whichPlayerEvent)
    return TriggerRegisterPlayerUnitEventSimple(self.nativeTrigger, whichPlayer, whichPlayerEvent)
end
return ____exports
 end,
["src.Utility.Node"] = function() local ____exports = {}
return ____exports
 end,
["src.Utility.LinkedList"] = function() require("lualib_bundle");
local ____exports = {}
____exports.LinkedList = __TS__Class()
local LinkedList = ____exports.LinkedList
LinkedList.name = "LinkedList"
function LinkedList.prototype.____constructor(self, values)
    self.head = nil
    self.size = 0
    if values then
        __TS__ArrayForEach(
            values,
            function(____, v) return self:add(v) end
        )
    end
end
function LinkedList.prototype.isEmpty(self)
    return self.head == nil
end
function LinkedList.prototype.add(self, value)
    if self:isEmpty() then
        self.head = {value = value}
        self.size = 1
    else
        self.head = {value = value, next = self.head}
        self.size = self.size + 1
    end
end
function LinkedList.prototype.pop(self)
    if self:isEmpty() then
        self.size = 0
        return nil
    end
    local temp = self.head
    self.head = self.head.next
    temp.next = nil
    self.size = self.size - 1
    return temp
end
function LinkedList.prototype.getSize(self)
    return self.size
end
return ____exports
 end,
["src.Utility.TimerUtils"] = function() require("lualib_bundle");
local ____exports = {}
local ____LinkedList = require("src.Utility.LinkedList")
local LinkedList = ____LinkedList.LinkedList
local ____Timer = require("src.JassOverrides.Timer")
local Timer = ____Timer.Timer
____exports.TimerUtils = __TS__Class()
local TimerUtils = ____exports.TimerUtils
TimerUtils.name = "TimerUtils"
function TimerUtils.prototype.____constructor(self)
    self.QUANTITY = 256
    self.MAX_SIZE = 8190
    self.timerQueue = __TS__New(LinkedList)
    do
        local i = 0
        while i < self.QUANTITY do
            self.timerQueue:add(
                __TS__New(
                    Timer,
                    CreateTimer()
                )
            )
            i = i + 1
        end
    end
end
function TimerUtils.prototype.newTimer(self)
    local t = self.timerQueue:pop()
    if t == nil then
        BJDebugMsg("Warning: Exceeded timer QUANTITY, make sure all timers are getting recycled correctly!")
        return __TS__New(
            Timer,
            CreateTimer()
        )
    end
    return t.value
end
function TimerUtils.prototype.releaseTimer(self, t)
    if t == nil then
        return BJDebugMsg("Warning: attempt to release an undefined timer")
    end
    if self.timerQueue:getSize() == self.MAX_SIZE then
        BJDebugMsg("Warning: Timer stack is full, destroying timer!!")
        return t:destroy()
    end
    t:pause()
    self.timerQueue:add(t)
end
return ____exports
 end,
["src.Spells.Generic.Sell"] = function() require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
____exports.Sell = __TS__Class()
local Sell = ____exports.Sell
Sell.name = "Sell"
function Sell.prototype.____constructor(self)
    self.trig = __TS__New(Trigger)
    self.orderId = String2OrderIdBJ("defend")
    self.trig:addCondition(
        function() return self:condition() end
    )
    self.trig:addAction(
        function() return self:action() end
    )
    self.trig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_ISSUED_ORDER)
end
function Sell.prototype.condition(self)
    return GetIssuedOrderIdBJ() == self.orderId
end
function Sell.prototype.action(self)
    local trig = GetTriggerUnit()
    local owningPlayer = GetOwningPlayer(trig)
    local cost = GetUnitGoldCost(
        GetUnitTypeId(trig)
    )
    SetPlayerState(
        owningPlayer,
        PLAYER_STATE_RESOURCE_GOLD,
        math.ceil(
            GetPlayerState(owningPlayer, PLAYER_STATE_RESOURCE_GOLD) + (0.75 * cost)
        )
    )
    RemoveUnit(trig)
end
return ____exports
 end,
["src.Spells.Spells"] = function() require("lualib_bundle");
local ____exports = {}
local ____Sell = require("src.Spells.Generic.Sell")
local Sell = ____Sell.Sell
____exports.Spells = __TS__Class()
local Spells = ____exports.Spells
Spells.name = "Spells"
function Spells.prototype.____constructor(self)
    self.spells = {
        __TS__New(Sell)
    }
end
return ____exports
 end,
["src.Utility.Color"] = function() local ____exports = {}
return ____exports
 end,
["src.Creeps.CreepType"] = function() local ____exports = {}
____exports.CreepType = CreepType or ({})
____exports.CreepType.LARGE = 0
____exports.CreepType[____exports.CreepType.LARGE] = "LARGE"
____exports.CreepType.ZEPPELIN = 1
____exports.CreepType[____exports.CreepType.ZEPPELIN] = "ZEPPELIN"
return ____exports
 end,
["src.Creeps.Creep"] = function() require("lualib_bundle");
local ____exports = {}
local defaultCreepUnitTypeId = FourCC("u000")
____exports.Creep = __TS__Class()
local Creep = ____exports.Creep
Creep.name = "Creep"
function Creep.prototype.____constructor(self)
    self.health = 1
    self.speed = 1
    self.unitTypeId = defaultCreepUnitTypeId
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.creepType = nil
    self.children = {}
    self._parent = nil
end
__TS__SetDescriptor(
    Creep.prototype,
    "parent",
    {
        get = function(self)
            return self._parent
        end
    },
    true
)
function Creep.prototype.apply(self, unit)
    SetUnitVertexColor(unit, self.color.r, self.color.g, self.color.b, self.color.a)
    SetUnitMoveSpeed(
        unit,
        GetUnitMoveSpeed(unit) * self.speed
    )
    if self.health > 1 then
        BlzSetUnitMaxHP(unit, self.health)
        SetUnitLifePercentBJ(unit, 100)
    end
end
function Creep.prototype.dealLethalDamage(self, damageAmount)
    local spawnedCreeps = {}
    do
        local i = 0
        while i < #self.children do
            self.children[i + 1]._parent = self
            local creepDamageEvent = self.children[i + 1]:dealDamage(damageAmount)
            damageAmount = creepDamageEvent.overflowingDamage
            spawnedCreeps = __TS__ArrayConcat(spawnedCreeps, creepDamageEvent.spawnedCreeps)
            i = i + 1
        end
    end
    return {spawnedCreeps = spawnedCreeps, overflowingDamage = damageAmount}
end
function Creep.prototype.dealDamage(self, damageAmount)
    if damageAmount < self.health then
        return {spawnedCreeps = {self}, overflowingDamage = damageAmount}
    end
    local spawnedCreeps = {}
    do
        local i = 0
        while (i < #self.children) and (damageAmount > 0) do
            self.children[i + 1]._parent = self
            local creepDamageEvent = self.children[i + 1]:dealDamage(damageAmount - self.health)
            damageAmount = creepDamageEvent.overflowingDamage
            spawnedCreeps = __TS__ArrayConcat(spawnedCreeps, creepDamageEvent.spawnedCreeps)
            i = i + 1
        end
    end
    return {spawnedCreeps = spawnedCreeps, overflowingDamage = damageAmount}
end
return ____exports
 end,
["src.Creeps.Normal.RedVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
____exports.RedVillager = __TS__Class()
local RedVillager = ____exports.RedVillager
RedVillager.name = "RedVillager"
__TS__ClassExtends(RedVillager, Creep)
function RedVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.color = {r = 255, g = 125, b = 125, a = 255}
end
return ____exports
 end,
["src.Creeps.Normal.BlueVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____RedVillager = require("src.Creeps.Normal.RedVillager")
local RedVillager = ____RedVillager.RedVillager
____exports.BlueVillager = __TS__Class()
local BlueVillager = ____exports.BlueVillager
BlueVillager.name = "BlueVillager"
__TS__ClassExtends(BlueVillager, Creep)
function BlueVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 1.4
    self.color = {r = 125, g = 125, b = 255, a = 255}
    self.children = {
        __TS__New(RedVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.GreenVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____BlueVillager = require("src.Creeps.Normal.BlueVillager")
local BlueVillager = ____BlueVillager.BlueVillager
____exports.GreenVillager = __TS__Class()
local GreenVillager = ____exports.GreenVillager
GreenVillager.name = "GreenVillager"
__TS__ClassExtends(GreenVillager, Creep)
function GreenVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 1.8
    self.color = {r = 100, g = 200, b = 100, a = 255}
    self.children = {
        __TS__New(BlueVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.YellowVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____GreenVillager = require("src.Creeps.Normal.GreenVillager")
local GreenVillager = ____GreenVillager.GreenVillager
____exports.YellowVillager = __TS__Class()
local YellowVillager = ____exports.YellowVillager
YellowVillager.name = "YellowVillager"
__TS__ClassExtends(YellowVillager, Creep)
function YellowVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 3.2
    self.color = {r = 255, g = 255, b = 75, a = 255}
    self.children = {
        __TS__New(GreenVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.PinkVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____YellowVillager = require("src.Creeps.Normal.YellowVillager")
local YellowVillager = ____YellowVillager.YellowVillager
____exports.PinkVillager = __TS__Class()
local PinkVillager = ____exports.PinkVillager
PinkVillager.name = "PinkVillager"
__TS__ClassExtends(PinkVillager, Creep)
function PinkVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 3.5
    self.color = {r = 255, g = 175, b = 255, a = 255}
    self.children = {
        __TS__New(YellowVillager)
    }
end
return ____exports
 end,
["src.Creeps.Modifier"] = function() require("lualib_bundle");
local ____exports = {}
____exports.Modifier = __TS__Class()
local Modifier = ____exports.Modifier
Modifier.name = "Modifier"
function Modifier.prototype.____constructor(self)
end
return ____exports
 end,
["src.Creeps.Modifiers.RegenModifier"] = function() require("lualib_bundle");
local ____exports = {}
local ____Modifier = require("src.Creeps.Modifier")
local Modifier = ____Modifier.Modifier
____exports.regenUnitMap = __TS__New(Map)
local regenUnitTypeId = FourCC("u002")
____exports.RegenModifier = __TS__Class()
local RegenModifier = ____exports.RegenModifier
RegenModifier.name = "RegenModifier"
__TS__ClassExtends(RegenModifier, Modifier)
function RegenModifier.prototype.transform(self, creep)
    creep.unitTypeId = regenUnitTypeId
end
function RegenModifier.prototype.apply(self, unit)
    ____exports.regenUnitMap:set(
        GetHandleId(unit),
        {unit = unit, remainingRegenTicks = 3}
    )
end
return ____exports
 end,
["src.Creeps.Normal.BlackVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____PinkVillager = require("src.Creeps.Normal.PinkVillager")
local PinkVillager = ____PinkVillager.PinkVillager
____exports.BlackVillager = __TS__Class()
local BlackVillager = ____exports.BlackVillager
BlackVillager.name = "BlackVillager"
__TS__ClassExtends(BlackVillager, Creep)
function BlackVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 1.8
    self.color = {r = 35, g = 35, b = 35, a = 255}
    self.children = {
        __TS__New(PinkVillager),
        __TS__New(PinkVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.WhiteVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____PinkVillager = require("src.Creeps.Normal.PinkVillager")
local PinkVillager = ____PinkVillager.PinkVillager
____exports.WhiteVillager = __TS__Class()
local WhiteVillager = ____exports.WhiteVillager
WhiteVillager.name = "WhiteVillager"
__TS__ClassExtends(WhiteVillager, Creep)
function WhiteVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 2
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.children = {
        __TS__New(PinkVillager),
        __TS__New(PinkVillager)
    }
end
return ____exports
 end,
["src.Creeps.Modifiers.InvisibilityModifier"] = function() require("lualib_bundle");
local ____exports = {}
local ____Modifier = require("src.Creeps.Modifier")
local Modifier = ____Modifier.Modifier
local invisibilityUnitTypeId = FourCC("u003")
____exports.InvisibilityModifier = __TS__Class()
local InvisibilityModifier = ____exports.InvisibilityModifier
InvisibilityModifier.name = "InvisibilityModifier"
__TS__ClassExtends(InvisibilityModifier, Modifier)
function InvisibilityModifier.prototype.transform(self, creep)
    creep.unitTypeId = invisibilityUnitTypeId
    creep.color = {r = creep.color.a, g = creep.color.g, b = creep.color.b, a = 125}
end
function InvisibilityModifier.prototype.apply(self, _unit)
    return
end
return ____exports
 end,
["src.Creeps.Normal.PurpleVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____PinkVillager = require("src.Creeps.Normal.PinkVillager")
local PinkVillager = ____PinkVillager.PinkVillager
____exports.PurpleVillager = __TS__Class()
local PurpleVillager = ____exports.PurpleVillager
PurpleVillager.name = "PurpleVillager"
__TS__ClassExtends(PurpleVillager, Creep)
function PurpleVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 3
    self.color = {r = 255, g = 75, b = 255, a = 255}
    self.children = {
        __TS__New(PinkVillager),
        __TS__New(PinkVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.ZebraVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____BlackVillager = require("src.Creeps.Normal.BlackVillager")
local BlackVillager = ____BlackVillager.BlackVillager
local ____WhiteVillager = require("src.Creeps.Normal.WhiteVillager")
local WhiteVillager = ____WhiteVillager.WhiteVillager
____exports.ZebraVillager = __TS__Class()
local ZebraVillager = ____exports.ZebraVillager
ZebraVillager.name = "ZebraVillager"
__TS__ClassExtends(ZebraVillager, Creep)
function ZebraVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 1.8
    self.color = {r = 125, g = 125, b = 125, a = 255}
    self.children = {
        __TS__New(BlackVillager),
        __TS__New(WhiteVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.FortifiedVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____BlackVillager = require("src.Creeps.Normal.BlackVillager")
local BlackVillager = ____BlackVillager.BlackVillager
local fortifiedVillagerTypeId = FourCC("u004")
____exports.FortifiedVillager = __TS__Class()
local FortifiedVillager = ____exports.FortifiedVillager
FortifiedVillager.name = "FortifiedVillager"
__TS__ClassExtends(FortifiedVillager, Creep)
function FortifiedVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.health = 4
    self.unitTypeId = fortifiedVillagerTypeId
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.children = {
        __TS__New(BlackVillager),
        __TS__New(BlackVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.RainbowVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____ZebraVillager = require("src.Creeps.Normal.ZebraVillager")
local ZebraVillager = ____ZebraVillager.ZebraVillager
____exports.RainbowVillager = __TS__Class()
local RainbowVillager = ____exports.RainbowVillager
RainbowVillager.name = "RainbowVillager"
__TS__ClassExtends(RainbowVillager, Creep)
function RainbowVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.speed = 2.2
    self.color = {r = 55, g = 255, b = 255, a = 255}
    self.children = {
        __TS__New(ZebraVillager),
        __TS__New(ZebraVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.LargeVillager"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____RainbowVillager = require("src.Creeps.Normal.RainbowVillager")
local RainbowVillager = ____RainbowVillager.RainbowVillager
local largeVillagerTypeId = FourCC("u005")
____exports.LargeVillager = __TS__Class()
local LargeVillager = ____exports.LargeVillager
LargeVillager.name = "LargeVillager"
__TS__ClassExtends(LargeVillager, Creep)
function LargeVillager.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.health = 20
    self.unitTypeId = largeVillagerTypeId
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.creepType = CreepType.LARGE
    self.children = {
        __TS__New(RainbowVillager),
        __TS__New(RainbowVillager)
    }
end
return ____exports
 end,
["src.Creeps.Normal.Zeppelin"] = function() require("lualib_bundle");
local ____exports = {}
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____LargeVillager = require("src.Creeps.Normal.LargeVillager")
local LargeVillager = ____LargeVillager.LargeVillager
local zeppelinTypeId = FourCC("u006")
____exports.Zeppelin = __TS__Class()
local Zeppelin = ____exports.Zeppelin
Zeppelin.name = "Zeppelin"
__TS__ClassExtends(Zeppelin, Creep)
function Zeppelin.prototype.____constructor(self, ...)
    Creep.prototype.____constructor(self, ...)
    self.health = 400
    self.unitTypeId = zeppelinTypeId
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.creepType = CreepType.ZEPPELIN
    self.children = {
        __TS__New(LargeVillager),
        __TS__New(LargeVillager),
        __TS__New(LargeVillager),
        __TS__New(LargeVillager)
    }
end
return ____exports
 end,
["src.Game.Rounds"] = function() require("lualib_bundle");
local ____exports = {}
local ____BlueVillager = require("src.Creeps.Normal.BlueVillager")
local BlueVillager = ____BlueVillager.BlueVillager
local ____GreenVillager = require("src.Creeps.Normal.GreenVillager")
local GreenVillager = ____GreenVillager.GreenVillager
local ____PinkVillager = require("src.Creeps.Normal.PinkVillager")
local PinkVillager = ____PinkVillager.PinkVillager
local ____RedVillager = require("src.Creeps.Normal.RedVillager")
local RedVillager = ____RedVillager.RedVillager
local ____YellowVillager = require("src.Creeps.Normal.YellowVillager")
local YellowVillager = ____YellowVillager.YellowVillager
local ____RegenModifier = require("src.Creeps.Modifiers.RegenModifier")
local RegenModifier = ____RegenModifier.RegenModifier
local ____BlackVillager = require("src.Creeps.Normal.BlackVillager")
local BlackVillager = ____BlackVillager.BlackVillager
local ____WhiteVillager = require("src.Creeps.Normal.WhiteVillager")
local WhiteVillager = ____WhiteVillager.WhiteVillager
local ____InvisibilityModifier = require("src.Creeps.Modifiers.InvisibilityModifier")
local InvisibilityModifier = ____InvisibilityModifier.InvisibilityModifier
local ____PurpleVillager = require("src.Creeps.Normal.PurpleVillager")
local PurpleVillager = ____PurpleVillager.PurpleVillager
local ____ZebraVillager = require("src.Creeps.Normal.ZebraVillager")
local ZebraVillager = ____ZebraVillager.ZebraVillager
local ____FortifiedVillager = require("src.Creeps.Normal.FortifiedVillager")
local FortifiedVillager = ____FortifiedVillager.FortifiedVillager
local ____RainbowVillager = require("src.Creeps.Normal.RainbowVillager")
local RainbowVillager = ____RainbowVillager.RainbowVillager
local ____LargeVillager = require("src.Creeps.Normal.LargeVillager")
local LargeVillager = ____LargeVillager.LargeVillager
local ____Zeppelin = require("src.Creeps.Normal.Zeppelin")
local Zeppelin = ____Zeppelin.Zeppelin
local regenModifier = __TS__New(RegenModifier)
local invisibilityModifier = __TS__New(InvisibilityModifier)
local rounds = {{{creepType = RedVillager, amount = 20, delay = 0.9}}, {{creepType = RedVillager, amount = 35, delay = 0.9}}, {{creepType = RedVillager, amount = 25, delay = 0.9}, {creepType = BlueVillager, amount = 5, delay = 0.9}}, {{creepType = RedVillager, amount = 35, delay = 0.9}, {creepType = BlueVillager, amount = 18, delay = 0.9}}, {{creepType = RedVillager, amount = 5, delay = 0.9}, {creepType = BlueVillager, amount = 27, delay = 0.9}}, {{creepType = RedVillager, amount = 15, delay = 0.9}, {creepType = BlueVillager, amount = 15, delay = 0.9}, {creepType = GreenVillager, amount = 4, delay = 0.9}}, {{creepType = RedVillager, amount = 20, delay = 0.9}, {creepType = BlueVillager, amount = 20, delay = 0.9}, {creepType = GreenVillager, amount = 5, delay = 0.9}}, {{creepType = RedVillager, amount = 10, delay = 0.9}, {creepType = BlueVillager, amount = 20, delay = 0.9}, {creepType = GreenVillager, amount = 14, delay = 0.9}}, {{creepType = GreenVillager, amount = 30, delay = 0.9}}, {{creepType = BlueVillager, amount = 102, delay = 0.9}}, {{creepType = RedVillager, amount = 10, delay = 0.9}, {creepType = BlueVillager, amount = 10, delay = 0.9}, {creepType = GreenVillager, amount = 12, delay = 0.9}, {creepType = YellowVillager, amount = 3, delay = 0.9}}, {{creepType = BlueVillager, amount = 15, delay = 0.9}, {creepType = GreenVillager, amount = 10, delay = 0.9}, {creepType = YellowVillager, amount = 5, delay = 0.9}}, {{creepType = BlueVillager, amount = 50, delay = 0.9}, {creepType = GreenVillager, amount = 23, delay = 0.9}}, {{creepType = RedVillager, amount = 49, delay = 0.9}, {creepType = BlueVillager, amount = 15, delay = 0.9}, {creepType = GreenVillager, amount = 10, delay = 0.9}, {creepType = YellowVillager, amount = 9, delay = 0.9}}, {{creepType = RedVillager, amount = 20, delay = 0.9}, {creepType = BlueVillager, amount = 15, delay = 0.9}, {creepType = GreenVillager, amount = 12, delay = 0.9}, {creepType = YellowVillager, amount = 10, delay = 0.9}, {creepType = PinkVillager, amount = 5, delay = 0.9}}, {{creepType = GreenVillager, amount = 40, delay = 0.9}, {creepType = YellowVillager, amount = 8, delay = 0.9}}, {{creepType = YellowVillager, amount = 12, delay = 0.9, modifiers = {regenModifier}}}, {{creepType = GreenVillager, amount = 80, delay = 0.9}}, {{creepType = GreenVillager, amount = 10, delay = 0.9}, {creepType = YellowVillager, amount = 4, delay = 0.9}, {creepType = YellowVillager, amount = 5, delay = 0.9, modifiers = {regenModifier}}, {creepType = PinkVillager, amount = 4, delay = 0.9}}, {{creepType = BlackVillager, amount = 6, delay = 0.9}}, {{creepType = YellowVillager, amount = 40, delay = 0.9}, {creepType = PinkVillager, amount = 14, delay = 0.9}}, {{creepType = WhiteVillager, amount = 16, delay = 0.9}}, {{creepType = BlackVillager, amount = 7, delay = 0.9}, {creepType = WhiteVillager, amount = 7, delay = 0.9}}, {{creepType = BlueVillager, amount = 20, delay = 0.9}, {creepType = GreenVillager, amount = 1, delay = 0.9, modifiers = {invisibilityModifier}}}, {{creepType = YellowVillager, amount = 25, delay = 0.9, modifiers = {regenModifier}}, {creepType = PurpleVillager, amount = 10, delay = 0.9}}, {{creepType = RedVillager, amount = 23, delay = 0.9, modifiers = {regenModifier}}, {creepType = ZebraVillager, amount = 4, delay = 0.9}}, {{creepType = RedVillager, amount = 100, delay = 0.1}, {creepType = BlueVillager, amount = 60, delay = 0.1}, {creepType = GreenVillager, amount = 45, delay = 0.1}, {creepType = YellowVillager, amount = 45, delay = 0.1}}, {{creepType = FortifiedVillager, amount = 6, delay = 0.9}}, {{creepType = YellowVillager, amount = 50, delay = 0.9}, {creepType = YellowVillager, amount = 15, delay = 0.9, modifiers = {regenModifier}}}, {{creepType = FortifiedVillager, amount = 9, delay = 0.9}}, {{creepType = BlackVillager, amount = 8, delay = 0.9}, {creepType = WhiteVillager, amount = 8, delay = 0.9}, {creepType = ZebraVillager, amount = 8, delay = 0.9}, {creepType = ZebraVillager, amount = 2, delay = 0.9, modifiers = {regenModifier}}}, {{creepType = BlackVillager, amount = 15, delay = 0.9}, {creepType = WhiteVillager, amount = 20, delay = 0.9}, {creepType = PurpleVillager, amount = 10, delay = 0.9}}, {{creepType = RedVillager, amount = 20, delay = 0.1, modifiers = {invisibilityModifier}}, {creepType = YellowVillager, amount = 13, delay = 0.6, modifiers = {invisibilityModifier}}}, {{creepType = YellowVillager, amount = 160, delay = 0.05}, {creepType = ZebraVillager, amount = 6, delay = 0.9}}, {{creepType = PinkVillager, amount = 35, delay = 0.4}, {creepType = BlackVillager, amount = 30, delay = 0.4}, {creepType = WhiteVillager, amount = 25, delay = 0.4}, {creepType = RainbowVillager, amount = 6, delay = 0.4}}, {{creepType = PinkVillager, amount = 140, delay = 0.05}, {creepType = GreenVillager, amount = 30, delay = 0.4, modifiers = {regenModifier, invisibilityModifier}}}, {{creepType = BlackVillager, amount = 25, delay = 0.5}, {creepType = WhiteVillager, amount = 25, delay = 0.5}, {creepType = WhiteVillager, amount = 7, delay = 0.5, modifiers = {invisibilityModifier}}, {creepType = ZebraVillager, amount = 10, delay = 0.5}, {creepType = FortifiedVillager, amount = 15, delay = 0.5}}, {{creepType = PinkVillager, amount = 42, delay = 0.1}, {creepType = WhiteVillager, amount = 17, delay = 0.1}, {creepType = ZebraVillager, amount = 10, delay = 0.1}, {creepType = FortifiedVillager, amount = 14, delay = 0.1}, {creepType = LargeVillager, amount = 2, delay = 0.9}}, {{creepType = BlackVillager, amount = 10, delay = 0.1}, {creepType = WhiteVillager, amount = 10, delay = 0.1}, {creepType = ZebraVillager, amount = 20, delay = 0.1}, {creepType = RainbowVillager, amount = 18, delay = 0.1}, {creepType = RainbowVillager, amount = 2, delay = 0.1, modifiers = {regenModifier}}}, {{creepType = Zeppelin, amount = 1, delay = 0.9}}}
function ____exports.getRoundCreeps(currentRound)
    return rounds[math.min(currentRound, #rounds - 1) + 1]
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEngineGlobals"] = function() require("lualib_bundle");
local ____exports = {}
____exports.DamageEngineGlobals = __TS__Class()
local DamageEngineGlobals = ____exports.DamageEngineGlobals
DamageEngineGlobals.name = "DamageEngineGlobals"
function DamageEngineGlobals.prototype.____constructor(self)
    self.DamageEventTrigger = nil
    self.DamageEventOverride = false
    self.NextDamageType = 0
    self.DamageEventType = 0
    self.DamageTypeCode = 0
    self.IsDamageCode = false
    self.IsDamageSpell = false
    self.IsDamageMelee = false
    self.IsDamageRanged = false
    self.DamageEventSourceOwningPlayer = nil
    self.DamageEventTargetOwningPlayer = nil
    self.DamageEventSourceOwningPlayerId = nil
    self.DamageEventTargetOwningPlayerId = nil
    self.DamageEventTargetUnitId = nil
    self.DamageEventSourceUnitTypeId = nil
    self.DamageEventSource = nil
    self.DamageEventTarget = nil
    self.DamageEventAOE = 0
    self.DamageEventAOEGroup = nil
    self.AOEDamageSource = nil
    self.DamageEventLevel = 0
    self.EnhancedDamageTarget = nil
    self.PiercingOverflowAmount = 0
    self.DamageEventAmount = 0
    self.DamageEventPrevAmt = 0
    self.LethalDamageHP = 0
    self.DamageEventArmorPierced = 0
    self.DamageScalingWC3 = 0
    self.DamageScalingUser = 0
    self.DamageEventAttackT = 0
    self.DamageEventDamageT = 0
    self.DamageEventWeaponT = 0
    self.DamageEventArmorT = 0
    self.DamageEventDefenseT = 0
end
return ____exports
 end,
["src.Utility.DamageEngine.GameSettings"] = function() local ____exports = {}
____exports.DamageTypePureExplosive = -2
____exports.DamageTypeExplosive = -1
____exports.DamageTypeCode = 1
____exports.DamageTypePure = 2
____exports.DamageTypeHeal = 3
____exports.DamageTypeBlocked = 4
____exports.DamageTypeReduced = 5
____exports.DamageTypeCriticalStrike = 6
____exports.DamageEventAOE = 1
____exports.DamageEventLevel = 1
____exports.ATTACK_TYPE_SPELLS = 0
____exports.ATTACK_TYPE_NORMAL = 1
____exports.ATTACK_TYPE_PIERCE = 2
____exports.ATTACK_TYPE_SIEGE = 3
____exports.ATTACK_TYPE_MAGIC = 4
____exports.ATTACK_TYPE_CHAOS = 5
____exports.ATTACK_TYPE_HERO = 6
____exports.DAMAGE_TYPE_UNKNOWN = 0
____exports.DAMAGE_TYPE_NORMAL = 4
____exports.DAMAGE_TYPE_ENHANCED = 5
____exports.DAMAGE_TYPE_FIRE = 8
____exports.DAMAGE_TYPE_COLD = 9
____exports.DAMAGE_TYPE_LIGHTNING = 10
____exports.DAMAGE_TYPE_POISON = 11
____exports.DAMAGE_TYPE_DISEASE = 12
____exports.DAMAGE_TYPE_DIVINE = 13
____exports.DAMAGE_TYPE_MAGIC = 14
____exports.DAMAGE_TYPE_SONIC = 15
____exports.DAMAGE_TYPE_ACID = 16
____exports.DAMAGE_TYPE_FORCE = 17
____exports.DAMAGE_TYPE_DEATH = 18
____exports.DAMAGE_TYPE_MIND = 19
____exports.DAMAGE_TYPE_PLANT = 20
____exports.DAMAGE_TYPE_DEFENSIVE = 21
____exports.DAMAGE_TYPE_DEMOLITION = 22
____exports.DAMAGE_TYPE_SLOW_POISON = 23
____exports.DAMAGE_TYPE_SPIRIT_LINK = 24
____exports.DAMAGE_TYPE_SHADOW_STRIKE = 25
____exports.DAMAGE_TYPE_UNIVERSAL = 26
____exports.WEAPON_TYPE_NONE = 0
____exports.WEAPON_TYPE_ML_CHOP = 1
____exports.WEAPON_TYPE_MM_CHOP = 2
____exports.WEAPON_TYPE_MH_CHOP = 3
____exports.WEAPON_TYPE_ML_SLICE = 4
____exports.WEAPON_TYPE_MM_SLICE = 5
____exports.WEAPON_TYPE_MH_SLICE = 6
____exports.WEAPON_TYPE_MM_BASH = 7
____exports.WEAPON_TYPE_MH_BASH = 8
____exports.WEAPON_TYPE_MM_STAB = 9
____exports.WEAPON_TYPE_MH_STAB = 10
____exports.WEAPON_TYPE_WL_SLICE = 11
____exports.WEAPON_TYPE_WM_SLICE = 12
____exports.WEAPON_TYPE_WH_SLICE = 13
____exports.WEAPON_TYPE_WL_BASH = 14
____exports.WEAPON_TYPE_WM_BASH = 15
____exports.WEAPON_TYPE_WH_BASH = 16
____exports.WEAPON_TYPE_WL_STAB = 17
____exports.WEAPON_TYPE_WM_STAB = 18
____exports.WEAPON_TYPE_CL_SLICE = 19
____exports.WEAPON_TYPE_CM_SLICE = 20
____exports.WEAPON_TYPE_CH_SLICE = 21
____exports.WEAPON_TYPE_AM_CHOP = 22
____exports.WEAPON_TYPE_RH_BASH = 23
____exports.AttackTypeDebugStr = {"SPELLS", "NORMAL", "PIERCE", "SIEGE", "MAGIC", "CHAOS", "HERO"}
____exports.DamageTypeDebugStr = {"UNKNOWN", nil, nil, nil, "NORMAL", "ENHANCED", nil, nil, "FIRE", "COLD", "LIGHTNING", "POISON", "DISEASE", "DIVINE", "MAGIC", "SONIC", "ACID", "FORCE", "DEATH", "MIND", "PLANT", "DEFENSIVE", "DEMOLITION", "SLOW_POISON", "SPIRIT_LINK", "SHADOW_STRIKE", "UNIVERSAL"}
____exports.WeaponTypeDebugStr = {"NONE", "METAL_LIGHT_CHOP", "METAL_MEDIUM_CHOP", "METAL_HEAVY_CHOP", "METAL_LIGHT_SLICE", "METAL_MEDIUM_SLICE", "METAL_HEAVY_SLICE", "METAL_MEDIUM_BASH", "METAL_HEAVY_BASH", "METAL_MEDIUM_STAB", "METAL_HEAVY_STAB", "WOOD_LIGHT_SLICE", "WOOD_MEDIUM_SLICE", "WOOD_HEAVY_SLICE", "WOOD_LIGHT_BASH", "WOOD_MEDIUM_BASH", "WOOD_HEAVY_BASH", "WOOD_LIGHT_STAB", "WOOD_MEDIUM_STAB", "CLAW_LIGHT_SLICE", "CLAW_MEDIUM_SLICE", "CLAW_HEAVY_SLICE", "AXE_MEDIUM_CHOP", "ROCK_HEAVY_BASH"}
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvent"] = function() local ____exports = {}
return ____exports
 end,
["src.Utility.DamageEngine.DamageEngine"] = function() require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local settings = require("src.Utility.DamageEngine.GameSettings")
____exports.DamageEngine = __TS__Class()
local DamageEngine = ____exports.DamageEngine
DamageEngine.name = "DamageEngine"
function DamageEngine.prototype.____constructor(self, timerUtils, damageEngineGlobals)
    self.initialDamageEvents = {}
    self.zeroDamageEvents = {}
    self.damageEventAOEEvents = {}
    self.damageEventLethalEvents = {}
    self.initialDamageModificationEvents = {}
    self.multiplicativeDamageModificationEvents = {}
    self.preFinalDamageModificationEvents = {}
    self.finalDamageModificationEvents = {}
    self.afterDamageEvents = {}
    self.alarmSet = false
    self.canKick = true
    self.totem = false
    self.armorType = 0
    self.defenseType = 0
    self.eventsRun = false
    self.kicking = false
    self.eventTrig = 0
    self.dreaming = false
    self.sleepLevel = 0
    self.stack = {}
    self.levelsDeep = {}
    self.trigFrozen = {}
    self.fischerMorrow = {}
    self.inceptionTrig = {}
    self.proclusGlobal = {}
    self.prev = {}
    self.LIMBO = 16
    self.t1 = __TS__New(Trigger)
    self.t2 = __TS__New(Trigger)
    self.timerUtils = timerUtils
    self.damageEngineGlobals = damageEngineGlobals
    self.alarm = self.timerUtils:newTimer()
    self.t1:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGING)
    self.t1:addCondition(
        function() return self:t1Condition() end
    )
    self.t2:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGED)
    self.t2:addCondition(
        function() return self:t2Condition() end
    )
end
function DamageEngine.prototype.addInitialDamageEvent(self, event)
    __TS__ArrayPush(self.initialDamageEvents, event)
end
function DamageEngine.prototype.addZeroDamageEvent(self, event)
    __TS__ArrayPush(self.zeroDamageEvents, event)
end
function DamageEngine.prototype.addInitialDamageModificationEvent(self, event)
    __TS__ArrayPush(self.initialDamageModificationEvents, event)
end
function DamageEngine.prototype.addMultiplicativeDamageModificationEvent(self, event)
    __TS__ArrayPush(self.multiplicativeDamageModificationEvents, event)
end
function DamageEngine.prototype.addPreFinalDamageModificationEvent(self, event)
    __TS__ArrayPush(self.preFinalDamageModificationEvents, event)
end
function DamageEngine.prototype.addLethalDamageEvent(self, event)
    __TS__ArrayPush(self.damageEventLethalEvents, event)
end
function DamageEngine.prototype.addAOEDamageEvent(self, event)
    __TS__ArrayPush(self.damageEventAOEEvents, event)
end
function DamageEngine.prototype.addFinalDamageModificationEvent(self, event)
    __TS__ArrayPush(self.finalDamageModificationEvents, event)
end
function DamageEngine.prototype.addAfterDamageEvent(self, event)
    __TS__ArrayPush(self.afterDamageEvents, event)
end
function DamageEngine.prototype.initialDamageEvent(self)
    __TS__ArrayForEach(
        self.initialDamageEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.zeroDamageEvent(self)
    __TS__ArrayForEach(
        self.zeroDamageEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.damageEventAOE(self)
    __TS__ArrayForEach(
        self.damageEventAOEEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.damageEventLethal(self)
    __TS__ArrayForEach(
        self.damageEventLethalEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.initialDamageModificationEvent(self)
    __TS__ArrayForEach(
        self.initialDamageModificationEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.multiplicativeDamageModificationEvent(self)
    __TS__ArrayForEach(
        self.multiplicativeDamageModificationEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.preFinalDamageModificationEvent(self)
    __TS__ArrayForEach(
        self.preFinalDamageModificationEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.finalDamageModificationEvent(self)
    __TS__ArrayForEach(
        self.finalDamageModificationEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.afterDamageEvent(self)
    __TS__ArrayForEach(
        self.afterDamageEvents,
        function(____, damageEvent) return damageEvent:event(self.damageEngineGlobals) end
    )
end
function DamageEngine.prototype.onAOEEnd(self)
    if self.damageEngineGlobals.DamageEventAOE > 1 then
        self:damageEventAOE()
        self.damageEngineGlobals.DamageEventAOE = 1
    end
    self.damageEngineGlobals.DamageEventLevel = 1
    self.damageEngineGlobals.EnhancedDamageTarget = nil
    self.damageEngineGlobals.AOEDamageSource = nil
    GroupClear(self.damageEngineGlobals.DamageEventAOEGroup)
end
function DamageEngine.prototype.afterDamage(self)
    if (self.damageEngineGlobals.DamageEventPrevAmt ~= 0) and (self.damageEngineGlobals.DamageEventDamageT ~= settings.DAMAGE_TYPE_UNKNOWN) then
        self:afterDamageEvent()
    end
end
function DamageEngine.prototype.finish(self)
    if self.eventsRun then
        self.eventsRun = false
        self:afterDamage()
    end
    if self.canKick and (not self.kicking) then
        local n = #self.stack
        if n > 0 then
            self.kicking = true
            local i = 0
            local open
            repeat
                do
                    self.sleepLevel = self.sleepLevel + 1
                    repeat
                        do
                            open = self.stack[i + 1]
                            self.damageEngineGlobals.NextDamageType = open.type
                            self:UnitDamageTarget(open.source, open.target, open.amount, true, false, open.attack, open.damage, open.weapon)
                            self:afterDamage()
                            i = i + 1
                        end
                    until not (i == n)
                    n = #self.stack
                end
            until not (i == n)
            self.sleepLevel = 0
            repeat
                do
                    i = i - 1
                    open = self.stack[i + 1].trig
                    __TS__ArraySplice(self.stack, i, 1)
                    self.proclusGlobal[open] = nil
                    self.fischerMorrow[open] = nil
                    self.trigFrozen[open] = false
                    self.levelsDeep[open] = 0
                end
            until not (i == 0)
            self.kicking = false
        end
    end
end
function DamageEngine.prototype.UnitDamageTarget(self, src, tgt, amt, a, r, at, dt, wt)
    if self.damageEngineGlobals.NextDamageType == 0 then
        self.damageEngineGlobals.NextDamageType = settings.DamageTypeCode
    end
    local b = false
    if self.dreaming then
        if amt ~= 0 then
            __TS__ArrayPush(self.stack, {type = self.damageEngineGlobals.NextDamageType, source = src, target = tgt, amount = amt, attack = at, damage = dt, weapon = wt, trig = self.eventTrig})
            ____exports.DamageEngine.inception = ____exports.DamageEngine.inception or self.inceptionTrig[self.eventTrig + 1]
            local sg = self.proclusGlobal[self.eventTrig]
            if not sg then
                sg = {}
                self.proclusGlobal[self.eventTrig] = sg
            end
            sg[GetHandleId(self.damageEngineGlobals.DamageEventSource)] = true
            local tg = self.fischerMorrow[self.eventTrig]
            if not tg then
                tg = {}
                self.fischerMorrow[self.eventTrig] = tg
            end
            tg[GetHandleId(self.damageEngineGlobals.DamageEventTarget)] = true
            if (self.kicking and sg[GetHandleId(src)]) and tg[GetHandleId(tgt)] then
                if ____exports.DamageEngine.inception and (not self.trigFrozen[self.eventTrig + 1]) then
                    self.inceptionTrig[self.eventTrig + 1] = true
                    if self.levelsDeep[self.eventTrig + 1] < self.sleepLevel then
                        local ____obj, ____index = self.levelsDeep, self.eventTrig + 1
                        ____obj[____index] = ____obj[____index] + 1
                        if self.levelsDeep[self.eventTrig + 1] >= self.LIMBO then
                            self.trigFrozen[self.eventTrig + 1] = true
                        end
                    end
                else
                    self.trigFrozen[self.eventTrig + 1] = true
                end
            end
        end
    else
        b = self:UnitDamageTarget(src, tgt, amt, a, r, at, dt, wt)
    end
    ____exports.DamageEngine.inception = false
    self.damageEngineGlobals.NextDamageType = 0
    if b and (not self.dreaming) then
        self:finish()
    end
    return b
end
function DamageEngine.prototype.t1Condition(self)
    local src = GetEventDamageSource()
    local tgt = BlzGetEventDamageTarget()
    local amt = GetEventDamage()
    local at = BlzGetEventAttackType()
    local dt = BlzGetEventDamageType()
    local wt = BlzGetEventWeaponType()
    if not self.kicking then
        if self.alarmSet then
            if self.totem then
                if ((dt ~= DAMAGE_TYPE_SPIRIT_LINK) and (dt ~= DAMAGE_TYPE_DEFENSIVE)) and (dt ~= DAMAGE_TYPE_PLANT) then
                    self:failsafeClear()
                else
                    self.totem = false
                    self.canKick = false
                    self.prev.type = self.damageEngineGlobals.DamageEventType
                    self.prev.amount = self.damageEngineGlobals.DamageEventAmount
                    self.prev.preAmt = self.damageEngineGlobals.DamageEventPrevAmt
                    self.prev.pierce = self.damageEngineGlobals.DamageEventArmorPierced
                    self.prev.armor = self.damageEngineGlobals.DamageEventArmorT
                    self.prev.preArm = self.armorType
                    self.prev.defense = self.damageEngineGlobals.DamageEventDefenseT
                    self.prev.preDef = self.defenseType
                    self.prev.code = self.damageEngineGlobals.IsDamageCode
                end
            end
            if src ~= self.damageEngineGlobals.AOEDamageSource then
                self:onAOEEnd()
            elseif tgt == self.damageEngineGlobals.EnhancedDamageTarget then
                local ____obj, ____index = self.damageEngineGlobals, "DamageEventLevel"
                ____obj[____index] = ____obj[____index] + 1
            elseif not IsUnitInGroup(tgt, self.damageEngineGlobals.DamageEventAOEGroup) then
                local ____obj, ____index = self.damageEngineGlobals, "DamageEventAOE"
                ____obj[____index] = ____obj[____index] + 1
            end
        else
            self.alarm:start(
                0,
                false,
                function()
                    self.alarmSet = false
                    self:finish()
                    self:onAOEEnd()
                end
            )
            self.alarmSet = true
            self.damageEngineGlobals.AOEDamageSource = src
            self.damageEngineGlobals.EnhancedDamageTarget = tgt
        end
        GroupAddUnit(self.damageEngineGlobals.DamageEventAOEGroup, tgt)
    end
    self.damageEngineGlobals.DamageEventType = self.damageEngineGlobals.NextDamageType
    self.damageEngineGlobals.IsDamageCode = self.damageEngineGlobals.NextDamageType ~= 0
    self.damageEngineGlobals.DamageEventOverride = dt == nil
    self.damageEngineGlobals.DamageEventPrevAmt = amt
    self.damageEngineGlobals.DamageEventSource = src
    self.damageEngineGlobals.DamageEventSourceOwningPlayer = GetOwningPlayer(self.damageEngineGlobals.DamageEventSource)
    self.damageEngineGlobals.DamageEventSourceOwningPlayerId = GetPlayerId(self.damageEngineGlobals.DamageEventSourceOwningPlayer)
    self.damageEngineGlobals.DamageEventTarget = tgt
    self.damageEngineGlobals.DamageEventTargetOwningPlayer = GetOwningPlayer(self.damageEngineGlobals.DamageEventTarget)
    self.damageEngineGlobals.DamageEventTargetOwningPlayerId = GetPlayerId(self.damageEngineGlobals.DamageEventTargetOwningPlayer)
    self.damageEngineGlobals.DamageEventTargetUnitId = GetHandleId(self.damageEngineGlobals.DamageEventTarget)
    self.damageEngineGlobals.DamageEventSourceUnitTypeId = GetUnitTypeId(self.damageEngineGlobals.DamageEventSource)
    self.damageEngineGlobals.DamageEventAmount = amt
    self.damageEngineGlobals.PiercingOverflowAmount = 0
    self.damageEngineGlobals.DamageEventAttackT = GetHandleId(at)
    self.damageEngineGlobals.DamageEventDamageT = GetHandleId(dt)
    self.damageEngineGlobals.DamageEventWeaponT = GetHandleId(wt)
    self:calibrateMR()
    self.damageEngineGlobals.DamageEventArmorT = BlzGetUnitIntegerField(self.damageEngineGlobals.DamageEventTarget, UNIT_IF_ARMOR_TYPE)
    self.damageEngineGlobals.DamageEventDefenseT = BlzGetUnitIntegerField(self.damageEngineGlobals.DamageEventTarget, UNIT_IF_DEFENSE_TYPE)
    self.armorType = self.damageEngineGlobals.DamageEventArmorT
    self.defenseType = self.damageEngineGlobals.DamageEventDefenseT
    self.damageEngineGlobals.DamageEventArmorPierced = 0
    self.damageEngineGlobals.DamageScalingUser = 1
    self.damageEngineGlobals.DamageScalingWC3 = 1
    if amt ~= 0 then
        if not self.damageEngineGlobals.DamageEventOverride then
            self:initialDamageModificationEvent()
            self:multiplicativeDamageModificationEvent()
            self:preFinalDamageModificationEvent()
            BlzSetEventAttackType(
                ConvertAttackType(self.damageEngineGlobals.DamageEventAttackT)
            )
            BlzSetEventDamageType(
                ConvertDamageType(self.damageEngineGlobals.DamageEventDamageT)
            )
            BlzSetEventWeaponType(
                ConvertWeaponType(self.damageEngineGlobals.DamageEventWeaponT)
            )
            if self.damageEngineGlobals.DamageEventArmorPierced ~= 0 then
                BlzSetUnitArmor(
                    self.damageEngineGlobals.DamageEventTarget,
                    BlzGetUnitArmor(self.damageEngineGlobals.DamageEventTarget) - self.damageEngineGlobals.DamageEventArmorPierced
                )
            end
            if self.armorType ~= self.damageEngineGlobals.DamageEventArmorT then
                BlzSetUnitIntegerField(self.damageEngineGlobals.DamageEventTarget, UNIT_IF_ARMOR_TYPE, self.damageEngineGlobals.DamageEventArmorT)
            end
            if self.defenseType ~= self.damageEngineGlobals.DamageEventDefenseT then
                BlzSetUnitIntegerField(self.damageEngineGlobals.DamageEventTarget, UNIT_IF_DEFENSE_TYPE, self.damageEngineGlobals.DamageEventDefenseT)
            end
            BlzSetEventDamage(self.damageEngineGlobals.DamageEventAmount)
        end
        self.totem = true
    else
        self:zeroDamageEvent()
        self.canKick = true
        self:finish()
    end
    return false
end
function DamageEngine.prototype.t2Condition(self)
    if self.damageEngineGlobals.DamageEventPrevAmt == 0 then
        return false
    end
    if self.totem then
        self.totem = false
    else
        self:afterDamage()
        self.canKick = true
        self.damageEngineGlobals.DamageEventSource = GetEventDamageSource()
        self.damageEngineGlobals.DamageEventSourceOwningPlayer = GetOwningPlayer(self.damageEngineGlobals.DamageEventSource)
        self.damageEngineGlobals.DamageEventSourceOwningPlayerId = GetPlayerId(self.damageEngineGlobals.DamageEventSourceOwningPlayer)
        self.damageEngineGlobals.DamageEventTarget = GetTriggerUnit()
        self.damageEngineGlobals.DamageEventTargetOwningPlayer = GetOwningPlayer(self.damageEngineGlobals.DamageEventTarget)
        self.damageEngineGlobals.DamageEventTargetOwningPlayerId = GetPlayerId(self.damageEngineGlobals.DamageEventTargetOwningPlayer)
        self.damageEngineGlobals.DamageEventTargetUnitId = GetHandleId(self.damageEngineGlobals.DamageEventTarget)
        self.damageEngineGlobals.DamageEventSourceUnitTypeId = GetUnitTypeId(self.damageEngineGlobals.DamageEventSource)
        self.damageEngineGlobals.DamageEventAmount = self.prev.amount
        self.damageEngineGlobals.PiercingOverflowAmount = 0
        self.damageEngineGlobals.DamageEventPrevAmt = self.prev.preAmt
        self.damageEngineGlobals.DamageEventAttackT = GetHandleId(
            BlzGetEventAttackType()
        )
        self.damageEngineGlobals.DamageEventDamageT = GetHandleId(
            BlzGetEventDamageType()
        )
        self.damageEngineGlobals.DamageEventWeaponT = GetHandleId(
            BlzGetEventWeaponType()
        )
        self.damageEngineGlobals.DamageEventType = self.prev.type
        self.damageEngineGlobals.IsDamageCode = self.prev.code
        self.damageEngineGlobals.DamageEventArmorT = self.prev.armor
        self.damageEngineGlobals.DamageEventDefenseT = self.prev.defense
        self.damageEngineGlobals.DamageEventArmorPierced = self.prev.pierce
        self.armorType = self.prev.preArm
        self.defenseType = self.prev.preDef
        self:calibrateMR()
    end
    self:resetArmor()
    local r = GetEventDamage()
    if (self.damageEngineGlobals.DamageEventAmount ~= 0) and (r ~= 0) then
        self.damageEngineGlobals.DamageScalingWC3 = r / self.damageEngineGlobals.DamageEventAmount
    else
        if self.damageEngineGlobals.DamageEventAmount > 0 then
            self.damageEngineGlobals.DamageScalingWC3 = 0
        else
            self.damageEngineGlobals.DamageScalingWC3 = 1
        end
        self.damageEngineGlobals.DamageScalingUser = self.damageEngineGlobals.DamageEventAmount / self.damageEngineGlobals.DamageEventPrevAmt
    end
    self.damageEngineGlobals.DamageEventAmount = self.damageEngineGlobals.DamageEventAmount * self.damageEngineGlobals.DamageScalingWC3
    if self.damageEngineGlobals.DamageEventAmount > 0 then
        self:finalDamageModificationEvent()
        self.damageEngineGlobals.LethalDamageHP = GetWidgetLife(self.damageEngineGlobals.DamageEventTarget) - self.damageEngineGlobals.DamageEventAmount
        if self.damageEngineGlobals.LethalDamageHP <= 0.405 then
            self.damageEngineGlobals.DamageEventAmount = GetWidgetLife(self.damageEngineGlobals.DamageEventTarget) - self.damageEngineGlobals.LethalDamageHP
            if (self.damageEngineGlobals.DamageEventType < 0) and (self.damageEngineGlobals.LethalDamageHP <= 0.405) then
                SetUnitExploded(self.damageEngineGlobals.DamageEventTarget, true)
            end
            self:damageEventLethal()
        end
        self.damageEngineGlobals.DamageScalingUser = (self.damageEngineGlobals.DamageEventAmount / self.damageEngineGlobals.DamageEventPrevAmt) / self.damageEngineGlobals.DamageScalingWC3
    end
    BlzSetEventDamage(self.damageEngineGlobals.DamageEventAmount)
    if self.damageEngineGlobals.DamageEventDamageT ~= settings.DAMAGE_TYPE_UNKNOWN then
        self:initialDamageEvent()
    end
    self.eventsRun = true
    if self.damageEngineGlobals.DamageEventAmount == 0 then
        self:finish()
    end
    return false
end
function DamageEngine.prototype.resetArmor(self)
    if self.damageEngineGlobals.DamageEventArmorPierced ~= 0 then
        BlzSetUnitArmor(
            self.damageEngineGlobals.DamageEventTarget,
            BlzGetUnitArmor(self.damageEngineGlobals.DamageEventTarget) + self.damageEngineGlobals.DamageEventArmorPierced
        )
    end
    if self.armorType ~= self.damageEngineGlobals.DamageEventArmorT then
        BlzSetUnitIntegerField(self.damageEngineGlobals.DamageEventTarget, UNIT_IF_ARMOR_TYPE, self.armorType)
    end
    if self.defenseType ~= self.damageEngineGlobals.DamageEventDefenseT then
        BlzSetUnitIntegerField(self.damageEngineGlobals.DamageEventTarget, UNIT_IF_DEFENSE_TYPE, self.defenseType)
    end
end
function DamageEngine.prototype.failsafeClear(self)
    self:resetArmor()
    self.canKick = true
    self.totem = false
    self.damageEngineGlobals.DamageEventAmount = 0
    self.damageEngineGlobals.DamageScalingWC3 = 0
    if self.damageEngineGlobals.DamageEventDamageT ~= settings.DAMAGE_TYPE_UNKNOWN then
        self:initialDamageEvent()
        self.eventsRun = true
    end
    self:finish()
end
function DamageEngine.prototype.calibrateMR(self)
    self.damageEngineGlobals.IsDamageMelee = false
    self.damageEngineGlobals.IsDamageRanged = false
    self.damageEngineGlobals.IsDamageSpell = self.damageEngineGlobals.DamageEventAttackT == 0
    if (self.damageEngineGlobals.DamageEventDamageT == settings.DAMAGE_TYPE_NORMAL) and (not self.damageEngineGlobals.IsDamageSpell) then
        self.damageEngineGlobals.IsDamageMelee = IsUnitType(self.damageEngineGlobals.DamageEventSource, UNIT_TYPE_MELEE_ATTACKER)
        self.damageEngineGlobals.IsDamageRanged = IsUnitType(self.damageEngineGlobals.DamageEventSource, UNIT_TYPE_RANGED_ATTACKER)
        if self.damageEngineGlobals.IsDamageMelee and self.damageEngineGlobals.IsDamageRanged then
            self.damageEngineGlobals.IsDamageMelee = self.damageEngineGlobals.DamageEventWeaponT > 0
            self.damageEngineGlobals.IsDamageRanged = not self.damageEngineGlobals.IsDamageMelee
        end
    end
end
DamageEngine.inception = false
return ____exports
 end,
["src.Game.Checkpoint"] = function() local ____exports = {}
return ____exports
 end,
["src.Creeps.SpawnedCreep"] = function() require("lualib_bundle");
local ____exports = {}
____exports.SpawnedCreep = __TS__Class()
local SpawnedCreep = ____exports.SpawnedCreep
SpawnedCreep.name = "SpawnedCreep"
function SpawnedCreep.prototype.____constructor(self, creep, currentCheckpoint, currentCheckpointIndex)
    self.creep = creep
    self.currentCheckpoint = currentCheckpoint
    self.currentCheckpointIndex = currentCheckpointIndex
end
return ____exports
 end,
["src.Game.RoundCreepController"] = function() require("lualib_bundle");
local ____exports = {}
____exports.RoundCreepController = __TS__Class()
local RoundCreepController = ____exports.RoundCreepController
RoundCreepController.name = "RoundCreepController"
function RoundCreepController.prototype.____constructor(self)
    self.creepMap = __TS__New(Map)
end
function RoundCreepController.prototype.set(self, unitId, creep)
    self.creepMap:set(unitId, creep)
end
function RoundCreepController.prototype.delete(self, unitId)
    return self.creepMap:delete(unitId)
end
function RoundCreepController.prototype.get(self, unitId)
    return self.creepMap:get(unitId)
end
function RoundCreepController.prototype.clear(self)
    self.creepMap:clear()
end
return ____exports
 end,
["src.Utility.StunnedUnit"] = function() require("lualib_bundle");
local ____exports = {}
____exports.StunnedUnit = __TS__Class()
local StunnedUnit = ____exports.StunnedUnit
StunnedUnit.name = "StunnedUnit"
function StunnedUnit.prototype.____constructor(self, unit, duration)
    self.unit = unit
    self.duration = duration
end
function StunnedUnit.prototype.getUnit(self)
    return self.unit
end
function StunnedUnit.prototype.addDuration(self, duration)
    self.duration = self.duration + duration
end
function StunnedUnit.prototype.getDuration(self)
    return self.duration
end
function StunnedUnit.prototype.setDuration(self, duration)
    self.duration = duration
end
return ____exports
 end,
["src.Utility.FrozenUnit"] = function() require("lualib_bundle");
local ____exports = {}
____exports.FrozenUnit = __TS__Class()
local FrozenUnit = ____exports.FrozenUnit
FrozenUnit.name = "FrozenUnit"
function FrozenUnit.prototype.____constructor(self, unit, duration, permafrost)
    self.permafrost = permafrost
    self.unit = unit
    self.duration = duration
end
function FrozenUnit.prototype.getUnit(self)
    return self.unit
end
function FrozenUnit.prototype.addDuration(self, duration)
    self.duration = self.duration + duration
end
function FrozenUnit.prototype.getDuration(self)
    return self.duration
end
function FrozenUnit.prototype.setDuration(self, duration)
    self.duration = duration
end
return ____exports
 end,
["src.Utility.StunUtils"] = function() require("lualib_bundle");
local ____exports = {}
local ____StunnedUnit = require("src.Utility.StunnedUnit")
local StunnedUnit = ____StunnedUnit.StunnedUnit
local ____FrozenUnit = require("src.Utility.FrozenUnit")
local FrozenUnit = ____FrozenUnit.FrozenUnit
local dummyUnitTypeId = FourCC("u007")
local timedLifeBuffId = FourCC("BTLF")
local permafrostAbilityId = FourCC("A00A")
____exports.StunUtils = __TS__Class()
local StunUtils = ____exports.StunUtils
StunUtils.name = "StunUtils"
function StunUtils.prototype.____constructor(self, timerUtils)
    self.stunAbilityId = FourCC("A003")
    self.freezeAbilityId = FourCC("A009")
    self.timerUtils = timerUtils
    self.stunnedUnits = __TS__New(Map)
    self.frozenUnits = __TS__New(Map)
end
function StunUtils.prototype.stunUnit(self, u, duration)
    local handleId = GetHandleIdBJ(u)
    if self.frozenUnits:has(handleId) then
        return
    elseif self.stunnedUnits:has(handleId) then
        self.stunnedUnits:get(handleId):addDuration(duration)
    else
        local stunnedUnit = __TS__New(StunnedUnit, u, duration)
        self.stunnedUnits:set(handleId, stunnedUnit)
        UnitAddAbility(
            stunnedUnit:getUnit(),
            self.stunAbilityId
        )
        BlzPauseUnitEx(
            stunnedUnit:getUnit(),
            true
        )
        local t = self.timerUtils:newTimer()
        t:start(
            0.05,
            true,
            function()
                stunnedUnit:addDuration(-0.05)
                if stunnedUnit:getDuration() <= 0 then
                    UnitRemoveAbility(
                        stunnedUnit:getUnit(),
                        self.stunAbilityId
                    )
                    if not self.frozenUnits:has(handleId) then
                        BlzPauseUnitEx(
                            stunnedUnit:getUnit(),
                            false
                        )
                    end
                    self.stunnedUnits:delete(handleId)
                    self.timerUtils:releaseTimer(t)
                end
            end
        )
    end
end
function StunUtils.prototype.freezeUnit(self, u, duration, permafrost, refreeze)
    local handleId = GetHandleIdBJ(u)
    if self.frozenUnits:has(handleId) then
        if refreeze then
            local frozenUnit = __TS__New(FrozenUnit, u, duration, permafrost)
            if frozenUnit:getDuration() < duration then
                frozenUnit:setDuration(duration)
            end
        end
        return
    end
    if self.stunnedUnits:has(handleId) then
        self.stunnedUnits:get(handleId):setDuration(0)
    end
    local frozenUnit = __TS__New(FrozenUnit, u, duration, permafrost)
    self.frozenUnits:set(handleId, frozenUnit)
    UnitAddAbility(
        frozenUnit:getUnit(),
        self.freezeAbilityId
    )
    BlzPauseUnitEx(
        frozenUnit:getUnit(),
        true
    )
    local t = self.timerUtils:newTimer()
    t:start(
        0.05,
        true,
        function()
            frozenUnit:addDuration(-0.05)
            if frozenUnit:getDuration() <= 0 then
                if frozenUnit.permafrost then
                    local dummy = CreateUnit(
                        Player(0),
                        dummyUnitTypeId,
                        GetUnitX(
                            frozenUnit:getUnit()
                        ),
                        GetUnitY(
                            frozenUnit:getUnit()
                        ),
                        bj_UNIT_FACING
                    )
                    UnitAddAbilityBJ(permafrostAbilityId, dummy)
                    UnitApplyTimedLifeBJ(1, timedLifeBuffId, dummy)
                    IssueTargetOrder(
                        dummy,
                        "slow",
                        frozenUnit:getUnit()
                    )
                end
                UnitRemoveAbility(
                    frozenUnit:getUnit(),
                    self.freezeAbilityId
                )
                BlzPauseUnitEx(
                    frozenUnit:getUnit(),
                    false
                )
                self.frozenUnits:delete(handleId)
                self.timerUtils:releaseTimer(t)
            end
        end
    )
end
function StunUtils.prototype.clearAllStuns(self)
    self.stunnedUnits:forEach(
        function(____, stunnedUnit) return stunnedUnit:setDuration(0) end
    )
end
return ____exports
 end,
["src.JassOverrides.Group"] = function() require("lualib_bundle");
local ____exports = {}
____exports.Group = __TS__Class()
local Group = ____exports.Group
Group.name = "Group"
function Group.prototype.____constructor(self, grp)
    self.grp = grp
end
Group.prototype["for"] = function(self, exp)
    local u = FirstOfGroup(self.grp)
    while u do
        exp(u)
        GroupRemoveUnit(self.grp, u)
        u = FirstOfGroup(self.grp)
    end
end
function Group.prototype.destroy(self)
    DestroyGroup(self.grp)
end
return ____exports
 end,
["src.JassOverrides.GroupInRange"] = function() require("lualib_bundle");
local ____exports = {}
local ____Group = require("src.JassOverrides.Group")
local Group = ____Group.Group
____exports.GroupInRange = __TS__Class()
local GroupInRange = ____exports.GroupInRange
GroupInRange.name = "GroupInRange"
__TS__ClassExtends(GroupInRange, Group)
function GroupInRange.prototype.____constructor(self, radius, loc)
    Group.prototype.____constructor(
        self,
        GetUnitsInRangeOfLocAll(radius, loc)
    )
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.SeaGiantDamageEvent"] = function() require("lualib_bundle");
local ____exports = {}
local ____GroupInRange = require("src.JassOverrides.GroupInRange")
local GroupInRange = ____GroupInRange.GroupInRange
local ____GameSettings = require("src.Utility.DamageEngine.GameSettings")
local ATTACK_TYPE_SIEGE = ____GameSettings.ATTACK_TYPE_SIEGE
local seaGiantUnitTypeId = FourCC("h004")
local clusterBombsAbilityId = FourCC("A005")
____exports.SeaGiantDamageEvent = __TS__Class()
local SeaGiantDamageEvent = ____exports.SeaGiantDamageEvent
SeaGiantDamageEvent.name = "SeaGiantDamageEvent"
function SeaGiantDamageEvent.prototype.____constructor(self, timerUtils)
    self.timerUtils = timerUtils
end
function SeaGiantDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    if globals.DamageEventSourceUnitTypeId ~= seaGiantUnitTypeId then
        return
    end
    if globals.DamageEventAttackT ~= ATTACK_TYPE_SIEGE then
        return
    end
    local trig = globals.DamageEventSource
    local clusterBombsLevel = GetUnitAbilityLevel(trig, clusterBombsAbilityId)
    local x = GetUnitX(globals.DamageEventTarget)
    local y = GetUnitY(globals.DamageEventTarget)
    local userData = (GetUnitUserData(globals.DamageEventSource) + 1) % 2
    SetUnitUserData(globals.DamageEventSource, userData)
    local explosiveDamage = 1
    if clusterBombsLevel == 3 then
        explosiveDamage = explosiveDamage + 4
    end
    local ticks = 21
    local t = self.timerUtils:newTimer()
    t:start(
        0.1,
        true,
        function()
            ticks = ticks - 1
            if ticks > 12 then
                local loc = Location(
                    x + (150 * CosBJ(45 * ticks)),
                    y + (150 * SinBJ(45 * ticks))
                )
                DestroyEffect(
                    AddSpecialEffectLoc("Objects\\Spawnmodels\\Human\\FragmentationShards\\FragBoomSpawn.mdl", loc)
                )
                local grp = __TS__New(GroupInRange, 150, loc)
                grp["for"](
                    grp,
                    function(u)
                        if GetPlayerId(
                            GetOwningPlayer(u)
                        ) ~= 23 then
                            return
                        end
                        UnitDamageTargetBJ(trig, u, explosiveDamage, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL)
                    end
                )
                grp:destroy()
                RemoveLocation(loc)
            elseif (clusterBombsLevel == 1) or ((clusterBombsLevel == 2) and (userData < 1)) then
                self.timerUtils:releaseTimer(t)
            elseif ticks > 7 then
            else
                local loc = Location(
                    x + (200 * CosBJ(45 * ticks)),
                    y + (200 * SinBJ(45 * ticks))
                )
                DestroyEffect(
                    AddSpecialEffectLoc("Abilities\\Weapons\\CannonTowerMissile\\CannonTowerMissile.mdl", loc)
                )
                local grp = __TS__New(GroupInRange, 340, loc)
                grp["for"](
                    grp,
                    function(u)
                        if GetPlayerId(
                            GetOwningPlayer(u)
                        ) ~= 23 then
                            return
                        end
                        UnitDamageTargetBJ(trig, u, explosiveDamage, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL)
                    end
                )
                grp:destroy()
                RemoveLocation(loc)
            end
            if ticks <= 0 then
                self.timerUtils:releaseTimer(t)
            end
        end
    )
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.SkeletalOrcDamageEvent"] = function() require("lualib_bundle");
local ____exports = {}
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local skeletalOrcUnitTypeId = FourCC("h006")
local skeletalHammerAbilityId = FourCC("A004")
____exports.SkeletalOrcDamageEvent = __TS__Class()
local SkeletalOrcDamageEvent = ____exports.SkeletalOrcDamageEvent
SkeletalOrcDamageEvent.name = "SkeletalOrcDamageEvent"
function SkeletalOrcDamageEvent.prototype.____constructor(self, stunUtils, roundCreepController)
    self.stunUtils = stunUtils
    self.roundCreepController = roundCreepController
end
function SkeletalOrcDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    if globals.DamageEventSourceUnitTypeId ~= skeletalOrcUnitTypeId then
        return
    end
    if globals.DamageEventAmount < 1 then
        return
    end
    local skeletalHammerAbilityLevel = GetUnitAbilityLevel(globals.DamageEventSource, skeletalHammerAbilityId)
    local stunDuration = 2
    if skeletalHammerAbilityLevel == 1 then
        stunDuration = 1
        local spawnedCreep = self.roundCreepController:get(globals.DamageEventTargetUnitId)
        local ____switch8 = spawnedCreep.creep.creepType
        if ____switch8 == CreepType.ZEPPELIN then
            goto ____switch8_case_0
        end
        goto ____switch8_end
        ::____switch8_case_0::
        do
            return
        end
        ::____switch8_end::
    end
    self.stunUtils:stunUnit(globals.DamageEventTarget, stunDuration)
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.VillagerLethalDamageEvent"] = function() require("lualib_bundle");
local ____exports = {}
local ____SpawnedCreep = require("src.Creeps.SpawnedCreep")
local SpawnedCreep = ____SpawnedCreep.SpawnedCreep
____exports.VillagerLethalDamageEvent = __TS__Class()
local VillagerLethalDamageEvent = ____exports.VillagerLethalDamageEvent
VillagerLethalDamageEvent.name = "VillagerLethalDamageEvent"
function VillagerLethalDamageEvent.prototype.____constructor(self, roundCreepController)
    self.roundCreepController = roundCreepController
end
function VillagerLethalDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    local x = GetUnitX(globals.DamageEventTarget)
    local y = GetUnitY(globals.DamageEventTarget)
    local face = GetUnitFacing(globals.DamageEventTarget)
    local spawnedCreep = self.roundCreepController:get(globals.DamageEventTargetUnitId)
    local ____ = spawnedCreep.creep:dealLethalDamage(
        math.floor(
            math.abs(globals.LethalDamageHP)
        )
    )
    local spawnedCreeps = ____.spawnedCreeps
    local overflowingDamage = ____.overflowingDamage
    local i = 0
    if (#spawnedCreeps > 0) and (spawnedCreep.creep.unitTypeId == spawnedCreeps[1].unitTypeId) then
        i = i + 1
        globals.DamageEventAmount = overflowingDamage
        spawnedCreep.creep = spawnedCreeps[1]
        spawnedCreeps[1]:apply(globals.DamageEventTarget)
    end
    do
        while i < #spawnedCreeps do
            local newCreep = CreateUnit(
                Player(23),
                spawnedCreeps[i + 1].unitTypeId,
                x,
                y,
                face
            )
            local newSpawnedCreep = __TS__New(SpawnedCreep, spawnedCreeps[i + 1], spawnedCreep.currentCheckpoint, spawnedCreep.currentCheckpointIndex)
            self.roundCreepController:set(
                GetHandleId(newCreep),
                newSpawnedCreep
            )
            spawnedCreeps[i + 1]:apply(newCreep)
            IssuePointOrder(newCreep, "move", newSpawnedCreep.currentCheckpoint.x, newSpawnedCreep.currentCheckpoint.y)
            i = i + 1
        end
    end
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.WendigoDamageEvent"] = function() require("lualib_bundle");
local ____exports = {}
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local wendigoUnitTypeId = FourCC("h005")
____exports.WendigoDamageEvent = __TS__Class()
local WendigoDamageEvent = ____exports.WendigoDamageEvent
WendigoDamageEvent.name = "WendigoDamageEvent"
function WendigoDamageEvent.prototype.____constructor(self, roundCreepController)
    self.roundCreepController = roundCreepController
end
function WendigoDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    if globals.DamageEventSourceUnitTypeId ~= wendigoUnitTypeId then
        return
    end
    local spawnedCreep = self.roundCreepController:get(globals.DamageEventTargetUnitId)
    local ____switch6 = spawnedCreep.creep.creepType
    if ____switch6 == CreepType.LARGE then
        goto ____switch6_case_0
    elseif ____switch6 == CreepType.ZEPPELIN then
        goto ____switch6_case_1
    end
    goto ____switch6_end
    ::____switch6_case_0::
    do
        globals.DamageEventAmount = globals.DamageEventAmount + 2
        goto ____switch6_end
    end
    ::____switch6_case_1::
    do
        globals.DamageEventAmount = globals.DamageEventAmount + 19
        goto ____switch6_end
    end
    ::____switch6_end::
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEventController"] = function() require("lualib_bundle");
local ____exports = {}
local ____SeaGiantDamageEvent = require("src.Utility.DamageEngine.DamageEvents.SeaGiantDamageEvent")
local SeaGiantDamageEvent = ____SeaGiantDamageEvent.SeaGiantDamageEvent
local ____SkeletalOrcDamageEvent = require("src.Utility.DamageEngine.DamageEvents.SkeletalOrcDamageEvent")
local SkeletalOrcDamageEvent = ____SkeletalOrcDamageEvent.SkeletalOrcDamageEvent
local ____VillagerLethalDamageEvent = require("src.Utility.DamageEngine.DamageEvents.VillagerLethalDamageEvent")
local VillagerLethalDamageEvent = ____VillagerLethalDamageEvent.VillagerLethalDamageEvent
local ____WendigoDamageEvent = require("src.Utility.DamageEngine.DamageEvents.WendigoDamageEvent")
local WendigoDamageEvent = ____WendigoDamageEvent.WendigoDamageEvent
____exports.DamageEventController = __TS__Class()
local DamageEventController = ____exports.DamageEventController
DamageEventController.name = "DamageEventController"
function DamageEventController.prototype.____constructor(self, damageEngine, roundCreepController, timerUtils, stunUtils)
    damageEngine:addInitialDamageModificationEvent(
        __TS__New(WendigoDamageEvent, roundCreepController)
    )
    damageEngine:addInitialDamageModificationEvent(
        __TS__New(SeaGiantDamageEvent, timerUtils)
    )
    damageEngine:addAfterDamageEvent(
        __TS__New(SkeletalOrcDamageEvent, stunUtils, roundCreepController)
    )
    damageEngine:addLethalDamageEvent(
        __TS__New(VillagerLethalDamageEvent, roundCreepController)
    )
end
return ____exports
 end,
["src.Towers.TowerUpgrade"] = function() require("lualib_bundle");
local ____exports = {}
____exports.TowerUpgrade = __TS__Class()
local TowerUpgrade = ____exports.TowerUpgrade
TowerUpgrade.name = "TowerUpgrade"
function TowerUpgrade.prototype.____constructor(self)
    self.newUnitTypeId = nil
end
return ____exports
 end,
["src.Towers.TowerType"] = function() require("lualib_bundle");
local ____exports = {}
____exports.TowerType = __TS__Class()
local TowerType = ____exports.TowerType
TowerType.name = "TowerType"
function TowerType.prototype.____constructor(self)
end
function TowerType.prototype.initializeCustomData(self)
    return
end
function TowerType.prototype.applyInitialUnitValues(self, _unit)
    return
end
return ____exports
 end,
["src.Towers.Tower"] = function() require("lualib_bundle");
local ____exports = {}
____exports.Tower = __TS__Class()
local Tower = ____exports.Tower
Tower.name = "Tower"
function Tower.prototype.____constructor(self, unit, towerType, pathUpgrades)
    if pathUpgrades == nil then
        pathUpgrades = {0, 0, 0}
    end
    self.unit = unit
    self.towerType = towerType
    self.pathUpgrades = pathUpgrades
    self.customData = self.towerType:initializeCustomData()
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.EvenFasterSpread"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.EvenFasterSpread = __TS__Class()
local EvenFasterSpread = ____exports.EvenFasterSpread
EvenFasterSpread.name = "EvenFasterSpread"
__TS__ClassExtends(EvenFasterSpread, TowerUpgrade)
function EvenFasterSpread.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Even Faster Spread"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 325
    self.description = "TODO: Write description"
end
function EvenFasterSpread.prototype.applyUpgrade(self, tower)
    local abil = BlzGetUnitAbility(tower.unit, tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.6
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.FasterSpread"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.FasterSpread = __TS__Class()
local FasterSpread = ____exports.FasterSpread
FasterSpread.name = "FasterSpread"
__TS__ClassExtends(FasterSpread, TowerUpgrade)
function FasterSpread.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Faster Spread"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNPlagueCloud.blp"
    self.cost = 160
    self.description = "TODO: Write description"
end
function FasterSpread.prototype.applyUpgrade(self, tower)
    local abil = BlzGetUnitAbility(tower.unit, tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.GreaterPermanentImmolation"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.GreaterPermanentImmolation = __TS__Class()
local GreaterPermanentImmolation = ____exports.GreaterPermanentImmolation
GreaterPermanentImmolation.name = "GreaterPermanentImmolation"
__TS__ClassExtends(GreaterPermanentImmolation, TowerUpgrade)
function GreaterPermanentImmolation.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Greater Permanent Immolation"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp"
    self.cost = 3780
    self.description = "TODO: Write description"
end
function GreaterPermanentImmolation.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "damageAmount"
    ____obj[____index] = ____obj[____index] + 1
    local ____obj, ____index = tower.customData, "maxUnitCount"
    ____obj[____index] = ____obj[____index] + 7
    tower.customData.hasGreaterPermanentImmolation = true
    local abil = BlzGetUnitAbility(tower.unit, tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.74604
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.Inferno"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.Inferno = __TS__Class()
local Inferno = ____exports.Inferno
Inferno.name = "Inferno"
__TS__ClassExtends(Inferno, TowerUpgrade)
function Inferno.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Inferno"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNInfernal.blp"
    self.cost = 49140
    self.description = "TODO: Write description"
end
function Inferno.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "range"
    ____obj[____index] = ____obj[____index] + 120
    local ____obj, ____index = tower.customData, "damageAmount"
    ____obj[____index] = ____obj[____index] + 1
    local abil = BlzGetUnitAbility(tower.unit, tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.2128
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.PermanentImmolation"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local diseaseCloudAbilityId = FourCC("A006")
local permanentImmolationAbilityId = FourCC("A007")
____exports.PermanentImmolation = __TS__Class()
local PermanentImmolation = ____exports.PermanentImmolation
PermanentImmolation.name = "PermanentImmolation"
__TS__ClassExtends(PermanentImmolation, TowerUpgrade)
function PermanentImmolation.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Permanent Immolation"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNDeathPact.blp"
    self.cost = 650
    self.description = "TODO: Write description"
end
function PermanentImmolation.prototype.applyUpgrade(self, tower)
    UnitRemoveAbility(tower.unit, diseaseCloudAbilityId)
    UnitAddAbility(tower.unit, permanentImmolationAbilityId)
    local ____obj, ____index = tower.customData, "damageAmount"
    ____obj[____index] = ____obj[____index] + 1
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path2.EvenLongerRange"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.EvenLongerRange = __TS__Class()
local EvenLongerRange = ____exports.EvenLongerRange
EvenLongerRange.name = "EvenLongerRange"
__TS__ClassExtends(EvenLongerRange, TowerUpgrade)
function EvenLongerRange.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Even Longer Range"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp"
    self.cost = 245
    self.description = "TODO: Write description"
end
function EvenLongerRange.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "range"
    ____obj[____index] = ____obj[____index] + 40
    local ____obj, ____index = tower.customData, "maxUnitCount"
    ____obj[____index] = ____obj[____index] + 1
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path2.LongerRange"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.LongerRange = __TS__Class()
local LongerRange = ____exports.LongerRange
LongerRange.name = "LongerRange"
__TS__ClassExtends(LongerRange, TowerUpgrade)
function LongerRange.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Longer Range"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNBansheeAdept.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function LongerRange.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "range"
    ____obj[____index] = ____obj[____index] + 40
    local ____obj, ____index = tower.customData, "greaterPermanentImmolationAdditionalUnitCount"
    ____obj[____index] = ____obj[____index] + 3
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.MaximizeEffectiveness"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.MaximizeEffectiveness = __TS__Class()
local MaximizeEffectiveness = ____exports.MaximizeEffectiveness
MaximizeEffectiveness.name = "MaximizeEffectiveness"
__TS__ClassExtends(MaximizeEffectiveness, TowerUpgrade)
function MaximizeEffectiveness.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Maximize Effectiveness"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNAdvancedUnholyStrength.blp"
    self.cost = 485
    self.description = "TODO: Write description"
end
function MaximizeEffectiveness.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "maxUnitCount"
    ____obj[____index] = ____obj[____index] + 4
    local abil = BlzGetUnitAbility(tower.unit, tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.FurtherIncreasedEffectiveness"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FurtherIncreasedEffectiveness = __TS__Class()
local FurtherIncreasedEffectiveness = ____exports.FurtherIncreasedEffectiveness
FurtherIncreasedEffectiveness.name = "FurtherIncreasedEffectiveness"
__TS__ClassExtends(FurtherIncreasedEffectiveness, TowerUpgrade)
function FurtherIncreasedEffectiveness.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Further Increased Effectiveness"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNImprovedUnholyStrength.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function FurtherIncreasedEffectiveness.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "nonGreaterPermanentImmolationAdditionalUnitCount"
    ____obj[____index] = ____obj[____index] + 2
    local ____obj, ____index = tower.customData, "greaterPermanentImmolationAdditionalDamageAmount"
    ____obj[____index] = ____obj[____index] + 1
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.IncreasedEffectiveness"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.IncreasedEffectiveness = __TS__Class()
local IncreasedEffectiveness = ____exports.IncreasedEffectiveness
IncreasedEffectiveness.name = "IncreasedEffectiveness"
__TS__ClassExtends(IncreasedEffectiveness, TowerUpgrade)
function IncreasedEffectiveness.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Increased Effectiveness"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNUnholyStrength.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function IncreasedEffectiveness.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "nonGreaterPermanentImmolationAdditionalUnitCount"
    ____obj[____index] = ____obj[____index] + 2
    local ____obj, ____index = tower.customData, "greaterPermanentImmolationAdditionalDamageAmount"
    ____obj[____index] = ____obj[____index] + 2
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.Overdrive"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.Overdrive = __TS__Class()
local Overdrive = ____exports.Overdrive
Overdrive.name = "Overdrive"
__TS__ClassExtends(Overdrive, TowerUpgrade)
function Overdrive.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Overdrive"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNRegenerationAura.blp"
    self.cost = 3455
    self.description = "TODO: Write description"
end
function Overdrive.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "maxUnitCount"
    ____obj[____index] = ____obj[____index] + 1
    local abil = BlzGetUnitAbility(tower.unit, tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.3333
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.ContaminationZone"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.ContaminationZone = __TS__Class()
local ContaminationZone = ____exports.ContaminationZone
ContaminationZone.name = "ContaminationZone"
__TS__ClassExtends(ContaminationZone, TowerUpgrade)
function ContaminationZone.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Contamination Zone"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNDeathAndDecay.blp"
    self.cost = 21600
    self.description = "TODO: Write description"
end
function ContaminationZone.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "range"
    ____obj[____index] = ____obj[____index] + 70
    local ____obj, ____index = tower.customData, "maxUnitCount"
    ____obj[____index] = ____obj[____index] + 16
    local ____obj, ____index = tower.customData, "damageAmount"
    ____obj[____index] = ____obj[____index] + 1
    local abil = BlzGetUnitAbility(tower.unit, tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75
    )
end
return ____exports
 end,
["src.Towers.Abomination.Abomination"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____EvenFasterSpread = require("src.Towers.Abomination.Upgrades.Path1.EvenFasterSpread")
local EvenFasterSpread = ____EvenFasterSpread.EvenFasterSpread
local ____FasterSpread = require("src.Towers.Abomination.Upgrades.Path1.FasterSpread")
local FasterSpread = ____FasterSpread.FasterSpread
local ____GreaterPermanentImmolation = require("src.Towers.Abomination.Upgrades.Path1.GreaterPermanentImmolation")
local GreaterPermanentImmolation = ____GreaterPermanentImmolation.GreaterPermanentImmolation
local ____Inferno = require("src.Towers.Abomination.Upgrades.Path1.Inferno")
local Inferno = ____Inferno.Inferno
local ____PermanentImmolation = require("src.Towers.Abomination.Upgrades.Path1.PermanentImmolation")
local PermanentImmolation = ____PermanentImmolation.PermanentImmolation
local ____EvenLongerRange = require("src.Towers.Abomination.Upgrades.Path2.EvenLongerRange")
local EvenLongerRange = ____EvenLongerRange.EvenLongerRange
local ____LongerRange = require("src.Towers.Abomination.Upgrades.Path2.LongerRange")
local LongerRange = ____LongerRange.LongerRange
local ____MaximizeEffectiveness = require("src.Towers.Abomination.Upgrades.Path3.MaximizeEffectiveness")
local MaximizeEffectiveness = ____MaximizeEffectiveness.MaximizeEffectiveness
local ____FurtherIncreasedEffectiveness = require("src.Towers.Abomination.Upgrades.Path3.FurtherIncreasedEffectiveness")
local FurtherIncreasedEffectiveness = ____FurtherIncreasedEffectiveness.FurtherIncreasedEffectiveness
local ____IncreasedEffectiveness = require("src.Towers.Abomination.Upgrades.Path3.IncreasedEffectiveness")
local IncreasedEffectiveness = ____IncreasedEffectiveness.IncreasedEffectiveness
local ____Overdrive = require("src.Towers.Abomination.Upgrades.Path3.Overdrive")
local Overdrive = ____Overdrive.Overdrive
local ____ContaminationZone = require("src.Towers.Abomination.Upgrades.Path3.ContaminationZone")
local ContaminationZone = ____ContaminationZone.ContaminationZone
local tickTowerAbilityId = FourCC("A008")
____exports.Abomination = __TS__Class()
local Abomination = ____exports.Abomination
Abomination.name = "Abomination"
__TS__ClassExtends(Abomination, TowerType)
function Abomination.prototype.____constructor(self, ...)
    TowerType.prototype.____constructor(self, ...)
    self.upgrades = {
        {
            __TS__New(FasterSpread),
            __TS__New(EvenFasterSpread),
            __TS__New(PermanentImmolation),
            __TS__New(GreaterPermanentImmolation),
            __TS__New(Inferno)
        },
        {
            __TS__New(LongerRange),
            __TS__New(EvenLongerRange)
        },
        {
            __TS__New(IncreasedEffectiveness),
            __TS__New(FurtherIncreasedEffectiveness),
            __TS__New(MaximizeEffectiveness),
            __TS__New(Overdrive),
            __TS__New(ContaminationZone)
        }
    }
    self.unitTypeId = FourCC("h007")
end
function Abomination.prototype.initializeCustomData(self)
    return {range = 300, maxUnitCount = 8, damageAmount = 1, hasGreaterPermanentImmolation = false, greaterPermanentImmolationAdditionalUnitCount = 0, greaterPermanentImmolationAdditionalDamageAmount = 0, nonGreaterPermanentImmolationAdditionalUnitCount = 0}
end
function Abomination.prototype.applyInitialUnitValues(self, unit)
    BlzSetAbilityRealLevelField(
        BlzGetUnitAbility(unit, tickTowerAbilityId),
        ABILITY_RLF_COOLDOWN,
        0,
        1.4
    )
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path1.ColdSnap"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ColdSnap = __TS__Class()
local ColdSnap = ____exports.ColdSnap
ColdSnap.name = "ColdSnap"
__TS__ClassExtends(ColdSnap, TowerUpgrade)
function ColdSnap.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Cold Snap"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNCrushingWave.blp"
    self.cost = 380
    self.description = "TODO: Write description"
end
function ColdSnap.prototype.applyUpgrade(self, tower)
    tower.customData.hasColdSnap = true
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path1.Permafrost"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.Permafrost = __TS__Class()
local Permafrost = ____exports.Permafrost
Permafrost.name = "Permafrost"
__TS__ClassExtends(Permafrost, TowerUpgrade)
function Permafrost.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Permafrost"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNSlow.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function Permafrost.prototype.applyUpgrade(self, tower)
    tower.customData.hasPermafrost = true
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path2.EnhancedFreeze"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.EnhancedFreeze = __TS__Class()
local EnhancedFreeze = ____exports.EnhancedFreeze
EnhancedFreeze.name = "EnhancedFreeze"
__TS__ClassExtends(EnhancedFreeze, TowerUpgrade)
function EnhancedFreeze.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Enhanced Freeze"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNCloudOfFog.blp"
    self.cost = 245
    self.description = "TODO: Write description"
end
function EnhancedFreeze.prototype.applyUpgrade(self, tower)
    tower.customData.freezeDuration = 2.2
    local abil = BlzGetUnitAbility(tower.unit, tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75
    )
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path3.LargerRadius"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.LargerRadius = __TS__Class()
local LargerRadius = ____exports.LargerRadius
LargerRadius.name = "LargerRadius"
__TS__ClassExtends(LargerRadius, TowerUpgrade)
function LargerRadius.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Larger Radius"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNFrostArmor.blp"
    self.cost = 190
    self.description = "TODO: Write description"
end
function LargerRadius.prototype.applyUpgrade(self, tower)
    local ____obj, ____index = tower.customData, "range"
    ____obj[____index] = ____obj[____index] + 70
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path3.ReFreeze"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ReFreeze = __TS__Class()
local ReFreeze = ____exports.ReFreeze
ReFreeze.name = "ReFreeze"
__TS__ClassExtends(ReFreeze, TowerUpgrade)
function ReFreeze.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Re-Freeze"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNFrost.blp"
    self.cost = 245
    self.description = "TODO: Write description"
end
function ReFreeze.prototype.applyUpgrade(self, tower)
    tower.customData.hasReFreeze = true
end
return ____exports
 end,
["src.Towers.ObsidianStatue.ObsidianStatue"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____ColdSnap = require("src.Towers.ObsidianStatue.Upgrades.Path1.ColdSnap")
local ColdSnap = ____ColdSnap.ColdSnap
local ____Permafrost = require("src.Towers.ObsidianStatue.Upgrades.Path1.Permafrost")
local Permafrost = ____Permafrost.Permafrost
local ____EnhancedFreeze = require("src.Towers.ObsidianStatue.Upgrades.Path2.EnhancedFreeze")
local EnhancedFreeze = ____EnhancedFreeze.EnhancedFreeze
local ____LargerRadius = require("src.Towers.ObsidianStatue.Upgrades.Path3.LargerRadius")
local LargerRadius = ____LargerRadius.LargerRadius
local ____ReFreeze = require("src.Towers.ObsidianStatue.Upgrades.Path3.ReFreeze")
local ReFreeze = ____ReFreeze.ReFreeze
local tickTowerAbilityId = FourCC("A008")
____exports.ObsidianStatue = __TS__Class()
local ObsidianStatue = ____exports.ObsidianStatue
ObsidianStatue.name = "ObsidianStatue"
__TS__ClassExtends(ObsidianStatue, TowerType)
function ObsidianStatue.prototype.____constructor(self, ...)
    TowerType.prototype.____constructor(self, ...)
    self.upgrades = {
        {
            __TS__New(Permafrost),
            __TS__New(ColdSnap)
        },
        {
            __TS__New(EnhancedFreeze)
        },
        {
            __TS__New(LargerRadius),
            __TS__New(ReFreeze)
        }
    }
    self.unitTypeId = FourCC("h008")
end
function ObsidianStatue.prototype.initializeCustomData(self)
    return {range = 270, maxUnitCount = 40, damageAmount = 1, freezeDuration = 1.5, hasPermafrost = false, hasColdSnap = false, hasReFreeze = false}
end
function ObsidianStatue.prototype.applyInitialUnitValues(self, unit)
    BlzSetAbilityRealLevelField(
        BlzGetUnitAbility(unit, tickTowerAbilityId),
        ABILITY_RLF_COOLDOWN,
        0,
        2.4
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path1.DeadlyShot"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.DeadlyShot = __TS__Class()
local DeadlyShot = ____exports.DeadlyShot
DeadlyShot.name = "DeadlyShot"
__TS__ClassExtends(DeadlyShot, TowerUpgrade)
function DeadlyShot.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Deadly Shot"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 3240
    self.description = "TODO: Write description"
end
function DeadlyShot.prototype.applyUpgrade(self, tower)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 13,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path1.FurtherIncreasedDamage"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FurtherIncreasedDamage = __TS__Class()
local FurtherIncreasedDamage = ____exports.FurtherIncreasedDamage
FurtherIncreasedDamage.name = "FurtherIncreasedDamage"
__TS__ClassExtends(FurtherIncreasedDamage, TowerUpgrade)
function FurtherIncreasedDamage.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Further Increased Damage"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 1620
    self.description = "TODO: Write description"
end
function FurtherIncreasedDamage.prototype.applyUpgrade(self, tower)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 3,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path1.IncreasedDamage"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.IncreasedDamage = __TS__Class()
local IncreasedDamage = ____exports.IncreasedDamage
IncreasedDamage.name = "IncreasedDamage"
__TS__ClassExtends(IncreasedDamage, TowerUpgrade)
function IncreasedDamage.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Increased Damage"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 380
    self.description = "TODO: Write description"
end
function IncreasedDamage.prototype.applyUpgrade(self, tower)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 2,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path2.NightVision"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.NightVision = __TS__Class()
local NightVision = ____exports.NightVision
NightVision.name = "NightVision"
__TS__ClassExtends(NightVision, TowerUpgrade)
function NightVision.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Night Vision"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 325
    self.description = "TODO: Write description"
end
function NightVision.prototype.applyUpgrade(self, tower)
    BlzSetUnitWeaponIntegerField(tower.unit, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, 0, 22)
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.EliteDefender"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.EliteDefender = __TS__Class()
local EliteDefender = ____exports.EliteDefender
EliteDefender.name = "EliteDefender"
__TS__ClassExtends(EliteDefender, TowerUpgrade)
function EliteDefender.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Elite Defender"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 15120
    self.description = "TODO: Write description"
end
function EliteDefender.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.5,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.EvenFasterFiring"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.EvenFasterFiring = __TS__Class()
local EvenFasterFiring = ____exports.EvenFasterFiring
EvenFasterFiring.name = "EvenFasterFiring"
__TS__ClassExtends(EvenFasterFiring, TowerUpgrade)
function EvenFasterFiring.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Even Faster Firing"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 430
    self.description = "TODO: Write description"
end
function EvenFasterFiring.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.7,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.FastFiring"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FastFiring = __TS__Class()
local FastFiring = ____exports.FastFiring
FastFiring.name = "FastFiring"
__TS__ClassExtends(FastFiring, TowerUpgrade)
function FastFiring.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Fast Firing"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 430
    self.description = "TODO: Write description"
end
function FastFiring.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.7,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.FullyAutomatic"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FullyAutomatic = __TS__Class()
local FullyAutomatic = ____exports.FullyAutomatic
FullyAutomatic.name = "FullyAutomatic"
__TS__ClassExtends(FullyAutomatic, TowerUpgrade)
function FullyAutomatic.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Fully-Automatic"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 4590
    self.description = "TODO: Write description"
end
function FullyAutomatic.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.5,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.SemiAutomatic"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.SemiAutomatic = __TS__Class()
local SemiAutomatic = ____exports.SemiAutomatic
SemiAutomatic.name = "SemiAutomatic"
__TS__ClassExtends(SemiAutomatic, TowerUpgrade)
function SemiAutomatic.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Semi-Automatic"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp"
    self.cost = 3780
    self.description = "TODO: Write description"
end
function SemiAutomatic.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.3333,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Gargoyle"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____DeadlyShot = require("src.Towers.Gargoyle.Upgrades.Path1.DeadlyShot")
local DeadlyShot = ____DeadlyShot.DeadlyShot
local ____FurtherIncreasedDamage = require("src.Towers.Gargoyle.Upgrades.Path1.FurtherIncreasedDamage")
local FurtherIncreasedDamage = ____FurtherIncreasedDamage.FurtherIncreasedDamage
local ____IncreasedDamage = require("src.Towers.Gargoyle.Upgrades.Path1.IncreasedDamage")
local IncreasedDamage = ____IncreasedDamage.IncreasedDamage
local ____NightVision = require("src.Towers.Gargoyle.Upgrades.Path2.NightVision")
local NightVision = ____NightVision.NightVision
local ____EliteDefender = require("src.Towers.Gargoyle.Upgrades.Path3.EliteDefender")
local EliteDefender = ____EliteDefender.EliteDefender
local ____EvenFasterFiring = require("src.Towers.Gargoyle.Upgrades.Path3.EvenFasterFiring")
local EvenFasterFiring = ____EvenFasterFiring.EvenFasterFiring
local ____FastFiring = require("src.Towers.Gargoyle.Upgrades.Path3.FastFiring")
local FastFiring = ____FastFiring.FastFiring
local ____FullyAutomatic = require("src.Towers.Gargoyle.Upgrades.Path3.FullyAutomatic")
local FullyAutomatic = ____FullyAutomatic.FullyAutomatic
local ____SemiAutomatic = require("src.Towers.Gargoyle.Upgrades.Path3.SemiAutomatic")
local SemiAutomatic = ____SemiAutomatic.SemiAutomatic
____exports.Gargoyle = __TS__Class()
local Gargoyle = ____exports.Gargoyle
Gargoyle.name = "Gargoyle"
__TS__ClassExtends(Gargoyle, TowerType)
function Gargoyle.prototype.____constructor(self, ...)
    TowerType.prototype.____constructor(self, ...)
    self.upgrades = {
        {
            __TS__New(IncreasedDamage),
            __TS__New(FurtherIncreasedDamage),
            __TS__New(DeadlyShot)
        },
        {
            __TS__New(NightVision)
        },
        {
            __TS__New(FastFiring),
            __TS__New(EvenFasterFiring),
            __TS__New(SemiAutomatic),
            __TS__New(FullyAutomatic),
            __TS__New(EliteDefender)
        }
    }
    self.unitTypeId = FourCC("h009")
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.LargerRocks"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.LargerRocks = __TS__Class()
local LargerRocks = ____exports.LargerRocks
LargerRocks.name = "LargerRocks"
__TS__ClassExtends(LargerRocks, TowerUpgrade)
function LargerRocks.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Larger Rocks"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpOne.blp"
    self.cost = 380
    self.description = "TODO: Write description"
end
function LargerRocks.prototype.applyUpgrade(self, tower)
    local currentCooldown = BlzGetUnitAttackCooldown(tower.unit, 0)
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 210)
    BlzSetUnitAttackCooldown(tower.unit, currentCooldown, 0)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.HeavierRocks"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.HeavierRocks = __TS__Class()
local HeavierRocks = ____exports.HeavierRocks
HeavierRocks.name = "HeavierRocks"
__TS__ClassExtends(HeavierRocks, TowerUpgrade)
function HeavierRocks.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Heavier Rocks"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpTwo.blp"
    self.cost = 700
    self.description = "TODO: Write description"
end
function HeavierRocks.prototype.applyUpgrade(self, tower)
    local currentCooldown = BlzGetUnitAttackCooldown(tower.unit, 0)
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 310)
    BlzSetUnitAttackCooldown(tower.unit, currentCooldown, 0)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.ReallyBigRocks"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ReallyBigRocks = __TS__Class()
local ReallyBigRocks = ____exports.ReallyBigRocks
ReallyBigRocks.name = "ReallyBigRocks"
__TS__ClassExtends(ReallyBigRocks, TowerUpgrade)
function ReallyBigRocks.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Really Big Rocks"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpThree.blp"
    self.cost = 1295
    self.description = "TODO: Write description"
end
function ReallyBigRocks.prototype.applyUpgrade(self, tower)
    local currentCooldown = BlzGetUnitAttackCooldown(tower.unit, 0)
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 400)
    BlzSetUnitAttackCooldown(tower.unit, currentCooldown, 0)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path2.FasterHurling"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FasterHurling = __TS__Class()
local FasterHurling = ____exports.FasterHurling
FasterHurling.name = "FasterHurling"
__TS__ClassExtends(FasterHurling, TowerUpgrade)
function FasterHurling.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Faster Hurling"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNDispelMagic.blp"
    self.cost = 270
    self.description = "TODO: Write description"
end
function FasterHurling.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.75,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path2.ExcessiveHurling"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ExcessiveHurling = __TS__Class()
local ExcessiveHurling = ____exports.ExcessiveHurling
ExcessiveHurling.name = "ExcessiveHurling"
__TS__ClassExtends(ExcessiveHurling, TowerUpgrade)
function ExcessiveHurling.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Excessive Hurling"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNFlakCannons.blp"
    self.cost = 430
    self.description = "TODO: Write description"
end
function ExcessiveHurling.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 40
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 40)
    BlzSetUnitWeaponRealField(
        tower.unit,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 150
    )
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.8,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path2.Wendigo"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.Wendigo = __TS__Class()
local Wendigo = ____exports.Wendigo
Wendigo.name = "Wendigo"
__TS__ClassExtends(Wendigo, TowerUpgrade)
function Wendigo.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Wendigo"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNHumanArtilleryUpOne.blp"
    self.cost = 1190
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h005")
end
function Wendigo.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 50
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 50)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.ExtraRange"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ExtraRange = __TS__Class()
local ExtraRange = ____exports.ExtraRange
ExtraRange.name = "ExtraRange"
__TS__ClassExtends(ExtraRange, TowerUpgrade)
function ExtraRange.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Extra Range"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNDwarvenLongRifle.blp"
    self.cost = 215
    self.description = "TODO: Write description"
end
function ExtraRange.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 70
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 70)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.FragBombs"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FragBombs = __TS__Class()
local FragBombs = ____exports.FragBombs
FragBombs.name = "FragBombs"
__TS__ClassExtends(FragBombs, TowerUpgrade)
function FragBombs.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Frag Bombs"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNFlare.blp"
    self.cost = 325
    self.description = "TODO: Write description"
end
function FragBombs.prototype.applyUpgrade(self, tower)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.SeaGiant"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.SeaGiant = __TS__Class()
local SeaGiant = ____exports.SeaGiant
SeaGiant.name = "SeaGiant"
__TS__ClassExtends(SeaGiant, TowerUpgrade)
function SeaGiant.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Cluster Bombs"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNFragmentationBombs.blp"
    self.cost = 865
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h004")
end
function SeaGiant.prototype.applyUpgrade(self, _tower)
    return
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.SkeletalHammer"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.SkeletalHammer = __TS__Class()
local SkeletalHammer = ____exports.SkeletalHammer
SkeletalHammer.name = "SkeletalHammer"
__TS__ClassExtends(SkeletalHammer, TowerUpgrade)
function SkeletalHammer.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Skeletal Hammer"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNBash.blp"
    self.cost = 3890
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h006")
end
function SkeletalHammer.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 30
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 30)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.GreaterHammers"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local skeletalHammerAbilityId = FourCC("A004")
____exports.GreaterHammers = __TS__Class()
local GreaterHammers = ____exports.GreaterHammers
GreaterHammers.name = "GreaterHammers"
__TS__ClassExtends(GreaterHammers, TowerUpgrade)
function GreaterHammers.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Greater Hammers"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp"
    self.cost = 59400
    self.description = "TODO: Write description"
end
function GreaterHammers.prototype.applyUpgrade(self, tower)
    BlzSetUnitWeaponStringField(tower.unit, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, "Abilities\\Weapons\\GryphonRiderMissile\\GryphonRiderMissile.mdl")
    SetUnitAbilityLevel(tower.unit, skeletalHammerAbilityId, 2)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.RecursiveBombs"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local clusterBombsAbilityId = FourCC("A005")
____exports.RecursiveBombs = __TS__Class()
local RecursiveBombs = ____exports.RecursiveBombs
RecursiveBombs.name = "RecursiveBombs"
__TS__ClassExtends(RecursiveBombs, TowerUpgrade)
function RecursiveBombs.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Recursive Bombs"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNScatterRockets.blp"
    self.cost = 3025
    self.description = "TODO: Write description"
end
function RecursiveBombs.prototype.applyUpgrade(self, tower)
    SetUnitAbilityLevel(tower.unit, clusterBombsAbilityId, 2)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.BombBlitz"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local clusterBombsAbilityId = FourCC("A005")
____exports.BombBlitz = __TS__Class()
local BombBlitz = ____exports.BombBlitz
BombBlitz.name = "BombBlitz"
__TS__ClassExtends(BombBlitz, TowerUpgrade)
function BombBlitz.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Bomb Blitz"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNWallOfFire.blp"
    self.cost = 37800
    self.description = "TODO: Write description"
end
function BombBlitz.prototype.applyUpgrade(self, tower)
    SetUnitAbilityLevel(tower.unit, clusterBombsAbilityId, 3)
end
return ____exports
 end,
["src.Towers.Sapper.Sapper"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____LargerRocks = require("src.Towers.Sapper.Upgrades.Path1.LargerRocks")
local LargerRocks = ____LargerRocks.LargerRocks
local ____HeavierRocks = require("src.Towers.Sapper.Upgrades.Path1.HeavierRocks")
local HeavierRocks = ____HeavierRocks.HeavierRocks
local ____ReallyBigRocks = require("src.Towers.Sapper.Upgrades.Path1.ReallyBigRocks")
local ReallyBigRocks = ____ReallyBigRocks.ReallyBigRocks
local ____FasterHurling = require("src.Towers.Sapper.Upgrades.Path2.FasterHurling")
local FasterHurling = ____FasterHurling.FasterHurling
local ____ExcessiveHurling = require("src.Towers.Sapper.Upgrades.Path2.ExcessiveHurling")
local ExcessiveHurling = ____ExcessiveHurling.ExcessiveHurling
local ____Wendigo = require("src.Towers.Sapper.Upgrades.Path2.Wendigo")
local Wendigo = ____Wendigo.Wendigo
local ____ExtraRange = require("src.Towers.Sapper.Upgrades.Path3.ExtraRange")
local ExtraRange = ____ExtraRange.ExtraRange
local ____FragBombs = require("src.Towers.Sapper.Upgrades.Path3.FragBombs")
local FragBombs = ____FragBombs.FragBombs
local ____SeaGiant = require("src.Towers.Sapper.Upgrades.Path3.SeaGiant")
local SeaGiant = ____SeaGiant.SeaGiant
local ____SkeletalHammer = require("src.Towers.Sapper.Upgrades.Path1.SkeletalHammer")
local SkeletalHammer = ____SkeletalHammer.SkeletalHammer
local ____GreaterHammers = require("src.Towers.Sapper.Upgrades.Path1.GreaterHammers")
local GreaterHammers = ____GreaterHammers.GreaterHammers
local ____RecursiveBombs = require("src.Towers.Sapper.Upgrades.Path3.RecursiveBombs")
local RecursiveBombs = ____RecursiveBombs.RecursiveBombs
local ____BombBlitz = require("src.Towers.Sapper.Upgrades.Path3.BombBlitz")
local BombBlitz = ____BombBlitz.BombBlitz
____exports.Sapper = __TS__Class()
local Sapper = ____exports.Sapper
Sapper.name = "Sapper"
__TS__ClassExtends(Sapper, TowerType)
function Sapper.prototype.____constructor(self, ...)
    TowerType.prototype.____constructor(self, ...)
    self.upgrades = {
        {
            __TS__New(LargerRocks),
            __TS__New(HeavierRocks),
            __TS__New(ReallyBigRocks),
            __TS__New(SkeletalHammer),
            __TS__New(GreaterHammers)
        },
        {
            __TS__New(FasterHurling),
            __TS__New(ExcessiveHurling),
            __TS__New(Wendigo)
        },
        {
            __TS__New(ExtraRange),
            __TS__New(FragBombs),
            __TS__New(SeaGiant),
            __TS__New(RecursiveBombs),
            __TS__New(BombBlitz)
        }
    }
    self.unitTypeId = FourCC("h003")
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.MeatWagon"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.MeatWagon = __TS__Class()
local MeatWagon = ____exports.MeatWagon
MeatWagon.name = "MeatWagon"
__TS__ClassExtends(MeatWagon, TowerUpgrade)
function MeatWagon.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Meat Wagon"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNVorpalBlades.blp"
    self.cost = 325
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h001")
end
function MeatWagon.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 680
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 680)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.EnhancedEyesight"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.EnhancedEyesight = __TS__Class()
local EnhancedEyesight = ____exports.EnhancedEyesight
EnhancedEyesight.name = "EnhancedEyesight"
__TS__ClassExtends(EnhancedEyesight, TowerUpgrade)
function EnhancedEyesight.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Enhanced Eyesight"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNUltravision.blp"
    self.cost = 215
    self.description = "TODO: Write description"
end
function EnhancedEyesight.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 80
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80)
    BlzSetUnitWeaponRealField(
        tower.unit,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 100
    )
    BlzSetUnitWeaponIntegerField(tower.unit, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, 0, 22)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.LongRangeArrows"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.LongRangeArrows = __TS__Class()
local LongRangeArrows = ____exports.LongRangeArrows
LongRangeArrows.name = "LongRangeArrows"
__TS__ClassExtends(LongRangeArrows, TowerUpgrade)
function LongRangeArrows.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Long Range Arrows"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNSentinel.blp"
    self.cost = 95
    self.description = "TODO: Write description"
end
function LongRangeArrows.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 80
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path2.QuickShots"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.QuickShots = __TS__Class()
local QuickShots = ____exports.QuickShots
QuickShots.name = "QuickShots"
__TS__ClassExtends(QuickShots, TowerUpgrade)
function QuickShots.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Quick Shots"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNStrengthOfTheMoon.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function QuickShots.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.85,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.RazorSharpArrows"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.RazorSharpArrows = __TS__Class()
local RazorSharpArrows = ____exports.RazorSharpArrows
RazorSharpArrows.name = "RazorSharpArrows"
__TS__ClassExtends(RazorSharpArrows, TowerUpgrade)
function RazorSharpArrows.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Razor Sharp Arrows"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNShadowStrike.blp"
    self.cost = 235
    self.description = "TODO: Write description"
end
function RazorSharpArrows.prototype.applyUpgrade(self, tower)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.BurningArcher"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.BurningArcher = __TS__Class()
local BurningArcher = ____exports.BurningArcher
BurningArcher.name = "BurningArcher"
__TS__ClassExtends(BurningArcher, TowerUpgrade)
function BurningArcher.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Burning Archer"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNSearingArrows.blp"
    self.cost = 675
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h002")
end
function BurningArcher.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 80
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 2,
        0
    )
    BlzSetUnitWeaponRealField(
        tower.unit,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 500
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.SharpArrows"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.SharpArrows = __TS__Class()
local SharpArrows = ____exports.SharpArrows
SharpArrows.name = "SharpArrows"
__TS__ClassExtends(SharpArrows, TowerUpgrade)
function SharpArrows.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Sharp Arrows"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNImprovedBows.blp"
    self.cost = 150
    self.description = "TODO: Write description"
end
function SharpArrows.prototype.applyUpgrade(self, tower)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path2.TripleShot"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.TripleShot = __TS__Class()
local TripleShot = ____exports.TripleShot
TripleShot.name = "TripleShot"
__TS__ClassExtends(TripleShot, TowerUpgrade)
function TripleShot.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Triple Shot"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNFanOfKnives.blp"
    self.cost = 430
    self.description = "TODO: Write description"
    self.tripleShotAbilityId = FourCC("A001")
end
function TripleShot.prototype.applyUpgrade(self, tower)
    UnitAddAbility(tower.unit, self.tripleShotAbilityId)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path2.VeryQuickShots"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.VeryQuickShots = __TS__Class()
local VeryQuickShots = ____exports.VeryQuickShots
VeryQuickShots.name = "VeryQuickShots"
__TS__ClassExtends(VeryQuickShots, TowerUpgrade)
function VeryQuickShots.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Very Quick Shots"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNImprovedStrengthOfTheMoon.blp"
    self.cost = 205
    self.description = "TODO: Write description"
end
function VeryQuickShots.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.745,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.CorrosiveAmmo"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.CorrosiveAmmo = __TS__Class()
local CorrosiveAmmo = ____exports.CorrosiveAmmo
CorrosiveAmmo.name = "CorrosiveAmmo"
__TS__ClassExtends(CorrosiveAmmo, TowerUpgrade)
function CorrosiveAmmo.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Corrosive Ammo"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNCorrosiveBreath.blp"
    self.cost = 1945
    self.description = "TODO: Write description"
end
function CorrosiveAmmo.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) * 1.15
    )
    BlzSetUnitWeaponRealField(
        tower.unit,
        UNIT_WEAPON_RF_ATTACK_RANGE,
        1,
        BlzGetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1) * 0.15
    )
    local currentCooldown = BlzGetUnitAttackCooldown(tower.unit, 0)
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 200)
    BlzSetUnitAttackCooldown(tower.unit, currentCooldown, 0)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 1,
        0
    )
    BlzSetUnitWeaponStringField(tower.unit, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl")
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.StarThrower"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.StarThrower = __TS__Class()
local StarThrower = ____exports.StarThrower
StarThrower.name = "StarThrower"
__TS__ClassExtends(StarThrower, TowerUpgrade)
function StarThrower.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Star Thrower"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNStarfall.blp"
    self.cost = 16200
    self.description = "TODO: Write description"
end
function StarThrower.prototype.applyUpgrade(self, tower)
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 3,
        0
    )
    BlzSetUnitWeaponStringField(tower.unit, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, "Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl")
    BlzSetUnitWeaponRealField(
        tower.unit,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 150
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.SharpShooter"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.SharpShooter = __TS__Class()
local SharpShooter = ____exports.SharpShooter
SharpShooter.name = "SharpShooter"
__TS__ClassExtends(SharpShooter, TowerUpgrade)
function SharpShooter.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Sharp Shooter"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNMarksmanship.blp"
    self.cost = 2160
    self.description = "TODO: Write description"
    self.sharpShooterAbilityId = FourCC("A002")
end
function SharpShooter.prototype.applyUpgrade(self, tower)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.2133,
        0
    )
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 3,
        0
    )
    UnitAddAbility(tower.unit, self.sharpShooterAbilityId)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.BowMaster"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.BowMaster = __TS__Class()
local BowMaster = ____exports.BowMaster
BowMaster.name = "BowMaster"
__TS__ClassExtends(BowMaster, TowerUpgrade)
function BowMaster.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Bow Master"
    self.icon = "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp"
    self.cost = 25380
    self.description = "TODO: Write description"
    self.sharpShooterAbilityId = FourCC("A002")
end
function BowMaster.prototype.applyUpgrade(self, tower)
    SetUnitAcquireRange(
        tower.unit,
        GetUnitAcquireRange(tower.unit) + 200
    )
    BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200)
    BlzSetUnitAttackCooldown(
        tower.unit,
        BlzGetUnitAttackCooldown(tower.unit, 0) * 0.7895,
        0
    )
    BlzSetUnitBaseDamage(
        tower.unit,
        BlzGetUnitBaseDamage(tower.unit, 0) + 3,
        0
    )
    SetUnitAbilityLevel(tower.unit, self.sharpShooterAbilityId, 2)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.SkeletonArcher"] = function() require("lualib_bundle");
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____MeatWagon = require("src.Towers.SkeletonArcher.Upgrades.Path1.MeatWagon")
local MeatWagon = ____MeatWagon.MeatWagon
local ____EnhancedEyesight = require("src.Towers.SkeletonArcher.Upgrades.Path3.EnhancedEyesight")
local EnhancedEyesight = ____EnhancedEyesight.EnhancedEyesight
local ____LongRangeArrows = require("src.Towers.SkeletonArcher.Upgrades.Path3.LongRangeArrows")
local LongRangeArrows = ____LongRangeArrows.LongRangeArrows
local ____QuickShots = require("src.Towers.SkeletonArcher.Upgrades.Path2.QuickShots")
local QuickShots = ____QuickShots.QuickShots
local ____RazorSharpArrows = require("src.Towers.SkeletonArcher.Upgrades.Path1.RazorSharpArrows")
local RazorSharpArrows = ____RazorSharpArrows.RazorSharpArrows
local ____BurningArcher = require("src.Towers.SkeletonArcher.Upgrades.Path3.BurningArcher")
local BurningArcher = ____BurningArcher.BurningArcher
local ____SharpArrows = require("src.Towers.SkeletonArcher.Upgrades.Path1.SharpArrows")
local SharpArrows = ____SharpArrows.SharpArrows
local ____TripleShot = require("src.Towers.SkeletonArcher.Upgrades.Path2.TripleShot")
local TripleShot = ____TripleShot.TripleShot
local ____VeryQuickShots = require("src.Towers.SkeletonArcher.Upgrades.Path2.VeryQuickShots")
local VeryQuickShots = ____VeryQuickShots.VeryQuickShots
local ____CorrosiveAmmo = require("src.Towers.SkeletonArcher.Upgrades.Path1.CorrosiveAmmo")
local CorrosiveAmmo = ____CorrosiveAmmo.CorrosiveAmmo
local ____StarThrower = require("src.Towers.SkeletonArcher.Upgrades.Path1.StarThrower")
local StarThrower = ____StarThrower.StarThrower
local ____SharpShooter = require("src.Towers.SkeletonArcher.Upgrades.Path3.SharpShooter")
local SharpShooter = ____SharpShooter.SharpShooter
local ____BowMaster = require("src.Towers.SkeletonArcher.Upgrades.Path3.BowMaster")
local BowMaster = ____BowMaster.BowMaster
____exports.SkeletonArcher = __TS__Class()
local SkeletonArcher = ____exports.SkeletonArcher
SkeletonArcher.name = "SkeletonArcher"
__TS__ClassExtends(SkeletonArcher, TowerType)
function SkeletonArcher.prototype.____constructor(self, ...)
    TowerType.prototype.____constructor(self, ...)
    self.upgrades = {
        {
            __TS__New(SharpArrows),
            __TS__New(RazorSharpArrows),
            __TS__New(MeatWagon),
            __TS__New(CorrosiveAmmo),
            __TS__New(StarThrower)
        },
        {
            __TS__New(QuickShots),
            __TS__New(VeryQuickShots),
            __TS__New(TripleShot)
        },
        {
            __TS__New(LongRangeArrows),
            __TS__New(EnhancedEyesight),
            __TS__New(BurningArcher),
            __TS__New(SharpShooter),
            __TS__New(BowMaster)
        }
    }
    self.unitTypeId = FourCC("h000")
end
return ____exports
 end,
["src.Towers.TowerTypes"] = function() require("lualib_bundle");
local ____exports = {}
local ____Abomination = require("src.Towers.Abomination.Abomination")
local Abomination = ____Abomination.Abomination
local ____Gargoyle = require("src.Towers.Gargoyle.Gargoyle")
local Gargoyle = ____Gargoyle.Gargoyle
local ____ObsidianStatue = require("src.Towers.ObsidianStatue.ObsidianStatue")
local ObsidianStatue = ____ObsidianStatue.ObsidianStatue
local ____Sapper = require("src.Towers.Sapper.Sapper")
local Sapper = ____Sapper.Sapper
local ____SkeletonArcher = require("src.Towers.SkeletonArcher.SkeletonArcher")
local SkeletonArcher = ____SkeletonArcher.SkeletonArcher
local towers = __TS__New(Map)
__TS__ArrayForEach(
    {
        __TS__New(SkeletonArcher),
        __TS__New(Sapper),
        __TS__New(Abomination),
        __TS__New(ObsidianStatue),
        __TS__New(Gargoyle)
    },
    function(____, tower)
        towers:set(tower.unitTypeId, tower)
        __TS__ArrayForEach(
            tower.upgrades,
            function(____, upgradePath)
                __TS__ArrayForEach(
                    upgradePath,
                    function(____, upgrade)
                        if upgrade.newUnitTypeId ~= nil then
                            towers:set(upgrade.newUnitTypeId, tower)
                        end
                    end
                )
            end
        )
    end
)
____exports.default = towers
return ____exports
 end,
["src.Towers.TowerController"] = function() require("lualib_bundle");
local ____exports = {}
local ____GroupInRange = require("src.JassOverrides.GroupInRange")
local GroupInRange = ____GroupInRange.GroupInRange
local ____Trigger = require("src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____Tower = require("src.Towers.Tower")
local Tower = ____Tower.Tower
local ____TowerTypes = require("src.Towers.TowerTypes")
local towerTypeMap = ____TowerTypes.default
local attackAbilityId = FourCC("Aatk")
local tickTowerAbilityId = FourCC("A008")
local fortifiedUnitTypeId = FourCC("u004")
local invisibilityUnitTypeId = FourCC("u003")
local abominationUnitTypeId = FourCC("h007")
local obsidianStatueUnitTypeId = FourCC("h008")
____exports.TowerController = __TS__Class()
local TowerController = ____exports.TowerController
TowerController.name = "TowerController"
function TowerController.prototype.____constructor(self, timerUtils, stunUtils, towers)
    self.tickTowers = __TS__New(Map)
    self.timerUtils = timerUtils
    self.stunUtils = stunUtils
    self.towers = towers
    local constTrig = __TS__New(Trigger)
    constTrig:addAction(
        function()
            local trig = GetTriggerUnit()
            BlzUnitDisableAbility(trig, attackAbilityId, false, true)
            local unitTypeId = GetUnitTypeId(trig)
            local towerType = towerTypeMap:get(unitTypeId)
            if towerType == nil then
                error(
                    __TS__New(
                        Error,
                        ("Invalid argument; no TowerType of unitTypeId " .. tostring(unitTypeId)) .. " exists!"
                    ),
                    0
                )
            end
            local trigHandleId = GetHandleId(trig)
            local tower = __TS__New(Tower, trig, towerType)
            tower.towerType:applyInitialUnitValues(trig)
            self.towers:set(trigHandleId, tower)
            self:addTickTower(tower)
        end
    )
    constTrig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START)
end
function TowerController.prototype.upgradeTower(self, tower, upgrade)
    local isTowerUnitReplaced = false
    local originalHandleId = GetHandleId(tower.unit)
    if upgrade.newUnitTypeId ~= nil then
        isTowerUnitReplaced = true
        local pathUpgrades = tower.pathUpgrades
        local unit = ReplaceUnitBJ(tower.unit, upgrade.newUnitTypeId, bj_UNIT_STATE_METHOD_DEFAULTS)
        tower.unit = unit
        self.towers:delete(originalHandleId)
        self.towers:set(
            GetHandleId(unit),
            tower
        )
        tower.towerType:applyInitialUnitValues(unit)
        do
            local i = 0
            while i < #pathUpgrades do
                do
                    local j = 0
                    while j < pathUpgrades[i + 1] do
                        tower.towerType.upgrades[i + 1][j + 1]:applyUpgrade(tower)
                        j = j + 1
                    end
                end
                i = i + 1
            end
        end
        SelectUnitForPlayerSingle(
            unit,
            GetTriggerPlayer()
        )
    end
    upgrade:applyUpgrade(tower)
    if self.tickTowers:has(originalHandleId) then
        self.timerUtils:releaseTimer(
            self.tickTowers:get(originalHandleId)
        )
        self.tickTowers:delete(originalHandleId)
    end
    if GetUnitAbilityLevel(tower.unit, tickTowerAbilityId) > 0 then
        self:addTickTower(tower)
    end
    return isTowerUnitReplaced
end
function TowerController.prototype.addTickTower(self, tower)
    if GetUnitAbilityLevel(tower.unit, tickTowerAbilityId) > 0 then
        local t = self.timerUtils:newTimer()
        local tickFunction = self:getTowerTickFunction(tower.towerType.unitTypeId)
        t:start(
            BlzGetAbilityRealLevelField(
                BlzGetUnitAbility(tower.unit, tickTowerAbilityId),
                ABILITY_RLF_COOLDOWN,
                0
            ),
            true,
            function() return tickFunction(tower) end
        )
        self.tickTowers:set(
            GetHandleId(tower.unit),
            t
        )
    end
end
function TowerController.prototype.getTowerTickFunction(self, unitTypeId)
    local ____switch15 = unitTypeId
    if ____switch15 == abominationUnitTypeId then
        goto ____switch15_case_0
    elseif ____switch15 == obsidianStatueUnitTypeId then
        goto ____switch15_case_1
    end
    goto ____switch15_case_default
    ::____switch15_case_0::
    do
        return function(tower)
            local ____ = tower.customData
            local range = ____.range
            local maxUnitCount = ____.maxUnitCount
            local damageAmount = ____.damageAmount
            local hasGreaterPermanentImmolation = ____.hasGreaterPermanentImmolation
            local greaterPermanentImmolationAdditionalUnitCount = ____.greaterPermanentImmolationAdditionalUnitCount
            local greaterPermanentImmolationAdditionalDamageAmount = ____.greaterPermanentImmolationAdditionalDamageAmount
            local nonGreaterPermanentImmolationAdditionalUnitCount = ____.nonGreaterPermanentImmolationAdditionalUnitCount
            local realMaxUnitCount = maxUnitCount
            if hasGreaterPermanentImmolation then
                realMaxUnitCount = realMaxUnitCount + greaterPermanentImmolationAdditionalUnitCount
            else
                realMaxUnitCount = realMaxUnitCount + nonGreaterPermanentImmolationAdditionalUnitCount
            end
            local realDamageAmount = damageAmount
            if hasGreaterPermanentImmolation then
                realDamageAmount = realDamageAmount + greaterPermanentImmolationAdditionalDamageAmount
            end
            local loc = GetUnitLoc(tower.unit)
            local group = __TS__New(GroupInRange, range, loc)
            local unitCount = 0
            group["for"](
                group,
                function(u)
                    if unitCount >= realMaxUnitCount then
                        return
                    end
                    if not UnitAlive(u) then
                        return
                    end
                    if GetPlayerId(
                        GetOwningPlayer(u)
                    ) ~= 23 then
                        return
                    end
                    unitCount = unitCount + 1
                    UnitDamageTargetBJ(tower.unit, u, realDamageAmount, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL)
                end
            )
            group:destroy()
            RemoveLocation(loc)
        end
    end
    ::____switch15_case_1::
    do
        return function(tower)
            local ____ = tower.customData
            local range = ____.range
            local maxUnitCount = ____.maxUnitCount
            local damageAmount = ____.damageAmount
            local freezeDuration = ____.freezeDuration
            local hasPermafrost = ____.hasPermafrost
            local hasColdSnap = ____.hasColdSnap
            local hasReFreeze = ____.hasReFreeze
            local loc = GetUnitLoc(tower.unit)
            local group = __TS__New(GroupInRange, range, loc)
            local unitCount = 0
            group["for"](
                group,
                function(u)
                    if unitCount >= maxUnitCount then
                        return
                    end
                    if not UnitAlive(u) then
                        return
                    end
                    if GetPlayerId(
                        GetOwningPlayer(u)
                    ) ~= 23 then
                        return
                    end
                    local unitTypeId = GetUnitTypeId(u)
                    if (not hasColdSnap) and ((unitTypeId == fortifiedUnitTypeId) or (unitTypeId == invisibilityUnitTypeId)) then
                        return
                    end
                    unitCount = unitCount + 1
                    UnitDamageTargetBJ(tower.unit, u, damageAmount, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL)
                    self.stunUtils:freezeUnit(u, freezeDuration, hasPermafrost, hasReFreeze)
                end
            )
            group:destroy()
            RemoveLocation(loc)
        end
    end
    ::____switch15_case_default::
    do
        error(
            __TS__New(
                Error,
                "Invalid argument; no TickFunction exists for Tower of type " .. tostring(unitTypeId)
            ),
            0
        )
    end
    ::____switch15_end::
end
return ____exports
 end,
["src.Game.Frames"] = function() require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
____exports.TowerSystem = __TS__Class()
local TowerSystem = ____exports.TowerSystem
TowerSystem.name = "TowerSystem"
function TowerSystem.prototype.____constructor(self, towerController, towers)
    self.selectedTower = nil
    self.towerController = towerController
    self.towers = towers
    self.originFrameGameUi = BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
    self.menu = BlzCreateFrame("EscMenuPopupMenuTemplate", self.originFrameGameUi, -1, 0)
    BlzFrameSetVisible(self.menu, false)
    BlzFrameSetSize(self.menu, 0.14, 0.19)
    BlzFrameSetPoint(self.menu, FRAMEPOINT_BOTTOMRIGHT, self.originFrameGameUi, FRAMEPOINT_BOTTOMRIGHT, -0.007, 0.16)
    local x = -0.046875
    local y = -0.075
    self.upgradePathIconFrames = {{}, {}, {}}
    do
        local i = 0
        while i < 3 do
            do
                local j = 0
                while j < 5 do
                    __TS__ArrayPush(
                        self.upgradePathIconFrames[i + 1],
                        self:createUpgradePathIconFrame(self.menu, x + (i * 0.046875), y + (j * 0.0375))
                    )
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    local menuBackdrop = BlzCreateFrameByType("BACKDROP", "menuBackdrop", self.menu, "", 0)
    BlzFrameSetTexture(menuBackdrop, "war3mapImported\\TowerUpgradePanel.dds", 0, true)
    BlzFrameSetAllPoints(menuBackdrop, self.menu)
    self.upgradePathEnabled = {{}, {}, {}}
    self.upgradePathTextFrames = {{}, {}, {}}
    do
        local i = 0
        while i < 3 do
            do
                local j = 0
                while j < 5 do
                    self.upgradePathEnabled[i + 1][j + 1] = false
                    local buttonFrame, textFrame = table.unpack(
                        self:createUpgradePathButtonFrame(self.upgradePathIconFrames[i + 1][j + 1])
                    )
                    self.upgradePathTextFrames[i + 1][j + 1] = textFrame
                    self:createUpgradePathButtonTrigger(buttonFrame, i, j)
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    local selectUnitTrig = __TS__New(Trigger)
    selectUnitTrig:addAction(
        function()
            local trig = GetTriggerUnit()
            local unitHandleId = GetHandleId(trig)
            local tower = self.towers:get(unitHandleId)
            if tower == nil then
                self.selectedTower = nil
                BlzFrameSetVisible(self.menu, false)
                return
            end
            self.selectedTower = tower
            self:renderSelectedTowerUpgrades()
            BlzFrameSetVisible(self.menu, true)
        end
    )
    selectUnitTrig:registerPlayerUnitEvent(
        Player(0),
        EVENT_PLAYER_UNIT_SELECTED
    )
    BlzFrameSetFocus(self.menu, false)
end
function TowerSystem.prototype.renderSelectedTowerUpgrades(self)
    if self.selectedTower == nil then
        return
    end
    do
        local i = 0
        while i < 3 do
            do
                local j = 0
                while j < 5 do
                    if self.selectedTower.towerType.upgrades[i + 1] and self.selectedTower.towerType.upgrades[i + 1][j + 1] then
                        local pathA = self.selectedTower.pathUpgrades[((i + 1) % 3) + 1]
                        local pathB = self.selectedTower.pathUpgrades[((i + 2) % 3) + 1]
                        local isPathAvailable = ((pathA == 0) or (pathB == 0)) and ((j < 2) or ((pathA < 3) and (pathB < 3)))
                        local isEnabled = (j == self.selectedTower.pathUpgrades[i + 1]) and isPathAvailable
                        local icon = self.selectedTower.towerType.upgrades[i + 1][j + 1].icon
                        if not isEnabled then
                            icon = __TS__StringReplace(icon, "CommandButtons\\BTN", "CommandButtonsDisabled\\DISBTN")
                        end
                        BlzFrameSetTexture(self.upgradePathIconFrames[i + 1][j + 1], icon, 0, true)
                        BlzFrameSetText(
                            self.upgradePathTextFrames[i + 1][j + 1],
                            (((self.selectedTower.towerType.upgrades[i + 1][j + 1].name .. " |cFFFFCC00(") .. tostring(self.selectedTower.towerType.upgrades[i + 1][j + 1].cost)) .. ")|r|n|n") .. tostring(self.selectedTower.towerType.upgrades[i + 1][j + 1].description)
                        )
                        self.upgradePathEnabled[i + 1][j + 1] = isEnabled
                    end
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
end
function TowerSystem.prototype.createUpgradePathIconFrame(self, parent, offsetX, offsetY)
    local iconFrame = BlzCreateFrameByType("BACKDROP", "iconFrame", parent, "", 0)
    BlzFrameSetSize(iconFrame, 0.02625, 0.02625)
    BlzFrameSetPoint(iconFrame, FRAMEPOINT_CENTER, parent, FRAMEPOINT_CENTER, offsetX, offsetY)
    BlzFrameSetTexture(iconFrame, "UI\\Widgets\\EscMenu\\Human\\Quest-Unknown.dds", 0, true)
    return iconFrame
end
function TowerSystem.prototype.createUpgradePathButtonFrame(self, parent)
    local buttonFrame = BlzCreateFrameByType("BUTTON", "", parent, "buttonFrame", 0)
    BlzFrameSetAllPoints(buttonFrame, parent)
    local tooltipFrame = BlzCreateFrame("BoxedText", buttonFrame, 0, 0)
    local textFrame = BlzCreateFrameByType("TEXT", "textFrame", tooltipFrame, "", 0)
    BlzFrameSetSize(textFrame, 0.25, 0)
    BlzFrameSetPoint(tooltipFrame, FRAMEPOINT_BOTTOMLEFT, textFrame, FRAMEPOINT_BOTTOMLEFT, -0.01, -0.01)
    BlzFrameSetPoint(tooltipFrame, FRAMEPOINT_TOPRIGHT, textFrame, FRAMEPOINT_TOPRIGHT, 0.01, 0.01)
    BlzFrameSetTooltip(buttonFrame, tooltipFrame)
    BlzFrameSetPoint(textFrame, FRAMEPOINT_BOTTOM, buttonFrame, FRAMEPOINT_TOP, 0, 0.01)
    return {buttonFrame, textFrame}
end
function TowerSystem.prototype.createUpgradePathButtonTrigger(self, buttonFrame, path, tier)
    local buttonTrig = __TS__New(Trigger)
    buttonTrig:addCondition(
        function() return (self.upgradePathEnabled[path + 1][tier + 1] and self.selectedTower) and (self.selectedTower.pathUpgrades[path + 1] == tier) end
    )
    buttonTrig:addAction(
        function()
            BlzFrameSetVisible(buttonFrame, false)
            BlzFrameSetVisible(buttonFrame, true)
            local tower = self.selectedTower
            local upgrade = tower.towerType.upgrades[path + 1][tier + 1]
            local playerCurrentGold = GetPlayerState(
                GetTriggerPlayer(),
                PLAYER_STATE_RESOURCE_GOLD
            )
            if playerCurrentGold < upgrade.cost then
                return
            end
            local pathA = tower.pathUpgrades[((path + 1) % 3) + 1]
            local pathB = tower.pathUpgrades[((path + 2) % 3) + 1]
            local isPathAvailable = ((pathA == 0) or (pathB == 0)) and ((tier < 2) or ((pathA < 3) and (pathB < 3)))
            if not isPathAvailable then
                return
            end
            SetPlayerState(
                GetTriggerPlayer(),
                PLAYER_STATE_RESOURCE_GOLD,
                playerCurrentGold - upgrade.cost
            )
            local ____obj, ____index = tower.pathUpgrades, path + 1
            ____obj[____index] = ____obj[____index] + 1
            if self.towerController:upgradeTower(tower, upgrade) then
                SelectUnitForPlayerSingle(
                    tower.unit,
                    GetTriggerPlayer()
                )
            else
                self:renderSelectedTowerUpgrades()
            end
        end
    )
    buttonTrig:registerFrameEvent(buttonFrame, FRAMEEVENT_CONTROL_CLICK)
end
return ____exports
 end,
["src.Creeps.CreepRegenSystem"] = function() require("lualib_bundle");
local ____exports = {}
local ____RegenModifier = require("src.Creeps.Modifiers.RegenModifier")
local regenUnitMap = ____RegenModifier.regenUnitMap
____exports.CreepRegenSystem = __TS__Class()
local CreepRegenSystem = ____exports.CreepRegenSystem
CreepRegenSystem.name = "CreepRegenSystem"
function CreepRegenSystem.prototype.____constructor(self, timerUtils, roundCreepController)
    local t = timerUtils:newTimer()
    t:start(
        0.1,
        true,
        function()
            regenUnitMap:forEach(
                function(____, value, key)
                    local roundCreep = roundCreepController:get(key)
                    if (roundCreep ~= nil) and (roundCreep.creep.parent ~= nil) then
                        value.remainingRegenTicks = value.remainingRegenTicks - 0.1
                        if value.remainingRegenTicks <= 0 then
                            roundCreep.creep = roundCreep.creep.parent
                            roundCreep.creep:apply(value.unit)
                            value.remainingRegenTicks = 1
                        end
                    end
                end
            )
        end
    )
end
return ____exports
 end,
["src.Game.Game"] = function() require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____TimerUtils = require("src.Utility.TimerUtils")
local TimerUtils = ____TimerUtils.TimerUtils
local ____Spells = require("src.Spells.Spells")
local Spells = ____Spells.Spells
local ____Rounds = require("src.Game.Rounds")
local getRoundCreeps = ____Rounds.getRoundCreeps
local ____DamageEngineGlobals = require("src.Utility.DamageEngine.DamageEngineGlobals")
local DamageEngineGlobals = ____DamageEngineGlobals.DamageEngineGlobals
local ____DamageEngine = require("src.Utility.DamageEngine.DamageEngine")
local DamageEngine = ____DamageEngine.DamageEngine
local ____DamageEventController = require("src.Utility.DamageEngine.DamageEventController")
local DamageEventController = ____DamageEventController.DamageEventController
local ____RoundCreepController = require("src.Game.RoundCreepController")
local RoundCreepController = ____RoundCreepController.RoundCreepController
local ____SpawnedCreep = require("src.Creeps.SpawnedCreep")
local SpawnedCreep = ____SpawnedCreep.SpawnedCreep
local ____GroupInRange = require("src.JassOverrides.GroupInRange")
local GroupInRange = ____GroupInRange.GroupInRange
local ____Frames = require("src.Game.Frames")
local TowerSystem = ____Frames.TowerSystem
local ____CreepRegenSystem = require("src.Creeps.CreepRegenSystem")
local CreepRegenSystem = ____CreepRegenSystem.CreepRegenSystem
local ____RegenModifier = require("src.Creeps.Modifiers.RegenModifier")
local regenUnitMap = ____RegenModifier.regenUnitMap
local ____StunUtils = require("src.Utility.StunUtils")
local StunUtils = ____StunUtils.StunUtils
local ____TowerController = require("src.Towers.TowerController")
local TowerController = ____TowerController.TowerController
____exports.Game = __TS__Class()
local Game = ____exports.Game
Game.name = "Game"
function Game.prototype.____constructor(self)
    self.towers = __TS__New(Map)
    self.timerUtils = __TS__New(TimerUtils)
    self.spells = __TS__New(Spells)
    self.damageEngineGlobals = __TS__New(DamageEngineGlobals)
    self.damageEngine = __TS__New(DamageEngine, self.timerUtils, self.damageEngineGlobals)
    self.roundCreepController = __TS__New(RoundCreepController)
    self.stunUtils = __TS__New(StunUtils, self.timerUtils)
    self.damageEventController = __TS__New(DamageEventController, self.damageEngine, self.roundCreepController, self.timerUtils, self.stunUtils)
    self.towerController = __TS__New(TowerController, self.timerUtils, self.stunUtils, self.towers)
    self.towerSystem = __TS__New(TowerSystem, self.towerController, self.towers)
    self.creepRegenSystem = __TS__New(CreepRegenSystem, self.timerUtils, self.roundCreepController)
    self.checkpoints = {{x = -1792, y = 2048}, {x = -1792, y = 2560}, {x = -2304, y = 2560}, {x = -2304, y = 1152}, {x = -2816, y = 1152}, {x = -2816, y = 1664}, {x = -1408, y = 1664}, {x = -1408, y = 2304}, {x = -1024, y = 2304}, {x = -1024, y = 1280}, {x = -1920, y = 1280}, {x = -1920, y = -256}, {x = -2816, y = -256}, {x = -2816, y = -1280}, {x = -2432, y = -1280}, {x = -2432, y = -640}, {x = -1024, y = -640}, {x = -1024, y = -128}, {x = -1536, y = -128}, {x = -1536, y = -1536}, {x = -2048, y = -1536}, {x = -2048, y = -1024}, {x = 1280, y = -1024}, {x = 1280, y = -1536}, {x = 768, y = -1536}, {x = 768, y = -128}, {x = 256, y = -128}, {x = 256, y = -640}, {x = 1664, y = -640}, {x = 1664, y = -1280}, {x = 2048, y = -1280}, {x = 2048, y = -256}, {x = 1152, y = -256}, {x = 1152, y = 1280}, {x = 256, y = 1280}, {x = 256, y = 2304}, {x = 640, y = 2304}, {x = 640, y = 1664}, {x = 2048, y = 1664}, {x = 2048, y = 1152}, {x = 1536, y = 1152}, {x = 1536, y = 2560}, {x = 1024, y = 2560}, {x = 1024, y = 2048}, {x = 2528, y = 2048}}
    local deathTrig = __TS__New(Trigger)
    deathTrig:addAction(
        function()
            local trig = GetTriggerUnit()
            local trigHandleId = GetHandleId(trig)
            regenUnitMap:delete(trigHandleId)
            self.roundCreepController:delete(trigHandleId)
        end
    )
    deathTrig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_DEATH)
    local trig = __TS__New(Trigger)
    local disableTrig = false
    local eff
    local eff2
    trig:addCondition(
        function() return not disableTrig end
    )
    trig:addAction(
        function()
            local trig = GetAttacker()
            local targ = GetTriggerUnit()
            local loc = GetUnitLoc(trig)
            local range = BlzGetUnitWeaponRealField(trig, UNIT_WEAPON_RF_ATTACK_RANGE, 0)
            local group = __TS__New(GroupInRange, range, loc)
            local first = nil
            local index = 0
            group["for"](
                group,
                function(u)
                    if (GetPlayerId(
                        GetOwningPlayer(u)
                    ) ~= 23) or (not UnitAlive(u)) then
                        return
                    end
                    local creep = self.roundCreepController:get(
                        GetHandleId(u)
                    )
                    local creepCheckpointIndex = creep.currentCheckpointIndex
                    if creepCheckpointIndex < index then
                        return
                    end
                    if first == nil then
                        first = u
                        index = creepCheckpointIndex
                        return
                    end
                    if creepCheckpointIndex < index then
                        return
                    end
                    if creepCheckpointIndex > index then
                        first = u
                        index = creepCheckpointIndex
                        return
                    end
                    local checkpoint = self.checkpoints[index + 1]
                    local x = GetUnitX(u)
                    local y = GetUnitY(u)
                    local fX = GetUnitX(first)
                    local fY = GetUnitY(first)
                    local d = math.sqrt(
                        Pow(x - checkpoint.x, 2) + Pow(y - checkpoint.y, 2)
                    )
                    local fD = math.sqrt(
                        Pow(fX - checkpoint.x, 2) + Pow(fY - checkpoint.y, 2)
                    )
                    if d < fD then
                        first = u
                    end
                end
            )
            group:destroy()
            RemoveLocation(loc)
            if first == nil then
                DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, "first === null... :c")
                return
            end
            DestroyEffect(eff)
            DestroyEffect(eff2)
            eff = AddSpecialEffectTarget("Abilities\\Spells\\Undead\\Curse\\CurseTarget.mdl", first, "overhead")
            eff2 = AddSpecialEffectTarget("Units\\Undead\\PlagueCloud\\PlagueCloudtarget.mdl", targ, "overhead")
            if first == targ then
                return
            end
            disableTrig = true
            IssueTargetOrderById(trig, 851983, first)
            disableTrig = false
        end
    )
    do
        local i = 0
        while i < #self.checkpoints do
            local trig = __TS__New(Trigger)
            trig:addCondition(
                function() return GetPlayerId(
                    GetOwningPlayer(
                        GetEnteringUnit()
                    )
                ) == 23 end
            )
            local checkpoint = self.checkpoints[i + 1]
            local nextCheckpointIndex = i + 1
            local nextCheckpoint = (((i == (#self.checkpoints - 1)) and (function() return nil end)) or (function() return self.checkpoints[nextCheckpointIndex + 1] end))()
            trig:addAction(
                function()
                    local enteringUnit = GetEnteringUnit()
                    if nextCheckpoint == nil then
                        return RemoveUnit(enteringUnit)
                    end
                    local spawnedCreep = self.roundCreepController:get(
                        GetHandleId(enteringUnit)
                    )
                    spawnedCreep.currentCheckpoint = nextCheckpoint
                    spawnedCreep.currentCheckpointIndex = nextCheckpointIndex
                    IssuePointOrder(enteringUnit, "move", nextCheckpoint.x, nextCheckpoint.y)
                end
            )
            trig:registerEnterRectSimple(
                Rect(checkpoint.x - 32, checkpoint.y - 32, checkpoint.x + 32, checkpoint.y + 32)
            )
            i = i + 1
        end
    end
end
function Game.prototype.start(self)
    do
        local i = 0
        while i < bj_MAX_PLAYERS do
            SetPlayerState(
                Player(i),
                PLAYER_STATE_RESOURCE_GOLD,
                9999999
            )
            FogModifierStart(
                CreateFogModifierRect(
                    Player(i),
                    FOG_OF_WAR_VISIBLE,
                    GetPlayableMapRect(),
                    false,
                    false
                )
            )
            SetPlayerAlliance(
                Player(23),
                Player(i),
                ALLIANCE_PASSIVE,
                true
            )
            i = i + 1
        end
    end
    local t = self.timerUtils:newTimer()
    t:start(
        10,
        false,
        function()
            self:spawnRounds()
        end
    )
end
function Game.prototype.spawnRounds(self)
    local t = self.timerUtils:newTimer()
    local roundIndex = 0
    local creepCount = 0
    local creepIndex = 0
    local tick = 0
    t:start(
        0.03,
        true,
        function()
            local round = getRoundCreeps(roundIndex)
            if creepIndex >= #round then
                creepIndex = 0
                roundIndex = roundIndex + 1
                return
            end
            tick = tick + 0.03
            local creepSpawnDetails = round[creepIndex + 1]
            if tick >= creepSpawnDetails.delay then
                tick = 0
                creepCount = creepCount + 1
                local initializedCreepType = __TS__New(creepSpawnDetails.creepType)
                do
                    local i = 0
                    while (creepSpawnDetails.modifiers ~= nil) and (i < #creepSpawnDetails.modifiers) do
                        creepSpawnDetails.modifiers[i + 1]:transform(initializedCreepType)
                        i = i + 1
                    end
                end
                local creep = CreateUnit(
                    Player(23),
                    initializedCreepType.unitTypeId,
                    -3296,
                    2049,
                    0
                )
                local handleId = GetHandleId(creep)
                initializedCreepType:apply(creep)
                do
                    local i = 0
                    while (creepSpawnDetails.modifiers ~= nil) and (i < #creepSpawnDetails.modifiers) do
                        creepSpawnDetails.modifiers[i + 1]:apply(creep)
                        i = i + 1
                    end
                end
                self.roundCreepController:set(
                    handleId,
                    __TS__New(SpawnedCreep, initializedCreepType, self.checkpoints[1], 0)
                )
                IssuePointOrder(creep, "move", self.checkpoints[1].x, self.checkpoints[1].y)
                if creepCount >= creepSpawnDetails.amount then
                    creepIndex = creepIndex + 1
                    creepCount = 0
                end
            end
        end
    )
end
return ____exports
 end,
["lua_modules.w3ts.hooks.index"] = function() require("lualib_bundle");
local ____exports = {}
local oldMain = main
local oldConfig = config
local hooksMainBefore = {}
local hooksMainAfter = {}
local hooksConfigBefore = {}
local hooksConfigAfter = {}
____exports.executeHooksMainBefore = function() return __TS__ArrayForEach(
    hooksMainBefore,
    function(____, func) return func() end
) end
____exports.executeHooksMainAfter = function() return __TS__ArrayForEach(
    hooksMainAfter,
    function(____, func) return func() end
) end
function ____exports.hookedMain()
    ____exports.executeHooksMainBefore()
    oldMain()
    ____exports.executeHooksMainAfter()
end
____exports.executeHooksConfigBefore = function() return __TS__ArrayForEach(
    hooksConfigBefore,
    function(____, func) return func() end
) end
____exports.executeHooksConfigAfter = function() return __TS__ArrayForEach(
    hooksConfigAfter,
    function(____, func) return func() end
) end
function ____exports.hookedConfig()
    ____exports.executeHooksConfigBefore()
    oldConfig()
    ____exports.executeHooksConfigAfter()
end
main = ____exports.hookedMain
config = ____exports.hookedConfig
____exports.W3TS_HOOK = W3TS_HOOK or ({})
____exports.W3TS_HOOK.MAIN_BEFORE = "main::before"
____exports.W3TS_HOOK.MAIN_AFTER = "main::after"
____exports.W3TS_HOOK.CONFIG_BEFORE = "config::before"
____exports.W3TS_HOOK.CONFIG_AFTER = "config::after"
local entryPoints = {[____exports.W3TS_HOOK.MAIN_BEFORE] = hooksMainBefore, [____exports.W3TS_HOOK.MAIN_AFTER] = hooksMainAfter, [____exports.W3TS_HOOK.CONFIG_BEFORE] = hooksConfigBefore, [____exports.W3TS_HOOK.CONFIG_AFTER] = hooksConfigAfter}
function ____exports.addScriptHook(entryPoint, hook)
    if not (entryPoints[entryPoint] ~= nil) then
        return false
    end
    __TS__ArrayPush(entryPoints[entryPoint], hook)
    return true
end
return ____exports
 end,
["src.main"] = function() require("lualib_bundle");
local ____exports = {}
local ____Serilog = require("src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local LogLevel = ____Serilog.LogLevel
local ____StringSink = require("src.lib.Serilog.Sinks.StringSink")
local StringSink = ____StringSink.StringSink
local ____Game = require("src.Game.Game")
local Game = ____Game.Game
local ____index = require("lua_modules.w3ts.hooks.index")
local addScriptHook = ____index.addScriptHook
local W3TS_HOOK = ____index.W3TS_HOOK
local createQuests, SendMessage
function createQuests()
end
function SendMessage(msg)
    DisplayTimedTextToForce(
        bj_FORCE_ALL_PLAYERS,
        10,
        tostring(msg)
    )
end
____exports.Initialiser = __TS__Class()
local Initialiser = ____exports.Initialiser
Initialiser.name = "Initialiser"
function Initialiser.prototype.____constructor(self)
end
function Initialiser.run(self)
    local oldFourCC = FourCC
    _G.FourCC = function(id)
        local a = oldFourCC(id)
        return a
    end
    Log.Init(
        {
            __TS__New(StringSink, LogLevel.Error, SendMessage)
        }
    )
    xpcall(
        function()
            BlzLoadTOCFile("war3mapImported\\Templates.toc")
            createQuests()
            local game = __TS__New(Game)
            game:start()
        end,
        function(err)
            Log.Fatal(err)
        end
    )
end
addScriptHook(
    W3TS_HOOK.MAIN_AFTER,
    function() return ____exports.Initialiser:run() end
)
return ____exports
 end,
["src.Spells.Spell"] = function() require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
____exports.Spell = __TS__Class()
local Spell = ____exports.Spell
Spell.name = "Spell"
function Spell.prototype.____constructor(self)
    self.trig = __TS__New(Trigger)
    self.trig:addCondition(
        function() return self:condition() end
    )
    self.trig:addAction(
        function() return self:action() end
    )
    self.trig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT)
end
function Spell.prototype.condition(self)
    return GetSpellAbilityId() == self.abilityId
end
function Spell.prototype.action(self)
end
return ____exports
 end,
["src.Spells.Generic.Debug"] = function() require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
____exports.Debug = __TS__Class()
local Debug = ____exports.Debug
Debug.name = "Debug"
function Debug.prototype.____constructor(self)
    self.cast_trig = __TS__New(Trigger)
    self.channel_trig = __TS__New(Trigger)
    self.effect_trig = __TS__New(Trigger)
    self.endcast_trig = __TS__New(Trigger)
    self.finish_trig = __TS__New(Trigger)
    self.cast_trig:addAction(
        function() return self:castAction() end
    )
    self.cast_trig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CAST)
    self.channel_trig:addAction(
        function() return self:channelAction() end
    )
    self.channel_trig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    self.effect_trig:addAction(
        function() return self:effectAction() end
    )
    self.effect_trig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT)
    self.endcast_trig:addAction(
        function() return self:endcastAction() end
    )
    self.endcast_trig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_ENDCAST)
    self.finish_trig:addAction(
        function() return self:finishAction() end
    )
    self.finish_trig:registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_FINISH)
end
function Debug.prototype.castAction(self)
    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, "Cast!")
end
function Debug.prototype.channelAction(self)
    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, "Channel!")
end
function Debug.prototype.effectAction(self)
    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, "Effect!")
end
function Debug.prototype.endcastAction(self)
    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, "Endcast!")
end
function Debug.prototype.finishAction(self)
    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, "Finish!")
end
return ____exports
 end,
["src.lib.Serilog.Sinks.PreloadSink"] = function() require("lualib_bundle");
local ____exports = {}
____exports.PreloadSink = __TS__Class()
local PreloadSink = ____exports.PreloadSink
PreloadSink.name = "PreloadSink"
function PreloadSink.prototype.____constructor(self, logLevel, FileName)
    self.logLevel = logLevel
    self.FileName = FileName
end
function PreloadSink.prototype.LogLevel(self)
    return self.logLevel
end
function PreloadSink.prototype.LogEventToJson(self, logEvent)
    local json = "{"
    json = tostring(json) .. (("t:\"" .. tostring(logEvent.Text)) .. "\"")
    if logEvent.Value then
        local serializeRaw = ____exports.PreloadSink.SerializeRaw[type(logEvent.Value)]
        if serializeRaw then
            json = tostring(json) .. (",v:" .. tostring(logEvent.Value))
        else
            json = tostring(json) .. ((",v:\"" .. tostring(logEvent.Value)) .. "\"")
        end
    end
    json = tostring(json) .. "}"
    return json
end
function PreloadSink.prototype.Log(self, level, events)
    local json = "{"
    json = tostring(json) .. (("l:" .. tostring(level)) .. ",")
    json = tostring(json) .. "e:{"
    do
        local index = 0
        while index < #events do
            json = tostring(json) .. tostring(
                self:LogEventToJson(events[index + 1])
            )
            if index < (#events - 1) then
                json = tostring(json) .. ","
            end
            index = index + 1
        end
    end
    json = tostring(json) .. "}"
    json = tostring(json) .. "}"
    PreloadGenStart()
    Preload(
        "l" .. tostring(json)
    )
    PreloadGenEnd(self.FileName)
end
PreloadSink.SerializeRaw = {["nil"] = false, boolean = true, number = true, string = false, table = false, ["function"] = false, userdata = false}
return ____exports
 end,
["src.lib.Serilog.Sinks.StringSinkTest"] = function() require("lualib_bundle");
local ____exports = {}
local ____Serilog = require("src.lib.Serilog.Serilog")
local LogEventType = ____Serilog.LogEventType
local LogLevel = ____Serilog.LogLevel
____exports.StringSinkTest = __TS__Class()
local StringSinkTest = ____exports.StringSinkTest
StringSinkTest.name = "StringSinkTest"
function StringSinkTest.prototype.____constructor(self, logLevel, printer)
    self.logLevel = logLevel
    self.printer = printer
end
function StringSinkTest.prototype.LogLevel(self)
    return self.logLevel
end
function StringSinkTest.prototype.Log(self, level, events)
    local message = ""
    do
        local index = 0
        while index < #events do
            local event = events[index + 1]
            if event.Type == LogEventType.Text then
                message = tostring(message) .. tostring(event.Text)
            elseif event.Type == LogEventType.Parameter then
                local whichType = type(event.Value)
                local color = ____exports.StringSinkTest.Colors[whichType]
                if color then
                    message = tostring(message) .. ("|cff" .. tostring(color))
                end
                if ____exports.StringSinkTest.Brackets[whichType] then
                    message = tostring(message) .. "{ "
                end
                message = tostring(message) .. tostring(event.Value)
                if ____exports.StringSinkTest.Brackets[whichType] then
                    message = tostring(message) .. " }"
                end
                if color then
                    message = tostring(message) .. "|r"
                end
            end
            index = index + 1
        end
    end
    self.printer(
        string.format("[%s]: %s", ____exports.StringSinkTest.Prefix[level], message)
    )
end
StringSinkTest.Prefix = {[LogLevel.None] = "NON", [LogLevel.Verbose] = "VRB", [LogLevel.Debug] = "DBG", [LogLevel.Information] = "INF", [LogLevel.Warning] = "WRN", [LogLevel.Error] = "ERR", [LogLevel.Fatal] = "FTL"}
StringSinkTest.Colors = {["nil"] = "9d9d9d", boolean = "1eff00", number = "00ccff", string = "ff8000", table = "ffcc00", ["function"] = "ffcc00", userdata = "ffcc00"}
StringSinkTest.Brackets = {["nil"] = false, boolean = false, number = false, string = false, table = true, ["function"] = true, userdata = true}
return ____exports
 end,
}
return require("src.main")
