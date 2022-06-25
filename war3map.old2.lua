function InitGlobals()
end

function CreateBuildingsForPlayer23()
    local p = Player(23)
    local u
    local unitID
    local t
    local life
    u = BlzCreateUnitWithSkin(p, FourCC("n000"), -672.0, 2784.0, 270.000, FourCC("n000"))
end

function CreatePlayerBuildings()
    CreateBuildingsForPlayer23()
end

function CreatePlayerUnits()
end

function CreateAllUnits()
    CreatePlayerBuildings()
    CreatePlayerUnits()
end

function InitCustomPlayerSlots()
    SetPlayerStartLocation(Player(0), 0)
    ForcePlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_UNDEAD)
    SetPlayerRaceSelectable(Player(0), true)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(1), 1)
    ForcePlayerStartLocation(Player(1), 1)
    SetPlayerColor(Player(1), ConvertPlayerColor(1))
    SetPlayerRacePreference(Player(1), RACE_PREF_UNDEAD)
    SetPlayerRaceSelectable(Player(1), true)
    SetPlayerController(Player(1), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(2), 2)
    ForcePlayerStartLocation(Player(2), 2)
    SetPlayerColor(Player(2), ConvertPlayerColor(2))
    SetPlayerRacePreference(Player(2), RACE_PREF_UNDEAD)
    SetPlayerRaceSelectable(Player(2), true)
    SetPlayerController(Player(2), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(3), 3)
    ForcePlayerStartLocation(Player(3), 3)
    SetPlayerColor(Player(3), ConvertPlayerColor(3))
    SetPlayerRacePreference(Player(3), RACE_PREF_UNDEAD)
    SetPlayerRaceSelectable(Player(3), true)
    SetPlayerController(Player(3), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(23), 4)
    SetPlayerColor(Player(23), ConvertPlayerColor(23))
    SetPlayerRacePreference(Player(23), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(23), true)
    SetPlayerController(Player(23), MAP_CONTROL_COMPUTER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
    SetPlayerTeam(Player(1), 0)
    SetPlayerTeam(Player(2), 0)
    SetPlayerTeam(Player(3), 0)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    SetPlayerTeam(Player(23), 1)
end

function InitAllyPriorities()
    SetStartLocPrioCount(0, 3)
    SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(1, 3)
    SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(2, 3)
    SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(3, 3)
    SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(4, 2)
    SetStartLocPrio(4, 0, 1, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(4, 1, 3, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrioCount(4, 3)
    SetEnemyStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    SetEnemyStartLocPrio(4, 1, 1, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrio(4, 2, 3, MAP_LOC_PRIO_LOW)
end

function main()
    SetCameraBounds(-3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -2432.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3584.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3584.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -2432.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    NewSoundEnvironment("Default")
    SetAmbientDaySound("LordaeronSummerDay")
    SetAmbientNightSound("LordaeronSummerNight")
    SetMapMusic("Music", true, 0)
    CreateAllUnits()
    InitBlizzard()
    InitGlobals()
end

function config()
    SetMapName("TRIGSTR_006")
    SetMapDescription("TRIGSTR_008")
    SetPlayers(5)
    SetTeams(5)
    SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    DefineStartLocation(0, -1536.0, 1792.0)
    DefineStartLocation(1, -1536.0, 1792.0)
    DefineStartLocation(2, -1536.0, 1792.0)
    DefineStartLocation(3, -1536.0, 1792.0)
    DefineStartLocation(4, -2560.0, 2368.0)
    InitCustomPlayerSlots()
    InitCustomTeams()
    InitAllyPriorities()
end


local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value, nil) == nil)
end

local function __TS__ArrayConcat(arr1, ...)
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

local __TS__Symbol, Symbol
do
    local symbolMetatable = {__tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, symbolMetatable)
    end
    Symbol = {
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
end

local function __TS__ArrayEntries(array)
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

local function __TS__ArrayEvery(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if not callbackfn(nil, arr[i + 1], i, arr) then
                return false
            end
            i = i + 1
        end
    end
    return true
end

local function __TS__ArrayFilter(arr, callbackfn)
    local result = {}
    do
        local i = 0
        while i < #arr do
            if callbackfn(nil, arr[i + 1], i, arr) then
                result[#result + 1] = arr[i + 1]
            end
            i = i + 1
        end
    end
    return result
end

local function __TS__ArrayForEach(arr, callbackFn)
    do
        local i = 0
        while i < #arr do
            callbackFn(nil, arr[i + 1], i, arr)
            i = i + 1
        end
    end
end

local function __TS__ArrayFind(arr, predicate)
    local len = #arr
    local k = 0
    while k < len do
        local elem = arr[k + 1]
        if predicate(nil, elem, k, arr) then
            return elem
        end
        k = k + 1
    end
    return nil
end

local function __TS__ArrayFindIndex(arr, callbackFn)
    do
        local i = 0
        local len = #arr
        while i < len do
            if callbackFn(nil, arr[i + 1], i, arr) then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

local function __TS__ArrayPush(arr, ...)
    local items = {...}
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
end

local __TS__Iterator
do
    local function iteratorGeneratorStep(self)
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
    local function iteratorIteratorStep(self)
        local result = self:next()
        if result.done then
            return
        end
        return true, result.value
    end
    local function iteratorStringStep(self, index)
        index = index + 1
        if index > #self then
            return
        end
        return index, string.sub(self, index, index)
    end
    function __TS__Iterator(iterable)
        if type(iterable) == "string" then
            return iteratorStringStep, iterable, 0
        elseif iterable.____coroutine ~= nil then
            return iteratorGeneratorStep, iterable
        elseif iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return iteratorIteratorStep, iterator
        else
            return ipairs(iterable)
        end
    end
end

local __TS__ArrayFrom
do
    local function arrayLikeStep(self, index)
        index = index + 1
        if index > self.length then
            return
        end
        return index, self[index]
    end
    local function arrayLikeIterator(arr)
        if type(arr.length) == "number" then
            return arrayLikeStep, arr, 0
        end
        return __TS__Iterator(arr)
    end
    function __TS__ArrayFrom(arrayLike, mapFn, thisArg)
        local result = {}
        if mapFn == nil then
            for ____, v in arrayLikeIterator(arrayLike) do
                __TS__ArrayPush(result, v)
            end
        else
            for i, v in arrayLikeIterator(arrayLike) do
                __TS__ArrayPush(
                    result,
                    mapFn(thisArg, v, i - 1)
                )
            end
        end
        return result
    end
end

local function __TS__ArrayIncludes(self, searchElement, fromIndex)
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

local function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
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

local function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local result = ""
    for index, value in ipairs(self) do
        if index > 1 then
            result = result .. separator
        end
        result = result .. tostring(value)
    end
    return result
end

local function __TS__ArrayMap(arr, callbackfn)
    local newArray = {}
    do
        local i = 0
        while i < #arr do
            newArray[i + 1] = callbackfn(nil, arr[i + 1], i, arr)
            i = i + 1
        end
    end
    return newArray
end

local function __TS__ArrayReduce(arr, callbackFn, ...)
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
        accumulator = callbackFn(
            nil,
            accumulator,
            arr[i + 1],
            i,
            arr
        )
    end
    return accumulator
end

local function __TS__ArrayReduceRight(arr, callbackFn, ...)
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
        accumulator = callbackFn(
            nil,
            accumulator,
            arr[i + 1],
            i,
            arr
        )
    end
    return accumulator
end

local function __TS__ArrayReverse(arr)
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

local function __TS__ArrayShift(arr)
    return table.remove(arr, 1)
end

local function __TS__ArrayUnshift(arr, ...)
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

local function __TS__ArraySort(arr, compareFn)
    if compareFn ~= nil then
        table.sort(
            arr,
            function(a, b) return compareFn(nil, a, b) < 0 end
        )
    else
        table.sort(arr)
    end
    return arr
end

local function __TS__ArraySlice(list, first, last)
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

local function __TS__ArraySome(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if callbackfn(nil, arr[i + 1], i, arr) then
                return true
            end
            i = i + 1
        end
    end
    return false
end

local function __TS__ArraySplice(list, ...)
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
            while k < len - actualDeleteCount do
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
            while k > len - actualDeleteCount + itemCount do
                list[k] = nil
                k = k - 1
            end
        end
    elseif itemCount > actualDeleteCount then
        do
            local k = len - actualDeleteCount
            while k > actualStart do
                local from = k + actualDeleteCount - 1
                local to = k + itemCount - 1
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
        while k >= len - actualDeleteCount + itemCount do
            list[k + 1] = nil
            k = k - 1
        end
    end
    return out
end

local function __TS__ArrayToObject(array)
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

local function __TS__ArrayFlat(array, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    for ____, value in ipairs(array) do
        if depth > 0 and __TS__ArrayIsArray(value) then
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

local function __TS__ArrayFlatMap(array, callback)
    local result = {}
    do
        local i = 0
        while i < #array do
            local value = callback(nil, array[i + 1], i, array)
            if type(value) == "table" and __TS__ArrayIsArray(value) then
                result = __TS__ArrayConcat(result, value)
            else
                result[#result + 1] = value
            end
            i = i + 1
        end
    end
    return result
end

local function __TS__ArraySetLength(arr, length)
    if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
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

local function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
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

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local __TS__Unpack = table.unpack or unpack

local function __TS__FunctionBind(fn, thisArg, ...)
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

local __TS__Promise
do
    local function promiseDeferred(self)
        local resolve
        local reject
        local promise = __TS__New(
            __TS__Promise,
            function(____, res, rej)
                resolve = res
                reject = rej
            end
        )
        return {promise = promise, resolve = resolve, reject = reject}
    end
    local function isPromiseLike(self, thing)
        return __TS__InstanceOf(thing, __TS__Promise)
    end
    __TS__Promise = __TS__Class()
    __TS__Promise.name = "__TS__Promise"
    function __TS__Promise.prototype.____constructor(self, executor)
        self.state = 0
        self.fulfilledCallbacks = {}
        self.rejectedCallbacks = {}
        self.finallyCallbacks = {}
        do
            local function ____catch(e)
                self:reject(e)
            end
            local ____try, ____hasReturned = pcall(function()
                executor(
                    nil,
                    __TS__FunctionBind(self.resolve, self),
                    __TS__FunctionBind(self.reject, self)
                )
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    function __TS__Promise.resolve(data)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 1
        promise.value = data
        return promise
    end
    function __TS__Promise.reject(reason)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 2
        promise.rejectionReason = reason
        return promise
    end
    __TS__Promise.prototype["then"] = function(self, onFulfilled, onRejected)
        local ____promiseDeferred_result_0 = promiseDeferred(nil)
        local promise = ____promiseDeferred_result_0.promise
        local resolve = ____promiseDeferred_result_0.resolve
        local reject = ____promiseDeferred_result_0.reject
        local isFulfilled = self.state == 1
        local isRejected = self.state == 2
        if onFulfilled then
            local internalCallback = self:createPromiseResolvingCallback(onFulfilled, resolve, reject)
            __TS__ArrayPush(self.fulfilledCallbacks, internalCallback)
            if isFulfilled then
                internalCallback(nil, self.value)
            end
        else
            __TS__ArrayPush(
                self.fulfilledCallbacks,
                function() return resolve(nil, nil) end
            )
        end
        if onRejected then
            local internalCallback = self:createPromiseResolvingCallback(onRejected, resolve, reject)
            __TS__ArrayPush(self.rejectedCallbacks, internalCallback)
            if isRejected then
                internalCallback(nil, self.rejectionReason)
            end
        end
        if isFulfilled then
            resolve(nil, self.value)
        end
        if isRejected then
            reject(nil, self.rejectionReason)
        end
        return promise
    end
    function __TS__Promise.prototype.catch(self, onRejected)
        return self["then"](self, nil, onRejected)
    end
    function __TS__Promise.prototype.finally(self, onFinally)
        if onFinally then
            __TS__ArrayPush(self.finallyCallbacks, onFinally)
            if self.state ~= 0 then
                onFinally(nil)
            end
        end
        return self
    end
    function __TS__Promise.prototype.resolve(self, data)
        if __TS__InstanceOf(data, __TS__Promise) then
            data["then"](
                data,
                function(____, v) return self:resolve(v) end,
                function(____, err) return self:reject(err) end
            )
            return
        end
        if self.state == 0 then
            self.state = 1
            self.value = data
            for ____, callback in ipairs(self.fulfilledCallbacks) do
                callback(nil, data)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.reject(self, reason)
        if self.state == 0 then
            self.state = 2
            self.rejectionReason = reason
            for ____, callback in ipairs(self.rejectedCallbacks) do
                callback(nil, reason)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.createPromiseResolvingCallback(self, f, resolve, reject)
        return function(____, value)
            do
                local function ____catch(e)
                    reject(nil, e)
                end
                local ____try, ____hasReturned = pcall(function()
                    self:handleCallbackData(
                        f(nil, value),
                        resolve,
                        reject
                    )
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    end
    function __TS__Promise.prototype.handleCallbackData(self, data, resolve, reject)
        if isPromiseLike(nil, data) then
            local nextpromise = data
            if nextpromise.state == 1 then
                resolve(nil, nextpromise.value)
            elseif nextpromise.state == 2 then
                reject(nil, nextpromise.rejectionReason)
            else
                data["then"](data, resolve, reject)
            end
        else
            resolve(nil, data)
        end
    end
end

local function __TS__AsyncAwaiter(generator)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            local adopt, fulfilled, rejected, step, asyncCoroutine
            function adopt(self, value)
                local ____temp_0
                if __TS__InstanceOf(value, __TS__Promise) then
                    ____temp_0 = value
                else
                    ____temp_0 = __TS__Promise.resolve(value)
                end
                return ____temp_0
            end
            function fulfilled(self, value)
                local success, errorOrErrorHandler, resultOrError = coroutine.resume(asyncCoroutine, value)
                if success then
                    step(nil, resultOrError, errorOrErrorHandler)
                else
                    reject(nil, errorOrErrorHandler)
                end
            end
            function rejected(self, handler)
                if handler then
                    return function(____, value)
                        local success, hasReturnedOrError, returnedValue = pcall(handler, value)
                        if success then
                            if hasReturnedOrError then
                                resolve(nil, returnedValue)
                            else
                                step(nil, hasReturnedOrError, handler)
                            end
                        else
                            reject(nil, hasReturnedOrError)
                        end
                    end
                else
                    return function(____, value)
                        reject(nil, value)
                    end
                end
            end
            function step(self, result, errorHandler)
                if coroutine.status(asyncCoroutine) == "dead" then
                    resolve(nil, result)
                else
                    local ____self_1 = adopt(nil, result)
                    ____self_1["then"](
                        ____self_1,
                        fulfilled,
                        rejected(nil, errorHandler)
                    )
                end
            end
            asyncCoroutine = coroutine.create(generator)
            local success, errorOrErrorHandler, resultOrError = coroutine.resume(asyncCoroutine)
            if success then
                step(nil, resultOrError, errorOrErrorHandler)
            else
                reject(nil, errorOrErrorHandler)
            end
        end
    )
end
local function __TS__Await(errorHandler, thing)
    return coroutine.yield(errorHandler, thing)
end

local function __TS__ClassExtends(target, base)
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

local function __TS__CloneDescriptor(____bindingPattern0)
    local value
    local writable
    local set
    local get
    local configurable
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    configurable = ____bindingPattern0.configurable
    get = ____bindingPattern0.get
    set = ____bindingPattern0.set
    writable = ____bindingPattern0.writable
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = get ~= nil or set ~= nil
    local hasValueOrWritableAttribute = writable ~= nil or value ~= nil
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

local function __TS__ObjectAssign(to, ...)
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

local function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

local __TS__SetDescriptor
do
    local function descriptorIndex(self, key)
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
    local function descriptorNewIndex(self, key, value)
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
        local ____isPrototype_0
        if isPrototype then
            ____isPrototype_0 = target
        else
            ____isPrototype_0 = getmetatable(target)
        end
        local metatable = ____isPrototype_0
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
        metatable.__index = descriptorIndex
        metatable.__newindex = descriptorNewIndex
    end
end

local function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(nil, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(nil, target, key, descriptor) or descriptor
                    local isSimpleValue = desc.configurable == true and desc.writable == true and not desc.get and not desc.set
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
                    result = decorator(nil, target, key, desc)
                else
                    result = decorator(nil, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(nil, target, key, paramIndex) end
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
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
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            if _VERSION == "Lua 5.1" or caller and caller.func ~= error then
                return description
            else
                return (tostring(description) .. "\n") .. self.stack
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_2 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, self.constructor.new)
        local metatable = getmetatable(self)
        if not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        local ____temp_1
        if self.message ~= "" then
            ____temp_1 = (self.name .. ": ") .. self.message
        else
            ____temp_1 = self.name
        end
        return ____temp_1
    end
    Error = ____initErrorClass_2(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_4 = initErrorClass
        local ____class_3 = __TS__Class()
        ____class_3.name = ____class_3.name
        __TS__ClassExtends(____class_3, Error)
        function ____class_3.prototype.____constructor(self, ...)
            ____class_3.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_4(nil, ____class_3, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

local function __TS__StringAccess(self, index)
    if index >= 0 and index < #self then
        return string.sub(self, index + 1, index + 1)
    end
end

local function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(__TS__StringAccess(iterable, index))
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

local __TS__Generator
do
    local function generatorIterator(self)
        return self
    end
    local function generatorNext(self, ...)
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
                ____coroutine = coroutine.create(function() return fn((unpack or table.unpack)(args, 1, argsLength)) end),
                [Symbol.iterator] = generatorIterator,
                next = generatorNext
            }
        end
    end
end

local function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return valueType == "table" or valueType == "function"
end

local Map
do
    Map = __TS__Class()
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
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, self.items[key], key, self)
        end
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return self.nextKey[key] ~= nil or self.lastKey == key
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
        local ____temp_0 = self
        local items = ____temp_0.items
        local nextKey = ____temp_0.nextKey
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
        local ____temp_1 = self
        local items = ____temp_1.items
        local nextKey = ____temp_1.nextKey
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
end

local __TS__MathAtan2 = math.atan2 or math.atan

local function __TS__MathSign(val)
    if val > 0 then
        return 1
    elseif val < 0 then
        return -1
    end
    return 0
end

local function __TS__Number(value)
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
        return value and 1 or 0
    else
        return 0 / 0
    end
end

local function __TS__NumberIsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

local function __TS__NumberIsNaN(value)
    return value ~= value
end

local __TS__NumberToString
do
    local radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
    function __TS__NumberToString(self, radix)
        if radix == nil or radix == 10 or self == math.huge or self == -math.huge or self ~= self then
            return tostring(self)
        end
        radix = math.floor(radix)
        if radix < 2 or radix > 36 then
            error("toString() radix argument must be between 2 and 36", 0)
        end
        local integer, fraction = math.modf(math.abs(self))
        local result = ""
        if radix == 8 then
            result = string.format("%o", integer)
        elseif radix == 16 then
            result = string.format("%x", integer)
        else
            repeat
                do
                    result = __TS__StringAccess(radixChars, integer % radix) .. result
                    integer = math.floor(integer / radix)
                end
            until not (integer ~= 0)
        end
        if fraction ~= 0 then
            result = result .. "."
            local delta = 1e-16
            repeat
                do
                    fraction = fraction * radix
                    delta = delta * radix
                    local digit = math.floor(fraction)
                    result = result .. __TS__StringAccess(radixChars, digit)
                    fraction = fraction - digit
                end
            until not (fraction >= delta)
        end
        if self < 0 then
            result = "-" .. result
        end
        return result
    end
end

local function __TS__ObjectDefineProperty(target, key, desc)
    local ____temp_0
    if type(key) == "number" then
        ____temp_0 = key + 1
    else
        ____temp_0 = key
    end
    local luaKey = ____temp_0
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = desc.get ~= nil or desc.set ~= nil
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
        local ____desc_set_5 = desc.set
        local ____desc_get_6 = desc.get
        local ____temp_1
        if desc.configurable ~= nil then
            ____temp_1 = desc.configurable
        else
            ____temp_1 = valueExists
        end
        local ____temp_2
        if desc.enumerable ~= nil then
            ____temp_2 = desc.enumerable
        else
            ____temp_2 = valueExists
        end
        local ____temp_3
        if desc.writable ~= nil then
            ____temp_3 = desc.writable
        else
            ____temp_3 = valueExists
        end
        local ____temp_4
        if desc.value ~= nil then
            ____temp_4 = desc.value
        else
            ____temp_4 = value
        end
        descriptor = {
            set = ____desc_set_5,
            get = ____desc_get_6,
            configurable = ____temp_1,
            enumerable = ____temp_2,
            writable = ____temp_3,
            value = ____temp_4
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

local function __TS__ObjectEntries(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = {key, obj[key]}
    end
    return result
end

local function __TS__ObjectFromEntries(entries)
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

local function __TS__ObjectKeys(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = key
    end
    return result
end

local function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

local function __TS__ObjectValues(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = obj[key]
    end
    return result
end

local function __TS__ParseFloat(numberString)
    local infinityMatch = string.match(numberString, "^%s*(-?Infinity)")
    if infinityMatch then
        local ____temp_0
        if __TS__StringAccess(infinityMatch, 0) == "-" then
            ____temp_0 = -math.huge
        else
            ____temp_0 = math.huge
        end
        return ____temp_0
    end
    local number = tonumber(string.match(numberString, "^%s*(-?%d+%.?%d*)"))
    return number or 0 / 0
end

local function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if length ~= length or length <= 0 then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

local function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if ____end ~= nil and start > ____end then
        start, ____end = ____end, start
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

local __TS__ParseInt
do
    local parseIntBasePattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
    function __TS__ParseInt(numberString, base)
        if base == nil then
            base = 10
            local hexMatch = string.match(numberString, "^%s*-?0[xX]")
            if hexMatch then
                base = 16
                local ____string_match_result__0_0
                if string.match(hexMatch, "-") then
                    ____string_match_result__0_0 = "-" .. __TS__StringSubstr(numberString, #hexMatch)
                else
                    ____string_match_result__0_0 = __TS__StringSubstr(numberString, #hexMatch)
                end
                numberString = ____string_match_result__0_0
            end
        end
        if base < 2 or base > 36 then
            return 0 / 0
        end
        local ____temp_1
        if base <= 10 then
            ____temp_1 = __TS__StringSubstring(parseIntBasePattern, 0, base)
        else
            ____temp_1 = __TS__StringSubstr(parseIntBasePattern, 0, 10 + 2 * (base - 10))
        end
        local allowedDigits = ____temp_1
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
end

local function __TS__PromiseAll(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = item.value
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = item
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = data
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        reject(nil, reason)
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAllSettled(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = {status = "fulfilled", value = item.value}
            elseif item.state == 2 then
                results[i + 1] = {status = "rejected", reason = item.rejectionReason}
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = {status = "fulfilled", value = item}
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = {status = "fulfilled", value = data}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        results[index + 1] = {status = "rejected", reason = reason}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAny(iterable)
    local rejections = {}
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                __TS__ArrayPush(rejections, item.rejectionReason)
            else
                __TS__ArrayPush(pending, item)
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    if #pending == 0 then
        return __TS__Promise.reject("No promises to resolve with .any()")
    end
    local numResolved = 0
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, data)
                        resolve(nil, data)
                    end,
                    function(____, reason)
                        __TS__ArrayPush(rejections, reason)
                        numResolved = numResolved + 1
                        if numResolved == #pending then
                            reject(nil, {name = "AggregateError", message = "All Promises rejected", errors = rejections})
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseRace(iterable)
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                __TS__ArrayPush(pending, item)
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, value) return resolve(nil, value) end,
                    function(____, reason) return reject(nil, reason) end
                )
            end
        end
    )
end

local Set
do
    Set = __TS__Class()
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
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, key, key, self)
        end
    end
    function Set.prototype.has(self, value)
        return self.nextKey[value] ~= nil or self.lastKey == value
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
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = select("#", ...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = select("#", ...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local _unpack = unpack or table.unpack
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

local WeakMap
do
    WeakMap = __TS__Class()
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
end

local WeakSet
do
    WeakSet = __TS__Class()
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
end

local function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        local originalTraceback = debug.traceback
        _G.__TS__originalTraceback = originalTraceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = originalTraceback()
            else
                trace = originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(nil, file .. ".lua", file .. ".ts", line) end
            )
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return replacer(nil, file, "unknown", line) end
            )
            return result
        end
    end
end

local function __TS__Spread(iterable)
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

local function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

local function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    return string.byte(self, index + 1) or 0 / 0
end

local function __TS__StringConcat(str1, ...)
    local args = {...}
    local out = str1
    for ____, arg in ipairs(args) do
        out = out .. arg
    end
    return out
end

local function __TS__StringEndsWith(self, searchString, endPosition)
    if endPosition == nil or endPosition > #self then
        endPosition = #self
    end
    return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
end

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return self .. string.sub(
        fillString,
        1,
        math.floor(maxLength)
    )
end

local function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return string.sub(
        fillString,
        1,
        math.floor(maxLength)
    ) .. self
end

local function __TS__StringReplace(source, searchValue, replaceValue)
    local startPos, endPos = string.find(source, searchValue, nil, true)
    if not startPos then
        return source
    end
    local sub = string.sub
    local before = sub(source, 1, startPos - 1)
    local ____temp_0
    if type(replaceValue) == "string" then
        ____temp_0 = replaceValue
    else
        ____temp_0 = replaceValue(nil, searchValue, startPos - 1, source)
    end
    local replacement = ____temp_0
    local after = sub(source, endPos + 1)
    return (before .. replacement) .. after
end

local function __TS__StringReplaceAll(source, searchValue, replaceValue)
    local replacer
    if type(replaceValue) == "string" then
        replacer = function() return replaceValue end
    else
        replacer = replaceValue
    end
    local parts = {}
    local partsIndex = 1
    local sub = string.sub
    if #searchValue == 0 then
        parts[1] = replacer(nil, "", 0, source)
        partsIndex = 2
        for i = 1, #source do
            parts[partsIndex] = sub(source, i, i)
            parts[partsIndex + 1] = replacer(nil, "", i, source)
            partsIndex = partsIndex + 2
        end
    else
        local find = string.find
        local currentPos = 1
        while true do
            local startPos, endPos = find(source, searchValue, currentPos, true)
            if not startPos then
                break
            end
            parts[partsIndex] = sub(source, currentPos, startPos - 1)
            parts[partsIndex + 1] = replacer(nil, searchValue, startPos - 1, source)
            partsIndex = partsIndex + 2
            currentPos = endPos + 1
        end
        parts[partsIndex] = sub(source, currentPos)
    end
    return table.concat(parts)
end

local function __TS__StringSlice(self, start, ____end)
    if start == nil or start ~= start then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

local function __TS__StringSplit(source, separator, limit)
    if limit == nil then
        limit = 4294967295
    end
    if limit == 0 then
        return {}
    end
    local out = {}
    local index = 0
    local count = 0
    if separator == nil or separator == "" then
        while index < #source - 1 and count < limit do
            out[count + 1] = __TS__StringAccess(source, index)
            count = count + 1
            index = index + 1
        end
    else
        local separatorLength = #separator
        local nextIndex = (string.find(source, separator, nil, true) or 0) - 1
        while nextIndex >= 0 and count < limit do
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

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

local function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

local function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

local __TS__SymbolRegistryFor, __TS__SymbolRegistryKeyFor
do
    local symbolRegistry = {}
    function __TS__SymbolRegistryFor(key)
        if not symbolRegistry[key] then
            symbolRegistry[key] = __TS__Symbol(key)
        end
        return symbolRegistry[key]
    end
    function __TS__SymbolRegistryKeyFor(sym)
        for key in pairs(symbolRegistry) do
            if symbolRegistry[key] == sym then
                return key
            end
        end
    end
end

local function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

return {
  __TS__ArrayConcat = __TS__ArrayConcat,
  __TS__ArrayEntries = __TS__ArrayEntries,
  __TS__ArrayEvery = __TS__ArrayEvery,
  __TS__ArrayFilter = __TS__ArrayFilter,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__ArrayFind = __TS__ArrayFind,
  __TS__ArrayFindIndex = __TS__ArrayFindIndex,
  __TS__ArrayFrom = __TS__ArrayFrom,
  __TS__ArrayIncludes = __TS__ArrayIncludes,
  __TS__ArrayIndexOf = __TS__ArrayIndexOf,
  __TS__ArrayIsArray = __TS__ArrayIsArray,
  __TS__ArrayJoin = __TS__ArrayJoin,
  __TS__ArrayMap = __TS__ArrayMap,
  __TS__ArrayPush = __TS__ArrayPush,
  __TS__ArrayReduce = __TS__ArrayReduce,
  __TS__ArrayReduceRight = __TS__ArrayReduceRight,
  __TS__ArrayReverse = __TS__ArrayReverse,
  __TS__ArrayShift = __TS__ArrayShift,
  __TS__ArrayUnshift = __TS__ArrayUnshift,
  __TS__ArraySort = __TS__ArraySort,
  __TS__ArraySlice = __TS__ArraySlice,
  __TS__ArraySome = __TS__ArraySome,
  __TS__ArraySplice = __TS__ArraySplice,
  __TS__ArrayToObject = __TS__ArrayToObject,
  __TS__ArrayFlat = __TS__ArrayFlat,
  __TS__ArrayFlatMap = __TS__ArrayFlatMap,
  __TS__ArraySetLength = __TS__ArraySetLength,
  __TS__AsyncAwaiter = __TS__AsyncAwaiter,
  __TS__Await = __TS__Await,
  __TS__Class = __TS__Class,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__CloneDescriptor = __TS__CloneDescriptor,
  __TS__Decorate = __TS__Decorate,
  __TS__DecorateParam = __TS__DecorateParam,
  __TS__Delete = __TS__Delete,
  __TS__DelegatedYield = __TS__DelegatedYield,
  Error = Error,
  RangeError = RangeError,
  ReferenceError = ReferenceError,
  SyntaxError = SyntaxError,
  TypeError = TypeError,
  URIError = URIError,
  __TS__FunctionBind = __TS__FunctionBind,
  __TS__Generator = __TS__Generator,
  __TS__InstanceOf = __TS__InstanceOf,
  __TS__InstanceOfObject = __TS__InstanceOfObject,
  __TS__Iterator = __TS__Iterator,
  Map = Map,
  __TS__MathAtan2 = __TS__MathAtan2,
  __TS__MathSign = __TS__MathSign,
  __TS__New = __TS__New,
  __TS__Number = __TS__Number,
  __TS__NumberIsFinite = __TS__NumberIsFinite,
  __TS__NumberIsNaN = __TS__NumberIsNaN,
  __TS__NumberToString = __TS__NumberToString,
  __TS__ObjectAssign = __TS__ObjectAssign,
  __TS__ObjectDefineProperty = __TS__ObjectDefineProperty,
  __TS__ObjectEntries = __TS__ObjectEntries,
  __TS__ObjectFromEntries = __TS__ObjectFromEntries,
  __TS__ObjectGetOwnPropertyDescriptor = __TS__ObjectGetOwnPropertyDescriptor,
  __TS__ObjectGetOwnPropertyDescriptors = __TS__ObjectGetOwnPropertyDescriptors,
  __TS__ObjectKeys = __TS__ObjectKeys,
  __TS__ObjectRest = __TS__ObjectRest,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__ParseInt = __TS__ParseInt,
  __TS__Promise = __TS__Promise,
  __TS__PromiseAll = __TS__PromiseAll,
  __TS__PromiseAllSettled = __TS__PromiseAllSettled,
  __TS__PromiseAny = __TS__PromiseAny,
  __TS__PromiseRace = __TS__PromiseRace,
  Set = Set,
  __TS__SetDescriptor = __TS__SetDescriptor,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread,
  WeakMap = WeakMap,
  WeakSet = WeakSet,
  __TS__SourceMapTraceBack = __TS__SourceMapTraceBack,
  __TS__Spread = __TS__Spread,
  __TS__StringAccess = __TS__StringAccess,
  __TS__StringCharAt = __TS__StringCharAt,
  __TS__StringCharCodeAt = __TS__StringCharCodeAt,
  __TS__StringConcat = __TS__StringConcat,
  __TS__StringEndsWith = __TS__StringEndsWith,
  __TS__StringIncludes = __TS__StringIncludes,
  __TS__StringPadEnd = __TS__StringPadEnd,
  __TS__StringPadStart = __TS__StringPadStart,
  __TS__StringReplace = __TS__StringReplace,
  __TS__StringReplaceAll = __TS__StringReplaceAll,
  __TS__StringSlice = __TS__StringSlice,
  __TS__StringSplit = __TS__StringSplit,
  __TS__StringStartsWith = __TS__StringStartsWith,
  __TS__StringSubstr = __TS__StringSubstr,
  __TS__StringSubstring = __TS__StringSubstring,
  __TS__StringTrim = __TS__StringTrim,
  __TS__StringTrimEnd = __TS__StringTrimEnd,
  __TS__StringTrimStart = __TS__StringTrimStart,
  __TS__Symbol = __TS__Symbol,
  Symbol = Symbol,
  __TS__SymbolRegistryFor = __TS__SymbolRegistryFor,
  __TS__SymbolRegistryKeyFor = __TS__SymbolRegistryKeyFor,
  __TS__TypeOf = __TS__TypeOf,
  __TS__Unpack = __TS__Unpack
}
 end,
["src.lib.Serilog.Serilog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__New = ____lualib.__TS__New
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
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
        while true do
            match = {matcher()}
            if not match then
                break
            end
            do
                local s, e = string.find(message, match, 1, true)
                if not s or not e then
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
["src.lib.Serilog.Sinks.StringSink"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
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
                message = message .. event.Text
            elseif event.Type == LogEventType.Parameter then
                local whichType = type(event.Value)
                local color = ____exports.StringSink.Colors[whichType]
                if color then
                    message = message .. "|cff" .. color
                end
                if ____exports.StringSink.Brackets[whichType] then
                    message = message .. "{ "
                end
                message = message .. tostring(event.Value)
                if ____exports.StringSink.Brackets[whichType] then
                    message = message .. " }"
                end
                if color then
                    message = message .. "|r"
                end
            end
            index = index + 1
        end
    end
    self.printer(string.format("[%s]: %s", ____exports.StringSink.Prefix[level], message))
end
StringSink.Prefix = {
    [LogLevel.None] = "|cffffffffNON|r",
    [LogLevel.Verbose] = "|cff9d9d9dVRB|r",
    [LogLevel.Debug] = "|cff9d9d9dDBG|r",
    [LogLevel.Information] = "|cffe6cc80INF|r",
    [LogLevel.Warning] = "|cffffcc00WRN|r",
    [LogLevel.Error] = "|cffff8000ERR|r",
    [LogLevel.Fatal] = "|cffff0000FTL|r"
}
StringSink.Colors = {
    ["nil"] = "9d9d9d",
    boolean = "1eff00",
    number = "00ccff",
    string = "ff8000",
    table = "ffcc00",
    ["function"] = "ffcc00",
    userdata = "ffcc00"
}
StringSink.Brackets = {
    ["nil"] = false,
    boolean = false,
    number = false,
    string = false,
    table = true,
    ["function"] = true,
    userdata = true
}
return ____exports
 end,
["src.Utility.Node"] = function(...) 
local ____exports = {}
return ____exports
 end,
["src.Utility.LinkedList"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
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
["lua_modules.w3ts.handles.handle"] = function(...) 
local ____lualib = require("lualib_bundle")
local WeakMap = ____lualib.WeakMap
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local map = __TS__New(WeakMap)
____exports.Handle = __TS__Class()
local Handle = ____exports.Handle
Handle.name = "Handle"
function Handle.prototype.____constructor(self, handle)
    local ____self_1 = self
    local ____temp_0
    if handle == nil then
        ____temp_0 = ____exports.Handle.initHandle
    else
        ____temp_0 = handle
    end
    ____self_1.handle = ____temp_0
    map:set(self.handle, self)
end
__TS__SetDescriptor(
    Handle.prototype,
    "id",
    {get = function(self)
        return GetHandleId(self.handle)
    end},
    true
)
function Handle.initFromHandle(self)
    return ____exports.Handle.initHandle ~= nil
end
function Handle.getObject(self, handle)
    local obj = map:get(handle)
    if obj ~= nil then
        return obj
    end
    ____exports.Handle.initHandle = handle
    local newObj = __TS__New(self)
    ____exports.Handle.initHandle = nil
    return newObj
end
return ____exports
 end,
["lua_modules.w3ts.handles.point"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Point = __TS__Class()
local Point = ____exports.Point
Point.name = "Point"
__TS__ClassExtends(Point, Handle)
function Point.prototype.____constructor(self, x, y)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            Location(x, y)
        )
    end
end
__TS__SetDescriptor(
    Point.prototype,
    "x",
    {
        get = function(self)
            return GetLocationX(self.handle)
        end,
        set = function(self, value)
            MoveLocation(self.handle, value, self.y)
        end
    },
    true
)
__TS__SetDescriptor(
    Point.prototype,
    "y",
    {
        get = function(self)
            return GetLocationY(self.handle)
        end,
        set = function(self, value)
            MoveLocation(self.handle, self.x, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Point.prototype,
    "z",
    {get = function(self)
        return GetLocationZ(self.handle)
    end},
    true
)
function Point.prototype.destroy(self)
    RemoveLocation(self.handle)
end
function Point.prototype.setPosition(self, x, y)
    MoveLocation(self.handle, x, y)
end
function Point.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.camera"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____point = require("lua_modules.w3ts.handles.point")
local Point = ____point.Point
____exports.Camera = __TS__Class()
local Camera = ____exports.Camera
Camera.name = "Camera"
function Camera.prototype.____constructor(self)
end
__TS__ObjectDefineProperty(
    Camera,
    "visible",
    {
        get = function(self)
            return IsCineFilterDisplayed()
        end,
        set = function(self, flag)
            DisplayCineFilter(flag)
        end
    }
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMinX",
    {get = function(self)
        return GetCameraBoundMinX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMinY",
    {get = function(self)
        return GetCameraBoundMinY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMaxX",
    {get = function(self)
        return GetCameraBoundMaxX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMaxY",
    {get = function(self)
        return GetCameraBoundMaxY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetX",
    {get = function(self)
        return GetCameraTargetPositionX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetY",
    {get = function(self)
        return GetCameraTargetPositionY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetZ",
    {get = function(self)
        return GetCameraTargetPositionZ()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeX",
    {get = function(self)
        return GetCameraEyePositionX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeY",
    {get = function(self)
        return GetCameraEyePositionY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeZ",
    {get = function(self)
        return GetCameraEyePositionZ()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyePoint",
    {get = function(self)
        return Point:fromHandle(GetCameraEyePositionLoc())
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetPoint",
    {get = function(self)
        return Point:fromHandle(GetCameraTargetPositionLoc())
    end}
)
function Camera.adjustField(self, whichField, offset, duration)
    AdjustCameraField(whichField, offset, duration)
end
function Camera.endCinematicScene(self)
    EndCinematicScene()
end
function Camera.forceCinematicSubtitles(self, flag)
    ForceCinematicSubtitles(flag)
end
function Camera.getField(self, field)
    return GetCameraField(field)
end
function Camera.getMargin(self, whichMargin)
    return GetCameraMargin(whichMargin)
end
function Camera.pan(self, x, y, zOffsetDest)
    if not zOffsetDest then
        PanCameraTo(x, y)
    else
        PanCameraToWithZ(x, y, zOffsetDest)
    end
end
function Camera.panTimed(self, x, y, duration, zOffsetDest)
    if not zOffsetDest then
        PanCameraToTimed(x, y, duration)
    else
        PanCameraToTimedWithZ(x, y, zOffsetDest, duration)
    end
end
function Camera.reset(self, duration)
    ResetToGameCamera(duration)
end
function Camera.setBounds(self, x1, y1, x2, y2, x3, y3, x4, y4)
    SetCameraBounds(
        x1,
        y1,
        x2,
        y2,
        x3,
        y3,
        x4,
        y4
    )
end
function Camera.setCameraOrientController(self, whichUnit, xOffset, yOffset)
    SetCameraOrientController(whichUnit, xOffset, yOffset)
end
function Camera.setCineFilterBlendMode(self, whichMode)
    SetCineFilterBlendMode(whichMode)
end
function Camera.setCineFilterDuration(self, duration)
    SetCineFilterDuration(duration)
end
function Camera.setCineFilterEndColor(self, red, green, blue, alpha)
    SetCineFilterEndColor(red, green, blue, alpha)
end
function Camera.setCineFilterEndUV(self, minU, minV, maxU, maxV)
    SetCineFilterEndUV(minU, minV, maxU, maxV)
end
function Camera.setCineFilterStartColor(self, red, green, blue, alpha)
    SetCineFilterStartColor(red, green, blue, alpha)
end
function Camera.setCineFilterStartUV(self, minU, minV, maxU, maxV)
    SetCineFilterStartUV(minU, minV, maxU, maxV)
end
function Camera.setCineFilterTexMapFlags(self, whichFlags)
    SetCineFilterTexMapFlags(whichFlags)
end
function Camera.setCineFilterTexture(self, fileName)
    SetCineFilterTexture(fileName)
end
function Camera.setCinematicAudio(self, cinematicAudio)
    SetCinematicAudio(cinematicAudio)
end
function Camera.setCinematicCamera(self, cameraModelFile)
    SetCinematicCamera(cameraModelFile)
end
function Camera.SetCinematicScene(self, portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
    SetCinematicScene(
        portraitUnitId,
        color,
        speakerTitle,
        text,
        sceneDuration,
        voiceoverDuration
    )
end
function Camera.setDepthOfFieldScale(self, scale)
    CameraSetDepthOfFieldScale(scale)
end
function Camera.setField(self, whichField, value, duration)
    SetCameraField(whichField, value, duration)
end
function Camera.setFocalDistance(self, distance)
    CameraSetFocalDistance(distance)
end
function Camera.setPos(self, x, y)
    SetCameraPosition(x, y)
end
function Camera.setRotateMode(self, x, y, radiansToSweep, duration)
    SetCameraRotateMode(x, y, radiansToSweep, duration)
end
function Camera.setSmoothingFactor(self, factor)
    CameraSetSmoothingFactor(factor)
end
function Camera.setSourceNoise(self, mag, velocity, vertOnly)
    if vertOnly == nil then
        vertOnly = false
    end
    CameraSetSourceNoiseEx(mag, velocity, vertOnly)
end
function Camera.setTargetController(self, whichUnit, xOffset, yOffset, inheritOrientation)
    SetCameraTargetController(whichUnit, xOffset, yOffset, inheritOrientation)
end
function Camera.setTargetNoise(self, mag, velocity, vertOnly)
    if vertOnly == nil then
        vertOnly = false
    end
    CameraSetTargetNoiseEx(mag, velocity, vertOnly)
end
function Camera.stop(self)
    StopCamera()
end
____exports.CameraSetup = __TS__Class()
local CameraSetup = ____exports.CameraSetup
CameraSetup.name = "CameraSetup"
__TS__ClassExtends(CameraSetup, Handle)
function CameraSetup.prototype.____constructor(self)
    local ____self_1 = self
    local ____Handle_initFromHandle_result_0
    if Handle:initFromHandle() then
        ____Handle_initFromHandle_result_0 = nil
    else
        ____Handle_initFromHandle_result_0 = CreateCameraSetup()
    end
    Handle.prototype.____constructor(____self_1, ____Handle_initFromHandle_result_0)
end
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destPoint",
    {get = function(self)
        return Point:fromHandle(CameraSetupGetDestPositionLoc(self.handle))
    end},
    true
)
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destX",
    {
        get = function(self)
            return CameraSetupGetDestPositionX(self.handle)
        end,
        set = function(self, x)
            CameraSetupSetDestPosition(self.handle, x, self.destY, 0)
        end
    },
    true
)
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destY",
    {
        get = function(self)
            return CameraSetupGetDestPositionY(self.handle)
        end,
        set = function(self, y)
            CameraSetupSetDestPosition(self.handle, self.destX, y, 0)
        end
    },
    true
)
__TS__SetDescriptor(
    CameraSetup.prototype,
    "label",
    {
        get = function(self)
            return BlzCameraSetupGetLabel(self.handle)
        end,
        set = function(self, label)
            BlzCameraSetupSetLabel(self.handle, label)
        end
    },
    true
)
function CameraSetup.prototype.apply(self, doPan, panTimed)
    CameraSetupApply(self.handle, doPan, panTimed)
end
function CameraSetup.prototype.applyForceDuration(self, doPan, forceDuration)
    CameraSetupApplyForceDuration(self.handle, doPan, forceDuration)
end
function CameraSetup.prototype.applyForceDurationSmooth(self, doPan, forcedDuration, easeInDuration, easeOutDuration, smoothFactor)
    BlzCameraSetupApplyForceDurationSmooth(
        self.handle,
        doPan,
        forcedDuration,
        easeInDuration,
        easeOutDuration,
        smoothFactor
    )
end
function CameraSetup.prototype.applyForceDurationZ(self, zDestOffset, forceDuration)
    CameraSetupApplyForceDurationWithZ(self.handle, zDestOffset, forceDuration)
end
function CameraSetup.prototype.applyZ(self, zDestOffset)
    CameraSetupApplyWithZ(self.handle, zDestOffset)
end
function CameraSetup.prototype.getField(self, whichField)
    return CameraSetupGetField(self.handle, whichField)
end
function CameraSetup.prototype.setDestPos(self, x, y, duration)
    CameraSetupSetDestPosition(self.handle, x, y, duration)
end
function CameraSetup.prototype.setField(self, whichField, value, duration)
    CameraSetupSetField(self.handle, whichField, value, duration)
end
function CameraSetup.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.widget"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Widget = __TS__Class()
local Widget = ____exports.Widget
Widget.name = "Widget"
__TS__ClassExtends(Widget, Handle)
__TS__SetDescriptor(
    Widget.prototype,
    "life",
    {
        get = function(self)
            return GetWidgetLife(self.handle)
        end,
        set = function(self, value)
            SetWidgetLife(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Widget.prototype,
    "x",
    {get = function(self)
        return GetWidgetX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Widget.prototype,
    "y",
    {get = function(self)
        return GetWidgetY(self.handle)
    end},
    true
)
function Widget.fromEvent(self)
    return self:fromHandle(GetTriggerWidget())
end
function Widget.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.destructable"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____widget = require("lua_modules.w3ts.handles.widget")
local Widget = ____widget.Widget
____exports.Destructable = __TS__Class()
local Destructable = ____exports.Destructable
Destructable.name = "Destructable"
__TS__ClassExtends(Destructable, Widget)
function Destructable.prototype.____constructor(self, objectId, x, y, z, face, scale, varation)
    if Handle:initFromHandle() then
        Widget.prototype.____constructor(self)
    else
        Widget.prototype.____constructor(
            self,
            CreateDestructableZ(
                objectId,
                x,
                y,
                z,
                face,
                scale,
                varation
            )
        )
    end
end
__TS__SetDescriptor(
    Destructable.prototype,
    "invulnerable",
    {
        get = function(self)
            return IsDestructableInvulnerable(self.handle)
        end,
        set = function(self, flag)
            SetDestructableInvulnerable(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "life",
    {
        get = function(self)
            return GetDestructableLife(self.handle)
        end,
        set = function(self, value)
            SetDestructableLife(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "maxLife",
    {
        get = function(self)
            return GetDestructableMaxLife(self.handle)
        end,
        set = function(self, value)
            SetDestructableMaxLife(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "name",
    {get = function(self)
        return GetDestructableName(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "occluderHeight",
    {
        get = function(self)
            return GetDestructableOccluderHeight(self.handle)
        end,
        set = function(self, value)
            SetDestructableOccluderHeight(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "typeId",
    {get = function(self)
        return GetDestructableTypeId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "x",
    {get = function(self)
        return GetDestructableX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "y",
    {get = function(self)
        return GetDestructableY(self.handle)
    end},
    true
)
function Destructable.prototype.destroy(self)
    RemoveDestructable(self.handle)
end
function Destructable.prototype.heal(self, life, birth)
    DestructableRestoreLife(self.handle, life, birth)
end
function Destructable.prototype.kill(self)
    KillDestructable(self.handle)
end
function Destructable.prototype.queueAnim(self, whichAnimation)
    QueueDestructableAnimation(self.handle, whichAnimation)
end
function Destructable.prototype.setAnim(self, whichAnimation)
    SetDestructableAnimation(self.handle, whichAnimation)
end
function Destructable.prototype.setAnimSpeed(self, speedFactor)
    SetDestructableAnimationSpeed(self.handle, speedFactor)
end
function Destructable.prototype.show(self, flag)
    ShowDestructable(self.handle, flag)
end
function Destructable.fromEvent(self)
    return self:fromHandle(GetTriggerDestructable())
end
function Destructable.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.force"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____player = require("lua_modules.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
____exports.Force = __TS__Class()
local Force = ____exports.Force
Force.name = "Force"
__TS__ClassExtends(Force, Handle)
function Force.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateForce()
        )
    end
end
function Force.prototype.addPlayer(self, whichPlayer)
    ForceAddPlayer(self.handle, whichPlayer.handle)
end
function Force.prototype.clear(self)
    ForceClear(self.handle)
end
function Force.prototype.destroy(self)
    DestroyForce(self.handle)
end
function Force.prototype.enumAllies(self, whichPlayer, filter)
    local ____ForceEnumAllies_3 = ForceEnumAllies
    local ____self_handle_1 = self.handle
    local ____whichPlayer_handle_2 = whichPlayer.handle
    local ____temp_0
    if type(filter) == "function" then
        ____temp_0 = Filter(filter)
    else
        ____temp_0 = filter
    end
    ____ForceEnumAllies_3(____self_handle_1, ____whichPlayer_handle_2, ____temp_0)
end
function Force.prototype.enumEnemies(self, whichPlayer, filter)
    local ____ForceEnumEnemies_7 = ForceEnumEnemies
    local ____self_handle_5 = self.handle
    local ____whichPlayer_handle_6 = whichPlayer.handle
    local ____temp_4
    if type(filter) == "function" then
        ____temp_4 = Filter(filter)
    else
        ____temp_4 = filter
    end
    ____ForceEnumEnemies_7(____self_handle_5, ____whichPlayer_handle_6, ____temp_4)
end
function Force.prototype.enumPlayers(self, filter)
    local ____ForceEnumPlayers_10 = ForceEnumPlayers
    local ____self_handle_9 = self.handle
    local ____temp_8
    if type(filter) == "function" then
        ____temp_8 = Filter(filter)
    else
        ____temp_8 = filter
    end
    ____ForceEnumPlayers_10(____self_handle_9, ____temp_8)
end
function Force.prototype.enumPlayersCounted(self, filter, countLimit)
    local ____ForceEnumPlayersCounted_13 = ForceEnumPlayersCounted
    local ____self_handle_12 = self.handle
    local ____temp_11
    if type(filter) == "function" then
        ____temp_11 = Filter(filter)
    else
        ____temp_11 = filter
    end
    ____ForceEnumPlayersCounted_13(____self_handle_12, ____temp_11, countLimit)
end
Force.prototype["for"] = function(self, callback)
    ForForce(self.handle, callback)
end
function Force.prototype.getPlayers(self)
    local players = {}
    ForForce(
        self.handle,
        function() return __TS__ArrayPush(
            players,
            MapPlayer:fromEnum()
        ) end
    )
    return players
end
function Force.prototype.hasPlayer(self, whichPlayer)
    return IsPlayerInForce(whichPlayer.handle, self.handle)
end
function Force.prototype.removePlayer(self, whichPlayer)
    ForceRemovePlayer(self.handle, whichPlayer.handle)
end
function Force.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.player"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.MapPlayer = __TS__Class()
local MapPlayer = ____exports.MapPlayer
MapPlayer.name = "MapPlayer"
__TS__ClassExtends(MapPlayer, Handle)
function MapPlayer.prototype.____constructor(self, index)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            Player(index)
        )
    end
end
__TS__SetDescriptor(
    MapPlayer.prototype,
    "color",
    {
        get = function(self)
            return GetPlayerColor(self.handle)
        end,
        set = function(self, color)
            SetPlayerColor(self.handle, color)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "controller",
    {get = function(self)
        return GetPlayerController(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "handicap",
    {
        get = function(self)
            return GetPlayerHandicap(self.handle)
        end,
        set = function(self, handicap)
            SetPlayerHandicap(self.handle, handicap)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "handicapXp",
    {
        get = function(self)
            return GetPlayerHandicapXP(self.handle)
        end,
        set = function(self, handicap)
            SetPlayerHandicapXP(self.handle, handicap)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "id",
    {get = function(self)
        return GetPlayerId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "name",
    {
        get = function(self)
            return GetPlayerName(self.handle)
        end,
        set = function(self, value)
            SetPlayerName(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "race",
    {get = function(self)
        return GetPlayerRace(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "slotState",
    {get = function(self)
        return GetPlayerSlotState(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocation",
    {get = function(self)
        return GetPlayerStartLocation(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationX",
    {get = function(self)
        return GetStartLocationX(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationY",
    {get = function(self)
        return GetStartLocationY(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationPoint",
    {get = function(self)
        return GetStartLocationLoc(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "team",
    {get = function(self)
        return GetPlayerTeam(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "townHallCount",
    {get = function(self)
        return BlzGetPlayerTownHallCount(self.handle)
    end},
    true
)
function MapPlayer.prototype.addTechResearched(self, techId, levels)
    AddPlayerTechResearched(self.handle, techId, levels)
end
function MapPlayer.prototype.decTechResearched(self, techId, levels)
    BlzDecPlayerTechResearched(self.handle, techId, levels)
end
function MapPlayer.prototype.cacheHeroData(self)
    CachePlayerHeroData(self.handle)
end
function MapPlayer.prototype.compareAlliance(self, otherPlayer, whichAllianceSetting)
    return GetPlayerAlliance(self.handle, otherPlayer.handle, whichAllianceSetting)
end
function MapPlayer.prototype.coordsFogged(self, x, y)
    return IsFoggedToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.coordsMasked(self, x, y)
    return IsMaskedToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.coordsVisible(self, x, y)
    return IsVisibleToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.cripple(self, toWhichPlayers, flag)
    CripplePlayer(self.handle, toWhichPlayers.handle, flag)
end
function MapPlayer.prototype.getScore(self, whichPlayerScore)
    return GetPlayerScore(self.handle, whichPlayerScore)
end
function MapPlayer.prototype.getState(self, whichPlayerState)
    return GetPlayerState(self.handle, whichPlayerState)
end
function MapPlayer.prototype.getStructureCount(self, includeIncomplete)
    return GetPlayerStructureCount(self.handle, includeIncomplete)
end
function MapPlayer.prototype.getTaxRate(self, otherPlayer, whichResource)
    return GetPlayerTaxRate(self.handle, otherPlayer, whichResource)
end
function MapPlayer.prototype.getTechCount(self, techId, specificonly)
    return GetPlayerTechCount(self.handle, techId, specificonly)
end
function MapPlayer.prototype.getTechMaxAllowed(self, techId)
    return GetPlayerTechMaxAllowed(self.handle, techId)
end
function MapPlayer.prototype.getTechResearched(self, techId, specificonly)
    return GetPlayerTechResearched(self.handle, techId, specificonly)
end
function MapPlayer.prototype.getUnitCount(self, includeIncomplete)
    return GetPlayerUnitCount(self.handle, includeIncomplete)
end
function MapPlayer.prototype.getUnitCountByType(self, unitName, includeIncomplete, includeUpgrades)
    return GetPlayerTypedUnitCount(self.handle, unitName, includeIncomplete, includeUpgrades)
end
function MapPlayer.prototype.inForce(self, whichForce)
    return IsPlayerInForce(self.handle, whichForce.handle)
end
function MapPlayer.prototype.isLocal(self)
    return GetLocalPlayer() == self.handle
end
function MapPlayer.prototype.isObserver(self)
    return IsPlayerObserver(self.handle)
end
function MapPlayer.prototype.isPlayerAlly(self, otherPlayer)
    return IsPlayerAlly(self.handle, otherPlayer.handle)
end
function MapPlayer.prototype.isPlayerEnemy(self, otherPlayer)
    return IsPlayerEnemy(self.handle, otherPlayer.handle)
end
function MapPlayer.prototype.isRacePrefSet(self, pref)
    return IsPlayerRacePrefSet(self.handle, pref)
end
function MapPlayer.prototype.isSelectable(self)
    return GetPlayerSelectable(self.handle)
end
function MapPlayer.prototype.pointFogged(self, whichPoint)
    return IsLocationFoggedToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.pointMasked(self, whichPoint)
    return IsLocationMaskedToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.pointVisible(self, whichPoint)
    return IsLocationVisibleToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.remove(self, gameResult)
    RemovePlayer(self.handle, gameResult)
end
function MapPlayer.prototype.removeAllGuardPositions(self)
    RemoveAllGuardPositions(self.handle)
end
function MapPlayer.prototype.setAbilityAvailable(self, abilId, avail)
    SetPlayerAbilityAvailable(self.handle, abilId, avail)
end
function MapPlayer.prototype.setAlliance(self, otherPlayer, whichAllianceSetting, value)
    SetPlayerAlliance(self.handle, otherPlayer.handle, whichAllianceSetting, value)
end
function MapPlayer.prototype.setOnScoreScreen(self, flag)
    SetPlayerOnScoreScreen(self.handle, flag)
end
function MapPlayer.prototype.setState(self, whichPlayerState, value)
    SetPlayerState(self.handle, whichPlayerState, value)
end
function MapPlayer.prototype.setTaxRate(self, otherPlayer, whichResource, rate)
    SetPlayerTaxRate(self.handle, otherPlayer.handle, whichResource, rate)
end
function MapPlayer.prototype.setTechMaxAllowed(self, techId, maximum)
    SetPlayerTechMaxAllowed(self.handle, techId, maximum)
end
function MapPlayer.prototype.setTechResearched(self, techId, setToLevel)
    SetPlayerTechResearched(self.handle, techId, setToLevel)
end
function MapPlayer.prototype.setUnitsOwner(self, newOwner)
    SetPlayerUnitsOwner(self.handle, newOwner)
end
function MapPlayer.fromEnum(self)
    return ____exports.MapPlayer:fromHandle(GetEnumPlayer())
end
function MapPlayer.fromEvent(self)
    return ____exports.MapPlayer:fromHandle(GetTriggerPlayer())
end
function MapPlayer.fromFilter(self)
    return ____exports.MapPlayer:fromHandle(GetFilterPlayer())
end
function MapPlayer.fromHandle(self, handle)
    return self:getObject(handle)
end
function MapPlayer.fromIndex(self, index)
    return self:fromHandle(Player(index))
end
function MapPlayer.fromLocal(self)
    return self:fromHandle(GetLocalPlayer())
end
return ____exports
 end,
["lua_modules.w3ts.handles.dialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.DialogButton = __TS__Class()
local DialogButton = ____exports.DialogButton
DialogButton.name = "DialogButton"
__TS__ClassExtends(DialogButton, Handle)
function DialogButton.prototype.____constructor(self, whichDialog, text, hotkey, quit, score)
    if hotkey == nil then
        hotkey = 0
    end
    if quit == nil then
        quit = false
    end
    if score == nil then
        score = false
    end
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    elseif not quit then
        Handle.prototype.____constructor(
            self,
            DialogAddButton(whichDialog.handle, text, hotkey)
        )
    else
        Handle.prototype.____constructor(
            self,
            DialogAddQuitButton(whichDialog.handle, score, text, hotkey)
        )
    end
end
function DialogButton.fromHandle(self, handle)
    return self:getObject(handle)
end
____exports.Dialog = __TS__Class()
local Dialog = ____exports.Dialog
Dialog.name = "Dialog"
__TS__ClassExtends(Dialog, Handle)
function Dialog.prototype.____constructor(self)
    local ____self_1 = self
    local ____Handle_initFromHandle_result_0
    if Handle:initFromHandle() then
        ____Handle_initFromHandle_result_0 = nil
    else
        ____Handle_initFromHandle_result_0 = DialogCreate()
    end
    Handle.prototype.____constructor(____self_1, ____Handle_initFromHandle_result_0)
end
function Dialog.prototype.addButton(self, text, hotkey, quit, score)
    if hotkey == nil then
        hotkey = 0
    end
    if quit == nil then
        quit = false
    end
    if score == nil then
        score = false
    end
    return __TS__New(
        ____exports.DialogButton,
        self,
        text,
        hotkey,
        quit,
        score
    )
end
function Dialog.prototype.clear(self)
    DialogClear(self.handle)
end
function Dialog.prototype.destroy(self)
    DialogDestroy(self.handle)
end
function Dialog.prototype.display(self, whichPlayer, flag)
    DialogDisplay(whichPlayer.handle, self.handle, flag)
end
function Dialog.prototype.setMessage(self, whichMessage)
    DialogSetMessage(self.handle, whichMessage)
end
function Dialog.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.effect"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Effect = __TS__Class()
local Effect = ____exports.Effect
Effect.name = "Effect"
__TS__ClassExtends(Effect, Handle)
function Effect.prototype.____constructor(self, modelName, a, b)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    elseif type(a) == "number" and type(b) == "number" then
        Handle.prototype.____constructor(
            self,
            AddSpecialEffect(modelName, a, b)
        )
    elseif type(a) ~= "number" and type(b) == "string" then
        Handle.prototype.____constructor(
            self,
            AddSpecialEffectTarget(modelName, a.handle, b)
        )
    end
end
__TS__SetDescriptor(
    Effect.prototype,
    "scale",
    {
        get = function(self)
            return BlzGetSpecialEffectScale(self.handle)
        end,
        set = function(self, scale)
            BlzSetSpecialEffectScale(self.handle, scale)
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "x",
    {
        get = function(self)
            return BlzGetLocalSpecialEffectX(self.handle)
        end,
        set = function(self, x)
            BlzSetSpecialEffectX(self.handle, x)
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "y",
    {
        get = function(self)
            return BlzGetLocalSpecialEffectY(self.handle)
        end,
        set = function(self, y)
            BlzSetSpecialEffectY(self.handle, y)
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "z",
    {
        get = function(self)
            return BlzGetLocalSpecialEffectZ(self.handle)
        end,
        set = function(self, z)
            BlzSetSpecialEffectZ(self.handle, z)
        end
    },
    true
)
function Effect.prototype.addSubAnimation(self, subAnim)
    BlzSpecialEffectAddSubAnimation(self.handle, subAnim)
end
function Effect.prototype.clearSubAnimations(self)
    BlzSpecialEffectClearSubAnimations(self.handle)
end
function Effect.prototype.destroy(self)
    DestroyEffect(self.handle)
end
function Effect.prototype.playAnimation(self, animType)
    BlzPlaySpecialEffect(self.handle, animType)
end
function Effect.prototype.playWithTimeScale(self, animType, timeScale)
    BlzPlaySpecialEffectWithTimeScale(self.handle, animType, timeScale)
end
function Effect.prototype.removeSubAnimation(self, subAnim)
    BlzSpecialEffectRemoveSubAnimation(self.handle, subAnim)
end
function Effect.prototype.resetScaleMatrix(self)
    BlzResetSpecialEffectMatrix(self.handle)
end
function Effect.prototype.setAlpha(self, alpha)
    BlzSetSpecialEffectAlpha(self.handle, alpha)
end
function Effect.prototype.setColor(self, red, green, blue)
    BlzSetSpecialEffectColor(self.handle, red, green, blue)
end
function Effect.prototype.setColorByPlayer(self, whichPlayer)
    BlzSetSpecialEffectColorByPlayer(self.handle, whichPlayer.handle)
end
function Effect.prototype.setHeight(self, height)
    BlzSetSpecialEffectHeight(self.handle, height)
end
function Effect.prototype.setOrientation(self, yaw, pitch, roll)
    BlzSetSpecialEffectOrientation(self.handle, yaw, pitch, roll)
end
function Effect.prototype.setPitch(self, pitch)
    BlzSetSpecialEffectPitch(self.handle, pitch)
end
function Effect.prototype.setPoint(self, p)
    BlzSetSpecialEffectPositionLoc(self.handle, p.handle)
end
function Effect.prototype.setPosition(self, x, y, z)
    BlzSetSpecialEffectPosition(self.handle, x, y, z)
end
function Effect.prototype.setRoll(self, roll)
    BlzSetSpecialEffectRoll(self.handle, roll)
end
function Effect.prototype.setScaleMatrix(self, x, y, z)
    BlzSetSpecialEffectMatrixScale(self.handle, x, y, z)
end
function Effect.prototype.setTime(self, value)
    BlzSetSpecialEffectTime(self.handle, value)
end
function Effect.prototype.setTimeScale(self, timeScale)
    BlzSetSpecialEffectTimeScale(self.handle, timeScale)
end
function Effect.prototype.setYaw(self, y)
    BlzSetSpecialEffectYaw(self.handle, y)
end
function Effect.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.rect"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Rectangle = __TS__Class()
local Rectangle = ____exports.Rectangle
Rectangle.name = "Rectangle"
__TS__ClassExtends(Rectangle, Handle)
function Rectangle.prototype.____constructor(self, minX, minY, maxX, maxY)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            Rect(minX, minY, maxX, maxY)
        )
    end
end
__TS__SetDescriptor(
    Rectangle.prototype,
    "centerX",
    {get = function(self)
        return GetRectCenterX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "centerY",
    {get = function(self)
        return GetRectCenterY(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "maxX",
    {get = function(self)
        return GetRectMaxX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "maxY",
    {get = function(self)
        return GetRectMaxY(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "minX",
    {get = function(self)
        return GetRectMinX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "minY",
    {get = function(self)
        return GetRectMinY(self.handle)
    end},
    true
)
function Rectangle.prototype.destroy(self)
    RemoveRect(self.handle)
end
function Rectangle.prototype.enumDestructables(self, filter, actionFunc)
    local ____EnumDestructablesInRect_2 = EnumDestructablesInRect
    local ____self_handle_1 = self.handle
    local ____temp_0
    if type(filter) == "function" then
        ____temp_0 = Filter(filter)
    else
        ____temp_0 = filter
    end
    ____EnumDestructablesInRect_2(____self_handle_1, ____temp_0, actionFunc)
end
function Rectangle.prototype.enumItems(self, filter, actionFunc)
    local ____EnumItemsInRect_5 = EnumItemsInRect
    local ____self_handle_4 = self.handle
    local ____temp_3
    if type(filter) == "function" then
        ____temp_3 = Filter(filter)
    else
        ____temp_3 = filter
    end
    ____EnumItemsInRect_5(____self_handle_4, ____temp_3, actionFunc)
end
function Rectangle.prototype.move(self, newCenterX, newCenterY)
    MoveRectTo(self.handle, newCenterX, newCenterY)
end
function Rectangle.prototype.movePoint(self, newCenterPoint)
    MoveRectToLoc(self.handle, newCenterPoint.handle)
end
function Rectangle.prototype.setRect(self, minX, minY, maxX, maxY)
    SetRect(
        self.handle,
        minX,
        minY,
        maxX,
        maxY
    )
end
function Rectangle.prototype.setRectFromPoint(self, min, max)
    SetRectFromLoc(self.handle, min.handle, max.handle)
end
function Rectangle.fromHandle(self, handle)
    return self:getObject(handle)
end
function Rectangle.fromPoint(self, min, max)
    return self:fromHandle(RectFromLoc(min.handle, max.handle))
end
function Rectangle.getWorldBounds(self)
    return ____exports.Rectangle:fromHandle(GetWorldBounds())
end
return ____exports
 end,
["lua_modules.w3ts.handles.fogmodifier"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.FogModifier = __TS__Class()
local FogModifier = ____exports.FogModifier
FogModifier.name = "FogModifier"
__TS__ClassExtends(FogModifier, Handle)
function FogModifier.prototype.____constructor(self, forWhichPlayer, whichState, centerX, centerY, radius, useSharedVision, afterUnits)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateFogModifierRadius(
                forWhichPlayer.handle,
                whichState,
                centerX,
                centerY,
                radius,
                useSharedVision,
                afterUnits
            )
        )
    end
end
function FogModifier.prototype.destroy(self)
    DestroyFogModifier(self.handle)
end
function FogModifier.prototype.start(self)
    FogModifierStart(self.handle)
end
function FogModifier.prototype.stop(self)
    FogModifierStop(self.handle)
end
function FogModifier.fromHandle(self, handle)
    return self:getObject(handle)
end
function FogModifier.fromRect(self, forWhichPlayer, whichState, where, useSharedVision, afterUnits)
    return self:fromHandle(CreateFogModifierRect(
        forWhichPlayer.handle,
        whichState,
        where.handle,
        useSharedVision,
        afterUnits
    ))
end
return ____exports
 end,
["lua_modules.w3ts.handles.frame"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Frame = __TS__Class()
local Frame = ____exports.Frame
Frame.name = "Frame"
__TS__ClassExtends(Frame, Handle)
function Frame.prototype.____constructor(self, name, owner, priority, createContext, typeName, inherits)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        if not createContext then
            Handle.prototype.____constructor(
                self,
                BlzCreateSimpleFrame(name, owner.handle, priority)
            )
        else
            if typeName and inherits then
                Handle.prototype.____constructor(
                    self,
                    BlzCreateFrameByType(
                        typeName,
                        name,
                        owner.handle,
                        inherits,
                        createContext
                    )
                )
            else
                Handle.prototype.____constructor(
                    self,
                    BlzCreateFrame(name, owner.handle, priority, createContext)
                )
            end
        end
    end
end
__TS__SetDescriptor(
    Frame.prototype,
    "alpha",
    {
        get = function(self)
            return BlzFrameGetAlpha(self.handle)
        end,
        set = function(self, alpha)
            BlzFrameSetAlpha(self.handle, alpha)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "children",
    {get = function(self)
        local count = self.childrenCount
        local output = {}
        do
            local i = 0
            while i < count do
                __TS__ArrayPush(
                    output,
                    self:getChild(i)
                )
                i = i + 1
            end
        end
        return output
    end},
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "childrenCount",
    {get = function(self)
        return BlzFrameGetChildrenCount(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "enabled",
    {
        get = function(self)
            return BlzFrameGetEnable(self.handle)
        end,
        set = function(self, flag)
            BlzFrameSetEnable(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "height",
    {
        get = function(self)
            return BlzFrameGetHeight(self.handle)
        end,
        set = function(self, height)
            BlzFrameSetSize(self.handle, self.width, height)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "parent",
    {
        get = function(self)
            return ____exports.Frame:fromHandle(BlzFrameGetParent(self.handle))
        end,
        set = function(self, parent)
            BlzFrameSetParent(self.handle, parent.handle)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "text",
    {
        get = function(self)
            return BlzFrameGetText(self.handle)
        end,
        set = function(self, text)
            BlzFrameSetText(self.handle, text)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "textSizeLimit",
    {
        get = function(self)
            return BlzFrameGetTextSizeLimit(self.handle)
        end,
        set = function(self, size)
            BlzFrameSetTextSizeLimit(self.handle, size)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "value",
    {
        get = function(self)
            return BlzFrameGetValue(self.handle)
        end,
        set = function(self, value)
            BlzFrameSetValue(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "visible",
    {
        get = function(self)
            return BlzFrameIsVisible(self.handle)
        end,
        set = function(self, flag)
            BlzFrameSetVisible(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "width",
    {
        get = function(self)
            return BlzFrameGetWidth(self.handle)
        end,
        set = function(self, width)
            BlzFrameSetSize(self.handle, width, self.height)
        end
    },
    true
)
function Frame.prototype.addText(self, text)
    BlzFrameAddText(self.handle, text)
    return self
end
function Frame.prototype.cageMouse(self, enable)
    BlzFrameCageMouse(self.handle, enable)
    return self
end
function Frame.prototype.clearPoints(self)
    BlzFrameClearAllPoints(self.handle)
    return self
end
function Frame.prototype.click(self)
    BlzFrameClick(self.handle)
    return self
end
function Frame.prototype.destroy(self)
    BlzDestroyFrame(self.handle)
    return self
end
function Frame.prototype.getChild(self, index)
    return ____exports.Frame:fromHandle(BlzFrameGetChild(self.handle, index))
end
function Frame.prototype.setAbsPoint(self, point, x, y)
    BlzFrameSetAbsPoint(self.handle, point, x, y)
    return self
end
function Frame.prototype.setAllPoints(self, relative)
    BlzFrameSetAllPoints(self.handle, relative.handle)
    return self
end
function Frame.prototype.setAlpha(self, alpha)
    BlzFrameSetAlpha(self.handle, alpha)
    return self
end
function Frame.prototype.setEnabled(self, flag)
    BlzFrameSetEnable(self.handle, flag)
    return self
end
function Frame.prototype.setFocus(self, flag)
    BlzFrameSetFocus(self.handle, flag)
    return self
end
function Frame.prototype.setFont(self, filename, height, flags)
    BlzFrameSetFont(self.handle, filename, height, flags)
    return self
end
function Frame.prototype.setHeight(self, height)
    BlzFrameSetSize(self.handle, self.width, height)
    return self
end
function Frame.prototype.setLevel(self, level)
    BlzFrameSetLevel(self.handle, level)
    return self
end
function Frame.prototype.setMinMaxValue(self, minValue, maxValue)
    BlzFrameSetMinMaxValue(self.handle, minValue, maxValue)
    return self
end
function Frame.prototype.setModel(self, modelFile, cameraIndex)
    BlzFrameSetModel(self.handle, modelFile, cameraIndex)
    return self
end
function Frame.prototype.setParent(self, parent)
    BlzFrameSetParent(self.handle, parent.handle)
    return self
end
function Frame.prototype.setPoint(self, point, relative, relativePoint, x, y)
    BlzFrameSetPoint(
        self.handle,
        point,
        relative.handle,
        relativePoint,
        x,
        y
    )
    return self
end
function Frame.prototype.setScale(self, scale)
    BlzFrameSetScale(self.handle, scale)
    return self
end
function Frame.prototype.setSize(self, width, height)
    BlzFrameSetSize(self.handle, width, height)
    return self
end
function Frame.prototype.setSpriteAnimate(self, primaryProp, flags)
    BlzFrameSetSpriteAnimate(self.handle, primaryProp, flags)
    return self
end
function Frame.prototype.setStepSize(self, stepSize)
    BlzFrameSetStepSize(self.handle, stepSize)
    return self
end
function Frame.prototype.setText(self, text)
    BlzFrameSetText(self.handle, text)
    return self
end
function Frame.prototype.setTextColor(self, color)
    BlzFrameSetTextColor(self.handle, color)
    return self
end
function Frame.prototype.setTextSizeLimit(self, size)
    BlzFrameSetTextSizeLimit(self.handle, size)
    return self
end
function Frame.prototype.setTexture(self, texFile, flag, blend)
    BlzFrameSetTexture(self.handle, texFile, flag, blend)
    return self
end
function Frame.prototype.setTooltip(self, tooltip)
    BlzFrameSetTooltip(self.handle, tooltip.handle)
    return self
end
function Frame.prototype.setValue(self, value)
    BlzFrameSetValue(self.handle, value)
    return self
end
function Frame.prototype.setVertexColor(self, color)
    BlzFrameSetVertexColor(self.handle, color)
    return self
end
function Frame.prototype.setVisible(self, flag)
    BlzFrameSetVisible(self.handle, flag)
    return self
end
function Frame.prototype.setWidth(self, width)
    BlzFrameSetSize(self.handle, width, self.height)
    return self
end
function Frame.autoPosition(self, enable)
    BlzEnableUIAutoPosition(enable)
end
function Frame.fromEvent(self)
    return self:fromHandle(BlzGetTriggerFrame())
end
function Frame.fromHandle(self, handle)
    return self:getObject(handle)
end
function Frame.fromName(self, name, createContext)
    return self:fromHandle(BlzGetFrameByName(name, createContext))
end
function Frame.fromOrigin(self, frameType, index)
    return self:fromHandle(BlzGetOriginFrame(frameType, index))
end
function Frame.getEventHandle(self)
    return BlzGetTriggerFrameEvent()
end
function Frame.getEventText(self)
    return BlzGetTriggerFrameValue()
end
function Frame.getEventValue(self)
    return BlzGetTriggerFrameValue()
end
function Frame.hideOrigin(self, enable)
    BlzHideOriginFrames(enable)
end
function Frame.loadTOC(self, filename)
    return BlzLoadTOCFile(filename)
end
return ____exports
 end,
["lua_modules.w3ts.handles.gamecache"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.GameCache = __TS__Class()
local GameCache = ____exports.GameCache
GameCache.name = "GameCache"
__TS__ClassExtends(GameCache, Handle)
function GameCache.prototype.____constructor(self, campaignFile)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            InitGameCache(campaignFile)
        )
    end
    self.filename = campaignFile
end
function GameCache.prototype.flush(self)
    FlushGameCache(self.handle)
end
function GameCache.prototype.flushBoolean(self, missionKey, key)
    FlushStoredBoolean(self.handle, missionKey, key)
end
function GameCache.prototype.flushInteger(self, missionKey, key)
    FlushStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.flushMission(self, missionKey)
    FlushStoredMission(self.handle, missionKey)
end
function GameCache.prototype.flushNumber(self, missionKey, key)
    FlushStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.flushString(self, missionKey, key)
    FlushStoredString(self.handle, missionKey, key)
end
function GameCache.prototype.flushUnit(self, missionKey, key)
    FlushStoredUnit(self.handle, missionKey, key)
end
function GameCache.prototype.getBoolean(self, missionKey, key)
    return GetStoredBoolean(self.handle, missionKey, key)
end
function GameCache.prototype.getInteger(self, missionKey, key)
    return GetStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.getNumber(self, missionKey, key)
    return GetStoredReal(self.handle, missionKey, key)
end
function GameCache.prototype.getString(self, missionKey, key)
    return GetStoredString(self.handle, missionKey, key)
end
function GameCache.prototype.hasBoolean(self, missionKey, key)
    return HaveStoredBoolean(self.handle, missionKey, key)
end
function GameCache.prototype.hasInteger(self, missionKey, key)
    return HaveStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.hasNumber(self, missionKey, key)
    return HaveStoredReal(self.handle, missionKey, key)
end
function GameCache.prototype.hasString(self, missionKey, key)
    return HaveStoredString(self.handle, missionKey, key)
end
function GameCache.prototype.restoreUnit(self, missionKey, key, forWhichPlayer, x, y, face)
    return RestoreUnit(
        self.handle,
        missionKey,
        key,
        forWhichPlayer.handle,
        x,
        y,
        face
    )
end
function GameCache.prototype.save(self)
    return SaveGameCache(self.handle)
end
function GameCache.prototype.store(self, missionKey, key, value)
    if type(value) == "string" then
        StoreString(self.handle, missionKey, key, value)
    elseif type(value) == "boolean" then
        StoreBoolean(self.handle, missionKey, key, value)
    elseif type(value) == "number" then
        StoreReal(self.handle, missionKey, key, value)
    else
        StoreUnit(self.handle, missionKey, key, value)
    end
end
function GameCache.prototype.syncBoolean(self, missionKey, key)
    return SyncStoredBoolean(self.handle, missionKey, key)
end
function GameCache.prototype.syncInteger(self, missionKey, key)
    return SyncStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.syncNumber(self, missionKey, key)
    return SyncStoredReal(self.handle, missionKey, key)
end
function GameCache.prototype.syncString(self, missionKey, key)
    return SyncStoredString(self.handle, missionKey, key)
end
function GameCache.prototype.syncUnit(self, missionKey, key)
    return SyncStoredUnit(self.handle, missionKey, key)
end
function GameCache.fromHandle(self, handle)
    return self:getObject(handle)
end
function GameCache.reloadFromDisk(self)
    return ReloadGameCachesFromDisk()
end
return ____exports
 end,
["lua_modules.w3ts.globals.order"] = function(...) 
local ____exports = {}
return ____exports
 end,
["lua_modules.w3ts.handles.item"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__StringSubstr = ____lualib.__TS__StringSubstr
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____widget = require("lua_modules.w3ts.handles.widget")
local Widget = ____widget.Widget
____exports.Item = __TS__Class()
local Item = ____exports.Item
Item.name = "Item"
__TS__ClassExtends(Item, Widget)
function Item.prototype.____constructor(self, itemId, x, y, skinId)
    if Handle:initFromHandle() then
        Widget.prototype.____constructor(self)
    else
        local ____self_1 = self
        local ____skinId_0
        if skinId then
            ____skinId_0 = BlzCreateItemWithSkin(itemId, x, y, skinId)
        else
            ____skinId_0 = CreateItem(itemId, x, y)
        end
        Widget.prototype.____constructor(____self_1, ____skinId_0)
    end
end
__TS__SetDescriptor(
    Item.prototype,
    "charges",
    {
        get = function(self)
            return GetItemCharges(self.handle)
        end,
        set = function(self, value)
            SetItemCharges(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "invulnerable",
    {
        get = function(self)
            return IsItemInvulnerable(self.handle)
        end,
        set = function(self, flag)
            SetItemInvulnerable(self.handle, true)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "level",
    {get = function(self)
        return GetItemLevel(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "description",
    {
        get = function(self)
            return BlzGetItemDescription(self.handle)
        end,
        set = function(self, description)
            BlzSetItemDescription(self.handle, description)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "extendedTooltip",
    {
        get = function(self)
            return BlzGetItemExtendedTooltip(self.handle)
        end,
        set = function(self, tooltip)
            BlzSetItemExtendedTooltip(self.handle, tooltip)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "icon",
    {
        get = function(self)
            return BlzGetItemIconPath(self.handle)
        end,
        set = function(self, path)
            BlzSetItemIconPath(self.handle, path)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "name",
    {
        get = function(self)
            return GetItemName(self.handle)
        end,
        set = function(self, value)
            BlzSetItemName(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "tooltip",
    {
        get = function(self)
            return BlzGetItemTooltip(self.handle)
        end,
        set = function(self, tooltip)
            BlzSetItemTooltip(self.handle, tooltip)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "pawnable",
    {
        get = function(self)
            return IsItemPawnable(self.handle)
        end,
        set = function(self, flag)
            SetItemPawnable(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "player",
    {get = function(self)
        return GetItemPlayer(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "type",
    {get = function(self)
        return GetItemType(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "typeId",
    {get = function(self)
        return GetItemTypeId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "userData",
    {
        get = function(self)
            return GetItemUserData(self.handle)
        end,
        set = function(self, value)
            SetItemUserData(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "visible",
    {
        get = function(self)
            return IsItemVisible(self.handle)
        end,
        set = function(self, flag)
            SetItemVisible(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "skin",
    {
        get = function(self)
            return BlzGetItemSkin(self.handle)
        end,
        set = function(self, skinId)
            BlzSetItemSkin(self.handle, skinId)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "x",
    {
        get = function(self)
            return GetItemX(self.handle)
        end,
        set = function(self, value)
            SetItemPosition(self.handle, value, self.y)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "y",
    {
        get = function(self)
            return GetItemY(self.handle)
        end,
        set = function(self, value)
            SetItemPosition(self.handle, self.x, value)
        end
    },
    true
)
function Item.prototype.addAbility(self, abilCode)
    BlzItemAddAbility(self.handle, abilCode)
end
function Item.prototype.getAbility(self, abilCode)
    return BlzGetItemAbility(self.handle, abilCode)
end
function Item.prototype.getAbilityByIndex(self, index)
    return BlzGetItemAbilityByIndex(self.handle, index)
end
function Item.prototype.removeAbility(self, abilCode)
    BlzItemRemoveAbility(self.handle, abilCode)
end
function Item.prototype.destroy(self)
    RemoveItem(self.handle)
end
function Item.prototype.getField(self, field)
    local fieldType = __TS__StringSubstr(
        tostring(field),
        0,
        (string.find(
            tostring(field),
            ":",
            nil,
            true
        ) or 0) - 1
    )
    repeat
        local ____switch41 = fieldType
        local ____cond41 = ____switch41 == "unitbooleanfield"
        if ____cond41 then
            return BlzGetItemBooleanField(self.handle, field)
        end
        ____cond41 = ____cond41 or ____switch41 == "unitintegerfield"
        if ____cond41 then
            return BlzGetItemIntegerField(self.handle, field)
        end
        ____cond41 = ____cond41 or ____switch41 == "unitrealfield"
        if ____cond41 then
            return BlzGetItemRealField(self.handle, field)
        end
        ____cond41 = ____cond41 or ____switch41 == "unitstringfield"
        if ____cond41 then
            return BlzGetItemStringField(self.handle, field)
        end
        do
            return 0
        end
    until true
end
function Item.prototype.isOwned(self)
    return IsItemOwned(self.handle)
end
function Item.prototype.isPawnable(self)
    return IsItemPawnable(self.handle)
end
function Item.prototype.isPowerup(self)
    return IsItemPowerup(self.handle)
end
function Item.prototype.isSellable(self)
    return IsItemSellable(self.handle)
end
function Item.prototype.setDropId(self, unitId)
    SetItemDropID(self.handle, unitId)
end
function Item.prototype.setDropOnDeath(self, flag)
    SetItemDropOnDeath(self.handle, flag)
end
function Item.prototype.setDroppable(self, flag)
    SetItemDroppable(self.handle, flag)
end
function Item.prototype.setField(self, field, value)
    local fieldType = __TS__StringSubstr(
        tostring(field),
        0,
        (string.find(
            tostring(field),
            ":",
            nil,
            true
        ) or 0) - 1
    )
    if fieldType == "unitbooleanfield" and type(value) == "boolean" then
        return BlzSetItemBooleanField(self.handle, field, value)
    elseif fieldType == "unitintegerfield" and type(value) == "number" then
        return BlzSetItemIntegerField(self.handle, field, value)
    elseif fieldType == "unitrealfield" and type(value) == "number" then
        return BlzSetItemRealField(self.handle, field, value)
    elseif fieldType == "unitstringfield" and type(value) == "string" then
        return BlzSetItemStringField(self.handle, field, value)
    end
    return false
end
function Item.prototype.setOwner(self, whichPlayer, changeColor)
    SetItemPlayer(self.handle, whichPlayer.handle, changeColor)
end
function Item.prototype.setPoint(self, whichPoint)
    SetItemPosition(self.handle, whichPoint.x, whichPoint.y)
end
function Item.prototype.setPosition(self, x, y)
    SetItemPosition(self.handle, x, y)
end
function Item.fromEvent(self)
    return self:fromHandle(GetManipulatedItem())
end
function Item.fromHandle(self, handle)
    return self:getObject(handle)
end
function Item.isIdPawnable(self, itemId)
    return IsItemIdPawnable(itemId)
end
function Item.isIdPowerup(self, itemId)
    return IsItemIdPowerup(itemId)
end
function Item.isIdSellable(self, itemId)
    return IsItemIdSellable(itemId)
end
return ____exports
 end,
["lua_modules.w3ts.handles.sound"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Sound = __TS__Class()
local Sound = ____exports.Sound
Sound.name = "Sound"
__TS__ClassExtends(Sound, Handle)
function Sound.prototype.____constructor(self, fileName, looping, is3D, stopWhenOutOfRange, fadeInRate, fadeOutRate, eaxSetting)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateSound(
                fileName,
                looping,
                is3D,
                stopWhenOutOfRange,
                fadeInRate,
                fadeOutRate,
                eaxSetting
            )
        )
    end
end
__TS__SetDescriptor(
    Sound.prototype,
    "dialogueSpeakerNameKey",
    {
        get = function(self)
            return GetDialogueSpeakerNameKey(self.handle)
        end,
        set = function(self, speakerName)
            SetDialogueSpeakerNameKey(self.handle, speakerName)
        end
    },
    true
)
__TS__SetDescriptor(
    Sound.prototype,
    "dialogueTextKey",
    {
        get = function(self)
            return GetDialogueTextKey(self.handle)
        end,
        set = function(self, dialogueText)
            SetDialogueTextKey(self.handle, dialogueText)
        end
    },
    true
)
__TS__SetDescriptor(
    Sound.prototype,
    "duration",
    {
        get = function(self)
            return GetSoundDuration(self.handle)
        end,
        set = function(self, duration)
            SetSoundDuration(self.handle, duration)
        end
    },
    true
)
__TS__SetDescriptor(
    Sound.prototype,
    "loading",
    {get = function(self)
        return GetSoundIsLoading(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Sound.prototype,
    "playing",
    {get = function(self)
        return GetSoundIsPlaying(self.handle)
    end},
    true
)
function Sound.prototype.killWhenDone(self)
    KillSoundWhenDone(self.handle)
end
function Sound.prototype.registerStacked(self, byPosition, rectWidth, rectHeight)
    RegisterStackedSound(self.handle, byPosition, rectWidth, rectHeight)
end
function Sound.prototype.setChannel(self, channel)
    SetSoundDistanceCutoff(self.handle, channel)
end
function Sound.prototype.setConeAngles(self, inside, outside, outsideVolume)
    SetSoundConeAngles(self.handle, inside, outside, outsideVolume)
end
function Sound.prototype.setConeOrientation(self, x, y, z)
    SetSoundConeOrientation(self.handle, x, y, z)
end
function Sound.prototype.setDistanceCutoff(self, cutoff)
    SetSoundDistanceCutoff(self.handle, cutoff)
end
function Sound.prototype.setDistances(self, minDist, maxDist)
    SetSoundDistances(self.handle, minDist, maxDist)
end
function Sound.prototype.setFacialAnimationFilepath(self, animationSetFilepath)
    SetSoundFacialAnimationSetFilepath(self.handle, animationSetFilepath)
end
function Sound.prototype.setFacialAnimationGroupLabel(self, groupLabel)
    SetSoundFacialAnimationGroupLabel(self.handle, groupLabel)
end
function Sound.prototype.setFacialAnimationLabel(self, animationLabel)
    SetSoundFacialAnimationLabel(self.handle, animationLabel)
end
function Sound.prototype.setParamsFromLabel(self, soundLabel)
    SetSoundParamsFromLabel(self.handle, soundLabel)
end
function Sound.prototype.setPitch(self, pitch)
    SetSoundPitch(self.handle, pitch)
end
function Sound.prototype.setPlayPosition(self, millisecs)
    SetSoundPlayPosition(self.handle, millisecs)
end
function Sound.prototype.setPosition(self, x, y, z)
    SetSoundPosition(self.handle, x, y, z)
end
function Sound.prototype.setVelocity(self, x, y, z)
    SetSoundVelocity(self.handle, x, y, z)
end
function Sound.prototype.setVolume(self, volume)
    SetSoundVolume(self.handle, volume)
end
function Sound.prototype.start(self)
    StartSound(self.handle)
end
function Sound.prototype.stop(self, killWhenDone, fadeOut)
    StopSound(self.handle, killWhenDone, fadeOut)
end
function Sound.prototype.unregisterStacked(self, byPosition, rectWidth, rectHeight)
    UnregisterStackedSound(self.handle, byPosition, rectWidth, rectHeight)
end
function Sound.fromHandle(self, handle)
    return self:getObject(handle)
end
function Sound.getFileDuration(self, fileName)
    return GetSoundFileDuration(fileName)
end
return ____exports
 end,
["lua_modules.w3ts.handles.unit"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__StringSubstr = ____lualib.__TS__StringSubstr
local ____exports = {}
local ____destructable = require("lua_modules.w3ts.handles.destructable")
local Destructable = ____destructable.Destructable
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____item = require("lua_modules.w3ts.handles.item")
local Item = ____item.Item
local ____player = require("lua_modules.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____point = require("lua_modules.w3ts.handles.point")
local Point = ____point.Point
local ____widget = require("lua_modules.w3ts.handles.widget")
local Widget = ____widget.Widget
____exports.Unit = __TS__Class()
local Unit = ____exports.Unit
Unit.name = "Unit"
__TS__ClassExtends(Unit, Widget)
function Unit.prototype.____constructor(self, owner, unitId, x, y, face, skinId)
    if Handle:initFromHandle() then
        Widget.prototype.____constructor(self)
    else
        local ____temp_0
        if type(owner) == "number" then
            ____temp_0 = Player(owner)
        else
            ____temp_0 = owner.handle
        end
        local p = ____temp_0
        local ____self_2 = self
        local ____skinId_1
        if skinId then
            ____skinId_1 = BlzCreateUnitWithSkin(
                p,
                unitId,
                x,
                y,
                face,
                skinId
            )
        else
            ____skinId_1 = CreateUnit(
                p,
                unitId,
                x,
                y,
                face
            )
        end
        Widget.prototype.____constructor(____self_2, ____skinId_1)
    end
end
__TS__SetDescriptor(
    Unit.prototype,
    "acquireRange",
    {
        get = function(self)
            return GetUnitAcquireRange(self.handle)
        end,
        set = function(self, value)
            SetUnitAcquireRange(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "agility",
    {
        get = function(self)
            return GetHeroAgi(self.handle, false)
        end,
        set = function(self, value)
            SetHeroAgi(self.handle, value, true)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "armor",
    {
        get = function(self)
            return BlzGetUnitArmor(self.handle)
        end,
        set = function(self, armorAmount)
            BlzSetUnitArmor(self.handle, armorAmount)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "canSleep",
    {
        get = function(self)
            return UnitCanSleep(self.handle)
        end,
        set = function(self, flag)
            UnitAddSleep(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "collisionSize",
    {get = function(self)
        return BlzGetUnitCollisionSize(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "color",
    {set = function(self, whichColor)
        SetUnitColor(self.handle, whichColor)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "currentOrder",
    {get = function(self)
        return GetUnitCurrentOrder(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "defaultAcquireRange",
    {get = function(self)
        return GetUnitDefaultAcquireRange(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "defaultFlyHeight",
    {get = function(self)
        return GetUnitDefaultFlyHeight(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "defaultMoveSpeed",
    {get = function(self)
        return GetUnitDefaultMoveSpeed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "defaultPropWindow",
    {get = function(self)
        return GetUnitDefaultPropWindow(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "defaultTurnSpeed",
    {get = function(self)
        return GetUnitDefaultTurnSpeed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "experience",
    {
        get = function(self)
            return GetHeroXP(self.handle)
        end,
        set = function(self, newXpVal)
            SetHeroXP(self.handle, newXpVal, true)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "facing",
    {
        get = function(self)
            return GetUnitFacing(self.handle)
        end,
        set = function(self, value)
            SetUnitFacing(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "foodMade",
    {get = function(self)
        return GetUnitFoodMade(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "foodUsed",
    {get = function(self)
        return GetUnitFoodUsed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "ignoreAlarmToggled",
    {get = function(self)
        return UnitIgnoreAlarmToggled(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "intelligence",
    {
        get = function(self)
            return GetHeroInt(self.handle, false)
        end,
        set = function(self, value)
            SetHeroInt(self.handle, value, true)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "inventorySize",
    {get = function(self)
        return UnitInventorySize(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "invulnerable",
    {
        get = function(self)
            return BlzIsUnitInvulnerable(self.handle)
        end,
        set = function(self, flag)
            SetUnitInvulnerable(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "level",
    {get = function(self)
        return GetUnitLevel(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "localZ",
    {get = function(self)
        return BlzGetLocalUnitZ(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "mana",
    {
        get = function(self)
            return self:getState(UNIT_STATE_MANA)
        end,
        set = function(self, value)
            self:setState(UNIT_STATE_MANA, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "maxLife",
    {
        get = function(self)
            return BlzGetUnitMaxHP(self.handle)
        end,
        set = function(self, value)
            BlzSetUnitMaxHP(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "maxMana",
    {
        get = function(self)
            return BlzGetUnitMaxMana(self.handle)
        end,
        set = function(self, value)
            BlzSetUnitMaxMana(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "moveSpeed",
    {
        get = function(self)
            return GetUnitMoveSpeed(self.handle)
        end,
        set = function(self, value)
            SetUnitMoveSpeed(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "name",
    {
        get = function(self)
            return GetUnitName(self.handle)
        end,
        set = function(self, value)
            BlzSetUnitName(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "nameProper",
    {
        get = function(self)
            return GetHeroProperName(self.handle)
        end,
        set = function(self, value)
            BlzSetHeroProperName(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "owner",
    {
        get = function(self)
            return MapPlayer:fromHandle(GetOwningPlayer(self.handle))
        end,
        set = function(self, whichPlayer)
            SetUnitOwner(self.handle, whichPlayer.handle, true)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "paused",
    {
        get = function(self)
            return IsUnitPaused(self.handle)
        end,
        set = function(self, flag)
            PauseUnit(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "point",
    {
        get = function(self)
            return Point:fromHandle(GetUnitLoc(self.handle))
        end,
        set = function(self, whichPoint)
            SetUnitPositionLoc(self.handle, whichPoint.handle)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "pointValue",
    {get = function(self)
        return GetUnitPointValue(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "propWindow",
    {
        get = function(self)
            return GetUnitPropWindow(self.handle)
        end,
        set = function(self, newPropWindowAngle)
            SetUnitPropWindow(self.handle, newPropWindowAngle)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "race",
    {get = function(self)
        return GetUnitRace(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "rallyDestructable",
    {get = function(self)
        return Destructable:fromHandle(GetUnitRallyDestructable(self.handle))
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "rallyPoint",
    {get = function(self)
        return Point:fromHandle(GetUnitRallyPoint(self.handle))
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "rallyUnit",
    {get = function(self)
        return ____exports.Unit:fromHandle(GetUnitRallyUnit(self.handle))
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "resourceAmount",
    {
        get = function(self)
            return GetResourceAmount(self.handle)
        end,
        set = function(self, amount)
            SetResourceAmount(self.handle, amount)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "selectable",
    {get = function(self)
        return BlzIsUnitSelectable(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "selectionScale",
    {
        get = function(self)
            local result = self:getField(UNIT_RF_SELECTION_SCALE)
            local ____temp_3
            if type(result) == "number" then
                ____temp_3 = result
            else
                ____temp_3 = 0
            end
            return ____temp_3
        end,
        set = function(self, scale)
            self:setField(UNIT_RF_SELECTION_SCALE, scale)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "show",
    {
        get = function(self)
            return not IsUnitHidden(self.handle)
        end,
        set = function(self, flag)
            ShowUnit(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "skin",
    {
        get = function(self)
            return BlzGetUnitSkin(self.handle)
        end,
        set = function(self, skinId)
            BlzSetUnitSkin(self.handle, skinId)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "skillPoints",
    {
        get = function(self)
            return GetHeroSkillPoints(self.handle)
        end,
        set = function(self, skillPointDelta)
            UnitModifySkillPoints(self.handle, skillPointDelta)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "sleeping",
    {get = function(self)
        return UnitIsSleeping(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "strength",
    {
        get = function(self)
            return GetHeroStr(self.handle, false)
        end,
        set = function(self, value)
            SetHeroStr(self.handle, value, true)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "turnSpeed",
    {
        get = function(self)
            return GetUnitTurnSpeed(self.handle)
        end,
        set = function(self, value)
            SetUnitTurnSpeed(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "typeId",
    {get = function(self)
        return GetUnitTypeId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "userData",
    {
        get = function(self)
            return GetUnitUserData(self.handle)
        end,
        set = function(self, value)
            SetUnitUserData(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "waygateActive",
    {
        get = function(self)
            return WaygateIsActive(self.handle)
        end,
        set = function(self, flag)
            WaygateActivate(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "x",
    {
        get = function(self)
            return GetUnitX(self.handle)
        end,
        set = function(self, value)
            SetUnitX(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "y",
    {
        get = function(self)
            return GetUnitY(self.handle)
        end,
        set = function(self, value)
            SetUnitY(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Unit.prototype,
    "z",
    {get = function(self)
        return BlzGetUnitZ(self.handle)
    end},
    true
)
function Unit.prototype.addAbility(self, abilityId)
    return UnitAddAbility(self.handle, abilityId)
end
function Unit.prototype.addAnimationProps(self, animProperties, add)
    AddUnitAnimationProperties(self.handle, animProperties, add)
end
function Unit.prototype.addExperience(self, xpToAdd, showEyeCandy)
    AddHeroXP(self.handle, xpToAdd, showEyeCandy)
end
function Unit.prototype.addIndicator(self, red, blue, green, alpha)
    UnitAddIndicator(
        self.handle,
        red,
        blue,
        green,
        alpha
    )
end
function Unit.prototype.addItem(self, whichItem)
    return UnitAddItem(self.handle, whichItem.handle)
end
function Unit.prototype.addItemById(self, itemId)
    return Item:fromHandle(UnitAddItemById(self.handle, itemId))
end
function Unit.prototype.addItemToSlotById(self, itemId, itemSlot)
    return UnitAddItemToSlotById(self.handle, itemId, itemSlot)
end
function Unit.prototype.addItemToStock(self, itemId, currentStock, stockMax)
    AddItemToStock(self.handle, itemId, currentStock, stockMax)
end
function Unit.prototype.addResourceAmount(self, amount)
    AddResourceAmount(self.handle, amount)
end
function Unit.prototype.addSleepPerm(self, add)
    UnitAddSleepPerm(self.handle, add)
end
function Unit.prototype.addType(self, whichUnitType)
    return UnitAddType(self.handle, whichUnitType)
end
function Unit.prototype.addUnitToStock(self, unitId, currentStock, stockMax)
    AddUnitToStock(self.handle, unitId, currentStock, stockMax)
end
function Unit.prototype.applyTimedLife(self, buffId, duration)
    UnitApplyTimedLife(self.handle, buffId, duration)
end
function Unit.prototype.attachSound(self, sound)
    AttachSoundToUnit(sound.handle, self.handle)
end
function Unit.prototype.cancelTimedLife(self)
    BlzUnitCancelTimedLife(self.handle)
end
function Unit.prototype.canSleepPerm(self)
    return UnitCanSleepPerm(self.handle)
end
function Unit.prototype.countBuffs(self, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    return UnitCountBuffsEx(
        self.handle,
        removePositive,
        removeNegative,
        magic,
        physical,
        timedLife,
        aura,
        autoDispel
    )
end
function Unit.prototype.damageAt(self, delay, radius, x, y, amount, attack, ranged, attackType, damageType, weaponType)
    return UnitDamagePoint(
        self.handle,
        delay,
        radius,
        x,
        y,
        amount,
        attack,
        ranged,
        attackType,
        damageType,
        weaponType
    )
end
function Unit.prototype.damageTarget(self, target, amount, attack, ranged, attackType, damageType, weaponType)
    return UnitDamageTarget(
        self.handle,
        target,
        amount,
        attack,
        ranged,
        attackType,
        damageType,
        weaponType
    )
end
function Unit.prototype.decAbilityLevel(self, abilCode)
    return DecUnitAbilityLevel(self.handle, abilCode)
end
function Unit.prototype.destroy(self)
    RemoveUnit(self.handle)
end
function Unit.prototype.disableAbility(self, abilId, flag, hideUI)
    BlzUnitDisableAbility(self.handle, abilId, flag, hideUI)
end
function Unit.prototype.dropItem(self, whichItem, x, y)
    return UnitDropItemPoint(self.handle, whichItem.handle, x, y)
end
function Unit.prototype.dropItemFromSlot(self, whichItem, slot)
    return UnitDropItemSlot(self.handle, whichItem.handle, slot)
end
function Unit.prototype.dropItemTarget(self, whichItem, target)
    return UnitDropItemTarget(self.handle, whichItem.handle, target.handle)
end
function Unit.prototype.endAbilityCooldown(self, abilCode)
    BlzEndUnitAbilityCooldown(self.handle, abilCode)
end
function Unit.prototype.getAbility(self, abilId)
    return BlzGetUnitAbility(self.handle, abilId)
end
function Unit.prototype.getAbilityByIndex(self, index)
    return BlzGetUnitAbilityByIndex(self.handle, index)
end
function Unit.prototype.getAbilityCooldown(self, abilId, level)
    return BlzGetUnitAbilityCooldown(self.handle, abilId, level)
end
function Unit.prototype.getAbilityCooldownRemaining(self, abilId)
    return BlzGetUnitAbilityCooldownRemaining(self.handle, abilId)
end
function Unit.prototype.getAbilityLevel(self, abilCode)
    return GetUnitAbilityLevel(self.handle, abilCode)
end
function Unit.prototype.getAbilityManaCost(self, abilId, level)
    return BlzGetUnitAbilityManaCost(self.handle, abilId, level)
end
function Unit.prototype.getAgility(self, includeBonuses)
    return GetHeroAgi(self.handle, includeBonuses)
end
function Unit.prototype.getAttackCooldown(self, weaponIndex)
    return BlzGetUnitAttackCooldown(self.handle, weaponIndex)
end
function Unit.prototype.getBaseDamage(self, weaponIndex)
    return BlzGetUnitBaseDamage(self.handle, weaponIndex)
end
function Unit.prototype.getDiceNumber(self, weaponIndex)
    return BlzGetUnitDiceNumber(self.handle, weaponIndex)
end
function Unit.prototype.getDiceSides(self, weaponIndex)
    return BlzGetUnitDiceSides(self.handle, weaponIndex)
end
function Unit.prototype.getField(self, field)
    local fieldType = __TS__StringSubstr(
        tostring(field),
        0,
        (string.find(
            tostring(field),
            ":",
            nil,
            true
        ) or 0) - 1
    )
    repeat
        local ____switch124 = fieldType
        local fieldBool, fieldInt, fieldReal, fieldString
        local ____cond124 = ____switch124 == "unitbooleanfield"
        if ____cond124 then
            fieldBool = field
            return BlzGetUnitBooleanField(self.handle, fieldBool)
        end
        ____cond124 = ____cond124 or ____switch124 == "unitintegerfield"
        if ____cond124 then
            fieldInt = field
            return BlzGetUnitIntegerField(self.handle, fieldInt)
        end
        ____cond124 = ____cond124 or ____switch124 == "unitrealfield"
        if ____cond124 then
            fieldReal = field
            return BlzGetUnitRealField(self.handle, fieldReal)
        end
        ____cond124 = ____cond124 or ____switch124 == "unitstringfield"
        if ____cond124 then
            fieldString = field
            return BlzGetUnitStringField(self.handle, fieldString)
        end
        do
            return 0
        end
    until true
end
function Unit.prototype.getflyHeight(self)
    return GetUnitFlyHeight(self.handle)
end
function Unit.prototype.getHeroLevel(self)
    return GetHeroLevel(self.handle)
end
function Unit.prototype.getIgnoreAlarm(self, flag)
    return UnitIgnoreAlarm(self.handle, flag)
end
function Unit.prototype.getIntelligence(self, includeBonuses)
    return GetHeroInt(self.handle, includeBonuses)
end
function Unit.prototype.getItemInSlot(self, slot)
    return Item:fromHandle(UnitItemInSlot(self.handle, slot))
end
function Unit.prototype.getState(self, whichUnitState)
    return GetUnitState(self.handle, whichUnitState)
end
function Unit.prototype.getStrength(self, includeBonuses)
    return GetHeroStr(self.handle, includeBonuses)
end
function Unit.prototype.hasBuffs(self, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    return UnitHasBuffsEx(
        self.handle,
        removePositive,
        removeNegative,
        magic,
        physical,
        timedLife,
        aura,
        autoDispel
    )
end
function Unit.prototype.hasItem(self, whichItem)
    return UnitHasItem(self.handle, whichItem.handle)
end
function Unit.prototype.hideAbility(self, abilId, flag)
    BlzUnitHideAbility(self.handle, abilId, flag)
end
function Unit.prototype.incAbilityLevel(self, abilCode)
    return IncUnitAbilityLevel(self.handle, abilCode)
end
function Unit.prototype.inForce(self, whichForce)
    return IsUnitInForce(self.handle, whichForce.handle)
end
function Unit.prototype.inGroup(self, whichGroup)
    return IsUnitInGroup(self.handle, whichGroup.handle)
end
function Unit.prototype.inRange(self, x, y, distance)
    return IsUnitInRangeXY(self.handle, x, y, distance)
end
function Unit.prototype.inRangeOfPoint(self, whichPoint, distance)
    return IsUnitInRangeLoc(self.handle, whichPoint.handle, distance)
end
function Unit.prototype.inRangeOfUnit(self, otherUnit, distance)
    return IsUnitInRange(self.handle, otherUnit.handle, distance)
end
function Unit.prototype.interruptAttack(self)
    BlzUnitInterruptAttack(self.handle)
end
function Unit.prototype.inTransport(self, whichTransport)
    return IsUnitInTransport(self.handle, whichTransport.handle)
end
function Unit.prototype.isAlive(self)
    return UnitAlive(self.handle)
end
function Unit.prototype.isAlly(self, whichPlayer)
    return IsUnitAlly(self.handle, whichPlayer.handle)
end
function Unit.prototype.isEnemy(self, whichPlayer)
    return IsUnitEnemy(self.handle, whichPlayer.handle)
end
function Unit.prototype.isExperienceSuspended(self)
    return IsSuspendedXP(self.handle)
end
function Unit.prototype.isFogged(self, whichPlayer)
    return IsUnitFogged(self.handle, whichPlayer.handle)
end
function Unit.prototype.isHero(self)
    return IsHeroUnitId(self.typeId)
end
function Unit.prototype.isIllusion(self)
    return IsUnitIllusion(self.handle)
end
function Unit.prototype.isLoaded(self)
    return IsUnitLoaded(self.handle)
end
function Unit.prototype.isMasked(self, whichPlayer)
    return IsUnitMasked(self.handle, whichPlayer.handle)
end
function Unit.prototype.isSelected(self, whichPlayer)
    return IsUnitSelected(self.handle, whichPlayer.handle)
end
function Unit.prototype.issueBuildOrder(self, unit, x, y)
    local ____temp_4
    if type(unit) == "string" then
        ____temp_4 = IssueBuildOrder(self.handle, unit, x, y)
    else
        ____temp_4 = IssueBuildOrderById(self.handle, unit, x, y)
    end
    return ____temp_4
end
function Unit.prototype.issueImmediateOrder(self, order)
    local ____temp_5
    if type(order) == "string" then
        ____temp_5 = IssueImmediateOrder(self.handle, order)
    else
        ____temp_5 = IssueImmediateOrderById(self.handle, order)
    end
    return ____temp_5
end
function Unit.prototype.issueInstantOrderAt(self, order, x, y, instantTargetWidget)
    local ____temp_6
    if type(order) == "string" then
        ____temp_6 = IssueInstantPointOrder(
            self.handle,
            order,
            x,
            y,
            instantTargetWidget.handle
        )
    else
        ____temp_6 = IssueInstantPointOrderById(
            self.handle,
            order,
            x,
            y,
            instantTargetWidget.handle
        )
    end
    return ____temp_6
end
function Unit.prototype.issueInstantTargetOrder(self, order, targetWidget, instantTargetWidget)
    local ____temp_7
    if type(order) == "string" then
        ____temp_7 = IssueInstantTargetOrder(self.handle, order, targetWidget.handle, instantTargetWidget.handle)
    else
        ____temp_7 = IssueInstantTargetOrderById(self.handle, order, targetWidget.handle, instantTargetWidget.handle)
    end
    return ____temp_7
end
function Unit.prototype.issueOrderAt(self, order, x, y)
    local ____temp_8
    if type(order) == "string" then
        ____temp_8 = IssuePointOrder(self.handle, order, x, y)
    else
        ____temp_8 = IssuePointOrderById(self.handle, order, x, y)
    end
    return ____temp_8
end
function Unit.prototype.issuePointOrder(self, order, whichPoint)
    local ____temp_9
    if type(order) == "string" then
        ____temp_9 = IssuePointOrderLoc(self.handle, order, whichPoint.handle)
    else
        ____temp_9 = IssuePointOrderByIdLoc(self.handle, order, whichPoint.handle)
    end
    return ____temp_9
end
function Unit.prototype.issueTargetOrder(self, order, targetWidget)
    local ____temp_10
    if type(order) == "string" then
        ____temp_10 = IssueTargetOrder(self.handle, order, targetWidget.handle)
    else
        ____temp_10 = IssueTargetOrderById(self.handle, order, targetWidget.handle)
    end
    return ____temp_10
end
function Unit.prototype.isUnit(self, whichSpecifiedUnit)
    return IsUnit(self.handle, whichSpecifiedUnit.handle)
end
function Unit.prototype.isUnitType(self, whichUnitType)
    return IsUnitType(self.handle, whichUnitType)
end
function Unit.prototype.isVisible(self, whichPlayer)
    return IsUnitVisible(self.handle, whichPlayer.handle)
end
function Unit.prototype.kill(self)
    KillUnit(self.handle)
end
function Unit.prototype.lookAt(self, whichBone, lookAtTarget, offsetX, offsetY, offsetZ)
    SetUnitLookAt(
        self.handle,
        whichBone,
        lookAtTarget.handle,
        offsetX,
        offsetY,
        offsetZ
    )
end
function Unit.prototype.makeAbilityPermanent(self, permanent, abilityId)
    UnitMakeAbilityPermanent(self.handle, permanent, abilityId)
end
function Unit.prototype.modifySkillPoints(self, skillPointDelta)
    return UnitModifySkillPoints(self.handle, skillPointDelta)
end
function Unit.prototype.pauseEx(self, flag)
    BlzPauseUnitEx(self.handle, flag)
end
function Unit.prototype.pauseTimedLife(self, flag)
    UnitPauseTimedLife(self.handle, flag)
end
function Unit.prototype.queueAnimation(self, whichAnimation)
    QueueUnitAnimation(self.handle, whichAnimation)
end
function Unit.prototype.recycleGuardPosition(self)
    RecycleGuardPosition(self.handle)
end
function Unit.prototype.removeAbility(self, abilityId)
    return UnitRemoveAbility(self.handle, abilityId)
end
function Unit.prototype.removeBuffs(self, removePositive, removeNegative)
    UnitRemoveBuffs(self.handle, removePositive, removeNegative)
end
function Unit.prototype.removeBuffsEx(self, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    UnitRemoveBuffsEx(
        self.handle,
        removePositive,
        removeNegative,
        magic,
        physical,
        timedLife,
        aura,
        autoDispel
    )
end
function Unit.prototype.removeGuardPosition(self)
    RemoveGuardPosition(self.handle)
end
function Unit.prototype.removeItem(self, whichItem)
    UnitRemoveItem(self.handle, whichItem.handle)
end
function Unit.prototype.removeItemFromSlot(self, itemSlot)
    return Item:fromHandle(UnitRemoveItemFromSlot(self.handle, itemSlot))
end
function Unit.prototype.removeItemFromStock(self, itemId)
    RemoveItemFromStock(self.handle, itemId)
end
function Unit.prototype.removeType(self, whichUnitType)
    return UnitAddType(self.handle, whichUnitType)
end
function Unit.prototype.removeUnitFromStock(self, itemId)
    RemoveUnitFromStock(self.handle, itemId)
end
function Unit.prototype.resetCooldown(self)
    UnitResetCooldown(self.handle)
end
function Unit.prototype.resetLookAt(self)
    ResetUnitLookAt(self.handle)
end
function Unit.prototype.revive(self, x, y, doEyecandy)
    return ReviveHero(self.handle, x, y, doEyecandy)
end
function Unit.prototype.reviveAtPoint(self, whichPoint, doEyecandy)
    return ReviveHeroLoc(self.handle, whichPoint.handle, doEyecandy)
end
function Unit.prototype.select(self, flag)
    SelectUnit(self.handle, flag)
end
function Unit.prototype.selectSkill(self, abilCode)
    SelectHeroSkill(self.handle, abilCode)
end
function Unit.prototype.setAbilityCooldown(self, abilId, level, cooldown)
    BlzSetUnitAbilityCooldown(self.handle, abilId, level, cooldown)
end
function Unit.prototype.setAbilityLevel(self, abilCode, level)
    return SetUnitAbilityLevel(self.handle, abilCode, level)
end
function Unit.prototype.setAbilityManaCost(self, abilId, level, manaCost)
    BlzSetUnitAbilityManaCost(self.handle, abilId, level, manaCost)
end
function Unit.prototype.setAgility(self, value, permanent)
    SetHeroAgi(self.handle, value, permanent)
end
function Unit.prototype.setAnimation(self, whichAnimation)
    if type(whichAnimation) == "string" then
        SetUnitAnimation(self.handle, whichAnimation)
    else
        SetUnitAnimationByIndex(self.handle, whichAnimation)
    end
end
function Unit.prototype.setAnimationWithRarity(self, whichAnimation, rarity)
    SetUnitAnimationWithRarity(self.handle, whichAnimation, rarity)
end
function Unit.prototype.setAttackCooldown(self, cooldown, weaponIndex)
    BlzSetUnitAttackCooldown(self.handle, cooldown, weaponIndex)
end
function Unit.prototype.setBaseDamage(self, baseDamage, weaponIndex)
    BlzSetUnitBaseDamage(self.handle, baseDamage, weaponIndex)
end
function Unit.prototype.setBlendTime(self, timeScale)
    SetUnitBlendTime(self.handle, timeScale)
end
function Unit.prototype.setConstructionProgress(self, constructionPercentage)
    UnitSetConstructionProgress(self.handle, constructionPercentage)
end
function Unit.prototype.setCreepGuard(self, creepGuard)
    SetUnitCreepGuard(self.handle, creepGuard)
end
function Unit.prototype.setDiceNumber(self, diceNumber, weaponIndex)
    BlzSetUnitDiceNumber(self.handle, diceNumber, weaponIndex)
end
function Unit.prototype.setDiceSides(self, diceSides, weaponIndex)
    BlzSetUnitDiceSides(self.handle, diceSides, weaponIndex)
end
function Unit.prototype.setExperience(self, newXpVal, showEyeCandy)
    SetHeroXP(self.handle, newXpVal, showEyeCandy)
end
function Unit.prototype.setExploded(self, exploded)
    SetUnitExploded(self.handle, exploded)
end
function Unit.prototype.setFacingEx(self, facingAngle)
    BlzSetUnitFacingEx(self.handle, facingAngle)
end
function Unit.prototype.setField(self, field, value)
    local fieldType = __TS__StringSubstr(
        tostring(field),
        0,
        (string.find(
            tostring(field),
            ":",
            nil,
            true
        ) or 0) - 1
    )
    if fieldType == "unitbooleanfield" and type(value) == "boolean" then
        return BlzSetUnitBooleanField(self.handle, field, value)
    elseif fieldType == "unitintegerfield" and type(value) == "number" then
        return BlzSetUnitIntegerField(self.handle, field, value)
    elseif fieldType == "unitrealfield" and type(value) == "number" then
        return BlzSetUnitRealField(self.handle, field, value)
    elseif fieldType == "unitstringfield" and type(value) == "string" then
        return BlzSetUnitStringField(self.handle, field, value)
    end
    return false
end
function Unit.prototype.setflyHeight(self, value, rate)
    SetUnitFlyHeight(self.handle, value, rate)
end
function Unit.prototype.setHeroLevel(self, level, showEyeCandy)
    SetHeroLevel(self.handle, level, showEyeCandy)
end
function Unit.prototype.setIntelligence(self, value, permanent)
    SetHeroInt(self.handle, value, permanent)
end
function Unit.prototype.setItemTypeSlots(self, slots)
    SetItemTypeSlots(self.handle, slots)
end
function Unit.prototype.setOwner(self, whichPlayer, changeColor)
    SetUnitOwner(self.handle, whichPlayer.handle, changeColor)
end
function Unit.prototype.setPathing(self, flag)
    SetUnitPathing(self.handle, flag)
end
function Unit.prototype.setPosition(self, x, y)
    SetUnitPosition(self.handle, x, y)
end
function Unit.prototype.setRescuable(self, byWhichPlayer, flag)
    SetUnitRescuable(self.handle, byWhichPlayer.handle, flag)
end
function Unit.prototype.setRescueRange(self, range)
    SetUnitRescueRange(self.handle, range)
end
function Unit.prototype.setScale(self, scaleX, scaleY, scaleZ)
    SetUnitScale(self.handle, scaleX, scaleY, scaleZ)
end
function Unit.prototype.setState(self, whichUnitState, newVal)
    SetUnitState(self.handle, whichUnitState, newVal)
end
function Unit.prototype.setStrength(self, value, permanent)
    SetHeroStr(self.handle, value, permanent)
end
function Unit.prototype.setTimeScale(self, timeScale)
    SetUnitTimeScale(self.handle, timeScale)
end
function Unit.prototype.setUnitAttackCooldown(self, cooldown, weaponIndex)
    BlzSetUnitAttackCooldown(self.handle, cooldown, weaponIndex)
end
function Unit.prototype.setUnitTypeSlots(self, slots)
    SetUnitTypeSlots(self.handle, slots)
end
function Unit.prototype.setUpgradeProgress(self, upgradePercentage)
    UnitSetUpgradeProgress(self.handle, upgradePercentage)
end
function Unit.prototype.setUseAltIcon(self, flag)
    UnitSetUsesAltIcon(self.handle, flag)
end
function Unit.prototype.setUseFood(self, useFood)
    SetUnitUseFood(self.handle, useFood)
end
function Unit.prototype.setVertexColor(self, red, green, blue, alpha)
    SetUnitVertexColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Unit.prototype.shareVision(self, whichPlayer, share)
    UnitShareVision(self.handle, whichPlayer.handle, share)
end
function Unit.prototype.showTeamGlow(self, show)
    BlzShowUnitTeamGlow(self.handle, show)
end
function Unit.prototype.startAbilityCooldown(self, abilCode, cooldown)
    BlzStartUnitAbilityCooldown(self.handle, abilCode, cooldown)
end
function Unit.prototype.stripLevels(self, howManyLevels)
    return UnitStripHeroLevel(self.handle, howManyLevels)
end
function Unit.prototype.suspendDecay(self, suspend)
    UnitSuspendDecay(self.handle, suspend)
end
function Unit.prototype.suspendExperience(self, flag)
    SuspendHeroXP(self.handle, flag)
end
function Unit.prototype.useItem(self, whichItem)
    return UnitUseItem(self.handle, whichItem.handle)
end
function Unit.prototype.useItemAt(self, whichItem, x, y)
    return UnitUseItemPoint(self.handle, whichItem.handle, x, y)
end
function Unit.prototype.useItemTarget(self, whichItem, target)
    return UnitUseItemTarget(self.handle, whichItem.handle, target.handle)
end
function Unit.prototype.wakeUp(self)
    UnitWakeUp(self.handle)
end
function Unit.prototype.waygateGetDestinationX(self)
    return WaygateGetDestinationX(self.handle)
end
function Unit.prototype.waygateGetDestinationY(self)
    return WaygateGetDestinationY(self.handle)
end
function Unit.prototype.waygateSetDestination(self, x, y)
    WaygateSetDestination(self.handle, x, y)
end
function Unit.foodMadeByType(self, unitId)
    return GetFoodMade(unitId)
end
function Unit.foodUsedByType(self, unitId)
    return GetFoodUsed(unitId)
end
function Unit.fromEnum(self)
    return self:fromHandle(GetEnumUnit())
end
function Unit.fromEvent(self)
    return self:fromHandle(GetTriggerUnit())
end
function Unit.fromFilter(self)
    return self:fromHandle(GetFilterUnit())
end
function Unit.fromHandle(self, handle)
    return self:getObject(handle)
end
function Unit.getPointValueByType(self, unitType)
    return GetUnitPointValueByType(unitType)
end
function Unit.isUnitIdHero(self, unitId)
    return IsHeroUnitId(unitId)
end
function Unit.isUnitIdType(self, unitId, whichUnitType)
    return IsUnitIdType(unitId, whichUnitType)
end
return ____exports
 end,
["lua_modules.w3ts.handles.group"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____unit = require("lua_modules.w3ts.handles.unit")
local Unit = ____unit.Unit
____exports.Group = __TS__Class()
local Group = ____exports.Group
Group.name = "Group"
__TS__ClassExtends(Group, Handle)
function Group.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateGroup()
        )
    end
end
__TS__SetDescriptor(
    Group.prototype,
    "first",
    {get = function(self)
        return Unit:fromHandle(FirstOfGroup(self.handle))
    end},
    true
)
__TS__SetDescriptor(
    Group.prototype,
    "size",
    {get = function(self)
        return BlzGroupGetSize(self.handle)
    end},
    true
)
function Group.prototype.addGroupFast(self, addGroup)
    return BlzGroupAddGroupFast(self.handle, addGroup.handle)
end
function Group.prototype.addUnit(self, whichUnit)
    return GroupAddUnit(self.handle, whichUnit.handle)
end
function Group.prototype.clear(self)
    GroupClear(self.handle)
end
function Group.prototype.destroy(self)
    DestroyGroup(self.handle)
end
function Group.prototype.enumUnitsInRange(self, x, y, radius, filter)
    local ____GroupEnumUnitsInRange_2 = GroupEnumUnitsInRange
    local ____array_1 = __TS__SparseArrayNew(self.handle, x, y, radius)
    local ____temp_0
    if type(filter) == "function" then
        ____temp_0 = Filter(filter)
    else
        ____temp_0 = filter
    end
    __TS__SparseArrayPush(____array_1, ____temp_0)
    ____GroupEnumUnitsInRange_2(__TS__SparseArraySpread(____array_1))
end
function Group.prototype.enumUnitsInRangeCounted(self, x, y, radius, filter, countLimit)
    local ____GroupEnumUnitsInRangeCounted_5 = GroupEnumUnitsInRangeCounted
    local ____array_4 = __TS__SparseArrayNew(self.handle, x, y, radius)
    local ____temp_3
    if type(filter) == "function" then
        ____temp_3 = Filter(filter)
    else
        ____temp_3 = filter
    end
    __TS__SparseArrayPush(____array_4, ____temp_3, countLimit)
    ____GroupEnumUnitsInRangeCounted_5(__TS__SparseArraySpread(____array_4))
end
function Group.prototype.enumUnitsInRangeOfPoint(self, whichPoint, radius, filter)
    local ____GroupEnumUnitsInRangeOfLoc_8 = GroupEnumUnitsInRangeOfLoc
    local ____array_7 = __TS__SparseArrayNew(self.handle, whichPoint.handle, radius)
    local ____temp_6
    if type(filter) == "function" then
        ____temp_6 = Filter(filter)
    else
        ____temp_6 = filter
    end
    __TS__SparseArrayPush(____array_7, ____temp_6)
    ____GroupEnumUnitsInRangeOfLoc_8(__TS__SparseArraySpread(____array_7))
end
function Group.prototype.enumUnitsInRangeOfPointCounted(self, whichPoint, radius, filter, countLimit)
    local ____GroupEnumUnitsInRangeOfLocCounted_11 = GroupEnumUnitsInRangeOfLocCounted
    local ____array_10 = __TS__SparseArrayNew(self.handle, whichPoint.handle, radius)
    local ____temp_9
    if type(filter) == "function" then
        ____temp_9 = Filter(filter)
    else
        ____temp_9 = filter
    end
    __TS__SparseArrayPush(____array_10, ____temp_9, countLimit)
    ____GroupEnumUnitsInRangeOfLocCounted_11(__TS__SparseArraySpread(____array_10))
end
function Group.prototype.enumUnitsInRect(self, r, filter)
    local ____GroupEnumUnitsInRect_15 = GroupEnumUnitsInRect
    local ____self_handle_13 = self.handle
    local ____r_handle_14 = r.handle
    local ____temp_12
    if type(filter) == "function" then
        ____temp_12 = Filter(filter)
    else
        ____temp_12 = filter
    end
    ____GroupEnumUnitsInRect_15(____self_handle_13, ____r_handle_14, ____temp_12)
end
function Group.prototype.enumUnitsInRectCounted(self, r, filter, countLimit)
    local ____GroupEnumUnitsInRectCounted_19 = GroupEnumUnitsInRectCounted
    local ____self_handle_17 = self.handle
    local ____r_handle_18 = r.handle
    local ____temp_16
    if type(filter) == "function" then
        ____temp_16 = Filter(filter)
    else
        ____temp_16 = filter
    end
    ____GroupEnumUnitsInRectCounted_19(____self_handle_17, ____r_handle_18, ____temp_16, countLimit)
end
function Group.prototype.enumUnitsOfPlayer(self, whichPlayer, filter)
    local ____GroupEnumUnitsOfPlayer_23 = GroupEnumUnitsOfPlayer
    local ____self_handle_21 = self.handle
    local ____whichPlayer_handle_22 = whichPlayer.handle
    local ____temp_20
    if type(filter) == "function" then
        ____temp_20 = Filter(filter)
    else
        ____temp_20 = filter
    end
    ____GroupEnumUnitsOfPlayer_23(____self_handle_21, ____whichPlayer_handle_22, ____temp_20)
end
function Group.prototype.enumUnitsOfType(self, unitName, filter)
    local ____GroupEnumUnitsOfType_27 = GroupEnumUnitsOfType
    local ____self_handle_25 = self.handle
    local ____unitName_26 = unitName
    local ____temp_24
    if type(filter) == "function" then
        ____temp_24 = Filter(filter)
    else
        ____temp_24 = filter
    end
    ____GroupEnumUnitsOfType_27(____self_handle_25, ____unitName_26, ____temp_24)
end
function Group.prototype.enumUnitsOfTypeCounted(self, unitName, filter, countLimit)
    local ____GroupEnumUnitsOfTypeCounted_31 = GroupEnumUnitsOfTypeCounted
    local ____self_handle_29 = self.handle
    local ____unitName_30 = unitName
    local ____temp_28
    if type(filter) == "function" then
        ____temp_28 = Filter(filter)
    else
        ____temp_28 = filter
    end
    ____GroupEnumUnitsOfTypeCounted_31(____self_handle_29, ____unitName_30, ____temp_28, countLimit)
end
function Group.prototype.enumUnitsSelected(self, whichPlayer, filter)
    local ____GroupEnumUnitsSelected_35 = GroupEnumUnitsSelected
    local ____self_handle_33 = self.handle
    local ____whichPlayer_handle_34 = whichPlayer.handle
    local ____temp_32
    if type(filter) == "function" then
        ____temp_32 = Filter(filter)
    else
        ____temp_32 = filter
    end
    ____GroupEnumUnitsSelected_35(____self_handle_33, ____whichPlayer_handle_34, ____temp_32)
end
Group.prototype["for"] = function(self, callback)
    ForGroup(self.handle, callback)
end
function Group.prototype.getUnits(self)
    local units = {}
    self["for"](
        self,
        function() return __TS__ArrayPush(
            units,
            Unit:fromFilter()
        ) end
    )
    return units
end
function Group.prototype.getUnitAt(self, index)
    return Unit:fromHandle(BlzGroupUnitAt(self.handle, index))
end
function Group.prototype.hasUnit(self, whichUnit)
    return IsUnitInGroup(whichUnit.handle, self.handle)
end
function Group.prototype.orderCoords(self, order, x, y)
    if type(order) == "string" then
        GroupPointOrder(self.handle, order, x, y)
    else
        GroupPointOrderById(self.handle, order, x, y)
    end
end
function Group.prototype.orderImmediate(self, order)
    if type(order) == "string" then
        GroupImmediateOrder(self.handle, order)
    else
        GroupImmediateOrderById(self.handle, order)
    end
end
function Group.prototype.orderPoint(self, order, whichPoint)
    if type(order) == "string" then
        GroupPointOrderLoc(self.handle, order, whichPoint.handle)
    else
        GroupPointOrderByIdLoc(self.handle, order, whichPoint.handle)
    end
end
function Group.prototype.orderTarget(self, order, targetWidget)
    if type(order) == "string" then
        GroupTargetOrder(self.handle, order, targetWidget.handle)
    else
        GroupTargetOrderById(self.handle, order, targetWidget.handle)
    end
end
function Group.prototype.removeGroupFast(self, removeGroup)
    return BlzGroupRemoveGroupFast(self.handle, removeGroup.handle)
end
function Group.prototype.removeUnit(self, whichUnit)
    return GroupRemoveUnit(self.handle, whichUnit.handle)
end
function Group.fromHandle(self, handle)
    return self:getObject(handle)
end
function Group.getEnumUnit(self)
    return Unit:fromHandle(GetEnumUnit())
end
function Group.getFilterUnit(self)
    return Unit:fromHandle(GetFilterUnit())
end
return ____exports
 end,
["lua_modules.w3ts.handles.image"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.ImageType = ImageType or ({})
____exports.ImageType.Selection = 1
____exports.ImageType[____exports.ImageType.Selection] = "Selection"
____exports.ImageType.Indicator = 2
____exports.ImageType[____exports.ImageType.Indicator] = "Indicator"
____exports.ImageType.OcclusionMask = 3
____exports.ImageType[____exports.ImageType.OcclusionMask] = "OcclusionMask"
____exports.ImageType.Ubersplat = 4
____exports.ImageType[____exports.ImageType.Ubersplat] = "Ubersplat"
____exports.Image = __TS__Class()
local Image = ____exports.Image
Image.name = "Image"
__TS__ClassExtends(Image, Handle)
function Image.prototype.____constructor(self, file, sizeX, sizeY, sizeZ, posX, posY, posZ, originX, originY, originZ, imageType)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateImage(
                file,
                sizeX,
                sizeY,
                sizeZ,
                posX,
                posY,
                posZ,
                originX,
                originY,
                originZ,
                imageType
            )
        )
    end
end
function Image.prototype.destroy(self)
    DestroyImage(self.handle)
end
function Image.prototype.setAboveWater(self, flag, useWaterAlpha)
    SetImageAboveWater(self.handle, flag, useWaterAlpha)
end
function Image.prototype.setColor(self, red, green, blue, alpha)
    SetImageColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Image.prototype.setConstantHeight(self, flag, height)
    SetImageConstantHeight(self.handle, flag, height)
end
function Image.prototype.setPosition(self, x, y, z)
    SetImagePosition(self.handle, x, y, z)
end
function Image.prototype.setRender(self, flag)
    SetImageRenderAlways(self.handle, flag)
end
function Image.prototype.setType(self, imageType)
    SetImageType(self.handle, imageType)
end
function Image.prototype.show(self, flag)
    ShowImage(self.handle, flag)
end
function Image.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.leaderboard"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Leaderboard = __TS__Class()
local Leaderboard = ____exports.Leaderboard
Leaderboard.name = "Leaderboard"
__TS__ClassExtends(Leaderboard, Handle)
function Leaderboard.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateLeaderboard()
        )
    end
end
__TS__SetDescriptor(
    Leaderboard.prototype,
    "displayed",
    {get = function(self)
        return IsLeaderboardDisplayed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Leaderboard.prototype,
    "itemCount",
    {
        get = function(self)
            return LeaderboardGetItemCount(self.handle)
        end,
        set = function(self, count)
            LeaderboardSetSizeByItemCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Leaderboard.prototype,
    "label",
    {
        get = function(self)
            return LeaderboardGetLabelText(self.handle)
        end,
        set = function(self, value)
            LeaderboardSetLabel(self.handle, value)
        end
    },
    true
)
function Leaderboard.prototype.addItem(self, label, value, p)
    LeaderboardAddItem(self.handle, label, value, p.handle)
end
function Leaderboard.prototype.clear(self)
    LeaderboardClear(self.handle)
end
function Leaderboard.prototype.destroy(self)
    DestroyLeaderboard(self.handle)
end
function Leaderboard.prototype.display(self, flag)
    if flag == nil then
        flag = true
    end
    LeaderboardDisplay(self.handle, flag)
end
function Leaderboard.prototype.getPlayerIndex(self, p)
    return LeaderboardGetPlayerIndex(self.handle, p.handle)
end
function Leaderboard.prototype.hasPlayerItem(self, p)
    LeaderboardHasPlayerItem(self.handle, p.handle)
end
function Leaderboard.prototype.removeItem(self, index)
    LeaderboardRemoveItem(self.handle, index)
end
function Leaderboard.prototype.removePlayerItem(self, p)
    LeaderboardRemovePlayerItem(self.handle, p.handle)
end
function Leaderboard.prototype.setItemLabel(self, item, label)
    LeaderboardSetItemLabel(self.handle, item, label)
end
function Leaderboard.prototype.setItemLabelColor(self, item, red, green, blue, alpha)
    LeaderboardSetItemLabelColor(
        self.handle,
        item,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setItemStyle(self, item, showLabel, showValues, showIcons)
    if showLabel == nil then
        showLabel = true
    end
    if showValues == nil then
        showValues = true
    end
    if showIcons == nil then
        showIcons = true
    end
    LeaderboardSetItemStyle(
        self.handle,
        item,
        showLabel,
        showValues,
        showIcons
    )
end
function Leaderboard.prototype.setItemValue(self, item, value)
    LeaderboardSetItemValue(self.handle, item, value)
end
function Leaderboard.prototype.setItemValueColor(self, item, red, green, blue, alpha)
    LeaderboardSetItemValueColor(
        self.handle,
        item,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setLabelColor(self, red, green, blue, alpha)
    LeaderboardSetLabelColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setPlayerBoard(self, p)
    PlayerSetLeaderboard(p.handle, self.handle)
end
function Leaderboard.prototype.setStyle(self, showLabel, showNames, showValues, showIcons)
    if showLabel == nil then
        showLabel = true
    end
    if showNames == nil then
        showNames = true
    end
    if showValues == nil then
        showValues = true
    end
    if showIcons == nil then
        showIcons = true
    end
    LeaderboardSetStyle(
        self.handle,
        showLabel,
        showNames,
        showValues,
        showIcons
    )
end
function Leaderboard.prototype.setValueColor(self, red, green, blue, alpha)
    LeaderboardSetValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.sortByLabel(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByLabel(self.handle, asc)
end
function Leaderboard.prototype.sortByPlayer(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByPlayer(self.handle, asc)
end
function Leaderboard.prototype.sortByValue(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByValue(self.handle, asc)
end
function Leaderboard.fromHandle(self, handle)
    return self:getObject(handle)
end
function Leaderboard.fromPlayer(self, p)
    return self:fromHandle(PlayerGetLeaderboard(p.handle))
end
return ____exports
 end,
["lua_modules.w3ts.handles.multiboard"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.MultiboardItem = __TS__Class()
local MultiboardItem = ____exports.MultiboardItem
MultiboardItem.name = "MultiboardItem"
__TS__ClassExtends(MultiboardItem, Handle)
function MultiboardItem.prototype.____constructor(self, board, x, y)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            MultiboardGetItem(board.handle, x - 1, y - 1)
        )
    end
end
function MultiboardItem.prototype.destroy(self)
    MultiboardReleaseItem(self.handle)
end
function MultiboardItem.prototype.setIcon(self, icon)
    MultiboardSetItemIcon(self.handle, icon)
end
function MultiboardItem.prototype.setStyle(self, showValue, showIcon)
    MultiboardSetItemStyle(self.handle, showValue, showIcon)
end
function MultiboardItem.prototype.setValue(self, val)
    MultiboardSetItemValue(self.handle, val)
end
function MultiboardItem.prototype.setValueColor(self, red, green, blue, alpha)
    MultiboardSetItemValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function MultiboardItem.prototype.setWidth(self, width)
    MultiboardSetItemWidth(self.handle, width)
end
function MultiboardItem.fromHandle(self, handle)
    return self:getObject(handle)
end
____exports.Multiboard = __TS__Class()
local Multiboard = ____exports.Multiboard
Multiboard.name = "Multiboard"
__TS__ClassExtends(Multiboard, Handle)
function Multiboard.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateMultiboard()
        )
    end
end
__TS__SetDescriptor(
    Multiboard.prototype,
    "columns",
    {
        get = function(self)
            return MultiboardGetColumnCount(self.handle)
        end,
        set = function(self, count)
            MultiboardSetColumnCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "displayed",
    {get = function(self)
        return IsMultiboardDisplayed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "rows",
    {
        get = function(self)
            return MultiboardGetRowCount(self.handle)
        end,
        set = function(self, count)
            MultiboardSetRowCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "title",
    {
        get = function(self)
            return MultiboardGetTitleText(self.handle)
        end,
        set = function(self, label)
            MultiboardSetTitleText(self.handle, label)
        end
    },
    true
)
function Multiboard.prototype.clear(self)
    MultiboardClear(self.handle)
end
function Multiboard.prototype.createItem(self, x, y)
    return __TS__New(____exports.MultiboardItem, self, x, y)
end
function Multiboard.prototype.destroy(self)
    DestroyMultiboard(self.handle)
end
function Multiboard.prototype.display(self, show)
    MultiboardDisplay(self.handle, show)
end
function Multiboard.prototype.minimize(self, flag)
    MultiboardMinimize(self.handle, flag)
end
function Multiboard.prototype.minimized(self)
    return IsMultiboardMinimized(self.handle)
end
function Multiboard.prototype.setItemsIcons(self, icon)
    MultiboardSetItemsIcon(self.handle, icon)
end
function Multiboard.prototype.setItemsStyle(self, showValues, showIcons)
    MultiboardSetItemsStyle(self.handle, showValues, showIcons)
end
function Multiboard.prototype.setItemsValue(self, value)
    MultiboardSetItemsValue(self.handle, value)
end
function Multiboard.prototype.setItemsValueColor(self, red, green, blue, alpha)
    MultiboardSetItemsValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Multiboard.prototype.setItemsWidth(self, width)
    MultiboardSetItemsWidth(self.handle, width)
end
function Multiboard.prototype.setTitleTextColor(self, red, green, blue, alpha)
    MultiboardSetTitleTextColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Multiboard.fromHandle(self, handle)
    return self:getObject(handle)
end
function Multiboard.suppressDisplay(self, flag)
    MultiboardSuppressDisplay(flag)
end
return ____exports
 end,
["lua_modules.w3ts.handles.quest"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.QuestItem = __TS__Class()
local QuestItem = ____exports.QuestItem
QuestItem.name = "QuestItem"
__TS__ClassExtends(QuestItem, Handle)
function QuestItem.prototype.____constructor(self, whichQuest)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            QuestCreateItem(whichQuest.handle)
        )
    end
end
__TS__SetDescriptor(
    QuestItem.prototype,
    "completed",
    {
        get = function(self)
            return IsQuestItemCompleted(self.handle)
        end,
        set = function(self, completed)
            QuestItemSetCompleted(self.handle, completed)
        end
    },
    true
)
function QuestItem.prototype.setDescription(self, description)
    QuestItemSetDescription(self.handle, description)
end
____exports.Quest = __TS__Class()
local Quest = ____exports.Quest
Quest.name = "Quest"
__TS__ClassExtends(Quest, Handle)
function Quest.prototype.____constructor(self)
    local ____self_1 = self
    local ____Handle_initFromHandle_result_0
    if Handle:initFromHandle() then
        ____Handle_initFromHandle_result_0 = nil
    else
        ____Handle_initFromHandle_result_0 = CreateQuest()
    end
    Handle.prototype.____constructor(____self_1, ____Handle_initFromHandle_result_0)
end
__TS__SetDescriptor(
    Quest.prototype,
    "completed",
    {
        get = function(self)
            return IsQuestCompleted(self.handle)
        end,
        set = function(self, completed)
            QuestSetCompleted(self.handle, completed)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "discovered",
    {
        get = function(self)
            return IsQuestDiscovered(self.handle)
        end,
        set = function(self, discovered)
            QuestSetDiscovered(self.handle, discovered)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "enabled",
    {
        get = function(self)
            return IsQuestEnabled(self.handle)
        end,
        set = function(self, enabled)
            QuestSetEnabled(self.handle, enabled)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "failed",
    {
        get = function(self)
            return IsQuestFailed(self.handle)
        end,
        set = function(self, failed)
            QuestSetFailed(self.handle, failed)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "required",
    {
        get = function(self)
            return IsQuestRequired(self.handle)
        end,
        set = function(self, required)
            QuestSetRequired(self.handle, required)
        end
    },
    true
)
function Quest.prototype.addItem(self, description)
    local questItem = __TS__New(____exports.QuestItem, self)
    questItem:setDescription(description)
    return questItem
end
function Quest.prototype.destroy(self)
    DestroyQuest(self.handle)
end
function Quest.prototype.setDescription(self, description)
    QuestSetDescription(self.handle, description)
end
function Quest.prototype.setIcon(self, iconPath)
    QuestSetIconPath(self.handle, iconPath)
end
function Quest.prototype.setTitle(self, title)
    QuestSetTitle(self.handle, title)
end
function Quest.flashQuestDialogButton(self)
    FlashQuestDialogButton()
end
function Quest.forceQuestDialogUpdate(self)
    ForceQuestDialogUpdate()
end
function Quest.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.region"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Region = __TS__Class()
local Region = ____exports.Region
Region.name = "Region"
__TS__ClassExtends(Region, Handle)
function Region.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateRegion()
        )
    end
end
function Region.prototype.addCell(self, x, y)
    RegionAddCell(self.handle, x, y)
end
function Region.prototype.addCellPoint(self, whichPoint)
    RegionAddCellAtLoc(self.handle, whichPoint.handle)
end
function Region.prototype.addRect(self, r)
    RegionAddRect(self.handle, r.handle)
end
function Region.prototype.clearCell(self, x, y)
    RegionClearCell(self.handle, x, y)
end
function Region.prototype.clearCellPoint(self, whichPoint)
    RegionClearCellAtLoc(self.handle, whichPoint.handle)
end
function Region.prototype.clearRect(self, r)
    RegionClearRect(self.handle, r.handle)
end
function Region.prototype.containsCoords(self, x, y)
    return IsPointInRegion(self.handle, x, y)
end
function Region.prototype.containsPoint(self, whichPoint)
    IsLocationInRegion(self.handle, whichPoint.handle)
end
function Region.prototype.containsUnit(self, whichUnit)
    return IsUnitInRegion(self.handle, whichUnit.handle)
end
function Region.prototype.destroy(self)
    RemoveRegion(self.handle)
end
function Region.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.texttag"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.TextTag = __TS__Class()
local TextTag = ____exports.TextTag
TextTag.name = "TextTag"
__TS__ClassExtends(TextTag, Handle)
function TextTag.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateTextTag()
        )
    end
end
function TextTag.prototype.destroy(self)
    DestroyTextTag(self.handle)
end
function TextTag.prototype.setAge(self, age)
    SetTextTagAge(self.handle, age)
end
function TextTag.prototype.setColor(self, red, green, blue, alpha)
    SetTextTagColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function TextTag.prototype.setFadepoint(self, fadepoint)
    SetTextTagFadepoint(self.handle, fadepoint)
end
function TextTag.prototype.setLifespan(self, lifespan)
    SetTextTagLifespan(self.handle, lifespan)
end
function TextTag.prototype.setPermanent(self, flag)
    SetTextTagPermanent(self.handle, flag)
end
function TextTag.prototype.setPos(self, x, y, heightOffset)
    SetTextTagPos(self.handle, x, y, heightOffset)
end
function TextTag.prototype.setPosUnit(self, u, heightOffset)
    SetTextTagPosUnit(self.handle, u.handle, heightOffset)
end
function TextTag.prototype.setSuspended(self, flag)
    SetTextTagSuspended(self.handle, flag)
end
function TextTag.prototype.setText(self, s, height, adjustHeight)
    if adjustHeight == nil then
        adjustHeight = false
    end
    if adjustHeight then
        height = height * 0.0023
    end
    SetTextTagText(self.handle, s, height)
end
function TextTag.prototype.setVelocity(self, xvel, yvel)
    SetTextTagVelocity(self.handle, xvel, yvel)
end
function TextTag.prototype.setVelocityAngle(self, speed, angle)
    local vel = speed * 0.071 / 128
    self:setVelocity(
        vel * Cos(angle * bj_DEGTORAD),
        vel * Sin(angle * bj_DEGTORAD)
    )
end
function TextTag.prototype.setVisible(self, flag)
    SetTextTagVisibility(self.handle, flag)
end
function TextTag.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.timer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Timer = __TS__Class()
local Timer = ____exports.Timer
Timer.name = "Timer"
__TS__ClassExtends(Timer, Handle)
function Timer.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateTimer()
        )
    end
end
__TS__SetDescriptor(
    Timer.prototype,
    "elapsed",
    {get = function(self)
        return TimerGetElapsed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Timer.prototype,
    "remaining",
    {get = function(self)
        return TimerGetRemaining(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Timer.prototype,
    "timeout",
    {get = function(self)
        return TimerGetTimeout(self.handle)
    end},
    true
)
function Timer.prototype.destroy(self)
    DestroyTimer(self.handle)
    return self
end
function Timer.prototype.pause(self)
    PauseTimer(self.handle)
    return self
end
function Timer.prototype.resume(self)
    ResumeTimer(self.handle)
    return self
end
function Timer.prototype.start(self, timeout, periodic, handlerFunc)
    TimerStart(self.handle, timeout, periodic, handlerFunc)
    return self
end
function Timer.fromExpired(self)
    return self:fromHandle(GetExpiredTimer())
end
function Timer.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.timerdialog"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.TimerDialog = __TS__Class()
local TimerDialog = ____exports.TimerDialog
TimerDialog.name = "TimerDialog"
__TS__ClassExtends(TimerDialog, Handle)
function TimerDialog.prototype.____constructor(self, t)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateTimerDialog(t.handle)
        )
    end
end
__TS__SetDescriptor(
    TimerDialog.prototype,
    "display",
    {
        get = function(self)
            return IsTimerDialogDisplayed(self.handle)
        end,
        set = function(self, display)
            TimerDialogDisplay(self.handle, display)
        end
    },
    true
)
function TimerDialog.prototype.destroy(self)
    DestroyTimerDialog(self.handle)
end
function TimerDialog.prototype.setSpeed(self, speedMultFactor)
    TimerDialogSetSpeed(self.handle, speedMultFactor)
end
function TimerDialog.prototype.setTimeRemaining(self, value)
    TimerDialogSetRealTimeRemaining(self.handle, value)
end
function TimerDialog.prototype.setTitle(self, title)
    TimerDialogSetTitle(self.handle, title)
end
function TimerDialog.prototype.setTitleColor(self, red, green, blue, alpha)
    TimerDialogSetTitleColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function TimerDialog.prototype.setTimeColor(self, red, green, blue, alpha)
    TimerDialogSetTimeColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function TimerDialog.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.trigger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Trigger = __TS__Class()
local Trigger = ____exports.Trigger
Trigger.name = "Trigger"
__TS__ClassExtends(Trigger, Handle)
function Trigger.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateTrigger()
        )
    end
end
__TS__SetDescriptor(
    Trigger.prototype,
    "enabled",
    {
        get = function(self)
            return IsTriggerEnabled(self.handle)
        end,
        set = function(self, flag)
            if flag then
                EnableTrigger(self.handle)
            else
                DisableTrigger(self.handle)
            end
        end
    },
    true
)
__TS__SetDescriptor(
    Trigger.prototype,
    "evalCount",
    {get = function(self)
        return GetTriggerEvalCount(self.handle)
    end},
    true
)
__TS__ObjectDefineProperty(
    Trigger,
    "eventId",
    {get = function(self)
        return GetTriggerEventId()
    end}
)
__TS__SetDescriptor(
    Trigger.prototype,
    "execCount",
    {get = function(self)
        return GetTriggerExecCount(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Trigger.prototype,
    "waitOnSleeps",
    {
        get = function(self)
            return IsTriggerWaitOnSleeps(self.handle)
        end,
        set = function(self, flag)
            TriggerWaitOnSleeps(self.handle, flag)
        end
    },
    true
)
function Trigger.prototype.addAction(self, actionFunc)
    return TriggerAddAction(self.handle, actionFunc)
end
function Trigger.prototype.addCondition(self, condition)
    local ____TriggerAddCondition_2 = TriggerAddCondition
    local ____self_handle_1 = self.handle
    local ____temp_0
    if type(condition) == "function" then
        ____temp_0 = Condition(condition)
    else
        ____temp_0 = condition
    end
    return ____TriggerAddCondition_2(____self_handle_1, ____temp_0)
end
function Trigger.prototype.destroy(self)
    DestroyTrigger(self.handle)
end
function Trigger.prototype.eval(self)
    return TriggerEvaluate(self.handle)
end
function Trigger.prototype.exec(self)
    return TriggerExecute(self.handle)
end
function Trigger.prototype.execWait(self)
    TriggerExecuteWait(self.handle)
end
function Trigger.prototype.registerAnyUnitEvent(self, whichPlayerUnitEvent)
    return TriggerRegisterAnyUnitEventBJ(self.handle, whichPlayerUnitEvent)
end
function Trigger.prototype.registerCommandEvent(self, whichAbility, order)
    return TriggerRegisterCommandEvent(self.handle, whichAbility, order)
end
function Trigger.prototype.registerDeathEvent(self, whichWidget)
    return TriggerRegisterDeathEvent(self.handle, whichWidget.handle)
end
function Trigger.prototype.registerDialogButtonEvent(self, whichButton)
    return TriggerRegisterDialogButtonEvent(self.handle, whichButton.handle)
end
function Trigger.prototype.registerDialogEvent(self, whichDialog)
    return TriggerRegisterDialogEvent(self.handle, whichDialog.handle)
end
function Trigger.prototype.registerEnterRegion(self, whichRegion, filter)
    local ____TriggerRegisterEnterRegion_6 = TriggerRegisterEnterRegion
    local ____self_handle_4 = self.handle
    local ____whichRegion_5 = whichRegion
    local ____temp_3
    if type(filter) == "function" then
        ____temp_3 = Filter(filter)
    else
        ____temp_3 = filter
    end
    return ____TriggerRegisterEnterRegion_6(____self_handle_4, ____whichRegion_5, ____temp_3)
end
function Trigger.prototype.registerFilterUnitEvent(self, whichUnit, whichEvent, filter)
    local ____TriggerRegisterFilterUnitEvent_9 = TriggerRegisterFilterUnitEvent
    local ____array_8 = __TS__SparseArrayNew(self.handle, whichUnit, whichEvent)
    local ____temp_7
    if type(filter) == "function" then
        ____temp_7 = Filter(filter)
    else
        ____temp_7 = filter
    end
    __TS__SparseArrayPush(____array_8, ____temp_7)
    return ____TriggerRegisterFilterUnitEvent_9(__TS__SparseArraySpread(____array_8))
end
function Trigger.prototype.registerGameEvent(self, whichGameEvent)
    return TriggerRegisterGameEvent(self.handle, whichGameEvent)
end
function Trigger.prototype.registerGameStateEvent(self, whichState, opcode, limitval)
    return TriggerRegisterGameStateEvent(self.handle, whichState, opcode, limitval)
end
function Trigger.prototype.registerLeaveRegion(self, whichRegion, filter)
    local ____TriggerRegisterLeaveRegion_13 = TriggerRegisterLeaveRegion
    local ____self_handle_11 = self.handle
    local ____whichRegion_12 = whichRegion
    local ____temp_10
    if type(filter) == "function" then
        ____temp_10 = Filter(filter)
    else
        ____temp_10 = filter
    end
    return ____TriggerRegisterLeaveRegion_13(____self_handle_11, ____whichRegion_12, ____temp_10)
end
function Trigger.prototype.registerPlayerAllianceChange(self, whichPlayer, whichAlliance)
    return TriggerRegisterPlayerAllianceChange(self.handle, whichPlayer.handle, whichAlliance)
end
function Trigger.prototype.registerPlayerChatEvent(self, whichPlayer, chatMessageToDetect, exactMatchOnly)
    return TriggerRegisterPlayerChatEvent(self.handle, whichPlayer.handle, chatMessageToDetect, exactMatchOnly)
end
function Trigger.prototype.registerPlayerEvent(self, whichPlayer, whichPlayerEvent)
    return TriggerRegisterPlayerEvent(self.handle, whichPlayer.handle, whichPlayerEvent)
end
function Trigger.prototype.registerPlayerKeyEvent(self, whichPlayer, whichKey, metaKey, fireOnKeyDown)
    return BlzTriggerRegisterPlayerKeyEvent(
        self.handle,
        whichPlayer.handle,
        whichKey,
        metaKey,
        fireOnKeyDown
    )
end
function Trigger.prototype.registerPlayerMouseEvent(self, whichPlayer, whichMouseEvent)
    return TriggerRegisterPlayerMouseEventBJ(self.handle, whichPlayer.handle, whichMouseEvent)
end
function Trigger.prototype.registerPlayerStateEvent(self, whichPlayer, whichState, opcode, limitval)
    return TriggerRegisterPlayerStateEvent(
        self.handle,
        whichPlayer.handle,
        whichState,
        opcode,
        limitval
    )
end
function Trigger.prototype.registerPlayerSyncEvent(self, whichPlayer, prefix, fromServer)
    return BlzTriggerRegisterPlayerSyncEvent(self.handle, whichPlayer.handle, prefix, fromServer)
end
function Trigger.prototype.registerPlayerUnitEvent(self, whichPlayer, whichPlayerUnitEvent, filter)
    local ____TriggerRegisterPlayerUnitEvent_16 = TriggerRegisterPlayerUnitEvent
    local ____array_15 = __TS__SparseArrayNew(self.handle, whichPlayer.handle, whichPlayerUnitEvent)
    local ____temp_14
    if type(filter) == "function" then
        ____temp_14 = Filter(filter)
    else
        ____temp_14 = filter
    end
    __TS__SparseArrayPush(____array_15, ____temp_14)
    return ____TriggerRegisterPlayerUnitEvent_16(__TS__SparseArraySpread(____array_15))
end
function Trigger.prototype.registerTimerEvent(self, timeout, periodic)
    return TriggerRegisterTimerEvent(self.handle, timeout, periodic)
end
function Trigger.prototype.registerTimerExpireEvent(self, t)
    return TriggerRegisterTimerExpireEvent(self.handle, t)
end
function Trigger.prototype.registerTrackableHitEvent(self, whichTrackable)
    return TriggerRegisterTrackableHitEvent(self.handle, whichTrackable)
end
function Trigger.prototype.registerTrackableTrackEvent(self, whichTrackable)
    return TriggerRegisterTrackableTrackEvent(self.handle, whichTrackable)
end
function Trigger.prototype.registerUnitEvent(self, whichUnit, whichEvent)
    return TriggerRegisterUnitEvent(self.handle, whichUnit.handle, whichEvent)
end
function Trigger.prototype.registerUnitInRage(self, whichUnit, range, filter)
    local ____TriggerRegisterUnitInRange_19 = TriggerRegisterUnitInRange
    local ____array_18 = __TS__SparseArrayNew(self.handle, whichUnit, range)
    local ____temp_17
    if type(filter) == "function" then
        ____temp_17 = Filter(filter)
    else
        ____temp_17 = filter
    end
    __TS__SparseArrayPush(____array_18, ____temp_17)
    return ____TriggerRegisterUnitInRange_19(__TS__SparseArraySpread(____array_18))
end
function Trigger.prototype.registerUnitStateEvent(self, whichUnit, whichState, opcode, limitval)
    return TriggerRegisterUnitStateEvent(
        self.handle,
        whichUnit.handle,
        whichState,
        opcode,
        limitval
    )
end
function Trigger.prototype.registerUpgradeCommandEvent(self, whichUpgrade)
    return TriggerRegisterUpgradeCommandEvent(self.handle, whichUpgrade)
end
function Trigger.prototype.registerVariableEvent(self, varName, opcode, limitval)
    return TriggerRegisterVariableEvent(self.handle, varName, opcode, limitval)
end
function Trigger.prototype.removeAction(self, whichAction)
    return TriggerRemoveAction(self.handle, whichAction)
end
function Trigger.prototype.removeActions(self)
    return TriggerClearActions(self.handle)
end
function Trigger.prototype.removeCondition(self, whichCondition)
    return TriggerRemoveCondition(self.handle, whichCondition)
end
function Trigger.prototype.removeConditions(self)
    return TriggerClearConditions(self.handle)
end
function Trigger.prototype.reset(self)
    ResetTrigger(self.handle)
end
function Trigger.prototype.triggerRegisterFrameEvent(self, frame, eventId)
    return BlzTriggerRegisterFrameEvent(self.handle, frame.handle, eventId)
end
function Trigger.fromEvent(self)
    return self:fromHandle(GetTriggeringTrigger())
end
function Trigger.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.ubersplat"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Ubersplat = __TS__Class()
local Ubersplat = ____exports.Ubersplat
Ubersplat.name = "Ubersplat"
__TS__ClassExtends(Ubersplat, Handle)
function Ubersplat.prototype.____constructor(self, x, y, name, red, green, blue, alpha, forcePaused, noBirthTime)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateUbersplat(
                x,
                y,
                name,
                red,
                green,
                blue,
                alpha,
                forcePaused,
                noBirthTime
            )
        )
    end
end
function Ubersplat.prototype.destroy(self)
    DestroyUbersplat(self.handle)
end
function Ubersplat.prototype.finish(self)
    FinishUbersplat(self.handle)
end
function Ubersplat.prototype.render(self, flag, always)
    if always == nil then
        always = false
    end
    if always then
        SetUbersplatRenderAlways(self.handle, flag)
    else
        SetUbersplatRender(self.handle, flag)
    end
end
function Ubersplat.prototype.reset(self)
    ResetUbersplat(self.handle)
end
function Ubersplat.prototype.show(self, flag)
    ShowUbersplat(self.handle, flag)
end
function Ubersplat.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.weathereffect"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____handle = require("lua_modules.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.WeatherEffect = __TS__Class()
local WeatherEffect = ____exports.WeatherEffect
WeatherEffect.name = "WeatherEffect"
__TS__ClassExtends(WeatherEffect, Handle)
function WeatherEffect.prototype.____constructor(self, where, effectID)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            AddWeatherEffect(where.handle, effectID)
        )
    end
end
function WeatherEffect.prototype.destroy(self)
    RemoveWeatherEffect(self.handle)
end
function WeatherEffect.prototype.enable(self, flag)
    EnableWeatherEffect(self.handle, flag)
end
function WeatherEffect.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
 end,
["lua_modules.w3ts.handles.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("lua_modules.w3ts.handles.camera")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.destructable")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.dialog")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.effect")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.fogmodifier")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.force")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.frame")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.gamecache")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.group")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.handle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.image")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.item")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.leaderboard")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.multiboard")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.player")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.point")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.quest")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.rect")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.region")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.sound")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.texttag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.timer")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.timerdialog")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.trigger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.ubersplat")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.unit")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.weathereffect")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.handles.widget")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.w3ts.hooks.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
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
["lua_modules.w3ts.system.base64"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringCharAt = ____lualib.__TS__StringCharAt
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__StringSubstr = ____lualib.__TS__StringSubstr
local ____exports = {}
local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
function ____exports.base64Encode(input)
    local output = ""
    do
        local block = 0
        local charCode = 0
        local idx = 0
        local map = chars
        while true do
            local ____temp_2 = #__TS__StringCharAt(
                input,
                math.floor(idx) | 0
            ) > 0
            if not ____temp_2 then
                map = "="
                local ____ = map
                ____temp_2 = idx % 1
            end
            if not ____temp_2 then
                break
            end
            local ____string_byte_1 = string.byte
            local ____input_0 = input
            idx = idx + 3 / 4
            charCode = ____string_byte_1(
                ____input_0,
                math.floor(idx) + 1
            ) or 0
            if math.floor(idx) > #input and charCode == 0 then
                if #output % 4 == 1 then
                    return output .. "="
                end
                return output .. "=="
            end
            if charCode > 255 then
                print("'base64Encode' failed: The string to be encoded contains characters outside of the Latin1 range.")
                return output
            end
            block = block << 8 | charCode
            output = output .. __TS__StringCharAt(
                map,
                math.floor(63 & block >> 8 - idx % 1 * 8)
            )
        end
    end
    return output
end
function ____exports.base64Decode(input)
    local i = #input
    do
        while i > 0 and __TS__StringAccess(input, i) ~= "=" do
            i = i - 1
        end
    end
    local str = __TS__StringSubstr(input, 0, i - 1)
    local output = ""
    if #str % 4 == 1 then
        print("'base64Decode' failed: The string to be decoded is not correctly encoded.")
        return output
    end
    local bs = 0
    do
        local bc = 0
        local buffer
        local idx = 0
        while true do
            buffer = __TS__StringCharAt(str, idx)
            if not buffer then
                break
            end
            if #tostring(buffer) == 0 then
                break
            end
            buffer = (string.find(chars, buffer, nil, true) or 0) - 1
            idx = idx + 1
            local ____temp_6
            local ____temp_5 = ~buffer
            if ____temp_5 then
                local ____temp_3
                if bc % 4 ~= 0 then
                    ____temp_3 = bs * 64 + buffer
                else
                    ____temp_3 = buffer
                end
                bs = ____temp_3
                local ____ = bs
                local ____bc_4 = bc
                bc = ____bc_4 + 1
                ____temp_5 = ____bc_4 % 4 ~= 0
            end
            if ____temp_5 then
                output = output .. string.char(255 & bs >> (-2 * bc & 6))
                ____temp_6 = output
            else
                ____temp_6 = 0
            end
        end
    end
    return output
end
return ____exports
 end,
["lua_modules.w3ts.system.binaryreader"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.BinaryReader = __TS__Class()
local BinaryReader = ____exports.BinaryReader
BinaryReader.name = "BinaryReader"
function BinaryReader.prototype.____constructor(self, binaryString)
    self.pos = 1
    self.data = binaryString
end
function BinaryReader.prototype.read(self, fmt, size)
    local unpacked = {string.unpack(fmt, self.data, self.pos)}
    self.pos = self.pos + size
    if #unpacked <= 0 then
        return 0
    end
    return unpacked[1]
end
function BinaryReader.prototype.readDouble(self)
    return self:read(">d", 4)
end
function BinaryReader.prototype.readFloat(self)
    return self:read(">f", 4)
end
function BinaryReader.prototype.readInt16(self)
    return self:read(">h", 2)
end
function BinaryReader.prototype.readInt32(self)
    return self:read(">i4", 4)
end
function BinaryReader.prototype.readInt8(self)
    return self:read(">b", 1)
end
function BinaryReader.prototype.readString(self)
    local value = self:read(">z", 0)
    self.pos = self.pos + (#value + 1)
    return value
end
function BinaryReader.prototype.readUInt16(self)
    return self:read(">H", 2)
end
function BinaryReader.prototype.readUInt32(self)
    return self:read(">I4", 4)
end
function BinaryReader.prototype.readUInt8(self)
    return self:read(">B", 1)
end
return ____exports
 end,
["lua_modules.w3ts.system.binarywriter"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
____exports.BinaryWriter = __TS__Class()
local BinaryWriter = ____exports.BinaryWriter
BinaryWriter.name = "BinaryWriter"
function BinaryWriter.prototype.____constructor(self)
    self.values = {}
    self.fmj = ">"
end
function BinaryWriter.prototype.__tostring(self)
    return string.pack(
        self.fmj,
        table.unpack(self.values)
    )
end
function BinaryWriter.prototype.writeDouble(self, value)
    self.fmj = self.fmj .. "d"
    __TS__ArrayPush(self.values, value)
end
function BinaryWriter.prototype.writeFloat(self, value)
    self.fmj = self.fmj .. "f"
    __TS__ArrayPush(self.values, value)
end
function BinaryWriter.prototype.writeInt16(self, value)
    self.fmj = self.fmj .. "h"
    __TS__ArrayPush(self.values, value)
end
function BinaryWriter.prototype.writeInt32(self, value)
    self.fmj = self.fmj .. "i4"
    __TS__ArrayPush(self.values, value)
end
function BinaryWriter.prototype.writeInt8(self, value)
    self.fmj = self.fmj .. "b"
    __TS__ArrayPush(self.values, value)
end
function BinaryWriter.prototype.writeString(self, value)
    self.fmj = self.fmj .. "z"
    __TS__ArrayPush(self.values, value)
end
function BinaryWriter.prototype.writeUInt16(self, value)
    self.fmj = self.fmj .. "H"
    __TS__ArrayPush(self.values, value)
end
function BinaryWriter.prototype.writeUInt32(self, value)
    self.fmj = self.fmj .. "I4"
    __TS__ArrayPush(self.values, value)
end
function BinaryWriter.prototype.writeUInt8(self, value)
    self.fmj = self.fmj .. "B"
    __TS__ArrayPush(self.values, value)
end
return ____exports
 end,
["lua_modules.w3ts.system.file"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstr = ____lualib.__TS__StringSubstr
local ____exports = {}
____exports.File = __TS__Class()
local File = ____exports.File
File.name = "File"
function File.prototype.____constructor(self)
end
function File.escape(self, contents)
    contents = string.gsub(contents, ____exports.File.escapeCharacter, ____exports.File.escapedSelf)
    contents = string.gsub(contents, "\"", ____exports.File.escapedQuote)
    return contents
end
function File.unescape(self, contents)
    contents = string.gsub(contents, ____exports.File.escapedQuote, "\"")
    contents = string.gsub(contents, ____exports.File.escapedSelf, ____exports.File.escapeCharacter)
    return contents
end
function File.read(self, filename)
    local originalIcon = BlzGetAbilityIcon(self.dummyAbility)
    Preloader(filename)
    local preloadText = BlzGetAbilityIcon(self.dummyAbility)
    BlzSetAbilityIcon(self.dummyAbility, originalIcon)
    if preloadText ~= originalIcon then
        return ____exports.File:unescape(preloadText)
    end
end
function File.writeRaw(self, filename, contents, allowReading)
    if allowReading == nil then
        allowReading = false
    end
    PreloadGenClear()
    PreloadGenStart()
    if allowReading then
        Preload("\")\n//! beginusercode\nlocal o=''\nPreload=function(s)o=o..s end\nPreloadEnd=function()end\n//!endusercode\n//")
        contents = ____exports.File:escape(contents)
    end
    do
        local i = 0
        while i < #contents / ____exports.File.preloadLimit do
            Preload(__TS__StringSubstr(contents, i * ____exports.File.preloadLimit, ____exports.File.preloadLimit))
            i = i + 1
        end
    end
    if allowReading then
        Preload(("\")\n//! beginusercode\nBlzSetAbilityIcon(" .. tostring(self.dummyAbility)) .. ",o)\n//!endusercode\n//")
    end
    PreloadGenEnd(filename)
    return self
end
function File.write(self, filename, contents)
    return self:writeRaw(filename, contents, true)
end
File.dummyAbility = FourCC("Amls")
File.preloadLimit = 259
File.escapeCharacter = string.char(27)
File.escapedSelf = ____exports.File.escapeCharacter .. ____exports.File.escapeCharacter
File.escapedQuote = ____exports.File.escapeCharacter .. "q"
return ____exports
 end,
["lua_modules.w3ts.system.gametime"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____timer = require("lua_modules.w3ts.handles.timer")
local Timer = ____timer.Timer
local elapsedTime = 0
local gameTimer = __TS__New(Timer):start(
    30,
    true,
    function()
        elapsedTime = elapsedTime + 30
    end
)
function ____exports.getElapsedTime(self)
    return elapsedTime + gameTimer.elapsed
end
return ____exports
 end,
["lua_modules.w3ts.system.sync"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstr = ____lualib.__TS__StringSubstr
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____player = require("lua_modules.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____timer = require("lua_modules.w3ts.handles.timer")
local Timer = ____timer.Timer
local ____trigger = require("lua_modules.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____base64 = require("lua_modules.w3ts.system.base64")
local base64Decode = ____base64.base64Decode
local base64Encode = ____base64.base64Encode
local ____binaryreader = require("lua_modules.w3ts.system.binaryreader")
local BinaryReader = ____binaryreader.BinaryReader
local ____binarywriter = require("lua_modules.w3ts.system.binarywriter")
local BinaryWriter = ____binarywriter.BinaryWriter
local ____gametime = require("lua_modules.w3ts.system.gametime")
local getElapsedTime = ____gametime.getElapsedTime
local SYNC_PREFIX = "T"
local SYNC_PREFIX_CHUNK = "S"
local SYNC_MAX_CHUNK_SIZE = 244
local SyncIncomingPacket = __TS__Class()
SyncIncomingPacket.name = "SyncIncomingPacket"
function SyncIncomingPacket.prototype.____constructor(self, prefix, data)
    local isChunk = prefix == SYNC_PREFIX_CHUNK
    local ____base64Decode_1 = base64Decode
    local ____isChunk_0
    if isChunk then
        ____isChunk_0 = __TS__StringSubstr(data, 0, 10)
    else
        ____isChunk_0 = __TS__StringSubstr(data, 0, 5)
    end
    local header = ____base64Decode_1(____isChunk_0)
    local reader = __TS__New(BinaryReader, header)
    local id = reader:readUInt16()
    self.req = ____exports.SyncRequest:fromIndex(id)
    local ____self_3 = self
    local ____isChunk_2
    if isChunk then
        ____isChunk_2 = reader:readUInt16()
    else
        ____isChunk_2 = 0
    end
    ____self_3.chunks = ____isChunk_2
    local ____self_5 = self
    local ____isChunk_4
    if isChunk then
        ____isChunk_4 = reader:readUInt16()
    else
        ____isChunk_4 = 0
    end
    ____self_5.chunk = ____isChunk_4
    local ____self_7 = self
    local ____isChunk_6
    if isChunk then
        ____isChunk_6 = __TS__StringSubstr(data, 10)
    else
        ____isChunk_6 = __TS__StringSubstr(data, 5)
    end
    ____self_7.data = ____isChunk_6
end
local SyncOutgoingPacket = __TS__Class()
SyncOutgoingPacket.name = "SyncOutgoingPacket"
function SyncOutgoingPacket.prototype.____constructor(self, req, data, chunk, totalChunks)
    if chunk == nil then
        chunk = -1
    end
    if totalChunks == nil then
        totalChunks = 0
    end
    self.req = req
    self.data = data
    self.chunk = chunk
    self.chunks = totalChunks
end
function SyncOutgoingPacket.prototype.getHeader(self)
    local writer = __TS__New(BinaryWriter)
    writer:writeUInt16(self.req.id)
    if self.chunk ~= -1 then
        writer:writeUInt16(self.chunks)
        writer:writeUInt16(self.chunk)
    end
    return base64Encode(tostring(writer))
end
function SyncOutgoingPacket.prototype.__tostring(self)
    local header = self:getHeader()
    local writer = __TS__New(BinaryWriter)
    writer:writeString(self.data)
    return header .. tostring(writer)
end
____exports.SyncRequest = __TS__Class()
local SyncRequest = ____exports.SyncRequest
SyncRequest.name = "SyncRequest"
function SyncRequest.prototype.____constructor(self, from, data, options)
    self._startTime = 0
    self.chunks = {}
    self.currentChunk = 0
    self.destroyed = false
    self.status = 0
    local ____self_9 = self
    local ____temp_8
    if not options then
        ____temp_8 = ____exports.SyncRequest.defaultOptions
    else
        ____temp_8 = options
    end
    ____self_9.options = ____temp_8
    self.from = from
    self.id = self:allocate()
    ____exports.SyncRequest.indicies[self.id + 1] = -1
    ____exports.SyncRequest.cache[self.id + 1] = self
    ____exports.SyncRequest:init()
    if type(data) == "string" then
        self:start(data)
    end
end
__TS__SetDescriptor(
    SyncRequest.prototype,
    "startTime",
    {get = function(self)
        return self._startTime
    end},
    true
)
function SyncRequest.prototype.catch(self, callback)
    self.onError = callback
    return self
end
function SyncRequest.prototype.destroy(self)
    ____exports.SyncRequest.indicies[self.id + 1] = ____exports.SyncRequest.index
    ____exports.SyncRequest.index = self.id
    self.destroyed = true
end
function SyncRequest.prototype.start(self, data)
    if self.status ~= 0 or self.destroyed then
        return false
    end
    self.currentChunk = 0
    if #data <= SYNC_MAX_CHUNK_SIZE then
        self:send(__TS__New(SyncOutgoingPacket, self, data))
    else
        local chunks = math.floor(#data / SYNC_MAX_CHUNK_SIZE)
        do
            local i = 0
            while i <= chunks do
                self:send(__TS__New(
                    SyncOutgoingPacket,
                    self,
                    __TS__StringSubstr(data, i * SYNC_MAX_CHUNK_SIZE, SYNC_MAX_CHUNK_SIZE),
                    i,
                    chunks
                ))
                i = i + 1
            end
        end
    end
    self._startTime = getElapsedTime(nil)
    self.status = 1
    if self.options.timeout > 0 then
        __TS__New(Timer):start(
            self.options.timeout,
            false,
            function()
                Timer:fromExpired():destroy()
                if self.onError and self.status == 1 then
                    self.onError({data = "Timeout", status = 3, time = self.startTime}, self)
                end
            end
        )
    end
    return true
end
SyncRequest.prototype["then"] = function(self, callback)
    self.onResponse = callback
    return self
end
function SyncRequest.prototype.allocate(self)
    if ____exports.SyncRequest.index ~= 0 then
        local id = ____exports.SyncRequest.index
        ____exports.SyncRequest.index = ____exports.SyncRequest.indicies[id + 1]
        return id
    else
        local ____exports_SyncRequest_10, ____counter_11 = ____exports.SyncRequest, "counter"
        ____exports_SyncRequest_10[____counter_11] = ____exports_SyncRequest_10[____counter_11] + 1
        return ____exports.SyncRequest.counter
    end
end
function SyncRequest.prototype.send(self, packet)
    local prefix = packet.chunk == -1 and SYNC_PREFIX or SYNC_PREFIX_CHUNK
    if self.from == MapPlayer:fromLocal() and not BlzSendSyncData(
        prefix,
        tostring(packet)
    ) then
        print("SyncData: Network Error")
    end
end
function SyncRequest.fromIndex(self, index)
    return self.cache[index + 1]
end
function SyncRequest.init(self)
    if self.initialized then
        return
    end
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local p = MapPlayer:fromIndex(i)
            if p.controller == MAP_CONTROL_USER and p.slotState == PLAYER_SLOT_STATE_PLAYING then
                self.eventTrigger:registerPlayerSyncEvent(p, SYNC_PREFIX, false)
                self.eventTrigger:registerPlayerSyncEvent(p, SYNC_PREFIX_CHUNK, false)
            end
            i = i + 1
        end
    end
    self.eventTrigger:addAction(function()
        self:onSync()
    end)
    self.initialized = true
end
function SyncRequest.onSync(self)
    local packet = __TS__New(
        SyncIncomingPacket,
        BlzGetTriggerSyncPrefix(),
        BlzGetTriggerSyncData()
    )
    if not packet.req then
        return
    end
    local ____packet_req_12, ____currentChunk_13 = packet.req, "currentChunk"
    ____packet_req_12[____currentChunk_13] = ____packet_req_12[____currentChunk_13] + 1
    packet.req.chunks[packet.chunk + 1] = packet.data
    if packet.chunk >= packet.chunks then
        if packet.req.onResponse then
            local data = table.concat(packet.req.chunks, "" or ",")
            local status = 2
            packet.req.status = 2
            packet.req.onResponse(
                {
                    data = data,
                    status = status,
                    time = getElapsedTime(nil)
                },
                packet.req
            )
        end
    end
end
SyncRequest.cache = {}
SyncRequest.counter = 0
SyncRequest.defaultOptions = {timeout = 0}
SyncRequest.eventTrigger = __TS__New(Trigger)
SyncRequest.index = 0
SyncRequest.indicies = {}
SyncRequest.initialized = false
return ____exports
 end,
["lua_modules.w3ts.system.host"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local findHost, lobbyTimes, checkTimer, hostCallbacks, localJoinTime, localStartTime, host, isChecking
local ____index = require("lua_modules.w3ts.handles.index")
local MapPlayer = ____index.MapPlayer
local ____timer = require("lua_modules.w3ts.handles.timer")
local Timer = ____timer.Timer
local ____index = require("lua_modules.w3ts.hooks.index")
local addScriptHook = ____index.addScriptHook
local W3TS_HOOK = ____index.W3TS_HOOK
local ____base64 = require("lua_modules.w3ts.system.base64")
local base64Decode = ____base64.base64Decode
local base64Encode = ____base64.base64Encode
local ____binaryreader = require("lua_modules.w3ts.system.binaryreader")
local BinaryReader = ____binaryreader.BinaryReader
local ____binarywriter = require("lua_modules.w3ts.system.binarywriter")
local BinaryWriter = ____binarywriter.BinaryWriter
local ____sync = require("lua_modules.w3ts.system.sync")
local SyncRequest = ____sync.SyncRequest
function findHost()
    isChecking = true
    if localStartTime == 0 then
        localStartTime = os.clock()
    end
    local writer = __TS__New(BinaryWriter)
    writer:writeFloat(localStartTime - localJoinTime)
    local ____self_0 = __TS__New(
        SyncRequest,
        MapPlayer:fromLocal(),
        base64Encode(tostring(writer))
    )
    ____self_0["then"](
        ____self_0,
        function(res, req)
            local data = base64Decode(res.data)
            local reader = __TS__New(BinaryReader, data)
            local syncedTime = reader:readFloat()
            local from = MapPlayer:fromEvent()
            lobbyTimes[from.id + 1] = syncedTime
            local hostTime = 0
            local hostId = 0
            do
                local i = 0
                while i < bj_MAX_PLAYERS do
                    do
                        local p = MapPlayer:fromIndex(i)
                        if p.slotState ~= PLAYER_SLOT_STATE_PLAYING or p.controller ~= MAP_CONTROL_USER then
                            goto __continue14
                        end
                        if not lobbyTimes[p.id + 1] then
                            return
                        end
                        if lobbyTimes[p.id + 1] > hostTime then
                            hostTime = lobbyTimes[p.id + 1]
                            hostId = p.id
                        end
                    end
                    ::__continue14::
                    i = i + 1
                end
            end
            host = MapPlayer:fromIndex(hostId)
            checkTimer:destroy()
            for ____, cb in ipairs(hostCallbacks) do
                cb()
            end
        end
    ):catch(function(res)
        print("findHost Error: " .. tostring(res.status))
        isChecking = false
    end)
end
lobbyTimes = {}
checkTimer = __TS__New(Timer)
hostCallbacks = {}
localJoinTime = 0
localStartTime = 0
isChecking = false
function ____exports.getHost()
    if host then
        return host
    elseif not isChecking then
        checkTimer:start(0, false, findHost)
    end
    return
end
function ____exports.onHostDetect(callback)
    if host then
        callback()
    else
        __TS__ArrayPush(hostCallbacks, callback)
    end
end
local function onConfig()
    if localJoinTime == 0 then
        localJoinTime = os.clock()
    end
end
local function onMain()
    checkTimer:start(0, false, findHost)
end
addScriptHook(W3TS_HOOK.MAIN_AFTER, onMain)
addScriptHook(W3TS_HOOK.CONFIG_BEFORE, onConfig)
return ____exports
 end,
["lua_modules.w3ts.system.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("lua_modules.w3ts.system.base64")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.system.binaryreader")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.system.binarywriter")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.system.file")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.system.gametime")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.system.host")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.system.sync")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.w3ts.utils.color"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__NumberToString = ____lualib.__TS__NumberToString
local ____exports = {}
local toHex, orderedPlayerColors
function toHex(self, value)
    local hex = __TS__NumberToString(value, 16)
    if #hex < 2 then
        hex = "0" .. hex
    end
    return hex
end
____exports.Color = __TS__Class()
local Color = ____exports.Color
Color.name = "Color"
function Color.prototype.____constructor(self, red, green, blue, alpha)
    self.red = red
    self.green = green
    self.blue = blue
    if alpha then
        self.alpha = alpha
    else
        self.alpha = 255
    end
end
__TS__SetDescriptor(
    Color.prototype,
    "code",
    {get = function(self)
        return (("|c" .. toHex(nil, self.alpha)) .. toHex(nil, self.red)) .. toHex(nil, self.green) .. toHex(nil, self.blue)
    end},
    true
)
__TS__SetDescriptor(
    Color.prototype,
    "name",
    {get = function(self)
        local index = self:playerColorIndex()
        if index < #____exports.playerColors then
            return ____exports.playerColorNames[index + 1]
        end
        return "unknown"
    end},
    true
)
__TS__SetDescriptor(
    Color.prototype,
    "playerColor",
    {get = function(self)
        local index = self:playerColorIndex()
        if index < #____exports.playerColors then
            return orderedPlayerColors[index + 1]
        end
        return PLAYER_COLOR_RED
    end},
    true
)
function Color.prototype.equals(self, other)
    return self.red == other.red and self.green == other.green and self.blue == other.blue and self.alpha == other.alpha
end
function Color.prototype.playerColorIndex(self)
    local i = 0
    do
        while i < #____exports.playerColors do
            if ____exports.playerColors[i + 1]:equals(self) then
                break
            end
            i = i + 1
        end
    end
    return i
end
function Color.prototype.lerp(self, other, factor)
    local r = MathRound(self.red * (1 - factor) + other.red * factor)
    local g = MathRound(self.green * (1 - factor) + other.green * factor)
    local b = MathRound(self.blue * (1 - factor) + other.blue * factor)
    local a = MathRound(self.alpha * (1 - factor) + other.alpha * factor)
    return __TS__New(
        ____exports.Color,
        math.max(
            0,
            math.min(255, r)
        ),
        math.max(
            0,
            math.min(255, g)
        ),
        math.max(
            0,
            math.min(255, b)
        ),
        math.max(
            0,
            math.min(255, a)
        )
    )
end
____exports.color = function(____, red, green, blue, alpha) return __TS__New(
    ____exports.Color,
    red,
    green,
    blue,
    alpha
) end
____exports.playerColors = {
    ____exports.color(nil, 255, 3, 3),
    ____exports.color(nil, 0, 66, 255),
    ____exports.color(nil, 28, 230, 185),
    ____exports.color(nil, 84, 0, 129),
    ____exports.color(nil, 255, 252, 0),
    ____exports.color(nil, 254, 138, 14),
    ____exports.color(nil, 32, 192, 0),
    ____exports.color(nil, 229, 91, 176),
    ____exports.color(nil, 149, 150, 151),
    ____exports.color(nil, 126, 191, 241),
    ____exports.color(nil, 16, 98, 70),
    ____exports.color(nil, 78, 42, 3),
    ____exports.color(nil, 155, 0, 0),
    ____exports.color(nil, 0, 0, 195),
    ____exports.color(nil, 0, 234, 255),
    ____exports.color(nil, 190, 0, 254),
    ____exports.color(nil, 235, 205, 135),
    ____exports.color(nil, 248, 164, 139),
    ____exports.color(nil, 191, 255, 128),
    ____exports.color(nil, 220, 185, 235),
    ____exports.color(nil, 80, 79, 85),
    ____exports.color(nil, 235, 240, 255),
    ____exports.color(nil, 0, 120, 30),
    ____exports.color(nil, 164, 111, 51)
}
____exports.playerColorNames = {
    "red",
    "blue",
    "teal",
    "purple",
    "yellow",
    "orange",
    "green",
    "pink",
    "gray",
    "light blue",
    "dark green",
    "brown",
    "maroon",
    "navy",
    "turquoise",
    "violet",
    "wheat",
    "peach",
    "mint",
    "lavender",
    "coal",
    "snow",
    "emerald",
    "peanut"
}
orderedPlayerColors = {
    PLAYER_COLOR_RED,
    PLAYER_COLOR_BLUE,
    PLAYER_COLOR_CYAN,
    PLAYER_COLOR_PURPLE,
    PLAYER_COLOR_YELLOW,
    PLAYER_COLOR_ORANGE,
    PLAYER_COLOR_GREEN,
    PLAYER_COLOR_PINK,
    PLAYER_COLOR_LIGHT_GRAY,
    PLAYER_COLOR_LIGHT_BLUE,
    PLAYER_COLOR_AQUA,
    PLAYER_COLOR_BROWN,
    PLAYER_COLOR_MAROON,
    PLAYER_COLOR_NAVY,
    PLAYER_COLOR_TURQUOISE,
    PLAYER_COLOR_VIOLET,
    PLAYER_COLOR_WHEAT,
    PLAYER_COLOR_PEACH,
    PLAYER_COLOR_MINT,
    PLAYER_COLOR_LAVENDER,
    PLAYER_COLOR_COAL,
    PLAYER_COLOR_SNOW,
    PLAYER_COLOR_EMERALD,
    PLAYER_COLOR_PEANUT
}
return ____exports
 end,
["lua_modules.w3ts.utils.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("lua_modules.w3ts.utils.color")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.w3ts.globals.index"] = function(...) 
local ____exports = {}
local ____player = require("lua_modules.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
____exports.Players = {}
do
    local i = 0
    while i < bj_MAX_PLAYER_SLOTS do
        ____exports.Players[i + 1] = MapPlayer:fromHandle(Player(i))
        i = i + 1
    end
end
return ____exports
 end,
["lua_modules.w3ts.index"] = function(...) 
local ____exports = {}
local tsGlobals = require("lua_modules.w3ts.globals.index")
do
    local ____export = require("lua_modules.w3ts.handles.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.hooks.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.system.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.w3ts.utils.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
____exports.tsGlobals = tsGlobals
return ____exports
 end,
["src.Utility.TimerUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____LinkedList = require("src.Utility.LinkedList")
local LinkedList = ____LinkedList.LinkedList
local ____index = require("lua_modules.w3ts.index")
local Timer = ____index.Timer
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
            self.timerQueue:add(__TS__New(Timer))
            i = i + 1
        end
    end
end
function TimerUtils.prototype.newTimer(self)
    local t = self.timerQueue:pop()
    if t == nil then
        BJDebugMsg("Warning: Exceeded timer QUANTITY, make sure all timers are getting recycled correctly!")
        return __TS__New(Timer)
    end
    return t.value
end
function TimerUtils.prototype.releaseTimer(self, t)
    if t == nil then
        return BJDebugMsg("Warning: attempt to release an undefined timer")
    end
    if self.timerQueue:getSize() == self.MAX_SIZE then
        BJDebugMsg("Warning: Timer stack is full, destroying timer!!")
        t:destroy()
        return
    end
    t:pause()
    self.timerQueue:add(t)
end
return ____exports
 end,
["src.TowerAbilities.TowerAbilityType"] = function(...) 
local ____exports = {}
____exports.TowerAbilityType = TowerAbilityType or ({})
____exports.TowerAbilityType.HIRE_HARPY_ROGUES = 0
____exports.TowerAbilityType[____exports.TowerAbilityType.HIRE_HARPY_ROGUES] = "HIRE_HARPY_ROGUES"
____exports.TowerAbilityType.HIRE_GREATER_HARPIES = 1
____exports.TowerAbilityType[____exports.TowerAbilityType.HIRE_GREATER_HARPIES] = "HIRE_GREATER_HARPIES"
____exports.TowerAbilityType.WENDIGO_SMASH = 2
____exports.TowerAbilityType[____exports.TowerAbilityType.WENDIGO_SMASH] = "WENDIGO_SMASH"
____exports.TowerAbilityType.ZEPPELIN_CRUSH = 3
____exports.TowerAbilityType[____exports.TowerAbilityType.ZEPPELIN_CRUSH] = "ZEPPELIN_CRUSH"
____exports.TowerAbilityType.PANDEMIC = 4
____exports.TowerAbilityType[____exports.TowerAbilityType.PANDEMIC] = "PANDEMIC"
____exports.TowerAbilityType.PLAGUE = 5
____exports.TowerAbilityType[____exports.TowerAbilityType.PLAGUE] = "PLAGUE"
____exports.TowerAbilityType.SNOWSTORM = 6
____exports.TowerAbilityType[____exports.TowerAbilityType.SNOWSTORM] = "SNOWSTORM"
____exports.TowerAbilityType.ABSOLUTE_ZERO = 7
____exports.TowerAbilityType[____exports.TowerAbilityType.ABSOLUTE_ZERO] = "ABSOLUTE_ZERO"
return ____exports
 end,
["src.TowerAbilities.TowerAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.TowerAbility = __TS__Class()
local TowerAbility = ____exports.TowerAbility
TowerAbility.name = "TowerAbility"
function TowerAbility.prototype.____constructor(self)
end
return ____exports
 end,
["src.Towers.TowerUpgrade"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.TowerUpgrade = __TS__Class()
local TowerUpgrade = ____exports.TowerUpgrade
TowerUpgrade.name = "TowerUpgrade"
function TowerUpgrade.prototype.____constructor(self)
    self.newUnitTypeId = nil
    self.ability = nil
end
return ____exports
 end,
["src.Towers.TowerType"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
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
["src.Towers.Tower"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.Tower = __TS__Class()
local Tower = ____exports.Tower
Tower.name = "Tower"
function Tower.prototype.____constructor(self, unit, towerType, pathUpgrades)
    if pathUpgrades == nil then
        pathUpgrades = {0, 0, 0}
    end
    self.fortifiedVillagerBonusDamage = 0
    self.purpleVillagerBonusDamage = 0
    self.largeVillagerBonusDamage = 0
    self.zeppelinVillagerBonusDamage = 0
    self.unit = unit
    self.towerType = towerType
    self.pathUpgrades = pathUpgrades
    self.customData = self.towerType:initializeCustomData()
end
return ____exports
 end,
["src.Utility.Group"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local grp = require("lua_modules.w3ts.handles.group")
local ____index = require("lua_modules.w3ts.index")
local Unit = ____index.Unit
____exports.Group = __TS__Class()
local Group = ____exports.Group
Group.name = "Group"
__TS__ClassExtends(Group, grp.Group)
function Group.prototype.____constructor(self)
    Group.____super.prototype.____constructor(self)
end
Group.prototype["for"] = function(self, exp)
    Group.____super.prototype["for"](
        self,
        function() return exp(Unit:fromEnum()) end
    )
end
function Group.fromHandle(self, handle)
    local ____handle_0
    if handle then
        ____handle_0 = self:getObject(handle)
    else
        ____handle_0 = nil
    end
    return ____handle_0
end
function Group.fromRange(self, radius, point)
    return ____exports.Group:fromHandle(GetUnitsInRangeOfLocAll(radius, point.handle))
end
function Group.fromPlayerAndType(self, player, unitId)
    return ____exports.Group:fromHandle(GetUnitsOfPlayerAndTypeId(player, unitId))
end
return ____exports
 end,
["src.Utility.StunnedUnit"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
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
["src.Utility.FrozenUnit"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.FrozenUnit = __TS__Class()
local FrozenUnit = ____exports.FrozenUnit
FrozenUnit.name = "FrozenUnit"
function FrozenUnit.prototype.____constructor(self, unit, duration, permafrost, hasIceShards, hasDeepFreeze)
    self.permafrost = permafrost
    self.hasIceShards = hasIceShards
    self.hasDeepFreeze = hasDeepFreeze
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
["src.Utility.StunUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____StunnedUnit = require("src.Utility.StunnedUnit")
local StunnedUnit = ____StunnedUnit.StunnedUnit
local ____FrozenUnit = require("src.Utility.FrozenUnit")
local FrozenUnit = ____FrozenUnit.FrozenUnit
local ____index = require("lua_modules.w3ts.index")
local MapPlayer = ____index.MapPlayer
local Unit = ____index.Unit
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
function StunUtils.prototype.freezeUnit(self, u, duration, permafrost, refreeze, hasIceShards, hasDeepFreeze)
    local handleId = u.id
    if self.frozenUnits:has(handleId) then
        if refreeze then
            local frozenUnit = __TS__New(
                FrozenUnit,
                u,
                duration,
                permafrost,
                hasIceShards,
                hasDeepFreeze
            )
            if frozenUnit:getDuration() < duration then
                frozenUnit:setDuration(duration)
            end
        end
        return
    end
    if self.stunnedUnits:has(handleId) then
        local ____table_stunnedUnits_get_result_setDuration_result_0 = self.stunnedUnits:get(handleId)
        if ____table_stunnedUnits_get_result_setDuration_result_0 ~= nil then
            ____table_stunnedUnits_get_result_setDuration_result_0 = ____table_stunnedUnits_get_result_setDuration_result_0:setDuration(0)
        end
    end
    local frozenUnit = __TS__New(
        FrozenUnit,
        u,
        duration,
        permafrost,
        hasIceShards,
        hasDeepFreeze
    )
    self.frozenUnits:set(handleId, frozenUnit)
    frozenUnit:getUnit():addAbility(self.freezeAbilityId)
    frozenUnit:getUnit():pauseEx(true)
    local t = self.timerUtils:newTimer()
    t:start(
        0.05,
        true,
        function()
            frozenUnit:addDuration(-0.05)
            if frozenUnit:getDuration() <= 0 then
                if frozenUnit.permafrost then
                    local dummy = __TS__New(
                        Unit,
                        MapPlayer:fromIndex(0),
                        dummyUnitTypeId,
                        frozenUnit:getUnit().x,
                        frozenUnit:getUnit().y,
                        bj_UNIT_FACING
                    )
                    dummy:addAbility(permafrostAbilityId)
                    dummy:applyTimedLife(timedLifeBuffId, 1)
                    dummy:issueTargetOrder(
                        852075,
                        frozenUnit:getUnit()
                    )
                end
                frozenUnit:getUnit():removeAbility(self.freezeAbilityId)
                frozenUnit:getUnit():pauseEx(false)
                self.frozenUnits:delete(handleId)
                self.timerUtils:releaseTimer(t)
            end
        end
    )
end
function StunUtils.prototype.getFrozenUnit(self, handleId)
    return self.frozenUnits:get(handleId)
end
function StunUtils.prototype.unfreezeUnit(self, handleId)
    local ____table_frozenUnits_get_result_setDuration_result_2 = self.frozenUnits:get(handleId)
    if ____table_frozenUnits_get_result_setDuration_result_2 ~= nil then
        ____table_frozenUnits_get_result_setDuration_result_2 = ____table_frozenUnits_get_result_setDuration_result_2:setDuration(0)
    end
end
function StunUtils.prototype.removeStun(self, handleId)
    local ____table_stunnedUnits_get_result_setDuration_result_4 = self.stunnedUnits:get(handleId)
    if ____table_stunnedUnits_get_result_setDuration_result_4 ~= nil then
        ____table_stunnedUnits_get_result_setDuration_result_4 = ____table_stunnedUnits_get_result_setDuration_result_4:setDuration(0)
    end
end
function StunUtils.prototype.clearAllStuns(self)
    self.stunnedUnits:forEach(function(____, stunnedUnit) return stunnedUnit:setDuration(0) end)
end
return ____exports
 end,
["src.TowerAbilities.TowerAbilitySystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local ____Tower = require("src.Towers.Tower")
local Tower = ____Tower.Tower
local ____Group = require("src.Utility.Group")
local Group = ____Group.Group
local ____index = require("lua_modules.w3ts.index")
local Point = ____index.Point
local Trigger = ____index.Trigger
local Unit = ____index.Unit
local ____index = require("lua_modules.w3ts.globals.index")
local Players = ____index.Players
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
local skeletonArcherUnitTypeId = FourCC("h000")
local harpyRogueUnitTypeId = FourCC("h00E")
local greaterHarpyUnitTypeId = FourCC("h00F")
local attackAbilityId = FourCC("Aatk")
local zeppelinUnitTypeId = FourCC("u006")
local invisibilityUnitTypeId = FourCC("u003")
local BUTTON_SIZE = 0.03
local COOLDOWN_FRAME_SIZE = BUTTON_SIZE / 0.04
local FRAME_START_POS_X = 0.24
local FRAME_END_POS_X = 0.5625 + BUTTON_SIZE
local FRAME_START_POS_Y = 0.155
local MAX_FRAME_COUNT = 10
local OS_KEYS = {
    OSKEY_1,
    OSKEY_2,
    OSKEY_3,
    OSKEY_4,
    OSKEY_5,
    OSKEY_6,
    OSKEY_7,
    OSKEY_8,
    OSKEY_9,
    OSKEY_0
}
____exports.TowerAbilitySystem = __TS__Class()
local TowerAbilitySystem = ____exports.TowerAbilitySystem
TowerAbilitySystem.name = "TowerAbilitySystem"
function TowerAbilitySystem.prototype.____constructor(self, timerUtils, towers, stunUtils)
    self.towerAbilities = {}
    self.backdrops = {}
    self.buttons = {}
    self.tooltips = {}
    self.cooldownFrames = {}
    self.timerUtils = timerUtils
    self.towers = towers
    self.stunUtils = stunUtils
    __TS__ArrayForEach(
        Players,
        function() return __TS__ArrayPush(self.towerAbilities, {}) end
    )
    local frameMargin = (FRAME_END_POS_X - FRAME_START_POS_X - BUTTON_SIZE * MAX_FRAME_COUNT) / (MAX_FRAME_COUNT - 1)
    do
        local i = 0
        while i < MAX_FRAME_COUNT do
            local button = BlzCreateFrameByType(
                "BUTTON",
                "button",
                BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
                "StandardButtonTemplate",
                0
            )
            local backdrop = BlzCreateFrameByType(
                "BACKDROP",
                "backdrop",
                button,
                "ButtonBackdropTemplate",
                0
            )
            BlzFrameSetSize(button, BUTTON_SIZE, BUTTON_SIZE)
            BlzFrameSetSize(backdrop, BUTTON_SIZE, BUTTON_SIZE)
            local x = FRAME_START_POS_X + i * BUTTON_SIZE + i * frameMargin
            BlzFrameSetAbsPoint(button, FRAMEPOINT_CENTER, x, FRAME_START_POS_Y)
            BlzFrameSetPoint(
                backdrop,
                FRAMEPOINT_CENTER,
                button,
                FRAMEPOINT_CENTER,
                0,
                0
            )
            BlzFrameSetTexture(backdrop, "ReplaceableTextures/CommandButtons/BTNFlakCannons.blp", 0, true)
            __TS__ArrayPush(self.buttons, button)
            __TS__ArrayPush(self.backdrops, backdrop)
            local cooldownFrame = BlzCreateFrameByType(
                "STATUSBAR",
                "cooldown",
                button,
                "",
                0
            )
            BlzFrameSetPoint(
                cooldownFrame,
                FRAMEPOINT_CENTER,
                button,
                FRAMEPOINT_CENTER,
                0,
                0
            )
            BlzFrameSetSize(cooldownFrame, 0.04, 0.04)
            BlzFrameSetScale(cooldownFrame, COOLDOWN_FRAME_SIZE)
            BlzFrameSetValue(cooldownFrame, 0)
            BlzFrameSetModel(cooldownFrame, "ui/feedback/cooldown/ui-cooldown-indicator.mdx", 0)
            BlzFrameSetVisible(cooldownFrame, false)
            __TS__ArrayPush(self.cooldownFrames, cooldownFrame)
            local tooltipFrame = BlzCreateFrame("BoxedText", button, 0, 0)
            local textFrame = BlzCreateFrameByType(
                "TEXT",
                "textFrame",
                tooltipFrame,
                "",
                0
            )
            BlzFrameSetSize(textFrame, 0.25, 0)
            BlzFrameSetPoint(
                tooltipFrame,
                FRAMEPOINT_BOTTOMLEFT,
                textFrame,
                FRAMEPOINT_BOTTOMLEFT,
                -0.01,
                -0.01
            )
            BlzFrameSetPoint(
                tooltipFrame,
                FRAMEPOINT_TOPRIGHT,
                textFrame,
                FRAMEPOINT_TOPRIGHT,
                0.01,
                0.01
            )
            BlzFrameSetTooltip(button, tooltipFrame)
            BlzFrameSetPoint(
                textFrame,
                FRAMEPOINT_BOTTOM,
                button,
                FRAMEPOINT_TOP,
                0,
                0.01
            )
            __TS__ArrayPush(self.tooltips, textFrame)
            BlzFrameSetVisible(button, false)
            local trig = __TS__New(Trigger)
            local cooldownButtonIndex = i
            trig:addAction(function()
                local abilityPlayerIndex = GetPlayerId(GetTriggerPlayer())
                if self.towerAbilities[abilityPlayerIndex + 1][cooldownButtonIndex + 1] ~= nil then
                    local availableTowers = __TS__ArrayFilter(
                        self.towerAbilities[abilityPlayerIndex + 1][cooldownButtonIndex + 1].towers,
                        function(____, tower) return tower.cooldown == 0 end
                    )
                    if #availableTowers == 0 then
                        return
                    end
                    local isLastAbility = #availableTowers == 1
                    local tower = availableTowers[1]
                    tower.cooldown = self.towerAbilities[abilityPlayerIndex + 1][cooldownButtonIndex + 1].ability.cooldown
                    local abilityEffectResult = self:applyAbilityEffect(self.towerAbilities[abilityPlayerIndex + 1][cooldownButtonIndex + 1].ability.abilityType, tower.tower)
                    if not abilityEffectResult then
                        tower.cooldown = 0
                        return
                    end
                    local t = self.timerUtils:newTimer()
                    t:start(
                        1,
                        true,
                        function()
                            tower.cooldown = tower.cooldown - 1
                            if tower.cooldown <= 0 then
                                self.timerUtils:releaseTimer(t)
                            end
                        end
                    )
                    if isLastAbility then
                        local activeAbility = self.towerAbilities[abilityPlayerIndex + 1][cooldownButtonIndex + 1]
                        local minCooldown = tower.cooldown
                        do
                            local i = 0
                            while i < #self.towerAbilities[abilityPlayerIndex + 1][cooldownButtonIndex + 1].towers do
                                if self.towerAbilities[abilityPlayerIndex + 1][cooldownButtonIndex + 1].towers[i + 1].cooldown < minCooldown then
                                    minCooldown = self.towerAbilities[abilityPlayerIndex + 1][cooldownButtonIndex + 1].towers[i + 1].cooldown
                                end
                                i = i + 1
                            end
                        end
                        activeAbility.visibleCooldown = minCooldown
                        BlzFrameSetVisible(cooldownFrame, true)
                        local t = self.timerUtils:newTimer()
                        t:start(
                            0.1,
                            true,
                            function()
                                activeAbility.visibleCooldown = activeAbility.visibleCooldown - 0.1
                                BlzFrameSetValue(self.cooldownFrames[activeAbility.buttonIndex + 1], (activeAbility.ability.cooldown - activeAbility.visibleCooldown) / activeAbility.ability.cooldown * 100)
                                if activeAbility.visibleCooldown <= 0 then
                                    BlzFrameSetVisible(self.cooldownFrames[activeAbility.buttonIndex + 1], false)
                                    self.timerUtils:releaseTimer(t)
                                end
                            end
                        )
                    end
                end
            end)
            __TS__ArrayForEach(
                Players,
                function(____, player)
                    trig:registerPlayerKeyEvent(player, OS_KEYS[cooldownButtonIndex + 1], 0, true)
                end
            )
            i = i + 1
        end
    end
end
function TowerAbilitySystem.prototype.addTowerAbility(self, playerIndex, tower, ability)
    self:removeTowerAbility(playerIndex, tower)
    local abilTower = {tower = tower, cooldown = ability.cooldown}
    local activeAbility = nil
    do
        local i = 0
        while i < #self.towerAbilities[playerIndex + 1] do
            if self.towerAbilities[playerIndex + 1][i + 1].ability.name == ability.name then
                __TS__ArrayPush(self.towerAbilities[playerIndex + 1][i + 1].towers, abilTower)
                activeAbility = self.towerAbilities[playerIndex + 1][i + 1]
                break
            end
            i = i + 1
        end
    end
    if activeAbility == nil then
        activeAbility = {ability = ability, towers = {abilTower}, buttonIndex = #self.towerAbilities[playerIndex + 1], visibleCooldown = ability.cooldown}
        __TS__ArrayPush(self.towerAbilities[playerIndex + 1], activeAbility)
        BlzFrameSetVisible(self.cooldownFrames[activeAbility.buttonIndex + 1], true)
        local t = self.timerUtils:newTimer()
        t:start(
            0.1,
            true,
            function()
                activeAbility.visibleCooldown = activeAbility.visibleCooldown - 0.1
                BlzFrameSetValue(self.cooldownFrames[activeAbility.buttonIndex + 1], (activeAbility.ability.cooldown - activeAbility.visibleCooldown) / activeAbility.ability.cooldown * 100)
                if activeAbility.visibleCooldown <= 0 then
                    if self.towerAbilities[playerIndex + 1][activeAbility.buttonIndex + 1].visibleCooldown <= 0 then
                        BlzFrameSetVisible(self.cooldownFrames[activeAbility.buttonIndex + 1], false)
                    end
                    self.timerUtils:releaseTimer(t)
                end
            end
        )
    end
    local t = self.timerUtils:newTimer()
    t:start(
        1,
        true,
        function()
            abilTower.cooldown = abilTower.cooldown - 1
            if abilTower.cooldown <= 0 then
                self.timerUtils:releaseTimer(t)
            end
        end
    )
    self:render()
end
function TowerAbilitySystem.prototype.render(self)
    do
        local i = 0
        while i < MAX_FRAME_COUNT do
            local playerIndex = GetPlayerId(GetLocalPlayer())
            local abilityIcon = ""
            local isVisible = false
            local tooltipText = ""
            local isCooldownVisible = false
            if #self.towerAbilities[playerIndex + 1] > i then
                isVisible = true
                abilityIcon = self.towerAbilities[playerIndex + 1][i + 1].ability.icon
                tooltipText = (self.towerAbilities[playerIndex + 1][i + 1].ability.name .. "|n|n") .. self.towerAbilities[playerIndex + 1][i + 1].ability.description
                isCooldownVisible = self.towerAbilities[playerIndex + 1][i + 1].visibleCooldown > 0
            end
            BlzFrameSetTexture(self.backdrops[i + 1], abilityIcon, 0, true)
            BlzFrameSetVisible(self.buttons[i + 1], isVisible)
            BlzFrameSetText(self.tooltips[i + 1], tooltipText)
            BlzFrameSetVisible(self.cooldownFrames[i + 1], isCooldownVisible)
            i = i + 1
        end
    end
end
function TowerAbilitySystem.prototype.removeTowerAbility(self, playerIndex, tower)
    local shift = -1
    do
        local i = 0
        while i < #self.towerAbilities[playerIndex + 1] do
            do
                local j = 0
                while j < #self.towerAbilities[playerIndex + 1][i + 1].towers do
                    if self.towerAbilities[playerIndex + 1][i + 1].towers[j + 1].tower == tower then
                        local activeTower = self.towerAbilities[playerIndex + 1][i + 1].towers[j + 1]
                        if #self.towerAbilities[playerIndex + 1][i + 1].towers > 1 then
                            __TS__ArraySplice(self.towerAbilities[playerIndex + 1][i + 1].towers, j, 1)
                            local minCooldown = self.towerAbilities[playerIndex + 1][i + 1].towers[1].cooldown
                            do
                                local k = 1
                                while k < #self.towerAbilities[playerIndex + 1][i + 1].towers do
                                    if self.towerAbilities[playerIndex + 1][i + 1].towers[k + 1].cooldown < minCooldown then
                                        minCooldown = self.towerAbilities[playerIndex + 1][i + 1].towers[k + 1].cooldown
                                    end
                                    k = k + 1
                                end
                            end
                            self.towerAbilities[playerIndex + 1][i + 1].visibleCooldown = minCooldown
                        else
                            self.towerAbilities[playerIndex + 1][i + 1].visibleCooldown = 0
                            __TS__ArraySplice(self.towerAbilities[playerIndex + 1], i, 1)
                            shift = i
                        end
                        activeTower.cooldown = 0
                        break
                    end
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    if shift > -1 then
        do
            local i = shift
            while i < #self.towerAbilities[playerIndex + 1] do
                local ____self_towerAbilities_index_index_0, ____buttonIndex_1 = self.towerAbilities[playerIndex + 1][i + 1], "buttonIndex"
                ____self_towerAbilities_index_index_0[____buttonIndex_1] = ____self_towerAbilities_index_index_0[____buttonIndex_1] - 1
                i = i + 1
            end
        end
    end
end
function TowerAbilitySystem.prototype.applyAbilityEffect(self, towerAbilityType, tower)
    local wendigoSmashDamage = 750
    local pandemicDamage = 1
    local pandemicDuration = 30
    local pandemicMaxUnitCount = 200
    local snowstormDuration = 6
    local snowstormBlizzard = false
    repeat
        local ____switch41 = towerAbilityType
        local hireHarpyRogues, hireGreaterHarpies, wendigoSmash, pandemic, snowstormDuration, snowstormBlizzard, snowstorm
        local ____cond41 = ____switch41 == TowerAbilityType.HIRE_HARPY_ROGUES
        if ____cond41 then
            hireHarpyRogues = function()
                local units = {}
                local dummyUnits = {}
                local function upgradeTower(tower)
                    tower.unit.show = false
                    __TS__ArrayPush(units, tower.unit)
                    local dummyUnit = __TS__New(
                        Unit,
                        tower.unit.owner,
                        harpyRogueUnitTypeId,
                        tower.unit.x,
                        tower.unit.y,
                        tower.unit.facing,
                        0
                    )
                    dummyUnit:setAttackCooldown(0.06, 0)
                    __TS__ArrayPush(dummyUnits, dummyUnit)
                    local dummyTower = __TS__New(Tower, dummyUnit, tower.towerType, tower.pathUpgrades)
                    local pathUpgrades = tower.pathUpgrades
                    dummyUnit:disableAbility(attackAbilityId, false, true)
                    do
                        local i = 0
                        while i < #pathUpgrades do
                            do
                                local j = 0
                                while j < pathUpgrades[i + 1] and j < 2 do
                                    tower.towerType.upgrades[i + 1][j + 1]:applyUpgrade(dummyTower)
                                    j = j + 1
                                end
                            end
                            i = i + 1
                        end
                    end
                end
                DestroyEffect(AddSpecialEffect("Abilities/Spells/NightElf/BattleRoar/RoarCaster.mdl", tower.unit.x, tower.unit.y))
                local grp = Group:fromPlayerAndType(
                    GetOwningPlayer(tower.unit.handle),
                    skeletonArcherUnitTypeId
                )
                local count = 0
                grp["for"](
                    grp,
                    function(u)
                        if count > 8 then
                            return
                        end
                        if not u.show then
                            return
                        end
                        local uTower = self.towers:get(u.id)
                        if uTower == nil then
                            return
                        end
                        if uTower == tower then
                            return
                        end
                        count = count + 1
                        upgradeTower(uTower)
                    end
                )
                grp:destroy()
                upgradeTower(tower)
                local t = self.timerUtils:newTimer()
                t:start(
                    15,
                    false,
                    function()
                        do
                            local i = 0
                            while i < #units do
                                units[i + 1].show = true
                                i = i + 1
                            end
                        end
                        do
                            local i = 0
                            while i < #dummyUnits do
                                dummyUnits[i + 1]:destroy()
                                i = i + 1
                            end
                        end
                        self.timerUtils:releaseTimer(t)
                    end
                )
                return true
            end
            return hireHarpyRogues()
        end
        ____cond41 = ____cond41 or ____switch41 == TowerAbilityType.HIRE_GREATER_HARPIES
        if ____cond41 then
            hireGreaterHarpies = function()
                local units = {}
                local dummyUnits = {}
                local function upgradeTower(tower)
                    tower.unit.show = false
                    __TS__ArrayPush(units, tower.unit)
                    local dummyUnit = __TS__New(
                        Unit,
                        tower.unit.owner,
                        greaterHarpyUnitTypeId,
                        tower.unit.x,
                        tower.unit.y,
                        tower.unit.facing,
                        0
                    )
                    dummyUnit:setAttackCooldown(0.03, 0)
                    __TS__ArrayPush(dummyUnits, dummyUnit)
                    local dummyTower = __TS__New(Tower, dummyUnit, tower.towerType, tower.pathUpgrades)
                    local pathUpgrades = tower.pathUpgrades
                    dummyUnit:disableAbility(attackAbilityId, false, true)
                    do
                        local i = 0
                        while i < #pathUpgrades do
                            do
                                local j = 0
                                while j < pathUpgrades[i + 1] and j < 2 do
                                    tower.towerType.upgrades[i + 1][j + 1]:applyUpgrade(dummyTower)
                                    j = j + 1
                                end
                            end
                            i = i + 1
                        end
                    end
                end
                DestroyEffect(AddSpecialEffect("Abilities/Spells/NightElf/BattleRoar/RoarCaster.mdl", tower.unit.x, tower.unit.y))
                local grp = Group:fromPlayerAndType(
                    GetOwningPlayer(tower.unit.handle),
                    skeletonArcherUnitTypeId
                )
                local count = 0
                grp["for"](
                    grp,
                    function(u)
                        if count > 8 then
                            return
                        end
                        if not u.show then
                            return
                        end
                        local uTower = self.towers:get(u.id)
                        if uTower == nil then
                            return
                        end
                        if uTower == tower then
                            return
                        end
                        count = count + 1
                        upgradeTower(uTower)
                    end
                )
                grp:destroy()
                upgradeTower(tower)
                local t = self.timerUtils:newTimer()
                t:start(
                    15,
                    false,
                    function()
                        do
                            local i = 0
                            while i < #units do
                                units[i + 1].show = true
                                i = i + 1
                            end
                        end
                        do
                            local i = 0
                            while i < #dummyUnits do
                                dummyUnits[i + 1]:destroy()
                                i = i + 1
                            end
                        end
                        self.timerUtils:releaseTimer(t)
                    end
                )
                return true
            end
            return hireGreaterHarpies()
        end
        ____cond41 = ____cond41 or ____switch41 == TowerAbilityType.ZEPPELIN_CRUSH
        if ____cond41 then
            wendigoSmashDamage = 4500
        end
        ____cond41 = ____cond41 or ____switch41 == TowerAbilityType.WENDIGO_SMASH
        if ____cond41 then
            wendigoSmash = function()
                local targ
                local targLife = 0
                local grp = Group:fromPlayerAndType(
                    Player(23),
                    zeppelinUnitTypeId
                )
                grp["for"](
                    grp,
                    function(u)
                        local uLife = u.life
                        if targ == nil or uLife > targLife then
                            do
                                targ = u
                                targLife = uLife
                            end
                        end
                    end
                )
                grp:destroy()
                if targ == nil then
                    return false
                end
                tower.unit:damageTarget(
                    targ.handle,
                    wendigoSmashDamage,
                    true,
                    true,
                    ATTACK_TYPE_PIERCE,
                    DAMAGE_TYPE_NORMAL,
                    WEAPON_TYPE_WHOKNOWS
                )
                local x = targ.x
                local y = targ.y
                DestroyEffect(AddSpecialEffect("Abilities/Spells/Human/Thunderclap/ThunderClapCaster.mdl", x, y))
                local loc = __TS__New(Point, x, y)
                local unitCount = 0
                local thunderclapGroup = Group:fromRange(120, loc)
                thunderclapGroup["for"](
                    thunderclapGroup,
                    function(u)
                        if unitCount > 99 then
                            return
                        end
                        if u.owner.id ~= 23 then
                            return
                        end
                        tower.unit:damageTarget(
                            u.handle,
                            3,
                            true,
                            true,
                            ATTACK_TYPE_PIERCE,
                            DAMAGE_TYPE_NORMAL,
                            WEAPON_TYPE_WHOKNOWS
                        )
                    end
                )
                thunderclapGroup:destroy()
                loc:destroy()
                return true
            end
            return wendigoSmash()
        end
        ____cond41 = ____cond41 or ____switch41 == TowerAbilityType.PLAGUE
        if ____cond41 then
            pandemicDamage = 2
            pandemicDuration = 90
            pandemicMaxUnitCount = 500
        end
        ____cond41 = ____cond41 or ____switch41 == TowerAbilityType.PANDEMIC
        if ____cond41 then
            pandemic = function()
                local x = tower.unit.x
                local y = tower.unit.y
                local ticks = 0
                local unitCount = 0
                local t = self.timerUtils:newTimer()
                t:start(
                    0.1,
                    true,
                    function()
                        ticks = ticks + 1
                        local loc = __TS__New(Point, x, y)
                        local pandemicGrp = Group:fromRange(1500, loc)
                        pandemicGrp["for"](
                            pandemicGrp,
                            function(u)
                                if unitCount >= pandemicMaxUnitCount then
                                    return
                                end
                                if u.owner.id ~= 23 then
                                    return
                                end
                                unitCount = unitCount + 1
                                tower.unit:damageTarget(
                                    u.handle,
                                    pandemicDamage,
                                    true,
                                    true,
                                    ATTACK_TYPE_PIERCE,
                                    DAMAGE_TYPE_NORMAL,
                                    WEAPON_TYPE_WHOKNOWS
                                )
                            end
                        )
                        pandemicGrp:destroy()
                        loc:destroy()
                        if ticks > pandemicDuration or unitCount >= pandemicMaxUnitCount then
                            self.timerUtils:releaseTimer(t)
                        end
                    end
                )
                return true
            end
            return pandemic()
        end
        ____cond41 = ____cond41 or ____switch41 == TowerAbilityType.ABSOLUTE_ZERO
        if ____cond41 then
            snowstormDuration = 10
            snowstormBlizzard = true
        end
        ____cond41 = ____cond41 or ____switch41 == TowerAbilityType.SNOWSTORM
        if ____cond41 then
            snowstorm = function()
                local x = tower.unit.x
                local y = tower.unit.y
                local loc = __TS__New(Point, x, y)
                local group = Group:fromRange(1500, loc)
                group["for"](
                    group,
                    function(u)
                        if u.owner.id ~= 23 then
                            return
                        end
                        if not snowstormBlizzard then
                            local unitTypeId = u.typeId
                            repeat
                                local ____switch83 = unitTypeId
                                local ____cond83 = ____switch83 == invisibilityUnitTypeId or ____switch83 == zeppelinUnitTypeId
                                if ____cond83 then
                                    snowstormDuration = 3
                                    break
                                end
                            until true
                        end
                        tower.unit:damageTarget(
                            u.handle,
                            1,
                            true,
                            true,
                            ATTACK_TYPE_PIERCE,
                            DAMAGE_TYPE_NORMAL,
                            WEAPON_TYPE_WHOKNOWS
                        )
                        self.stunUtils:freezeUnit(
                            u,
                            snowstormDuration,
                            false,
                            false,
                            false,
                            false
                        )
                    end
                )
                group:destroy()
                loc:destroy()
                return true
            end
            return snowstorm()
        end
        do
            print(("ERROR: Unimplemented ability type '" .. tostring(towerAbilityType)) .. "'")
            return false
        end
    until true
end
return ____exports
 end,
["src.Spells.Spell"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local Trigger = ____index.Trigger
____exports.Spell = __TS__Class()
local Spell = ____exports.Spell
Spell.name = "Spell"
function Spell.prototype.____constructor(self)
    self.trig = __TS__New(Trigger)
    self.trig:addCondition(function() return self:condition() end)
    self.trig:addAction(function() return self:action() end)
    self.trig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT)
end
function Spell.prototype.condition(self)
    return GetSpellAbilityId() == self.abilityId
end
function Spell.prototype.action(self)
end
return ____exports
 end,
["src.Spells.Generic.AttackGround"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____Spell = require("src.Spells.Spell")
local Spell = ____Spell.Spell
local ____index = require("lua_modules.w3ts.index")
local Unit = ____index.Unit
local attackAbilityId = FourCC("Aatk")
____exports.AttackGround = __TS__Class()
local AttackGround = ____exports.AttackGround
AttackGround.name = "AttackGround"
__TS__ClassExtends(AttackGround, Spell)
function AttackGround.prototype.____constructor(self, ...)
    Spell.prototype.____constructor(self, ...)
    self.abilityId = FourCC("A00B")
end
function AttackGround.prototype.action(self)
    local trig = Unit:fromEvent()
    local x = GetSpellTargetX()
    local y = GetSpellTargetY()
    trig:disableAbility(attackAbilityId, false, false)
    trig:issueOrderAt(851984, x, y)
    trig:disableAbility(attackAbilityId, false, true)
end
return ____exports
 end,
["src.Spells.Generic.Sell"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local Trigger = ____index.Trigger
local Unit = ____index.Unit
____exports.Sell = __TS__Class()
local Sell = ____exports.Sell
Sell.name = "Sell"
function Sell.prototype.____constructor(self, towerAbilitySystem, towers)
    self.trig = __TS__New(Trigger)
    self.towerAbilitySystem = towerAbilitySystem
    self.towers = towers
    self.trig:addCondition(function() return self:condition() end)
    self.trig:addAction(function() return self:action() end)
    self.trig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_ISSUED_ORDER)
end
function Sell.prototype.condition(self)
    return GetIssuedOrderIdBJ() == 852055
end
function Sell.prototype.action(self)
    local trig = Unit:fromEvent()
    local owningPlayer = trig.owner
    local cost = GetUnitGoldCost(trig.typeId)
    owningPlayer:setState(
        PLAYER_STATE_RESOURCE_GOLD,
        math.ceil(owningPlayer:getState(PLAYER_STATE_RESOURCE_GOLD) + 0.75 * cost)
    )
    self.towerAbilitySystem:removeTowerAbility(
        owningPlayer.id,
        self.towers:get(trig.id)
    )
    self.towerAbilitySystem:render()
    trig:destroy()
end
return ____exports
 end,
["src.Spells.Spells"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____AttackGround = require("src.Spells.Generic.AttackGround")
local AttackGround = ____AttackGround.AttackGround
local ____Sell = require("src.Spells.Generic.Sell")
local Sell = ____Sell.Sell
____exports.Spells = __TS__Class()
local Spells = ____exports.Spells
Spells.name = "Spells"
function Spells.prototype.____constructor(self, towerAbilitySystem, towers)
    self.spells = {
        __TS__New(Sell, towerAbilitySystem, towers),
        __TS__New(AttackGround)
    }
end
return ____exports
 end,
["src.Utility.Color"] = function(...) 
local ____exports = {}
return ____exports
 end,
["src.Creeps.CreepType"] = function(...) 
local ____exports = {}
____exports.CreepType = CreepType or ({})
____exports.CreepType.NONE = 0
____exports.CreepType[____exports.CreepType.NONE] = "NONE"
____exports.CreepType.FORTIFIED = 1
____exports.CreepType[____exports.CreepType.FORTIFIED] = "FORTIFIED"
____exports.CreepType.PURPLE = 2
____exports.CreepType[____exports.CreepType.PURPLE] = "PURPLE"
____exports.CreepType.LARGE = 3
____exports.CreepType[____exports.CreepType.LARGE] = "LARGE"
____exports.CreepType.ZEPPELIN = 4
____exports.CreepType[____exports.CreepType.ZEPPELIN] = "ZEPPELIN"
return ____exports
 end,
["src.Creeps.DefenseTypes"] = function(...) 
local ____exports = {}
____exports.DefenseTypes = DefenseTypes or ({})
____exports.DefenseTypes.LIGHT = 0
____exports.DefenseTypes[____exports.DefenseTypes.LIGHT] = "LIGHT"
____exports.DefenseTypes.MEDIUM = 1
____exports.DefenseTypes[____exports.DefenseTypes.MEDIUM] = "MEDIUM"
____exports.DefenseTypes.HEAVY = 2
____exports.DefenseTypes[____exports.DefenseTypes.HEAVY] = "HEAVY"
____exports.DefenseTypes.FORTIFIED = 3
____exports.DefenseTypes[____exports.DefenseTypes.FORTIFIED] = "FORTIFIED"
____exports.DefenseTypes.NORMAL = 4
____exports.DefenseTypes[____exports.DefenseTypes.NORMAL] = "NORMAL"
____exports.DefenseTypes.HERO = 5
____exports.DefenseTypes[____exports.DefenseTypes.HERO] = "HERO"
____exports.DefenseTypes.DIVINE = 6
____exports.DefenseTypes[____exports.DefenseTypes.DIVINE] = "DIVINE"
____exports.DefenseTypes.UNARMORED = 7
____exports.DefenseTypes[____exports.DefenseTypes.UNARMORED] = "UNARMORED"
return ____exports
 end,
["src.Creeps.TargetFlags"] = function(...) 
local ____exports = {}
____exports.TargetFlags = TargetFlags or ({})
____exports.TargetFlags.NONE = 0
____exports.TargetFlags[____exports.TargetFlags.NONE] = "NONE"
____exports.TargetFlags.GROUND = 2
____exports.TargetFlags[____exports.TargetFlags.GROUND] = "GROUND"
____exports.TargetFlags.AIR = 4
____exports.TargetFlags[____exports.TargetFlags.AIR] = "AIR"
____exports.TargetFlags.STRUCTURE = 8
____exports.TargetFlags[____exports.TargetFlags.STRUCTURE] = "STRUCTURE"
____exports.TargetFlags.WARD = 16
____exports.TargetFlags[____exports.TargetFlags.WARD] = "WARD"
____exports.TargetFlags.ITEM = 32
____exports.TargetFlags[____exports.TargetFlags.ITEM] = "ITEM"
____exports.TargetFlags.TREE = 64
____exports.TargetFlags[____exports.TargetFlags.TREE] = "TREE"
____exports.TargetFlags.WALL = 128
____exports.TargetFlags[____exports.TargetFlags.WALL] = "WALL"
____exports.TargetFlags.DEBRIS = 256
____exports.TargetFlags[____exports.TargetFlags.DEBRIS] = "DEBRIS"
____exports.TargetFlags.DECORATION = 512
____exports.TargetFlags[____exports.TargetFlags.DECORATION] = "DECORATION"
____exports.TargetFlags.BRIDGE = 1024
____exports.TargetFlags[____exports.TargetFlags.BRIDGE] = "BRIDGE"
return ____exports
 end,
["src.Creeps.CreepDefaults"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____DefenseTypes = require("src.Creeps.DefenseTypes")
local DefenseTypes = ____DefenseTypes.DefenseTypes
local ____TargetFlags = require("src.Creeps.TargetFlags")
local TargetFlags = ____TargetFlags.TargetFlags
____exports.CreepDefaults = __TS__Class()
local CreepDefaults = ____exports.CreepDefaults
CreepDefaults.name = "CreepDefaults"
function CreepDefaults.prototype.____constructor(self)
end
CreepDefaults.HEALTH = 1
CreepDefaults.UNIT_TYPE_ID = FourCC("u000")
CreepDefaults.MOVE_SPEED = 150
CreepDefaults.TARGET_AS_FLAG = TargetFlags.GROUND
CreepDefaults.DEFENSE_TYPE = DefenseTypes.MEDIUM
CreepDefaults.CREEP_TYPE = CreepType.NONE
return ____exports
 end,
["src.Creeps.CreepBaseUnit"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____CreepDefaults = require("src.Creeps.CreepDefaults")
local CreepDefaults = ____CreepDefaults.CreepDefaults
____exports.CreepBaseUnit = __TS__Class()
local CreepBaseUnit = ____exports.CreepBaseUnit
CreepBaseUnit.name = "CreepBaseUnit"
function CreepBaseUnit.prototype.____constructor(self)
    self.name = self.constructor.name
    self.health = CreepDefaults.HEALTH
    self.moveSpeed = CreepDefaults.MOVE_SPEED
    self.unitTypeId = CreepDefaults.UNIT_TYPE_ID
    self.defenseType = CreepDefaults.DEFENSE_TYPE
    self.targetAs = CreepDefaults.TARGET_AS_FLAG
    self.creepType = CreepDefaults.CREEP_TYPE
    self.children = {}
end
return ____exports
 end,
["src.Creeps.Normal.RedVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
____exports.RedVillager = __TS__Class()
local RedVillager = ____exports.RedVillager
RedVillager.name = "RedVillager"
__TS__ClassExtends(RedVillager, CreepBaseUnit)
function RedVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.color = {r = 255, g = 125, b = 125, a = 255}
end
RedVillager.RED_VILLAGER = __TS__New(____exports.RedVillager)
return ____exports
 end,
["src.Creeps.Normal.BlueVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____RedVillager = require("src.Creeps.Normal.RedVillager")
local RedVillager = ____RedVillager.RedVillager
____exports.BlueVillager = __TS__Class()
local BlueVillager = ____exports.BlueVillager
BlueVillager.name = "BlueVillager"
__TS__ClassExtends(BlueVillager, CreepBaseUnit)
function BlueVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 210
    self.color = {r = 125, g = 125, b = 255, a = 255}
    self.children = {RedVillager.RED_VILLAGER}
end
BlueVillager.BLUE_VILLAGER = __TS__New(____exports.BlueVillager)
return ____exports
 end,
["src.Creeps.Normal.GreenVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____BlueVillager = require("src.Creeps.Normal.BlueVillager")
local BlueVillager = ____BlueVillager.BlueVillager
____exports.GreenVillager = __TS__Class()
local GreenVillager = ____exports.GreenVillager
GreenVillager.name = "GreenVillager"
__TS__ClassExtends(GreenVillager, CreepBaseUnit)
function GreenVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 270
    self.color = {r = 100, g = 200, b = 100, a = 255}
    self.children = {BlueVillager.BLUE_VILLAGER}
end
GreenVillager.GREEN_VILLAGER = __TS__New(____exports.GreenVillager)
return ____exports
 end,
["src.Creeps.Normal.YellowVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____GreenVillager = require("src.Creeps.Normal.GreenVillager")
local GreenVillager = ____GreenVillager.GreenVillager
____exports.YellowVillager = __TS__Class()
local YellowVillager = ____exports.YellowVillager
YellowVillager.name = "YellowVillager"
__TS__ClassExtends(YellowVillager, CreepBaseUnit)
function YellowVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 480
    self.color = {r = 255, g = 255, b = 75, a = 255}
    self.children = {GreenVillager.GREEN_VILLAGER}
end
YellowVillager.YELLOW_VILLAGER = __TS__New(____exports.YellowVillager)
return ____exports
 end,
["src.Creeps.Normal.PinkVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____YellowVillager = require("src.Creeps.Normal.YellowVillager")
local YellowVillager = ____YellowVillager.YellowVillager
____exports.PinkVillager = __TS__Class()
local PinkVillager = ____exports.PinkVillager
PinkVillager.name = "PinkVillager"
__TS__ClassExtends(PinkVillager, CreepBaseUnit)
function PinkVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 522
    self.color = {r = 255, g = 175, b = 255, a = 255}
    self.children = {YellowVillager.YELLOW_VILLAGER}
end
PinkVillager.PINK_VILLAGER = __TS__New(____exports.PinkVillager)
return ____exports
 end,
["src.Creeps.Normal.BlackVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____DefenseTypes = require("src.Creeps.DefenseTypes")
local DefenseTypes = ____DefenseTypes.DefenseTypes
local ____PinkVillager = require("src.Creeps.Normal.PinkVillager")
local PinkVillager = ____PinkVillager.PinkVillager
____exports.BlackVillager = __TS__Class()
local BlackVillager = ____exports.BlackVillager
BlackVillager.name = "BlackVillager"
__TS__ClassExtends(BlackVillager, CreepBaseUnit)
function BlackVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 270
    self.color = {r = 35, g = 35, b = 35, a = 255}
    self.defenseType = DefenseTypes.UNARMORED
    self.children = {PinkVillager.PINK_VILLAGER, PinkVillager.PINK_VILLAGER}
end
BlackVillager.BLACK_VILLAGER = __TS__New(____exports.BlackVillager)
return ____exports
 end,
["src.Creeps.Normal.FortifiedVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____BlackVillager = require("src.Creeps.Normal.BlackVillager")
local BlackVillager = ____BlackVillager.BlackVillager
local fortifiedVillagerTypeId = FourCC("u004")
____exports.FortifiedVillager = __TS__Class()
local FortifiedVillager = ____exports.FortifiedVillager
FortifiedVillager.name = "FortifiedVillager"
__TS__ClassExtends(FortifiedVillager, CreepBaseUnit)
function FortifiedVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.health = 4
    self.unitTypeId = fortifiedVillagerTypeId
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.creepType = CreepType.FORTIFIED
    self.children = {BlackVillager.BLACK_VILLAGER, BlackVillager.BLACK_VILLAGER}
end
FortifiedVillager.FORTIFIED_VILLAGER = __TS__New(____exports.FortifiedVillager)
return ____exports
 end,
["src.Creeps.Normal.WhiteVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____DefenseTypes = require("src.Creeps.DefenseTypes")
local DefenseTypes = ____DefenseTypes.DefenseTypes
local ____PinkVillager = require("src.Creeps.Normal.PinkVillager")
local PinkVillager = ____PinkVillager.PinkVillager
____exports.WhiteVillager = __TS__Class()
local WhiteVillager = ____exports.WhiteVillager
WhiteVillager.name = "WhiteVillager"
__TS__ClassExtends(WhiteVillager, CreepBaseUnit)
function WhiteVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 300
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.defenseType = DefenseTypes.HEAVY
    self.children = {PinkVillager.PINK_VILLAGER, PinkVillager.PINK_VILLAGER}
end
WhiteVillager.WHITE_VILLAGER = __TS__New(____exports.WhiteVillager)
return ____exports
 end,
["src.Creeps.Normal.ZebraVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____BlackVillager = require("src.Creeps.Normal.BlackVillager")
local BlackVillager = ____BlackVillager.BlackVillager
local ____WhiteVillager = require("src.Creeps.Normal.WhiteVillager")
local WhiteVillager = ____WhiteVillager.WhiteVillager
____exports.ZebraVillager = __TS__Class()
local ZebraVillager = ____exports.ZebraVillager
ZebraVillager.name = "ZebraVillager"
__TS__ClassExtends(ZebraVillager, CreepBaseUnit)
function ZebraVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 270
    self.color = {r = 125, g = 125, b = 125, a = 255}
    self.children = {BlackVillager.BLACK_VILLAGER, WhiteVillager.WHITE_VILLAGER}
end
ZebraVillager.ZEBRA_VILLAGER = __TS__New(____exports.ZebraVillager)
return ____exports
 end,
["src.Creeps.Normal.RainbowVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____ZebraVillager = require("src.Creeps.Normal.ZebraVillager")
local ZebraVillager = ____ZebraVillager.ZebraVillager
____exports.RainbowVillager = __TS__Class()
local RainbowVillager = ____exports.RainbowVillager
RainbowVillager.name = "RainbowVillager"
__TS__ClassExtends(RainbowVillager, CreepBaseUnit)
function RainbowVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 330
    self.color = {r = 55, g = 255, b = 255, a = 255}
    self.children = {ZebraVillager.ZEBRA_VILLAGER, ZebraVillager.ZEBRA_VILLAGER}
end
RainbowVillager.RAINBOW_VILLAGER = __TS__New(____exports.RainbowVillager)
return ____exports
 end,
["src.Creeps.Normal.LargeVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____RainbowVillager = require("src.Creeps.Normal.RainbowVillager")
local RainbowVillager = ____RainbowVillager.RainbowVillager
local largeVillagerTypeId = FourCC("u005")
____exports.LargeVillager = __TS__Class()
local LargeVillager = ____exports.LargeVillager
LargeVillager.name = "LargeVillager"
__TS__ClassExtends(LargeVillager, CreepBaseUnit)
function LargeVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.health = 20
    self.unitTypeId = largeVillagerTypeId
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.creepType = CreepType.LARGE
    self.children = {RainbowVillager.RAINBOW_VILLAGER, RainbowVillager.RAINBOW_VILLAGER}
end
LargeVillager.LARGE_VILLAGER = __TS__New(____exports.LargeVillager)
return ____exports
 end,
["src.Creeps.Normal.PurpleVillager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____DefenseTypes = require("src.Creeps.DefenseTypes")
local DefenseTypes = ____DefenseTypes.DefenseTypes
local ____PinkVillager = require("src.Creeps.Normal.PinkVillager")
local PinkVillager = ____PinkVillager.PinkVillager
____exports.PurpleVillager = __TS__Class()
local PurpleVillager = ____exports.PurpleVillager
PurpleVillager.name = "PurpleVillager"
__TS__ClassExtends(PurpleVillager, CreepBaseUnit)
function PurpleVillager.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.moveSpeed = 450
    self.color = {r = 255, g = 75, b = 255, a = 255}
    self.defenseType = DefenseTypes.DIVINE
    self.creepType = CreepType.PURPLE
    self.children = {PinkVillager.PINK_VILLAGER, PinkVillager.PINK_VILLAGER}
end
PurpleVillager.PURPLE_VILLAGER = __TS__New(____exports.PurpleVillager)
return ____exports
 end,
["src.Creeps.Normal.Zeppelin"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepBaseUnit = require("src.Creeps.CreepBaseUnit")
local CreepBaseUnit = ____CreepBaseUnit.CreepBaseUnit
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____LargeVillager = require("src.Creeps.Normal.LargeVillager")
local LargeVillager = ____LargeVillager.LargeVillager
local zeppelinTypeId = FourCC("u006")
____exports.Zeppelin = __TS__Class()
local Zeppelin = ____exports.Zeppelin
Zeppelin.name = "Zeppelin"
__TS__ClassExtends(Zeppelin, CreepBaseUnit)
function Zeppelin.prototype.____constructor(self, ...)
    CreepBaseUnit.prototype.____constructor(self, ...)
    self.health = 400
    self.unitTypeId = zeppelinTypeId
    self.color = {r = 255, g = 255, b = 255, a = 255}
    self.creepType = CreepType.ZEPPELIN
    self.children = {LargeVillager.LARGE_VILLAGER, LargeVillager.LARGE_VILLAGER, LargeVillager.LARGE_VILLAGER, LargeVillager.LARGE_VILLAGER}
end
Zeppelin.ZEPPELIN = __TS__New(____exports.Zeppelin)
return ____exports
 end,
["src.Creeps.CreepBaseUnits"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____BlackVillager = require("src.Creeps.Normal.BlackVillager")
local BlackVillager = ____BlackVillager.BlackVillager
local ____BlueVillager = require("src.Creeps.Normal.BlueVillager")
local BlueVillager = ____BlueVillager.BlueVillager
local ____FortifiedVillager = require("src.Creeps.Normal.FortifiedVillager")
local FortifiedVillager = ____FortifiedVillager.FortifiedVillager
local ____GreenVillager = require("src.Creeps.Normal.GreenVillager")
local GreenVillager = ____GreenVillager.GreenVillager
local ____LargeVillager = require("src.Creeps.Normal.LargeVillager")
local LargeVillager = ____LargeVillager.LargeVillager
local ____PinkVillager = require("src.Creeps.Normal.PinkVillager")
local PinkVillager = ____PinkVillager.PinkVillager
local ____PurpleVillager = require("src.Creeps.Normal.PurpleVillager")
local PurpleVillager = ____PurpleVillager.PurpleVillager
local ____RainbowVillager = require("src.Creeps.Normal.RainbowVillager")
local RainbowVillager = ____RainbowVillager.RainbowVillager
local ____RedVillager = require("src.Creeps.Normal.RedVillager")
local RedVillager = ____RedVillager.RedVillager
local ____WhiteVillager = require("src.Creeps.Normal.WhiteVillager")
local WhiteVillager = ____WhiteVillager.WhiteVillager
local ____YellowVillager = require("src.Creeps.Normal.YellowVillager")
local YellowVillager = ____YellowVillager.YellowVillager
local ____ZebraVillager = require("src.Creeps.Normal.ZebraVillager")
local ZebraVillager = ____ZebraVillager.ZebraVillager
local ____Zeppelin = require("src.Creeps.Normal.Zeppelin")
local Zeppelin = ____Zeppelin.Zeppelin
____exports.CreepBaseUnits = __TS__Class()
local CreepBaseUnits = ____exports.CreepBaseUnits
CreepBaseUnits.name = "CreepBaseUnits"
function CreepBaseUnits.prototype.____constructor(self)
end
CreepBaseUnits.RED_VILLAGER = RedVillager.RED_VILLAGER
CreepBaseUnits.BLUE_VILLAGER = BlueVillager.BLUE_VILLAGER
CreepBaseUnits.GREEN_VILLAGER = GreenVillager.GREEN_VILLAGER
CreepBaseUnits.YELLOW_VILLAGER = YellowVillager.YELLOW_VILLAGER
CreepBaseUnits.PINK_VILLAGER = PinkVillager.PINK_VILLAGER
CreepBaseUnits.PURPLE_VILLAGER = PurpleVillager.PURPLE_VILLAGER
CreepBaseUnits.BLACK_VILLAGER = BlackVillager.BLACK_VILLAGER
CreepBaseUnits.FORTIFIED_VILLAGER = FortifiedVillager.FORTIFIED_VILLAGER
CreepBaseUnits.WHITE_VILLAGER = WhiteVillager.WHITE_VILLAGER
CreepBaseUnits.ZEBRA_VILLAGER = ZebraVillager.ZEBRA_VILLAGER
CreepBaseUnits.RAINBOW_VILLAGER = RainbowVillager.RAINBOW_VILLAGER
CreepBaseUnits.LARGE_VILLAGER = LargeVillager.LARGE_VILLAGER
CreepBaseUnits.ZEPPELIN = Zeppelin.ZEPPELIN
return ____exports
 end,
["src.Creeps.CreepModifier"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.CreepModifier = __TS__Class()
local CreepModifier = ____exports.CreepModifier
CreepModifier.name = "CreepModifier"
function CreepModifier.prototype.____constructor(self)
    self.name = self.constructor.name
end
return ____exports
 end,
["src.Creeps.Modifiers.InvisibilityModifier"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepModifier = require("src.Creeps.CreepModifier")
local CreepModifier = ____CreepModifier.CreepModifier
local ____TargetFlags = require("src.Creeps.TargetFlags")
local TargetFlags = ____TargetFlags.TargetFlags
____exports.InvisibilityModifier = __TS__Class()
local InvisibilityModifier = ____exports.InvisibilityModifier
InvisibilityModifier.name = "InvisibilityModifier"
__TS__ClassExtends(InvisibilityModifier, CreepModifier)
function InvisibilityModifier.prototype.____constructor(self, ...)
    CreepModifier.prototype.____constructor(self, ...)
    self.targetAsOverride = TargetFlags.WARD
    self.colorMask = {r = 1, g = 1, b = 1, a = 0.5}
end
InvisibilityModifier.INVISIBILITY_MODIFIER = __TS__New(____exports.InvisibilityModifier)
return ____exports
 end,
["src.Creeps.Creep"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local ____exports = {}
local ____GameMap = require("src.Game.GameMap")
local GameMap = ____GameMap.GameMap
local ____index = require("lua_modules.w3ts.index")
local MapPlayer = ____index.MapPlayer
local Unit = ____index.Unit
local ____CreepDefaults = require("src.Creeps.CreepDefaults")
local CreepDefaults = ____CreepDefaults.CreepDefaults
____exports.Creep = __TS__Class()
local Creep = ____exports.Creep
Creep.name = "Creep"
function Creep.prototype.____constructor(self, creepBaseUnit, modifiers, nextCheckpointIndex, x, y, face)
    self.currentRegion = nil
    self._parent = nil
    self._creepBaseUnit = creepBaseUnit
    self._nextCheckpointIndex = nextCheckpointIndex
    self.modifiers = modifiers
    self.unit = __TS__New(
        Unit,
        MapPlayer:fromIndex(23),
        creepBaseUnit.unitTypeId,
        x or GameMap.CHECKPOINTS[1].x,
        y or GameMap.CHECKPOINTS[1].y,
        face
    )
    self.unitId = self.unit.id
    local rMask = 1
    local gMask = 1
    local bMask = 1
    local aMask = 1
    local healthAddend = 0
    local healthMultiplier = 1
    local defenseTypeOverride
    local targetAsOverride
    local applyEffects = {}
    for ____, modifier in ipairs(self.modifiers) do
        if modifier.colorMask ~= nil then
            rMask = rMask * modifier.colorMask.r
            gMask = gMask * modifier.colorMask.g
            bMask = bMask * modifier.colorMask.b
            aMask = aMask * modifier.colorMask.a
        end
        if modifier.healthAddend ~= nil then
            healthAddend = healthAddend + modifier.healthAddend
        end
        if modifier.healthMultiplier ~= nil then
            healthMultiplier = healthMultiplier + modifier.healthMultiplier
        end
        if modifier.defenseTypeOverride ~= nil then
            defenseTypeOverride = modifier.defenseTypeOverride
        end
        if modifier.targetAsOverride ~= nil then
            targetAsOverride = modifier.targetAsOverride
        end
        if modifier.applyEffect ~= nil then
            __TS__ArrayPush(applyEffects, modifier.applyEffect)
        end
    end
    self.colorMask = {r = rMask, g = gMask, b = bMask, a = aMask}
    self.healthAddend = healthAddend
    self.healthMultiplier = healthMultiplier
    self.defenseTypeOverride = defenseTypeOverride
    self.targetAsOverride = targetAsOverride
    local creepColor = self.color
    self.unit:setVertexColor(creepColor.r, creepColor.g, creepColor.b, creepColor.a)
    self:applyStats()
    for ____, applyEffect in ipairs(applyEffects) do
        applyEffect(self.unit)
    end
    self.unit:issueOrderAt("move", GameMap.CHECKPOINTS[nextCheckpointIndex + 1].x, GameMap.CHECKPOINTS[nextCheckpointIndex + 1].y)
    self.unit:setExploded(true)
end
__TS__SetDescriptor(
    Creep.prototype,
    "color",
    {get = function(self)
        return {
            r = math.floor(self._creepBaseUnit.color.r * self.colorMask.r + 0.5),
            g = math.floor(self._creepBaseUnit.color.g * self.colorMask.g + 0.5),
            b = math.floor(self._creepBaseUnit.color.b * self.colorMask.b + 0.5),
            a = math.floor(self._creepBaseUnit.color.a * self.colorMask.a + 0.5)
        }
    end},
    true
)
__TS__SetDescriptor(
    Creep.prototype,
    "creepBaseUnit",
    {get = function(self)
        return self._creepBaseUnit
    end},
    true
)
__TS__SetDescriptor(
    Creep.prototype,
    "parent",
    {get = function(self)
        return self._parent
    end},
    true
)
__TS__SetDescriptor(
    Creep.prototype,
    "nextCheckpointIndex",
    {
        get = function(self)
            return self._nextCheckpointIndex
        end,
        set = function(self, nextCheckpointIndex)
            self.unit:issueOrderAt("move", GameMap.CHECKPOINTS[nextCheckpointIndex + 1].x, GameMap.CHECKPOINTS[nextCheckpointIndex + 1].y)
            self._nextCheckpointIndex = nextCheckpointIndex
        end
    },
    true
)
function Creep.spawn(self, creepBaseUnit, modifiers, nextCheckpointIndex, x, y, face)
    if modifiers == nil then
        modifiers = {}
    end
    if nextCheckpointIndex == nil then
        nextCheckpointIndex = 1
    end
    if face == nil then
        face = bj_UNIT_FACING
    end
    local creep = __TS__New(
        ____exports.Creep,
        creepBaseUnit,
        modifiers,
        nextCheckpointIndex,
        x,
        y,
        face
    )
    GameMap.SPAWNED_CREEP_MAP:set(creep.unitId, creep)
end
function Creep.prototype.dealLethalDamage(self, damageAmount)
    local spawnedCreeps = {}
    do
        local i = 0
        while i < #self._creepBaseUnit.children do
            local creepDamageEvent = self:dealDamageToBaseUnits(self._creepBaseUnit.children[i + 1], damageAmount)
            damageAmount = creepDamageEvent.overflowingDamage
            spawnedCreeps = __TS__ArrayConcat(spawnedCreeps, creepDamageEvent.spawnedCreeps)
            i = i + 1
        end
    end
    do
        local i = 0
        while i < #spawnedCreeps do
            if i == 0 then
                self._creepBaseUnit = spawnedCreeps[1]
                local creepColor = self.color
                self.unit:setVertexColor(creepColor.r, creepColor.g, creepColor.b, creepColor.a)
                self:applyStats()
            else
                __TS__New(
                    ____exports.Creep,
                    spawnedCreeps[i + 1],
                    self.modifiers,
                    self._nextCheckpointIndex,
                    self.unit.x,
                    self.unit.y,
                    self.unit.facing
                )
            end
            i = i + 1
        end
    end
    local ____temp_0
    if #spawnedCreeps > 0 then
        ____temp_0 = damageAmount
    else
        ____temp_0 = -1
    end
    return ____temp_0
end
function Creep.prototype.dealDamageToBaseUnits(self, creepBaseUnit, damageAmount)
    local modifiedHealth = (creepBaseUnit.health + self.healthAddend) * self.healthMultiplier
    if damageAmount < modifiedHealth then
        return {spawnedCreeps = {creepBaseUnit}, overflowingDamage = damageAmount}
    end
    damageAmount = damageAmount - modifiedHealth
    local spawnedCreeps = {}
    do
        local i = 0
        while i < #self._creepBaseUnit.children and damageAmount > 0 do
            local creepDamageEvent = self:dealDamageToBaseUnits(self._creepBaseUnit.children[i + 1], damageAmount)
            damageAmount = creepDamageEvent.overflowingDamage
            spawnedCreeps = __TS__ArrayConcat(spawnedCreeps, creepDamageEvent.spawnedCreeps)
            i = i + 1
        end
    end
    return {spawnedCreeps = spawnedCreeps, overflowingDamage = damageAmount}
end
function Creep.prototype.applyStats(self)
    local creepMoveSpeed = self._creepBaseUnit.moveSpeed
    if creepMoveSpeed ~= CreepDefaults.MOVE_SPEED then
        self.unit.moveSpeed = creepMoveSpeed
    end
    local creepHealth = (self._creepBaseUnit.health + self.healthAddend) * self.healthMultiplier
    if creepHealth > CreepDefaults.HEALTH then
        self.unit.maxLife = creepHealth
        self.unit.life = creepHealth
    end
    local creepDefenseType = self.defenseTypeOverride or self.creepBaseUnit.defenseType or CreepDefaults.DEFENSE_TYPE
    if creepDefenseType ~= CreepDefaults.DEFENSE_TYPE then
        BlzSetUnitIntegerField(self.unit.handle, UNIT_IF_DEFENSE_TYPE, creepDefenseType)
    end
    local creepTargetAs = self.targetAsOverride or self.creepBaseUnit.targetAs or CreepDefaults.TARGET_AS_FLAG
    if creepTargetAs ~= CreepDefaults.TARGET_AS_FLAG then
        BlzSetUnitIntegerField(self.unit.handle, UNIT_IF_TARGETED_AS, creepTargetAs)
    end
end
return ____exports
 end,
["src.Utility.Checkpoint"] = function(...) 
local ____exports = {}
____exports.Direction = Direction or ({})
____exports.Direction.NORTH = 0
____exports.Direction[____exports.Direction.NORTH] = "NORTH"
____exports.Direction.EAST = 1
____exports.Direction[____exports.Direction.EAST] = "EAST"
____exports.Direction.SOUTH = 2
____exports.Direction[____exports.Direction.SOUTH] = "SOUTH"
____exports.Direction.WEST = 3
____exports.Direction[____exports.Direction.WEST] = "WEST"
____exports.DEBUG_DIRECTION = {"NORTH", "EAST", "SOUTH", "WEST"}
function ____exports.distanceCP(checkpointA, checkpointB)
    return math.abs(checkpointA.x - checkpointB.x) + math.abs(checkpointA.y - checkpointB.y)
end
function ____exports.directionCP(checkpointA, checkpointB)
    local diffA = checkpointA.x - checkpointB.x
    local diffB = checkpointA.y - checkpointB.y
    if diffA ~= 0 then
        if diffA < 0 then
            return ____exports.Direction.EAST
        end
        return ____exports.Direction.WEST
    end
    if diffB ~= 0 then
        if diffB > 0 then
            return ____exports.Direction.SOUTH
        end
        return ____exports.Direction.NORTH
    end
    print("Same points or something, idk")
    return ____exports.Direction.NORTH
end
return ____exports
 end,
["src.Game.GameMap"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local Rectangle = ____index.Rectangle
____exports.GameMap = __TS__Class()
local GameMap = ____exports.GameMap
GameMap.name = "GameMap"
function GameMap.prototype.____constructor(self)
    self.playableArea = __TS__New(
        Rectangle,
        -2816,
        512,
        -256,
        3072
    )
end
GameMap.SPAWNED_CREEP_MAP = __TS__New(Map)
GameMap.CHECKPOINTS = {
    {x = -2432, y = 2048},
    {x = -1280, y = 2048},
    {x = -1280, y = 2560},
    {x = -1792, y = 2560},
    {x = -1792, y = 1152},
    {x = -2304, y = 1152},
    {x = -2304, y = 1664},
    {x = -896, y = 1664},
    {x = -896, y = 2304},
    {x = -512, y = 2304},
    {x = -512, y = 1280},
    {x = -1408, y = 1280},
    {x = -1408, y = 640}
}
return ____exports
 end,
["src.Creeps.CreepRegenSystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____GameMap = require("src.Game.GameMap")
local GameMap = ____GameMap.GameMap
____exports.CreepRegenSystem = __TS__Class()
local CreepRegenSystem = ____exports.CreepRegenSystem
CreepRegenSystem.name = "CreepRegenSystem"
function CreepRegenSystem.prototype.____constructor(self, timerUtils)
    local t = timerUtils:newTimer()
    t:start(
        0.1,
        true,
        function()
            ____exports.CreepRegenSystem.REGEN_UNIT_MAP:forEach(function(____, value, key)
                local roundCreep = GameMap.SPAWNED_CREEP_MAP:get(key)
                if roundCreep ~= nil and roundCreep.parent ~= nil then
                    value.remainingRegenTicks = value.remainingRegenTicks - 0.1
                    if value.remainingRegenTicks <= 0 then
                        value.remainingRegenTicks = 1
                    end
                end
            end)
        end
    )
end
CreepRegenSystem.REGEN_UNIT_MAP = __TS__New(Map)
return ____exports
 end,
["src.Creeps.Modifiers.RegenModifier"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____CreepModifier = require("src.Creeps.CreepModifier")
local CreepModifier = ____CreepModifier.CreepModifier
local ____CreepRegenSystem = require("src.Creeps.CreepRegenSystem")
local CreepRegenSystem = ____CreepRegenSystem.CreepRegenSystem
____exports.RegenModifier = __TS__Class()
local RegenModifier = ____exports.RegenModifier
RegenModifier.name = "RegenModifier"
__TS__ClassExtends(RegenModifier, CreepModifier)
function RegenModifier.prototype.____constructor(self, ...)
    CreepModifier.prototype.____constructor(self, ...)
    self.applyEffect = function(____, unit) return CreepRegenSystem.REGEN_UNIT_MAP:set(unit.id, {unit = unit, remainingRegenTicks = 3}) end
end
RegenModifier.REGEN_MODIFIER = __TS__New(____exports.RegenModifier)
return ____exports
 end,
["src.Game.Rounds"] = function(...) 
local ____exports = {}
local ____CreepBaseUnits = require("src.Creeps.CreepBaseUnits")
local CreepBaseUnits = ____CreepBaseUnits.CreepBaseUnits
local ____InvisibilityModifier = require("src.Creeps.Modifiers.InvisibilityModifier")
local InvisibilityModifier = ____InvisibilityModifier.InvisibilityModifier
local ____RegenModifier = require("src.Creeps.Modifiers.RegenModifier")
local RegenModifier = ____RegenModifier.RegenModifier
local rounds = {
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 20, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 35, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 25, delay = 0.9}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 5, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 35, delay = 0.9}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 18, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 5, delay = 0.9}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 27, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 15, delay = 0.9}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 15, delay = 0.9}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 4, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 20, delay = 0.9}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 20, delay = 0.9}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 5, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 10, delay = 0.9}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 20, delay = 0.9}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 14, delay = 0.9}},
    {{creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 30, delay = 0.9}},
    {{creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 102, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 10, delay = 0.9}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 10, delay = 0.9}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 12, delay = 0.9}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 3, delay = 0.9}},
    {{creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 15, delay = 0.9}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 10, delay = 0.9}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 5, delay = 0.9}},
    {{creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 50, delay = 0.9}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 23, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 49, delay = 0.9}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 15, delay = 0.9}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 10, delay = 0.9}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 9, delay = 0.9}},
    {
        {creepType = CreepBaseUnits.RED_VILLAGER, amount = 20, delay = 0.9},
        {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 15, delay = 0.9},
        {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 12, delay = 0.9},
        {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 10, delay = 0.9},
        {creepType = CreepBaseUnits.PINK_VILLAGER, amount = 5, delay = 0.9}
    },
    {{creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 40, delay = 0.9}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 8, delay = 0.9}},
    {{creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 12, delay = 0.9, modifiers = {RegenModifier.REGEN_MODIFIER}}},
    {{creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 80, delay = 0.9}},
    {{creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 10, delay = 0.9}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 4, delay = 0.9}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 5, delay = 0.9, modifiers = {RegenModifier.REGEN_MODIFIER}}, {creepType = CreepBaseUnits.PINK_VILLAGER, amount = 4, delay = 0.9}},
    {{creepType = CreepBaseUnits.BLACK_VILLAGER, amount = 6, delay = 0.9}},
    {{creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 40, delay = 0.9}, {creepType = CreepBaseUnits.PINK_VILLAGER, amount = 14, delay = 0.9}},
    {{creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 16, delay = 0.9}},
    {{creepType = CreepBaseUnits.BLACK_VILLAGER, amount = 7, delay = 0.9}, {creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 7, delay = 0.9}},
    {{creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 20, delay = 0.9}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 1, delay = 0.9, modifiers = {InvisibilityModifier.INVISIBILITY_MODIFIER}}},
    {{creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 25, delay = 0.9, modifiers = {RegenModifier.REGEN_MODIFIER}}, {creepType = CreepBaseUnits.PURPLE_VILLAGER, amount = 10, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 23, delay = 0.9, modifiers = {RegenModifier.REGEN_MODIFIER}}, {creepType = CreepBaseUnits.ZEBRA_VILLAGER, amount = 4, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 100, delay = 0.1}, {creepType = CreepBaseUnits.BLUE_VILLAGER, amount = 60, delay = 0.1}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 45, delay = 0.1}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 45, delay = 0.1}},
    {{creepType = CreepBaseUnits.FORTIFIED_VILLAGER, amount = 6, delay = 0.9}},
    {{creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 50, delay = 0.9}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 15, delay = 0.9, modifiers = {RegenModifier.REGEN_MODIFIER}}},
    {{creepType = CreepBaseUnits.FORTIFIED_VILLAGER, amount = 9, delay = 0.9}},
    {{creepType = CreepBaseUnits.BLACK_VILLAGER, amount = 8, delay = 0.9}, {creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 8, delay = 0.9}, {creepType = CreepBaseUnits.ZEBRA_VILLAGER, amount = 8, delay = 0.9}, {creepType = CreepBaseUnits.ZEBRA_VILLAGER, amount = 2, delay = 0.9, modifiers = {RegenModifier.REGEN_MODIFIER}}},
    {{creepType = CreepBaseUnits.BLACK_VILLAGER, modifiers = {InvisibilityModifier.INVISIBILITY_MODIFIER, RegenModifier.REGEN_MODIFIER}, amount = 15, delay = 0.9}, {creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 20, delay = 0.9}, {creepType = CreepBaseUnits.PURPLE_VILLAGER, amount = 10, delay = 0.9}},
    {{creepType = CreepBaseUnits.RED_VILLAGER, amount = 20, delay = 0.1, modifiers = {InvisibilityModifier.INVISIBILITY_MODIFIER}}, {creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 13, delay = 0.6, modifiers = {InvisibilityModifier.INVISIBILITY_MODIFIER}}},
    {{creepType = CreepBaseUnits.YELLOW_VILLAGER, amount = 160, delay = 0.05}, {creepType = CreepBaseUnits.ZEBRA_VILLAGER, amount = 6, delay = 0.9}},
    {{creepType = CreepBaseUnits.PINK_VILLAGER, amount = 35, delay = 0.4}, {creepType = CreepBaseUnits.BLACK_VILLAGER, amount = 30, delay = 0.4}, {creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 25, delay = 0.4}, {creepType = CreepBaseUnits.RAINBOW_VILLAGER, amount = 6, delay = 0.4}},
    {{creepType = CreepBaseUnits.PINK_VILLAGER, amount = 140, delay = 0.05}, {creepType = CreepBaseUnits.GREEN_VILLAGER, amount = 30, delay = 0.4, modifiers = {RegenModifier.REGEN_MODIFIER, InvisibilityModifier.INVISIBILITY_MODIFIER}}},
    {
        {creepType = CreepBaseUnits.BLACK_VILLAGER, amount = 25, delay = 0.5},
        {creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 25, delay = 0.5},
        {creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 7, delay = 0.5, modifiers = {InvisibilityModifier.INVISIBILITY_MODIFIER}},
        {creepType = CreepBaseUnits.ZEBRA_VILLAGER, amount = 10, delay = 0.5},
        {creepType = CreepBaseUnits.FORTIFIED_VILLAGER, amount = 15, delay = 0.5}
    },
    {
        {creepType = CreepBaseUnits.PINK_VILLAGER, amount = 42, delay = 0.1},
        {creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 17, delay = 0.1},
        {creepType = CreepBaseUnits.ZEBRA_VILLAGER, amount = 10, delay = 0.1},
        {creepType = CreepBaseUnits.FORTIFIED_VILLAGER, amount = 14, delay = 0.1},
        {creepType = CreepBaseUnits.LARGE_VILLAGER, amount = 2, delay = 0.9}
    },
    {
        {creepType = CreepBaseUnits.BLACK_VILLAGER, amount = 10, delay = 0.1},
        {creepType = CreepBaseUnits.WHITE_VILLAGER, amount = 10, delay = 0.1},
        {creepType = CreepBaseUnits.ZEBRA_VILLAGER, amount = 20, delay = 0.1},
        {creepType = CreepBaseUnits.RAINBOW_VILLAGER, amount = 18, delay = 0.1},
        {creepType = CreepBaseUnits.RAINBOW_VILLAGER, amount = 2, delay = 0.1, modifiers = {RegenModifier.REGEN_MODIFIER}}
    },
    {{creepType = CreepBaseUnits.ZEPPELIN, amount = 1, delay = 0.9}}
}
function ____exports.getRoundCreeps(currentRound)
    return rounds[math.min(currentRound, #rounds - 1) + 1]
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEngineGlobals"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
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
    self.DamageEventSourceUnitId = nil
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
["src.Utility.DamageEngine.GameSettings"] = function(...) 
local ____exports = {}
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
____exports.AttackTypeDebugStr = {
    "SPELLS",
    "NORMAL",
    "PIERCE",
    "SIEGE",
    "MAGIC",
    "CHAOS",
    "HERO"
}
____exports.WeaponTypeDebugStr = {
    "NONE",
    "METAL_LIGHT_CHOP",
    "METAL_MEDIUM_CHOP",
    "METAL_HEAVY_CHOP",
    "METAL_LIGHT_SLICE",
    "METAL_MEDIUM_SLICE",
    "METAL_HEAVY_SLICE",
    "METAL_MEDIUM_BASH",
    "METAL_HEAVY_BASH",
    "METAL_MEDIUM_STAB",
    "METAL_HEAVY_STAB",
    "WOOD_LIGHT_SLICE",
    "WOOD_MEDIUM_SLICE",
    "WOOD_HEAVY_SLICE",
    "WOOD_LIGHT_BASH",
    "WOOD_MEDIUM_BASH",
    "WOOD_HEAVY_BASH",
    "WOOD_LIGHT_STAB",
    "WOOD_MEDIUM_STAB",
    "CLAW_LIGHT_SLICE",
    "CLAW_MEDIUM_SLICE",
    "CLAW_HEAVY_SLICE",
    "AXE_MEDIUM_CHOP",
    "ROCK_HEAVY_BASH"
}
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvent"] = function(...) 
local ____exports = {}
return ____exports
 end,
["src.Utility.DamageEngine.DamageEngine"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local settings = require("src.Utility.DamageEngine.GameSettings")
local ____index = require("lua_modules.w3ts.index")
local Trigger = ____index.Trigger
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
    self.t1:registerAnyUnitEvent(EVENT_PLAYER_UNIT_DAMAGING)
    self.t1:addCondition(function() return self:t1Condition() end)
    self.t2:registerAnyUnitEvent(EVENT_PLAYER_UNIT_DAMAGED)
    self.t2:addCondition(function() return self:t2Condition() end)
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
    if self.damageEngineGlobals.DamageEventPrevAmt ~= 0 and self.damageEngineGlobals.DamageEventDamageT ~= settings.DAMAGE_TYPE_UNKNOWN then
        self:afterDamageEvent()
    end
end
function DamageEngine.prototype.finish(self)
    if self.eventsRun then
        self.eventsRun = false
        self:afterDamage()
    end
    if self.canKick and not self.kicking then
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
                            self:UnitDamageTarget(
                                open.source,
                                open.target,
                                open.amount,
                                true,
                                false,
                                open.attack,
                                open.damage,
                                open.weapon
                            )
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
            __TS__ArrayPush(self.stack, {
                type = self.damageEngineGlobals.NextDamageType,
                source = src,
                target = tgt,
                amount = amt,
                attack = at,
                damage = dt,
                weapon = wt,
                trig = self.eventTrig
            })
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
            if self.kicking and sg[GetHandleId(src)] and tg[GetHandleId(tgt)] then
                if ____exports.DamageEngine.inception and not self.trigFrozen[self.eventTrig + 1] then
                    self.inceptionTrig[self.eventTrig + 1] = true
                    if self.levelsDeep[self.eventTrig + 1] < self.sleepLevel then
                        local ____self_levelsDeep_0, ____temp_1 = self.levelsDeep, self.eventTrig + 1
                        ____self_levelsDeep_0[____temp_1] = ____self_levelsDeep_0[____temp_1] + 1
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
        b = self:UnitDamageTarget(
            src,
            tgt,
            amt,
            a,
            r,
            at,
            dt,
            wt
        )
    end
    ____exports.DamageEngine.inception = false
    self.damageEngineGlobals.NextDamageType = 0
    if b and not self.dreaming then
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
                if dt ~= DAMAGE_TYPE_SPIRIT_LINK and dt ~= DAMAGE_TYPE_DEFENSIVE and dt ~= DAMAGE_TYPE_PLANT then
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
                local ____self_damageEngineGlobals_2, ____DamageEventLevel_3 = self.damageEngineGlobals, "DamageEventLevel"
                ____self_damageEngineGlobals_2[____DamageEventLevel_3] = ____self_damageEngineGlobals_2[____DamageEventLevel_3] + 1
            elseif not IsUnitInGroup(tgt, self.damageEngineGlobals.DamageEventAOEGroup) then
                local ____self_damageEngineGlobals_4, ____DamageEventAOE_5 = self.damageEngineGlobals, "DamageEventAOE"
                ____self_damageEngineGlobals_4[____DamageEventAOE_5] = ____self_damageEngineGlobals_4[____DamageEventAOE_5] + 1
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
    self.damageEngineGlobals.DamageEventSourceUnitId = GetHandleId(self.damageEngineGlobals.DamageEventSource)
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
            BlzSetEventAttackType(ConvertAttackType(self.damageEngineGlobals.DamageEventAttackT))
            BlzSetEventDamageType(ConvertDamageType(self.damageEngineGlobals.DamageEventDamageT))
            BlzSetEventWeaponType(ConvertWeaponType(self.damageEngineGlobals.DamageEventWeaponT))
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
        self.damageEngineGlobals.DamageEventAttackT = GetHandleId(BlzGetEventAttackType())
        self.damageEngineGlobals.DamageEventDamageT = GetHandleId(BlzGetEventDamageType())
        self.damageEngineGlobals.DamageEventWeaponT = GetHandleId(BlzGetEventWeaponType())
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
    if self.damageEngineGlobals.DamageEventAmount ~= 0 and r ~= 0 then
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
            if self.damageEngineGlobals.DamageEventType < 0 and self.damageEngineGlobals.LethalDamageHP <= 0.405 then
                SetUnitExploded(self.damageEngineGlobals.DamageEventTarget, true)
            end
            self:damageEventLethal()
        end
        self.damageEngineGlobals.DamageScalingUser = self.damageEngineGlobals.DamageEventAmount / self.damageEngineGlobals.DamageEventPrevAmt / self.damageEngineGlobals.DamageScalingWC3
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
    if self.damageEngineGlobals.DamageEventDamageT == settings.DAMAGE_TYPE_NORMAL and not self.damageEngineGlobals.IsDamageSpell then
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
["src.Utility.DamageEngine.DamageEvents.EmbrittlementDamageEvent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____GameSettings = require("src.Utility.DamageEngine.GameSettings")
local ATTACK_TYPE_CHAOS = ____GameSettings.ATTACK_TYPE_CHAOS
local embrittlementBuffId = FourCC("B002")
____exports.EmbrittlementDamageEvent = __TS__Class()
local EmbrittlementDamageEvent = ____exports.EmbrittlementDamageEvent
EmbrittlementDamageEvent.name = "EmbrittlementDamageEvent"
function EmbrittlementDamageEvent.prototype.____constructor(self)
end
function EmbrittlementDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    if UnitHasBuffBJ(globals.DamageEventTarget, embrittlementBuffId) then
        globals.DamageEventAttackT = ATTACK_TYPE_CHAOS
        globals.DamageEventAmount = globals.DamageEventAmount + 1
    end
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path1.ColdSnap"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNCrushingWave.blp"
    self.cost = 380
    self.description = "TODO: Write description"
end
function ColdSnap.prototype.applyUpgrade(self, tower)
    tower.customData.hasColdSnap = true
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path1.Permafrost"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNSlow.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function Permafrost.prototype.applyUpgrade(self, tower)
    tower.customData.hasPermafrost = true
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path2.EnhancedFreeze"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNCloudOfFog.blp"
    self.cost = 245
    self.description = "TODO: Write description"
end
function EnhancedFreeze.prototype.applyUpgrade(self, tower)
    tower.customData.freezeDuration = 2.2
    if tower.pathUpgrades[3] < 3 then
        local abil = tower.unit:getAbility(tickTowerAbilityId)
        BlzSetAbilityRealLevelField(
            abil,
            ABILITY_RLF_COOLDOWN,
            0,
            BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75
        )
    else
        tower.unit:setAttackCooldown(
            tower.unit:getAttackCooldown(0) * 0.75,
            0
        )
    end
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path3.LargerRadius"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNFrostArmor.blp"
    self.cost = 190
    self.description = "TODO: Write description"
end
function LargerRadius.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 70
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path3.ReFreeze"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNFrost.blp"
    self.cost = 245
    self.description = "TODO: Write description"
end
function ReFreeze.prototype.applyUpgrade(self, tower)
    tower.customData.hasReFreeze = true
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path1.IceShards"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.IceShards = __TS__Class()
local IceShards = ____exports.IceShards
IceShards.name = "IceShards"
__TS__ClassExtends(IceShards, TowerUpgrade)
function IceShards.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Ice Shards"
    self.icon = "ReplaceableTextures/CommandButtons/BTNBlizzard.blp"
    self.cost = 1620
    self.description = "TODO: Write description"
end
function IceShards.prototype.applyUpgrade(self, tower)
    tower.customData.hasIceShards = true
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 50
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path2.DeepFreeze"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.DeepFreeze = __TS__Class()
local DeepFreeze = ____exports.DeepFreeze
DeepFreeze.name = "DeepFreeze"
__TS__ClassExtends(DeepFreeze, TowerUpgrade)
function DeepFreeze.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Deep Freeze"
    self.icon = "ReplaceableTextures/CommandButtons/BTNFreezingBreath.blp"
    self.cost = 380
    self.description = "TODO: Write description"
end
function DeepFreeze.prototype.applyUpgrade(self, tower)
    tower.customData.hasDeepFreeze = true
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path3.FrostWyrm"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FrostWyrm = __TS__Class()
local FrostWyrm = ____exports.FrostWyrm
FrostWyrm.name = "FrostWyrm"
__TS__ClassExtends(FrostWyrm, TowerUpgrade)
function FrostWyrm.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Frost Wyrm"
    self.icon = "ReplaceableTextures/CommandButtons/BTNFrostWyrm.blp"
    self.cost = 2105
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h00G")
end
function FrostWyrm.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____maxUnitCount_1 = tower.customData, "maxUnitCount"
    ____tower_customData_0[____maxUnitCount_1] = ____tower_customData_0[____maxUnitCount_1] - 10
    local ____tower_customData_2, ____range_3 = tower.customData, "range"
    ____tower_customData_2[____range_3] = ____tower_customData_2[____range_3] - 70
    local ____tower_customData_4, ____damageAmount_5 = tower.customData, "damageAmount"
    ____tower_customData_4[____damageAmount_5] = ____tower_customData_4[____damageAmount_5] + 1
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path2.ArcticWind"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local arcticWindSlowAuraAbilityId = FourCC("A00C")
____exports.ArcticWind = __TS__Class()
local ArcticWind = ____exports.ArcticWind
ArcticWind.name = "ArcticWind"
__TS__ClassExtends(ArcticWind, TowerUpgrade)
function ArcticWind.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Arctic Wind"
    self.icon = "ReplaceableTextures/CommandButtons/BTNBrilliance.blp"
    self.cost = 3130
    self.description = "TODO: Write description"
end
function ArcticWind.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____maxUnitCount_1 = tower.customData, "maxUnitCount"
    ____tower_customData_0[____maxUnitCount_1] = ____tower_customData_0[____maxUnitCount_1] + 60
    tower.unit:addAbility(arcticWindSlowAuraAbilityId)
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path1.Embrittlement"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.Embrittlement = __TS__Class()
local Embrittlement = ____exports.Embrittlement
Embrittlement.name = "Embrittlement"
__TS__ClassExtends(Embrittlement, TowerUpgrade)
function Embrittlement.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Embrittlement"
    self.icon = "ReplaceableTextures/CommandButtons/BTNDarkRitual.blp"
    self.cost = 2375
    self.description = "TODO: Write description"
end
function Embrittlement.prototype.applyUpgrade(self, tower)
    tower.customData.hasEmbrittlement = true
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path1.SuperBrittle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.SuperBrittle = __TS__Class()
local SuperBrittle = ____exports.SuperBrittle
SuperBrittle.name = "SuperBrittle"
__TS__ClassExtends(SuperBrittle, TowerUpgrade)
function SuperBrittle.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Super Brittle"
    self.icon = "ReplaceableTextures/CommandButtons/BTNSkeletalLongevity.blp"
    self.cost = 30240
    self.description = "TODO: Write description"
end
function SuperBrittle.prototype.applyUpgrade(self, tower)
    tower.customData.hasSuperBrittle = true
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.9
    )
end
return ____exports
 end,
["src.TowerAbilities.SnowstormAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerAbility = require("src.TowerAbilities.TowerAbility")
local TowerAbility = ____TowerAbility.TowerAbility
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
____exports.SnowstormAbility = __TS__Class()
local SnowstormAbility = ____exports.SnowstormAbility
SnowstormAbility.name = "SnowstormAbility"
__TS__ClassExtends(SnowstormAbility, TowerAbility)
function SnowstormAbility.prototype.____constructor(self, ...)
    TowerAbility.prototype.____constructor(self, ...)
    self.name = "Snowstorm"
    self.description = "Damages and freezes all creeps for 6 seconds."
    self.icon = "ReplaceableTextures/CommandButtons/BTNGlacier.blp"
    self.cooldown = 30
    self.abilityType = TowerAbilityType.SNOWSTORM
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path2.Snowstorm"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____SnowstormAbility = require("src.TowerAbilities.SnowstormAbility")
local SnowstormAbility = ____SnowstormAbility.SnowstormAbility
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.Snowstorm = __TS__Class()
local Snowstorm = ____exports.Snowstorm
Snowstorm.name = "Snowstorm"
__TS__ClassExtends(Snowstorm, TowerUpgrade)
function Snowstorm.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Snowstorm"
    self.icon = "ReplaceableTextures/CommandButtons/BTNGlacier.blp"
    self.cost = 3240
    self.description = "TODO: Write description"
    self.ability = __TS__New(SnowstormAbility)
end
function Snowstorm.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 100
end
return ____exports
 end,
["src.Towers.ObsidianStatue.ObsidianStatue"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
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
local ____IceShards = require("src.Towers.ObsidianStatue.Upgrades.Path1.IceShards")
local IceShards = ____IceShards.IceShards
local ____DeepFreeze = require("src.Towers.ObsidianStatue.Upgrades.Path2.DeepFreeze")
local DeepFreeze = ____DeepFreeze.DeepFreeze
local ____FrostWyrm = require("src.Towers.ObsidianStatue.Upgrades.Path3.FrostWyrm")
local FrostWyrm = ____FrostWyrm.FrostWyrm
local ____ArcticWind = require("src.Towers.ObsidianStatue.Upgrades.Path2.ArcticWind")
local ArcticWind = ____ArcticWind.ArcticWind
local ____Embrittlement = require("src.Towers.ObsidianStatue.Upgrades.Path1.Embrittlement")
local Embrittlement = ____Embrittlement.Embrittlement
local ____SuperBrittle = require("src.Towers.ObsidianStatue.Upgrades.Path1.SuperBrittle")
local SuperBrittle = ____SuperBrittle.SuperBrittle
local ____Snowstorm = require("src.Towers.ObsidianStatue.Upgrades.Path2.Snowstorm")
local Snowstorm = ____Snowstorm.Snowstorm
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
            __TS__New(ColdSnap),
            __TS__New(IceShards),
            __TS__New(Embrittlement),
            __TS__New(SuperBrittle)
        },
        {
            __TS__New(EnhancedFreeze),
            __TS__New(DeepFreeze),
            __TS__New(ArcticWind),
            __TS__New(Snowstorm)
        },
        {
            __TS__New(LargerRadius),
            __TS__New(ReFreeze),
            __TS__New(FrostWyrm)
        }
    }
    self.unitTypeId = FourCC("h008")
end
function ObsidianStatue.prototype.initializeCustomData(self)
    return {
        range = 270,
        maxUnitCount = 40,
        damageAmount = 1,
        freezeDuration = 1.5,
        hasPermafrost = false,
        hasColdSnap = false,
        hasReFreeze = false,
        hasIceShards = false,
        hasDeepFreeze = false,
        hasEmbrittlement = false,
        hasSuperBrittle = false
    }
end
function ObsidianStatue.prototype.applyInitialUnitValues(self, unit)
    BlzSetAbilityRealLevelField(
        unit:getAbility(tickTowerAbilityId),
        ABILITY_RLF_COOLDOWN,
        0,
        2.4
    )
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.FrostWyrmDamageEvent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____GameSettings = require("src.Utility.DamageEngine.GameSettings")
local ATTACK_TYPE_NORMAL = ____GameSettings.ATTACK_TYPE_NORMAL
local ____point = require("lua_modules.w3ts.handles.point")
local Point = ____point.Point
local ____Group = require("src.Utility.Group")
local Group = ____Group.Group
local ____DefenseTypes = require("src.Creeps.DefenseTypes")
local DefenseTypes = ____DefenseTypes.DefenseTypes
local frostWyrmUnitTypeId = FourCC("h00G")
local fortifiedUnitTypeId = FourCC("u004")
local invisibilityUnitTypeId = FourCC("u003")
____exports.FrostWyrmDamageEvent = __TS__Class()
local FrostWyrmDamageEvent = ____exports.FrostWyrmDamageEvent
FrostWyrmDamageEvent.name = "FrostWyrmDamageEvent"
function FrostWyrmDamageEvent.prototype.____constructor(self, towers, stunUtils)
    self.towers = towers
    self.stunUtils = stunUtils
end
function FrostWyrmDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    if globals.DamageEventSourceUnitTypeId ~= frostWyrmUnitTypeId then
        return
    end
    if globals.DamageEventAttackT ~= ATTACK_TYPE_NORMAL then
        return
    end
    local trig = globals.DamageEventSource
    local targ = globals.DamageEventTarget
    local tower = self.towers:get(GetHandleId(trig))
    if tower == nil then
        return
    end
    local ____temp_0 = tower.customData
    local range = ____temp_0.range
    local maxUnitCount = ____temp_0.maxUnitCount
    local damageAmount = ____temp_0.damageAmount
    local freezeDuration = ____temp_0.freezeDuration
    local hasPermafrost = ____temp_0.hasPermafrost
    local hasReFreeze = ____temp_0.hasReFreeze
    local hasIceShards = ____temp_0.hasIceShards
    local hasDeepFreeze = ____temp_0.hasDeepFreeze
    local hasColdSnap = ____temp_0.hasColdSnap
    local loc = __TS__New(
        Point,
        GetUnitX(targ),
        GetUnitY(targ)
    )
    local grp = Group:fromRange(range, loc)
    local unitCount = 0
    grp["for"](
        grp,
        function(u)
            if unitCount >= maxUnitCount then
                return
            end
            if u.owner.id ~= 23 then
                return
            end
            if u.handle == targ then
                return
            end
            if not u:isAlive() then
                return
            end
            local unitTypeId = u.typeId
            if not hasColdSnap and (unitTypeId == fortifiedUnitTypeId or unitTypeId == invisibilityUnitTypeId) then
                return
            end
            if BlzGetUnitIntegerField(u.handle, UNIT_IF_DEFENSE_TYPE) == DefenseTypes.HEAVY then
                return
            end
            unitCount = unitCount + 1
            tower.unit:damageTarget(
                u.handle,
                damageAmount,
                true,
                false,
                ATTACK_TYPE_CHAOS,
                DAMAGE_TYPE_NORMAL,
                WEAPON_TYPE_WHOKNOWS
            )
            self.stunUtils:freezeUnit(
                u,
                freezeDuration,
                hasPermafrost,
                hasReFreeze,
                hasIceShards,
                hasDeepFreeze
            )
        end
    )
    grp:destroy()
    loc:destroy()
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.LargerRocks"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNHumanMissileUpOne.blp"
    self.cost = 380
    self.description = "TODO: Write description"
end
function LargerRocks.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____areaOfEffect_1 = tower.customData, "areaOfEffect"
    ____tower_customData_0[____areaOfEffect_1] = ____tower_customData_0[____areaOfEffect_1] + 60
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.HeavierRocks"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNHumanMissileUpTwo.blp"
    self.cost = 700
    self.description = "TODO: Write description"
end
function HeavierRocks.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____maxUnitCount_1 = tower.customData, "maxUnitCount"
    ____tower_customData_0[____maxUnitCount_1] = ____tower_customData_0[____maxUnitCount_1] + 10
    local ____tower_customData_2, ____aoeDamage_3 = tower.customData, "aoeDamage"
    ____tower_customData_2[____aoeDamage_3] = ____tower_customData_2[____aoeDamage_3] + 1
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.ReallyBigRocks"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNHumanMissileUpThree.blp"
    self.cost = 1295
    self.description = "TODO: Write description"
end
function ReallyBigRocks.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____areaOfEffect_1 = tower.customData, "areaOfEffect"
    ____tower_customData_0[____areaOfEffect_1] = ____tower_customData_0[____areaOfEffect_1] + 90
    local ____tower_customData_2, ____aoeDamage_3 = tower.customData, "aoeDamage"
    ____tower_customData_2[____aoeDamage_3] = ____tower_customData_2[____aoeDamage_3] + 1
    local ____tower_customData_4, ____maxUnitCount_5 = tower.customData, "maxUnitCount"
    ____tower_customData_4[____maxUnitCount_5] = ____tower_customData_4[____maxUnitCount_5] + 20
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path2.FasterHurling"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNDispelMagic.blp"
    self.cost = 270
    self.description = "TODO: Write description"
end
function FasterHurling.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.75,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path2.ExcessiveHurling"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNFlakCannons.blp"
    self.cost = 430
    self.description = "TODO: Write description"
end
function ExcessiveHurling.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 40
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 40)
    BlzSetUnitWeaponRealField(
        tower.unit.handle,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 150
    )
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.8,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path2.Wendigo"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNHumanArtilleryUpOne.blp"
    self.cost = 1190
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h005")
end
function Wendigo.prototype.applyUpgrade(self, tower)
    tower.zeppelinVillagerBonusDamage = tower.zeppelinVillagerBonusDamage + 18
    tower.unit.acquireRange = tower.unit.acquireRange + 50
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 50)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.ExtraRange"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNDwarvenLongRifle.blp"
    self.cost = 215
    self.description = "TODO: Write description"
end
function ExtraRange.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 70
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 70)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.FragBombs"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNFlare.blp"
    self.cost = 325
    self.description = "TODO: Write description"
end
function FragBombs.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____aoeDamage_1 = tower.customData, "aoeDamage"
    ____tower_customData_0[____aoeDamage_1] = ____tower_customData_0[____aoeDamage_1] + 1
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.SeaGiant"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNFragmentationBombs.blp"
    self.cost = 865
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h004")
end
function SeaGiant.prototype.applyUpgrade(self, _tower)
    return
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.SkeletalHammer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNBash.blp"
    self.cost = 3890
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h006")
end
function SkeletalHammer.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 30
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 30)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path1.GreaterHammers"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNStormHammer.blp"
    self.cost = 59400
    self.description = "TODO: Write description"
end
function GreaterHammers.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____aoeDamage_1 = tower.customData, "aoeDamage"
    ____tower_customData_0[____aoeDamage_1] = ____tower_customData_0[____aoeDamage_1] + 9
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 9,
        0
    )
    BlzSetUnitWeaponStringField(tower.unit.handle, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, "Abilities/Weapons/GryphonRiderMissile/GryphonRiderMissile.mdl")
    tower.unit:setAbilityLevel(skeletalHammerAbilityId, 2)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.RecursiveBombs"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNScatterRockets.blp"
    self.cost = 3025
    self.description = "TODO: Write description"
end
function RecursiveBombs.prototype.applyUpgrade(self, tower)
    tower.unit:setAbilityLevel(clusterBombsAbilityId, 2)
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path3.BombBlitz"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNWallOfFire.blp"
    self.cost = 37800
    self.description = "TODO: Write description"
end
function BombBlitz.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____aoeDamage_1 = tower.customData, "aoeDamage"
    ____tower_customData_0[____aoeDamage_1] = ____tower_customData_0[____aoeDamage_1] + 3
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 3,
        0
    )
    tower.unit:setAbilityLevel(clusterBombsAbilityId, 3)
end
return ____exports
 end,
["src.TowerAbilities.WendigoSmashAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerAbility = require("src.TowerAbilities.TowerAbility")
local TowerAbility = ____TowerAbility.TowerAbility
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
____exports.WendigoSmashAbility = __TS__Class()
local WendigoSmashAbility = ____exports.WendigoSmashAbility
WendigoSmashAbility.name = "WendigoSmashAbility"
__TS__ClassExtends(WendigoSmashAbility, TowerAbility)
function WendigoSmashAbility.prototype.____constructor(self, ...)
    TowerAbility.prototype.____constructor(self, ...)
    self.name = "Wendigo Smash"
    self.description = "Smashes the strongest Zeppelin on the map into pieces."
    self.icon = "ReplaceableTextures/CommandButtons/BTNThunderclap.blp"
    self.cooldown = 30
    self.abilityType = TowerAbilityType.WENDIGO_SMASH
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path2.WendigoSmash"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____WendigoSmashAbility = require("src.TowerAbilities.WendigoSmashAbility")
local WendigoSmashAbility = ____WendigoSmashAbility.WendigoSmashAbility
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.WendigoSmash = __TS__Class()
local WendigoSmash = ____exports.WendigoSmash
WendigoSmash.name = "WendigoSmash"
__TS__ClassExtends(WendigoSmash, TowerUpgrade)
function WendigoSmash.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Wendigo Smash"
    self.icon = "ReplaceableTextures/CommandButtons/BTNThunderclap.blp"
    self.cost = 3455
    self.description = "TODO: Write description"
    self.ability = __TS__New(WendigoSmashAbility)
end
function WendigoSmash.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 70
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 70)
    tower.zeppelinVillagerBonusDamage = tower.zeppelinVillagerBonusDamage + 12
    tower.largeVillagerBonusDamage = tower.largeVillagerBonusDamage + 4
end
return ____exports
 end,
["src.TowerAbilities.ZeppelinCrushAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerAbility = require("src.TowerAbilities.TowerAbility")
local TowerAbility = ____TowerAbility.TowerAbility
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
____exports.ZeppelinCrushAbility = __TS__Class()
local ZeppelinCrushAbility = ____exports.ZeppelinCrushAbility
ZeppelinCrushAbility.name = "ZeppelinCrushAbility"
__TS__ClassExtends(ZeppelinCrushAbility, TowerAbility)
function ZeppelinCrushAbility.prototype.____constructor(self, ...)
    TowerAbility.prototype.____constructor(self, ...)
    self.name = "Zeppelin Crush"
    self.description = "Crushes the strongest Zeppelin on the map into several pieces."
    self.icon = "ReplaceableTextures/CommandButtons/BTNEarthquake.blp"
    self.cooldown = 10
    self.abilityType = TowerAbilityType.ZEPPELIN_CRUSH
end
return ____exports
 end,
["src.Towers.Sapper.Upgrades.Path2.ZeppelinCrusher"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____ZeppelinCrushAbility = require("src.TowerAbilities.ZeppelinCrushAbility")
local ZeppelinCrushAbility = ____ZeppelinCrushAbility.ZeppelinCrushAbility
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ZeppelinCrusher = __TS__Class()
local ZeppelinCrusher = ____exports.ZeppelinCrusher
ZeppelinCrusher.name = "ZeppelinCrusher"
__TS__ClassExtends(ZeppelinCrusher, TowerUpgrade)
function ZeppelinCrusher.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Zeppelin Crusher"
    self.icon = "ReplaceableTextures/CommandButtons/BTNEarthquake.blp"
    self.cost = 27000
    self.description = "TODO: Write description"
    self.ability = __TS__New(ZeppelinCrushAbility)
end
function ZeppelinCrusher.prototype.applyUpgrade(self, tower)
    tower.zeppelinVillagerBonusDamage = tower.zeppelinVillagerBonusDamage + 69
end
return ____exports
 end,
["src.Towers.Sapper.Sapper"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
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
local ____WendigoSmash = require("src.Towers.Sapper.Upgrades.Path2.WendigoSmash")
local WendigoSmash = ____WendigoSmash.WendigoSmash
local ____ZeppelinCrusher = require("src.Towers.Sapper.Upgrades.Path2.ZeppelinCrusher")
local ZeppelinCrusher = ____ZeppelinCrusher.ZeppelinCrusher
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
            __TS__New(Wendigo),
            __TS__New(WendigoSmash),
            __TS__New(ZeppelinCrusher)
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
function Sapper.prototype.initializeCustomData(self)
    return {areaOfEffect = 120, maxUnitCount = 13, aoeDamage = 1}
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.SapperDamageEvent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____GameSettings = require("src.Utility.DamageEngine.GameSettings")
local ATTACK_TYPE_SIEGE = ____GameSettings.ATTACK_TYPE_SIEGE
local ____point = require("lua_modules.w3ts.handles.point")
local Point = ____point.Point
local ____Group = require("src.Utility.Group")
local Group = ____Group.Group
local sapperUnitTypeId = FourCC("h003")
local seaGiantUnitTypeId = FourCC("h004")
local wendigoUnitTypeId = FourCC("h005")
local skeletalOrcUnitTypeId = FourCC("h006")
____exports.SapperDamageEvent = __TS__Class()
local SapperDamageEvent = ____exports.SapperDamageEvent
SapperDamageEvent.name = "SapperDamageEvent"
function SapperDamageEvent.prototype.____constructor(self, towers)
    self.towers = towers
end
function SapperDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    repeat
        local ____switch5 = globals.DamageEventSourceUnitTypeId
        local ____cond5 = ____switch5 == sapperUnitTypeId or ____switch5 == seaGiantUnitTypeId or ____switch5 == wendigoUnitTypeId or ____switch5 == skeletalOrcUnitTypeId
        if ____cond5 then
            break
        end
        do
            return
        end
    until true
    if globals.DamageEventAttackT ~= ATTACK_TYPE_SIEGE then
        return
    end
    local trig = globals.DamageEventSource
    local targ = globals.DamageEventTarget
    local tower = self.towers:get(GetHandleId(trig))
    if tower == nil then
        return
    end
    local ____temp_0 = tower.customData
    local areaOfEffect = ____temp_0.areaOfEffect
    local maxUnitCount = ____temp_0.maxUnitCount
    local aoeDamage = ____temp_0.aoeDamage
    local loc = __TS__New(
        Point,
        GetUnitX(targ),
        GetUnitY(targ)
    )
    local grp = Group:fromRange(areaOfEffect, loc)
    local unitCount = 0
    grp["for"](
        grp,
        function(u)
            if unitCount >= maxUnitCount then
                return
            end
            if u.owner.id ~= 23 then
                return
            end
            if u.handle == targ then
                return
            end
            UnitDamageTarget(
                trig,
                u.handle,
                aoeDamage,
                true,
                true,
                ATTACK_TYPE_PIERCE,
                DAMAGE_TYPE_NORMAL,
                WEAPON_TYPE_WHOKNOWS
            )
        end
    )
    grp:destroy()
    loc:destroy()
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.SeaGiantDamageEvent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____GameSettings = require("src.Utility.DamageEngine.GameSettings")
local ATTACK_TYPE_SIEGE = ____GameSettings.ATTACK_TYPE_SIEGE
local ____index = require("lua_modules.w3ts.index")
local Effect = ____index.Effect
local ____point = require("lua_modules.w3ts.handles.point")
local Point = ____point.Point
local ____Group = require("src.Utility.Group")
local Group = ____Group.Group
local seaGiantUnitTypeId = FourCC("h004")
local clusterBombsAbilityId = FourCC("A005")
____exports.SeaGiantDamageEvent = __TS__Class()
local SeaGiantDamageEvent = ____exports.SeaGiantDamageEvent
SeaGiantDamageEvent.name = "SeaGiantDamageEvent"
function SeaGiantDamageEvent.prototype.____constructor(self, timerUtils, towers)
    self.timerUtils = timerUtils
    self.towers = towers
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
    local tower = self.towers:get(GetHandleId(trig))
    if tower == nil then
        return
    end
    local clusterBombsLevel = GetUnitAbilityLevel(trig, clusterBombsAbilityId)
    local x = GetUnitX(globals.DamageEventTarget)
    local y = GetUnitY(globals.DamageEventTarget)
    local userData = (GetUnitUserData(globals.DamageEventSource) + 1) % 2
    SetUnitUserData(globals.DamageEventSource, userData)
    local ____temp_0 = tower.customData
    local aoeDamage = ____temp_0.aoeDamage
    local ticks = 21
    local t = self.timerUtils:newTimer()
    t:start(
        0.1,
        true,
        function()
            ticks = ticks - 1
            if ticks > 12 then
                local loc = __TS__New(
                    Point,
                    x + 150 * CosBJ(45 * ticks),
                    y + 150 * SinBJ(45 * ticks)
                )
                local effect = __TS__New(Effect, "Objects/Spawnmodels/Human/FragmentationShards/FragBoomSpawn.mdl", loc.x, loc.y)
                effect:destroy()
                local grp = Group:fromRange(150, loc)
                grp["for"](
                    grp,
                    function(u)
                        if u.owner.id ~= 23 then
                            return
                        end
                        u:damageTarget(
                            u.handle,
                            aoeDamage,
                            true,
                            false,
                            ATTACK_TYPE_PIERCE,
                            DAMAGE_TYPE_NORMAL,
                            WEAPON_TYPE_WHOKNOWS
                        )
                    end
                )
                grp:destroy()
                loc:destroy()
            elseif clusterBombsLevel == 1 or clusterBombsLevel == 2 and userData < 1 then
                self.timerUtils:releaseTimer(t)
            elseif ticks > 7 then
            else
                local loc = __TS__New(
                    Point,
                    x + 200 * CosBJ(45 * ticks),
                    y + 200 * SinBJ(45 * ticks)
                )
                local effect = __TS__New(Effect, "Abilities/Weapons/CannonTowerMissile/CannonTowerMissile.mdl", loc.x, loc.y)
                effect:destroy()
                local grp = Group:fromRange(340, loc)
                grp["for"](
                    grp,
                    function(u)
                        if u.owner.id ~= 23 then
                            return
                        end
                        u:damageTarget(
                            u.handle,
                            aoeDamage,
                            true,
                            false,
                            ATTACK_TYPE_PIERCE,
                            DAMAGE_TYPE_NORMAL,
                            WEAPON_TYPE_WHOKNOWS
                        )
                    end
                )
                grp:destroy()
                loc:destroy()
            end
            if ticks <= 0 then
                self.timerUtils:releaseTimer(t)
            end
        end
    )
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.SkeletalOrcDamageEvent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____GameMap = require("src.Game.GameMap")
local GameMap = ____GameMap.GameMap
local skeletalOrcUnitTypeId = FourCC("h006")
local skeletalHammerAbilityId = FourCC("A004")
____exports.SkeletalOrcDamageEvent = __TS__Class()
local SkeletalOrcDamageEvent = ____exports.SkeletalOrcDamageEvent
SkeletalOrcDamageEvent.name = "SkeletalOrcDamageEvent"
function SkeletalOrcDamageEvent.prototype.____constructor(self, stunUtils)
    self.stunUtils = stunUtils
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
        local spawnedCreep = GameMap.SPAWNED_CREEP_MAP:get(globals.DamageEventTargetUnitId)
        repeat
            local ____switch8 = spawnedCreep.creepBaseUnit.creepType
            local ____cond8 = ____switch8 == CreepType.ZEPPELIN
            if ____cond8 then
                return
            end
        until true
    end
    self.stunUtils:stunUnit(globals.DamageEventTarget, stunDuration)
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.SuperBrittleDamageEvent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____GameSettings = require("src.Utility.DamageEngine.GameSettings")
local ATTACK_TYPE_CHAOS = ____GameSettings.ATTACK_TYPE_CHAOS
local superBrittleBuffId = FourCC("B003")
____exports.SuperBrittleDamageEvent = __TS__Class()
local SuperBrittleDamageEvent = ____exports.SuperBrittleDamageEvent
SuperBrittleDamageEvent.name = "SuperBrittleDamageEvent"
function SuperBrittleDamageEvent.prototype.____constructor(self)
end
function SuperBrittleDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    if UnitHasBuffBJ(globals.DamageEventTarget, superBrittleBuffId) then
        globals.DamageEventAttackT = ATTACK_TYPE_CHAOS
        globals.DamageEventAmount = globals.DamageEventAmount + 4
    end
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.VillagerLethalDamageEvent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____Group = require("src.Utility.Group")
local Group = ____Group.Group
local ____index = require("lua_modules.w3ts.index")
local Point = ____index.Point
local ____GameMap = require("src.Game.GameMap")
local GameMap = ____GameMap.GameMap
local obsidianStatueUnitTypeId = FourCC("h008")
____exports.VillagerLethalDamageEvent = __TS__Class()
local VillagerLethalDamageEvent = ____exports.VillagerLethalDamageEvent
VillagerLethalDamageEvent.name = "VillagerLethalDamageEvent"
function VillagerLethalDamageEvent.prototype.____constructor(self, stunUtils)
    self.stunUtils = stunUtils
end
function VillagerLethalDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    local spawnedCreep = GameMap.SPAWNED_CREEP_MAP:get(globals.DamageEventTargetUnitId)
    local overflowingDamage = spawnedCreep:dealLethalDamage(math.floor(math.abs(globals.LethalDamageHP)))
    if overflowingDamage ~= -1 then
        globals.DamageEventAmount = overflowingDamage
    end
    self.stunUtils:removeStun(globals.DamageEventTargetUnitId)
    local frozenUnit = self.stunUtils:getFrozenUnit(globals.DamageEventTargetUnitId)
    if frozenUnit ~= nil then
        if globals.DamageEventSourceUnitTypeId ~= obsidianStatueUnitTypeId then
            if not frozenUnit.hasDeepFreeze or globals.DamageEventAmount > 1 then
                frozenUnit:setDuration(0)
            end
        end
        if frozenUnit.hasIceShards then
            local x = GetUnitX(globals.DamageEventTarget)
            local y = GetUnitY(globals.DamageEventTarget)
            local count = 0
            local loc = __TS__New(Point, x, y)
            local group = Group:fromRange(75, loc)
            group["for"](
                group,
                function(u)
                    if count > 2 then
                        return
                    end
                    count = count + 1
                    UnitDamageTarget(
                        globals.DamageEventTarget,
                        u.handle,
                        1,
                        true,
                        false,
                        ATTACK_TYPE_CHAOS,
                        DAMAGE_TYPE_NORMAL,
                        WEAPON_TYPE_WHOKNOWS
                    )
                end
            )
            group:destroy()
            loc:destroy()
        end
    end
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEvents.VillagerTypeBonusDamageEvent"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local ____exports = {}
local ____CreepType = require("src.Creeps.CreepType")
local CreepType = ____CreepType.CreepType
local ____GameMap = require("src.Game.GameMap")
local GameMap = ____GameMap.GameMap
____exports.VillagerTypeBonusDamageEvent = __TS__Class()
local VillagerTypeBonusDamageEvent = ____exports.VillagerTypeBonusDamageEvent
VillagerTypeBonusDamageEvent.name = "VillagerTypeBonusDamageEvent"
function VillagerTypeBonusDamageEvent.prototype.____constructor(self, towers)
    self.towers = towers
end
function VillagerTypeBonusDamageEvent.prototype.event(self, globals)
    local playerId = globals.DamageEventTargetOwningPlayerId
    if playerId ~= 23 then
        return
    end
    local spawnedCreep = GameMap.SPAWNED_CREEP_MAP:get(globals.DamageEventTargetUnitId)
    if spawnedCreep == nil then
        return
    end
    local tower = self.towers:get(globals.DamageEventSourceUnitId)
    if tower == nil then
        return
    end
    repeat
        local ____switch7 = spawnedCreep.creepBaseUnit.creepType
        local ____cond7 = ____switch7 == CreepType.FORTIFIED
        if ____cond7 then
            globals.DamageEventAmount = globals.DamageEventAmount + tower.fortifiedVillagerBonusDamage
            break
        end
        ____cond7 = ____cond7 or ____switch7 == CreepType.PURPLE
        if ____cond7 then
            globals.DamageEventAmount = globals.DamageEventAmount + tower.purpleVillagerBonusDamage
            break
        end
        ____cond7 = ____cond7 or ____switch7 == CreepType.LARGE
        if ____cond7 then
            globals.DamageEventAmount = globals.DamageEventAmount + tower.largeVillagerBonusDamage
            break
        end
        ____cond7 = ____cond7 or ____switch7 == CreepType.ZEPPELIN
        if ____cond7 then
            globals.DamageEventAmount = globals.DamageEventAmount + tower.zeppelinVillagerBonusDamage
            break
        end
        ____cond7 = ____cond7 or ____switch7 == CreepType.NONE
        do
            return
        end
    until true
end
return ____exports
 end,
["src.Utility.DamageEngine.DamageEventController"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local ____exports = {}
local ____EmbrittlementDamageEvent = require("src.Utility.DamageEngine.DamageEvents.EmbrittlementDamageEvent")
local EmbrittlementDamageEvent = ____EmbrittlementDamageEvent.EmbrittlementDamageEvent
local ____FrostWyrmDamageEvent = require("src.Utility.DamageEngine.DamageEvents.FrostWyrmDamageEvent")
local FrostWyrmDamageEvent = ____FrostWyrmDamageEvent.FrostWyrmDamageEvent
local ____SapperDamageEvent = require("src.Utility.DamageEngine.DamageEvents.SapperDamageEvent")
local SapperDamageEvent = ____SapperDamageEvent.SapperDamageEvent
local ____SeaGiantDamageEvent = require("src.Utility.DamageEngine.DamageEvents.SeaGiantDamageEvent")
local SeaGiantDamageEvent = ____SeaGiantDamageEvent.SeaGiantDamageEvent
local ____SkeletalOrcDamageEvent = require("src.Utility.DamageEngine.DamageEvents.SkeletalOrcDamageEvent")
local SkeletalOrcDamageEvent = ____SkeletalOrcDamageEvent.SkeletalOrcDamageEvent
local ____SuperBrittleDamageEvent = require("src.Utility.DamageEngine.DamageEvents.SuperBrittleDamageEvent")
local SuperBrittleDamageEvent = ____SuperBrittleDamageEvent.SuperBrittleDamageEvent
local ____VillagerLethalDamageEvent = require("src.Utility.DamageEngine.DamageEvents.VillagerLethalDamageEvent")
local VillagerLethalDamageEvent = ____VillagerLethalDamageEvent.VillagerLethalDamageEvent
local ____VillagerTypeBonusDamageEvent = require("src.Utility.DamageEngine.DamageEvents.VillagerTypeBonusDamageEvent")
local VillagerTypeBonusDamageEvent = ____VillagerTypeBonusDamageEvent.VillagerTypeBonusDamageEvent
____exports.DamageEventController = __TS__Class()
local DamageEventController = ____exports.DamageEventController
DamageEventController.name = "DamageEventController"
function DamageEventController.prototype.____constructor(self, damageEngine, timerUtils, stunUtils, towers)
    damageEngine:addInitialDamageModificationEvent(__TS__New(EmbrittlementDamageEvent))
    damageEngine:addInitialDamageModificationEvent(__TS__New(SuperBrittleDamageEvent))
    damageEngine:addInitialDamageModificationEvent(__TS__New(VillagerTypeBonusDamageEvent, towers))
    damageEngine:addAfterDamageEvent(__TS__New(SapperDamageEvent, towers))
    damageEngine:addAfterDamageEvent(__TS__New(SeaGiantDamageEvent, timerUtils, towers))
    damageEngine:addAfterDamageEvent(__TS__New(SkeletalOrcDamageEvent, stunUtils))
    damageEngine:addAfterDamageEvent(__TS__New(FrostWyrmDamageEvent, towers, stunUtils))
    damageEngine:addLethalDamageEvent(__TS__New(VillagerLethalDamageEvent, stunUtils))
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.EvenFasterSpread"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 325
    self.description = "TODO: Write description"
end
function EvenFasterSpread.prototype.applyUpgrade(self, tower)
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.6
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.FasterSpread"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNPlagueCloud.blp"
    self.cost = 160
    self.description = "TODO: Write description"
end
function FasterSpread.prototype.applyUpgrade(self, tower)
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.GreaterPermanentImmolation"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNDeathCoil.blp"
    self.cost = 3780
    self.description = "TODO: Write description"
end
function GreaterPermanentImmolation.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____damageAmount_1 = tower.customData, "damageAmount"
    ____tower_customData_0[____damageAmount_1] = ____tower_customData_0[____damageAmount_1] + 1
    local ____tower_customData_2, ____maxUnitCount_3 = tower.customData, "maxUnitCount"
    ____tower_customData_2[____maxUnitCount_3] = ____tower_customData_2[____maxUnitCount_3] + 7
    tower.customData.hasGreaterPermanentImmolation = true
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.74604
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.Inferno"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNInfernal.blp"
    self.cost = 49140
    self.description = "TODO: Write description"
end
function Inferno.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 120
    local ____tower_customData_2, ____damageAmount_3 = tower.customData, "damageAmount"
    ____tower_customData_2[____damageAmount_3] = ____tower_customData_2[____damageAmount_3] + 1
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.2128
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path1.PermanentImmolation"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNDeathPact.blp"
    self.cost = 650
    self.description = "TODO: Write description"
end
function PermanentImmolation.prototype.applyUpgrade(self, tower)
    tower.unit:removeAbility(diseaseCloudAbilityId)
    tower.unit:addAbility(permanentImmolationAbilityId)
    local ____tower_customData_0, ____damageAmount_1 = tower.customData, "damageAmount"
    ____tower_customData_0[____damageAmount_1] = ____tower_customData_0[____damageAmount_1] + 1
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path2.EvenLongerRange"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNBansheeMaster.blp"
    self.cost = 245
    self.description = "TODO: Write description"
end
function EvenLongerRange.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 40
    local ____tower_customData_2, ____maxUnitCount_3 = tower.customData, "maxUnitCount"
    ____tower_customData_2[____maxUnitCount_3] = ____tower_customData_2[____maxUnitCount_3] + 1
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path2.LongerRange"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNBansheeAdept.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function LongerRange.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 40
    local ____tower_customData_2, ____greaterPermanentImmolationAdditionalUnitCount_3 = tower.customData, "greaterPermanentImmolationAdditionalUnitCount"
    ____tower_customData_2[____greaterPermanentImmolationAdditionalUnitCount_3] = ____tower_customData_2[____greaterPermanentImmolationAdditionalUnitCount_3] + 3
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.MaximizeEffectiveness"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNAdvancedUnholyStrength.blp"
    self.cost = 485
    self.description = "TODO: Write description"
end
function MaximizeEffectiveness.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____maxUnitCount_1 = tower.customData, "maxUnitCount"
    ____tower_customData_0[____maxUnitCount_1] = ____tower_customData_0[____maxUnitCount_1] + 4
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.FurtherIncreasedEffectiveness"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNImprovedUnholyStrength.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function FurtherIncreasedEffectiveness.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____nonGreaterPermanentImmolationAdditionalUnitCount_1 = tower.customData, "nonGreaterPermanentImmolationAdditionalUnitCount"
    ____tower_customData_0[____nonGreaterPermanentImmolationAdditionalUnitCount_1] = ____tower_customData_0[____nonGreaterPermanentImmolationAdditionalUnitCount_1] + 2
    local ____tower_customData_2, ____greaterPermanentImmolationAdditionalDamageAmount_3 = tower.customData, "greaterPermanentImmolationAdditionalDamageAmount"
    ____tower_customData_2[____greaterPermanentImmolationAdditionalDamageAmount_3] = ____tower_customData_2[____greaterPermanentImmolationAdditionalDamageAmount_3] + 1
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.IncreasedEffectiveness"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNUnholyStrength.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function IncreasedEffectiveness.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____nonGreaterPermanentImmolationAdditionalUnitCount_1 = tower.customData, "nonGreaterPermanentImmolationAdditionalUnitCount"
    ____tower_customData_0[____nonGreaterPermanentImmolationAdditionalUnitCount_1] = ____tower_customData_0[____nonGreaterPermanentImmolationAdditionalUnitCount_1] + 2
    local ____tower_customData_2, ____greaterPermanentImmolationAdditionalDamageAmount_3 = tower.customData, "greaterPermanentImmolationAdditionalDamageAmount"
    ____tower_customData_2[____greaterPermanentImmolationAdditionalDamageAmount_3] = ____tower_customData_2[____greaterPermanentImmolationAdditionalDamageAmount_3] + 2
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.Overdrive"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNRegenerationAura.blp"
    self.cost = 3455
    self.description = "TODO: Write description"
end
function Overdrive.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____maxUnitCount_1 = tower.customData, "maxUnitCount"
    ____tower_customData_0[____maxUnitCount_1] = ____tower_customData_0[____maxUnitCount_1] + 1
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.3333
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path3.ContaminationZone"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNDeathAndDecay.blp"
    self.cost = 21600
    self.description = "TODO: Write description"
end
function ContaminationZone.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 70
    local ____tower_customData_2, ____maxUnitCount_3 = tower.customData, "maxUnitCount"
    ____tower_customData_2[____maxUnitCount_3] = ____tower_customData_2[____maxUnitCount_3] + 16
    local ____tower_customData_4, ____damageAmount_5 = tower.customData, "damageAmount"
    ____tower_customData_4[____damageAmount_5] = ____tower_customData_4[____damageAmount_5] + 1
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75
    )
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path2.Enlarge"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.Enlarge = __TS__Class()
local Enlarge = ____exports.Enlarge
Enlarge.name = "Enlarge"
__TS__ClassExtends(Enlarge, TowerUpgrade)
function Enlarge.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Enlarge"
    self.icon = "ReplaceableTextures/CommandButtons/BTNUnholyFrenzy.blp"
    self.cost = 595
    self.description = "TODO: Write description"
end
function Enlarge.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 30
    local ____tower_customData_2, ____maxUnitCount_3 = tower.customData, "maxUnitCount"
    ____tower_customData_2[____maxUnitCount_3] = ____tower_customData_2[____maxUnitCount_3] + 2
    local abil = tower.unit:getAbility(tickTowerAbilityId)
    BlzSetAbilityRealLevelField(
        abil,
        ABILITY_RLF_COOLDOWN,
        0,
        BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.85
    )
end
return ____exports
 end,
["src.TowerAbilities.PandemicAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerAbility = require("src.TowerAbilities.TowerAbility")
local TowerAbility = ____TowerAbility.TowerAbility
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
____exports.PandemicAbility = __TS__Class()
local PandemicAbility = ____exports.PandemicAbility
PandemicAbility.name = "PandemicAbility"
__TS__ClassExtends(PandemicAbility, TowerAbility)
function PandemicAbility.prototype.____constructor(self, ...)
    TowerAbility.prototype.____constructor(self, ...)
    self.name = "Pandemic"
    self.description = "Releases a pandemic into the world that damages every creep on the map."
    self.icon = "ReplaceableTextures/CommandButtons/BTNPossession.blp"
    self.cooldown = 20
    self.abilityType = TowerAbilityType.PANDEMIC
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path2.Pandemic"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____PandemicAbility = require("src.TowerAbilities.PandemicAbility")
local PandemicAbility = ____PandemicAbility.PandemicAbility
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.Pandemic = __TS__Class()
local Pandemic = ____exports.Pandemic
Pandemic.name = "Pandemic"
__TS__ClassExtends(Pandemic, TowerUpgrade)
function Pandemic.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Pandemic"
    self.icon = "ReplaceableTextures/CommandButtons/BTNPossession.blp"
    self.cost = 2915
    self.description = "TODO: Write description"
    self.ability = __TS__New(PandemicAbility)
end
function Pandemic.prototype.applyUpgrade(self, _tower)
end
return ____exports
 end,
["src.TowerAbilities.PlagueAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerAbility = require("src.TowerAbilities.TowerAbility")
local TowerAbility = ____TowerAbility.TowerAbility
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
____exports.PlagueAbility = __TS__Class()
local PlagueAbility = ____exports.PlagueAbility
PlagueAbility.name = "PlagueAbility"
__TS__ClassExtends(PlagueAbility, TowerAbility)
function PlagueAbility.prototype.____constructor(self, ...)
    TowerAbility.prototype.____constructor(self, ...)
    self.name = "Plague"
    self.description = "Releases a plague into the world that damages every creep on the map."
    self.icon = "ReplaceableTextures/CommandButtons/BTNCarrionSwarm.blp"
    self.cooldown = 20
    self.abilityType = TowerAbilityType.PLAGUE
end
return ____exports
 end,
["src.Towers.Abomination.Upgrades.Path2.Plague"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____PlagueAbility = require("src.TowerAbilities.PlagueAbility")
local PlagueAbility = ____PlagueAbility.PlagueAbility
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.Plague = __TS__Class()
local Plague = ____exports.Plague
Plague.name = "Plague"
__TS__ClassExtends(Plague, TowerUpgrade)
function Plague.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Plague"
    self.icon = "ReplaceableTextures/CommandButtons/BTNCarrionSwarm.blp"
    self.cost = 16200
    self.description = "TODO: Write description"
    self.ability = __TS__New(PlagueAbility)
end
function Plague.prototype.applyUpgrade(self, _tower)
end
return ____exports
 end,
["src.Towers.Abomination.Abomination"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
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
local ____Enlarge = require("src.Towers.Abomination.Upgrades.Path2.Enlarge")
local Enlarge = ____Enlarge.Enlarge
local ____Pandemic = require("src.Towers.Abomination.Upgrades.Path2.Pandemic")
local Pandemic = ____Pandemic.Pandemic
local ____Plague = require("src.Towers.Abomination.Upgrades.Path2.Plague")
local Plague = ____Plague.Plague
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
            __TS__New(EvenLongerRange),
            __TS__New(Enlarge),
            __TS__New(Pandemic),
            __TS__New(Plague)
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
    return {
        range = 300,
        maxUnitCount = 8,
        damageAmount = 1,
        hasGreaterPermanentImmolation = false,
        greaterPermanentImmolationAdditionalUnitCount = 0,
        greaterPermanentImmolationAdditionalDamageAmount = 0,
        nonGreaterPermanentImmolationAdditionalUnitCount = 0
    }
end
function Abomination.prototype.applyInitialUnitValues(self, unit)
    BlzSetAbilityRealLevelField(
        unit:getAbility(tickTowerAbilityId),
        ABILITY_RLF_COOLDOWN,
        0,
        1.4
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path1.DeadlyShot"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 3240
    self.description = "TODO: Write description"
end
function DeadlyShot.prototype.applyUpgrade(self, tower)
    tower.largeVillagerBonusDamage = tower.largeVillagerBonusDamage + 15
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 13,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path1.FurtherIncreasedDamage"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 1620
    self.description = "TODO: Write description"
end
function FurtherIncreasedDamage.prototype.applyUpgrade(self, tower)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 3,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path1.IncreasedDamage"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 380
    self.description = "TODO: Write description"
end
function IncreasedDamage.prototype.applyUpgrade(self, tower)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 2,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path2.NightVision"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 325
    self.description = "TODO: Write description"
end
function NightVision.prototype.applyUpgrade(self, tower)
    BlzSetUnitWeaponIntegerField(tower.unit.handle, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, 0, 22)
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.EliteDefender"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 15120
    self.description = "TODO: Write description"
end
function EliteDefender.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.5,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.EvenFasterFiring"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 430
    self.description = "TODO: Write description"
end
function EvenFasterFiring.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.7,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.FastFiring"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 430
    self.description = "TODO: Write description"
end
function FastFiring.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.7,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.FullyAutomatic"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 4590
    self.description = "TODO: Write description"
end
function FullyAutomatic.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.5,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Upgrades.Path3.SemiAutomatic"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp"
    self.cost = 3780
    self.description = "TODO: Write description"
end
function SemiAutomatic.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.3333,
        0
    )
end
return ____exports
 end,
["src.Towers.Gargoyle.Gargoyle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
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
        {__TS__New(NightVision)},
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
["src.Towers.MeatWagon.Upgrades.Path1.WarSong"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.WarSong = __TS__Class()
local WarSong = ____exports.WarSong
WarSong.name = "WarSong"
__TS__ClassExtends(WarSong, TowerUpgrade)
function WarSong.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "War Song"
    self.icon = "ReplaceableTextures/CommandButtons/BTNDrum.blp"
    self.cost = 540
    self.description = "TODO: Write description"
end
function WarSong.prototype.applyUpgrade(self, tower)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.MeatWagon.Upgrades.Path1.BiggerBlast"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.BiggerBlast = __TS__Class()
local BiggerBlast = ____exports.BiggerBlast
BiggerBlast.name = "BiggerBlast"
__TS__ClassExtends(BiggerBlast, TowerUpgrade)
function BiggerBlast.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Bigger Blast"
    self.icon = "ReplaceableTextures/CommandButtons/BTNSmash.blp"
    self.cost = 540
    self.description = "TODO: Write description"
end
function BiggerBlast.prototype.applyUpgrade(self, tower)
    local currentCooldown = tower.unit:getAttackCooldown(0)
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 300)
    tower.unit:setAttackCooldown(currentCooldown, 0)
end
return ____exports
 end,
["src.Towers.MeatWagon.Upgrades.Path2.FasterReload"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FasterReload = __TS__Class()
local FasterReload = ____exports.FasterReload
FasterReload.name = "FasterReload"
__TS__ClassExtends(FasterReload, TowerUpgrade)
function FasterReload.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Faster Reload"
    self.icon = "ReplaceableTextures/CommandButtons/BTNBloodLust.blp"
    self.cost = 325
    self.description = "TODO: Write description"
end
function FasterReload.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) + 0.75,
        0
    )
end
return ____exports
 end,
["src.Towers.AttackTypes"] = function(...) 
local ____exports = {}
____exports.AttackTypes = AttackTypes or ({})
____exports.AttackTypes.NONE = 0
____exports.AttackTypes[____exports.AttackTypes.NONE] = "NONE"
____exports.AttackTypes.NORMAL = 1
____exports.AttackTypes[____exports.AttackTypes.NORMAL] = "NORMAL"
____exports.AttackTypes.PIERCE = 2
____exports.AttackTypes[____exports.AttackTypes.PIERCE] = "PIERCE"
____exports.AttackTypes.SIEGE = 3
____exports.AttackTypes[____exports.AttackTypes.SIEGE] = "SIEGE"
____exports.AttackTypes.MAGIC = 4
____exports.AttackTypes[____exports.AttackTypes.MAGIC] = "MAGIC"
____exports.AttackTypes.CHAOS = 5
____exports.AttackTypes[____exports.AttackTypes.CHAOS] = "CHAOS"
____exports.AttackTypes.HERO = 6
____exports.AttackTypes[____exports.AttackTypes.HERO] = "HERO"
return ____exports
 end,
["src.Towers.MeatWagon.Upgrades.Path2.HeavyShells"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____AttackTypes = require("src.Towers.AttackTypes")
local AttackTypes = ____AttackTypes.AttackTypes
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.HeavyShells = __TS__Class()
local HeavyShells = ____exports.HeavyShells
HeavyShells.name = "HeavyShells"
__TS__ClassExtends(HeavyShells, TowerUpgrade)
function HeavyShells.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Heavy Shells"
    self.icon = "ReplaceableTextures/CommandButtons/BTNEarthquake.blp"
    self.cost = 970
    self.description = "TODO: Write description"
end
function HeavyShells.prototype.applyUpgrade(self, tower)
    BlzSetUnitWeaponIntegerField(
        GetEnumUnit(),
        UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE,
        0,
        AttackTypes.CHAOS
    )
    tower.largeVillagerBonusDamage = tower.largeVillagerBonusDamage + 3
    tower.fortifiedVillagerBonusDamage = tower.fortifiedVillagerBonusDamage + 1
    tower.zeppelinVillagerBonusDamage = tower.zeppelinVillagerBonusDamage + 1
end
return ____exports
 end,
["src.Towers.MeatWagon.Upgrades.Path2.RapidReload"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.RapidReload = __TS__Class()
local RapidReload = ____exports.RapidReload
RapidReload.name = "RapidReload"
__TS__ClassExtends(RapidReload, TowerUpgrade)
function RapidReload.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Rapid Reload"
    self.icon = "ReplaceableTextures/CommandButtons/BTNBerserkForTrolls.blp"
    self.cost = 540
    self.description = "TODO: Write description"
end
function RapidReload.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) + 0.78,
        0
    )
end
return ____exports
 end,
["src.Towers.MeatWagon.Upgrades.Path3.BurnyStuff"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.BurnyStuff = __TS__Class()
local BurnyStuff = ____exports.BurnyStuff
BurnyStuff.name = "BurnyStuff"
__TS__ClassExtends(BurnyStuff, TowerUpgrade)
function BurnyStuff.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Burny Stuff"
    self.icon = "ReplaceableTextures/CommandButtons/BTNLiquidFire.blp"
    self.cost = 540
    self.description = "TODO: Write description"
end
function BurnyStuff.prototype.applyUpgrade(self, _tower)
end
return ____exports
 end,
["src.Towers.MeatWagon.Upgrades.Path3.ImprovedArtillery"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ImprovedArtillery = __TS__Class()
local ImprovedArtillery = ____exports.ImprovedArtillery
ImprovedArtillery.name = "ImprovedArtillery"
__TS__ClassExtends(ImprovedArtillery, TowerUpgrade)
function ImprovedArtillery.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Improved Artillery"
    self.icon = "ReplaceableTextures/CommandButtons/BTNSpiritLink.blp"
    self.cost = 215
    self.description = "TODO: Write description"
end
function ImprovedArtillery.prototype.applyUpgrade(self, tower)
    tower.purpleVillagerBonusDamage = tower.purpleVillagerBonusDamage + 1
end
return ____exports
 end,
["src.Towers.MeatWagon.MeatWagon"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____WarSong = require("src.Towers.MeatWagon.Upgrades.Path1.WarSong")
local WarSong = ____WarSong.WarSong
local ____BiggerBlast = require("src.Towers.MeatWagon.Upgrades.Path1.BiggerBlast")
local BiggerBlast = ____BiggerBlast.BiggerBlast
local ____FasterReload = require("src.Towers.MeatWagon.Upgrades.Path2.FasterReload")
local FasterReload = ____FasterReload.FasterReload
local ____HeavyShells = require("src.Towers.MeatWagon.Upgrades.Path2.HeavyShells")
local HeavyShells = ____HeavyShells.HeavyShells
local ____RapidReload = require("src.Towers.MeatWagon.Upgrades.Path2.RapidReload")
local RapidReload = ____RapidReload.RapidReload
local ____BurnyStuff = require("src.Towers.MeatWagon.Upgrades.Path3.BurnyStuff")
local BurnyStuff = ____BurnyStuff.BurnyStuff
local ____ImprovedArtillery = require("src.Towers.MeatWagon.Upgrades.Path3.ImprovedArtillery")
local ImprovedArtillery = ____ImprovedArtillery.ImprovedArtillery
____exports.MeatWagon = __TS__Class()
local MeatWagon = ____exports.MeatWagon
MeatWagon.name = "MeatWagon"
__TS__ClassExtends(MeatWagon, TowerType)
function MeatWagon.prototype.____constructor(self, ...)
    TowerType.prototype.____constructor(self, ...)
    self.upgrades = {
        {
            __TS__New(BiggerBlast),
            __TS__New(WarSong)
        },
        {
            __TS__New(FasterReload),
            __TS__New(RapidReload),
            __TS__New(HeavyShells)
        },
        {
            __TS__New(ImprovedArtillery),
            __TS__New(BurnyStuff)
        }
    }
    self.unitTypeId = FourCC("h00A")
end
return ____exports
 end,
["src.Towers.SkeletalMage.Upgrades.Path1.ArcaneBlast"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ArcaneBlast = __TS__Class()
local ArcaneBlast = ____exports.ArcaneBlast
ArcaneBlast.name = "ArcaneBlast"
__TS__ClassExtends(ArcaneBlast, TowerUpgrade)
function ArcaneBlast.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Arcane Blast"
    self.icon = "ReplaceableTextures/CommandButtons/BTNDispelMagic.blp"
    self.cost = 650
    self.description = "TODO: Write description"
end
function ArcaneBlast.prototype.applyUpgrade(self, tower)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletalMage.Upgrades.Path1.ArcaneMastery"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ArcaneMastery = __TS__Class()
local ArcaneMastery = ____exports.ArcaneMastery
ArcaneMastery.name = "ArcaneMastery"
__TS__ClassExtends(ArcaneMastery, TowerUpgrade)
function ArcaneMastery.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Arcane Mastery"
    self.icon = "ReplaceableTextures/CommandButtons/BTNSorceressAdept.blp"
    self.cost = 1405
    self.description = "TODO: Write description"
end
function ArcaneMastery.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 200
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.5,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletalMage.Upgrades.Path1.ArcaneSpike"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.ArcaneSpike = __TS__Class()
local ArcaneSpike = ____exports.ArcaneSpike
ArcaneSpike.name = "ArcaneSpike"
__TS__ClassExtends(ArcaneSpike, TowerUpgrade)
function ArcaneSpike.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Arcane Spike"
    self.icon = "ReplaceableTextures/CommandButtons/BTNPriestAdept.blp"
    self.cost = 10800
    self.description = "TODO: Write description"
end
function ArcaneSpike.prototype.applyUpgrade(self, tower)
    tower.zeppelinVillagerBonusDamage = tower.zeppelinVillagerBonusDamage + 11
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 2,
        0
    )
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.5,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletalMage.Upgrades.Path1.Archmage"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.Archmage = __TS__Class()
local Archmage = ____exports.Archmage
Archmage.name = "Archmage"
__TS__ClassExtends(Archmage, TowerUpgrade)
function Archmage.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Archmage"
    self.icon = "ReplaceableTextures/CommandButtons/BTNSorceressMaster.blp"
    self.cost = 34560
    self.description = "TODO: Write description"
end
function Archmage.prototype.applyUpgrade(self, tower)
    tower.zeppelinVillagerBonusDamage = tower.zeppelinVillagerBonusDamage + 6
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 2,
        0
    )
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.5,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletalMage.Upgrades.Path1.FasterMagic"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.FasterMagic = __TS__Class()
local FasterMagic = ____exports.FasterMagic
FasterMagic.name = "FasterMagic"
__TS__ClassExtends(FasterMagic, TowerUpgrade)
function FasterMagic.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Faster Magic"
    self.icon = "ReplaceableTextures/CommandButtons/BTNAnimalWarTraining.blp"
    self.cost = 160
    self.description = "TODO: Write description"
end
function FasterMagic.prototype.applyUpgrade(self, tower)
    BlzSetUnitWeaponRealField(
        tower.unit.handle,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 450
    )
end
return ____exports
 end,
["src.Towers.SkeletalMage.SkeletalMage"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____ArcaneBlast = require("src.Towers.SkeletalMage.Upgrades.Path1.ArcaneBlast")
local ArcaneBlast = ____ArcaneBlast.ArcaneBlast
local ____ArcaneMastery = require("src.Towers.SkeletalMage.Upgrades.Path1.ArcaneMastery")
local ArcaneMastery = ____ArcaneMastery.ArcaneMastery
local ____ArcaneSpike = require("src.Towers.SkeletalMage.Upgrades.Path1.ArcaneSpike")
local ArcaneSpike = ____ArcaneSpike.ArcaneSpike
local ____Archmage = require("src.Towers.SkeletalMage.Upgrades.Path1.Archmage")
local Archmage = ____Archmage.Archmage
local ____FasterMagic = require("src.Towers.SkeletalMage.Upgrades.Path1.FasterMagic")
local FasterMagic = ____FasterMagic.FasterMagic
____exports.SkeletalMage = __TS__Class()
local SkeletalMage = ____exports.SkeletalMage
SkeletalMage.name = "SkeletalMage"
__TS__ClassExtends(SkeletalMage, TowerType)
function SkeletalMage.prototype.____constructor(self, ...)
    TowerType.prototype.____constructor(self, ...)
    self.upgrades = {
        {
            __TS__New(FasterMagic),
            __TS__New(ArcaneBlast),
            __TS__New(ArcaneMastery),
            __TS__New(ArcaneSpike),
            __TS__New(Archmage)
        },
        {},
        {}
    }
    self.unitTypeId = FourCC("h00B")
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.BlackDragonWhelp"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.BlackDragonWhelp = __TS__Class()
local BlackDragonWhelp = ____exports.BlackDragonWhelp
BlackDragonWhelp.name = "BlackDragonWhelp"
__TS__ClassExtends(BlackDragonWhelp, TowerUpgrade)
function BlackDragonWhelp.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Black Dragon Whelp"
    self.icon = "ReplaceableTextures/CommandButtons/BTNVorpalBlades.blp"
    self.cost = 325
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h001")
end
function BlackDragonWhelp.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 680
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 680)
    tower.largeVillagerBonusDamage = tower.largeVillagerBonusDamage + 1
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.EnhancedEyesight"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNUltravision.blp"
    self.cost = 215
    self.description = "TODO: Write description"
end
function EnhancedEyesight.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 80
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80)
    BlzSetUnitWeaponRealField(
        tower.unit.handle,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 100
    )
    BlzSetUnitWeaponIntegerField(tower.unit.handle, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, 0, 22)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.LongRangeArrows"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNSentinel.blp"
    self.cost = 95
    self.description = "TODO: Write description"
end
function LongRangeArrows.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 80
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path2.QuickShots"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNStrengthOfTheMoon.blp"
    self.cost = 110
    self.description = "TODO: Write description"
end
function QuickShots.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.85,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.RazorSharpArrows"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNShadowStrike.blp"
    self.cost = 235
    self.description = "TODO: Write description"
end
function RazorSharpArrows.prototype.applyUpgrade(self, tower)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.BurningArcher"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNSearingArrows.blp"
    self.cost = 675
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h002")
end
function BurningArcher.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 80
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 2,
        0
    )
    BlzSetUnitWeaponRealField(
        tower.unit.handle,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 500
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.SharpArrows"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNImprovedBows.blp"
    self.cost = 150
    self.description = "TODO: Write description"
end
function SharpArrows.prototype.applyUpgrade(self, tower)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path2.TripleShot"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNFanOfKnives.blp"
    self.cost = 430
    self.description = "TODO: Write description"
    self.tripleShotAbilityId = FourCC("A001")
end
function TripleShot.prototype.applyUpgrade(self, tower)
    tower.unit:addAbility(self.tripleShotAbilityId)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path2.VeryQuickShots"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNImprovedStrengthOfTheMoon.blp"
    self.cost = 205
    self.description = "TODO: Write description"
end
function VeryQuickShots.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.745,
        0
    )
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.CorrosiveAmmo"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNCorrosiveBreath.blp"
    self.cost = 1945
    self.description = "TODO: Write description"
end
function CorrosiveAmmo.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange * 1.15
    BlzSetUnitWeaponRealField(
        tower.unit.handle,
        UNIT_WEAPON_RF_ATTACK_RANGE,
        1,
        BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1) * 0.15
    )
    local currentCooldown = tower.unit:getAttackCooldown(0)
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 200)
    tower.unit:setAttackCooldown(currentCooldown, 0)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 1,
        0
    )
    BlzSetUnitWeaponStringField(tower.unit.handle, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, "Abilities/Weapons/ChimaeraAcidMissile/ChimaeraAcidMissile.mdl")
    tower.largeVillagerBonusDamage = tower.largeVillagerBonusDamage + 2
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path1.StarThrower"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNStarfall.blp"
    self.cost = 16200
    self.description = "TODO: Write description"
end
function StarThrower.prototype.applyUpgrade(self, tower)
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 3,
        0
    )
    BlzSetUnitWeaponStringField(tower.unit.handle, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, "Abilities/Weapons/FaerieDragonMissile/FaerieDragonMissile.mdl")
    BlzSetUnitWeaponRealField(
        tower.unit.handle,
        UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED,
        0,
        BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 150
    )
    tower.largeVillagerBonusDamage = tower.largeVillagerBonusDamage + 5
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.SharpShooter"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNMarksmanship.blp"
    self.cost = 2160
    self.description = "TODO: Write description"
    self.sharpShooterAbilityId = FourCC("A002")
end
function SharpShooter.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.2133,
        0
    )
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) * 0.3,
        0
    )
    tower.unit:addAbility(self.sharpShooterAbilityId)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path3.BowMaster"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
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
    self.icon = "ReplaceableTextures/CommandButtons/BTNAmbush.blp"
    self.cost = 25380
    self.description = "TODO: Write description"
    self.sharpShooterAbilityId = FourCC("A002")
end
function BowMaster.prototype.applyUpgrade(self, tower)
    tower.unit.acquireRange = tower.unit.acquireRange + 200
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.7895,
        0
    )
    tower.unit:setBaseDamage(
        tower.unit:getBaseDamage(0) + 3,
        0
    )
    tower.unit:setAbilityLevel(self.sharpShooterAbilityId, 2)
end
return ____exports
 end,
["src.TowerAbilities.HireHarpyRoguesAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerAbility = require("src.TowerAbilities.TowerAbility")
local TowerAbility = ____TowerAbility.TowerAbility
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
____exports.HireHarpyRoguesAbility = __TS__Class()
local HireHarpyRoguesAbility = ____exports.HireHarpyRoguesAbility
HireHarpyRoguesAbility.name = "HireHarpyRoguesAbility"
__TS__ClassExtends(HireHarpyRoguesAbility, TowerAbility)
function HireHarpyRoguesAbility.prototype.____constructor(self, ...)
    TowerAbility.prototype.____constructor(self, ...)
    self.name = "Hire Harpy Rogues"
    self.description = "Groups every archer tower together to increase their awesome power."
    self.icon = "ReplaceableTextures/CommandButtons/BTNBattleRoar.blp"
    self.cooldown = 50
    self.abilityType = TowerAbilityType.HIRE_HARPY_ROGUES
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path2.HiredHarpyRogues"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____HireHarpyRoguesAbility = require("src.TowerAbilities.HireHarpyRoguesAbility")
local HireHarpyRoguesAbility = ____HireHarpyRoguesAbility.HireHarpyRoguesAbility
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.HiredHarpyRogues = __TS__Class()
local HiredHarpyRogues = ____exports.HiredHarpyRogues
HiredHarpyRogues.name = "HiredHarpyRogues"
__TS__ClassExtends(HiredHarpyRogues, TowerUpgrade)
function HiredHarpyRogues.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Hired Harpy Rogues"
    self.icon = "ReplaceableTextures/CommandButtons/BTNBattleRoar.blp"
    self.cost = 8640
    self.description = "TODO: Write description"
    self.ability = __TS__New(HireHarpyRoguesAbility)
end
function HiredHarpyRogues.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.75,
        0
    )
end
return ____exports
 end,
["src.TowerAbilities.HireGreaterHarpyAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerAbility = require("src.TowerAbilities.TowerAbility")
local TowerAbility = ____TowerAbility.TowerAbility
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
____exports.HireGreaterHarpyAbility = __TS__Class()
local HireGreaterHarpyAbility = ____exports.HireGreaterHarpyAbility
HireGreaterHarpyAbility.name = "HireGreaterHarpyAbility"
__TS__ClassExtends(HireGreaterHarpyAbility, TowerAbility)
function HireGreaterHarpyAbility.prototype.____constructor(self, ...)
    TowerAbility.prototype.____constructor(self, ...)
    self.name = "Hire Greater Harpies"
    self.description = "Groups every archer tower together to increase their awesome power."
    self.icon = "ReplaceableTextures/CommandButtons/BTNEnchantedBears.blp"
    self.cooldown = 50
    self.abilityType = TowerAbilityType.HIRE_GREATER_HARPIES
end
return ____exports
 end,
["src.Towers.SkeletonArcher.Upgrades.Path2.HiredGreaterHarpies"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____HireGreaterHarpyAbility = require("src.TowerAbilities.HireGreaterHarpyAbility")
local HireGreaterHarpyAbility = ____HireGreaterHarpyAbility.HireGreaterHarpyAbility
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.HiredGreaterHarpies = __TS__Class()
local HiredGreaterHarpies = ____exports.HiredGreaterHarpies
HiredGreaterHarpies.name = "HiredGreaterHarpies"
__TS__ClassExtends(HiredGreaterHarpies, TowerUpgrade)
function HiredGreaterHarpies.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Hired Greater Harpies"
    self.icon = "ReplaceableTextures/CommandButtons/BTNEnchantedBears.blp"
    self.cost = 48600
    self.description = "TODO: Write description"
    self.ability = __TS__New(HireGreaterHarpyAbility)
end
function HiredGreaterHarpies.prototype.applyUpgrade(self, _tower)
end
return ____exports
 end,
["src.Towers.SkeletonArcher.SkeletonArcher"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____BlackDragonWhelp = require("src.Towers.SkeletonArcher.Upgrades.Path1.BlackDragonWhelp")
local BlackDragonWhelp = ____BlackDragonWhelp.BlackDragonWhelp
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
local ____HiredHarpyRogues = require("src.Towers.SkeletonArcher.Upgrades.Path2.HiredHarpyRogues")
local HiredHarpyRogues = ____HiredHarpyRogues.HiredHarpyRogues
local ____HiredGreaterHarpies = require("src.Towers.SkeletonArcher.Upgrades.Path2.HiredGreaterHarpies")
local HiredGreaterHarpies = ____HiredGreaterHarpies.HiredGreaterHarpies
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
            __TS__New(BlackDragonWhelp),
            __TS__New(CorrosiveAmmo),
            __TS__New(StarThrower)
        },
        {
            __TS__New(QuickShots),
            __TS__New(VeryQuickShots),
            __TS__New(TripleShot),
            __TS__New(HiredHarpyRogues),
            __TS__New(HiredGreaterHarpies)
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
["src.Towers.Voidwalker.Upgrades.Path1.ElementalVoidwalkers"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local newVoidwalkerUnitTypeIds = {
    FourCC("o004"),
    FourCC("o003"),
    FourCC("o001"),
    FourCC("o002")
}
____exports.ElementalVoidwalkers = __TS__Class()
local ElementalVoidwalkers = ____exports.ElementalVoidwalkers
ElementalVoidwalkers.name = "ElementalVoidwalkers"
__TS__ClassExtends(ElementalVoidwalkers, TowerUpgrade)
function ElementalVoidwalkers.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Elemental Voidwalkers"
    self.icon = "ReplaceableTextures/CommandButtons/BTNStormEarth&Fire.blp"
    self.cost = 2700
    self.description = "TODO: Write description"
end
function ElementalVoidwalkers.prototype.applyUpgrade(self, tower)
    tower.customData.voidwalkerUnitTypeIds = newVoidwalkerUnitTypeIds
end
return ____exports
 end,
["src.Towers.Voidwalker.Upgrades.Path1.IncreasedVoidwalkerEfficiency"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.IncreasedVoidwalkerEfficiency = __TS__Class()
local IncreasedVoidwalkerEfficiency = ____exports.IncreasedVoidwalkerEfficiency
IncreasedVoidwalkerEfficiency.name = "IncreasedVoidwalkerEfficiency"
__TS__ClassExtends(IncreasedVoidwalkerEfficiency, TowerUpgrade)
function IncreasedVoidwalkerEfficiency.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Increased Voidwalker Efficiency"
    self.icon = "ReplaceableTextures/CommandButtons/BTNEngineeringUpgrade.blp"
    self.cost = 620
    self.description = "TODO: Write description"
end
function IncreasedVoidwalkerEfficiency.prototype.applyUpgrade(self, tower)
    tower.unit:setAttackCooldown(
        tower.unit:getAttackCooldown(0) * 0.6,
        0
    )
    local ____tower_customData_0, ____cooldown_1 = tower.customData, "cooldown"
    ____tower_customData_0[____cooldown_1] = ____tower_customData_0[____cooldown_1] * 0.6
end
return ____exports
 end,
["src.Towers.Voidwalker.Upgrades.Path1.LesserVoidwalker"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.LesserVoidwalker = __TS__Class()
local LesserVoidwalker = ____exports.LesserVoidwalker
LesserVoidwalker.name = "LesserVoidwalker"
__TS__ClassExtends(LesserVoidwalker, TowerUpgrade)
function LesserVoidwalker.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Lesser Voidwalker"
    self.icon = "ReplaceableTextures/CommandButtons/BTNSpiritWolf.blp"
    self.cost = 540
    self.description = "TODO: Write description"
    self.newUnitTypeId = FourCC("h00D")
end
function LesserVoidwalker.prototype.applyUpgrade(self, tower)
    BlzSetAbilityRealLevelField(
        tower.unit:getAbility(tickTowerAbilityId),
        ABILITY_RLF_COOLDOWN,
        0,
        10
    )
end
return ____exports
 end,
["src.Towers.Voidwalker.Upgrades.Path1.MoreVoidwalkers"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
local tickTowerAbilityId = FourCC("A008")
____exports.MoreVoidwalkers = __TS__Class()
local MoreVoidwalkers = ____exports.MoreVoidwalkers
MoreVoidwalkers.name = "MoreVoidwalkers"
__TS__ClassExtends(MoreVoidwalkers, TowerUpgrade)
function MoreVoidwalkers.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "More Voidwalker"
    self.icon = "ReplaceableTextures/CommandButtons/BTNPocketFactory.blp"
    self.cost = 430
    self.description = "TODO: Write description"
end
function MoreVoidwalkers.prototype.applyUpgrade(self, tower)
    BlzSetAbilityRealLevelField(
        tower.unit:getAbility(tickTowerAbilityId),
        ABILITY_RLF_COOLDOWN,
        0,
        6
    )
end
return ____exports
 end,
["src.Towers.Voidwalker.Upgrades.Path2.IncreasedRange"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.IncreasedRange = __TS__Class()
local IncreasedRange = ____exports.IncreasedRange
IncreasedRange.name = "IncreasedRange"
__TS__ClassExtends(IncreasedRange, TowerUpgrade)
function IncreasedRange.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Increased Range"
    self.icon = "ReplaceableTextures/CommandButtons/BTNROBOGOBLIN.blp"
    self.cost = 270
    self.description = "TODO: Write description"
end
function IncreasedRange.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____additionalRange_1 = tower.customData, "additionalRange"
    ____tower_customData_0[____additionalRange_1] = ____tower_customData_0[____additionalRange_1] + 40
    local ____tower_customData_2, ____spread_3 = tower.customData, "spread"
    ____tower_customData_2[____spread_3] = ____tower_customData_2[____spread_3] + 200
    local ____tower_unit_4, ____acquireRange_5 = tower.unit, "acquireRange"
    ____tower_unit_4[____acquireRange_5] = ____tower_unit_4[____acquireRange_5] + 200
    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200)
end
return ____exports
 end,
["src.Towers.Voidwalker.Voidwalker"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____TowerType = require("src.Towers.TowerType")
local TowerType = ____TowerType.TowerType
local ____ElementalVoidwalkers = require("src.Towers.Voidwalker.Upgrades.Path1.ElementalVoidwalkers")
local ElementalVoidwalkers = ____ElementalVoidwalkers.ElementalVoidwalkers
local ____IncreasedVoidwalkerEfficiency = require("src.Towers.Voidwalker.Upgrades.Path1.IncreasedVoidwalkerEfficiency")
local IncreasedVoidwalkerEfficiency = ____IncreasedVoidwalkerEfficiency.IncreasedVoidwalkerEfficiency
local ____LesserVoidwalker = require("src.Towers.Voidwalker.Upgrades.Path1.LesserVoidwalker")
local LesserVoidwalker = ____LesserVoidwalker.LesserVoidwalker
local ____MoreVoidwalkers = require("src.Towers.Voidwalker.Upgrades.Path1.MoreVoidwalkers")
local MoreVoidwalkers = ____MoreVoidwalkers.MoreVoidwalkers
local ____IncreasedRange = require("src.Towers.Voidwalker.Upgrades.Path2.IncreasedRange")
local IncreasedRange = ____IncreasedRange.IncreasedRange
____exports.Voidwalker = __TS__Class()
local Voidwalker = ____exports.Voidwalker
Voidwalker.name = "Voidwalker"
__TS__ClassExtends(Voidwalker, TowerType)
function Voidwalker.prototype.____constructor(self, ...)
    TowerType.prototype.____constructor(self, ...)
    self.upgrades = {
        {
            __TS__New(LesserVoidwalker),
            __TS__New(MoreVoidwalkers),
            __TS__New(IncreasedVoidwalkerEfficiency),
            __TS__New(ElementalVoidwalkers)
        },
        {__TS__New(IncreasedRange)},
        {}
    }
    self.unitTypeId = FourCC("h00C")
end
function Voidwalker.prototype.initializeCustomData(self)
    return {
        duration = 25,
        spread = 400,
        cooldown = 0.95,
        additionalRange = 0,
        voidwalkerUnitTypeIndex = 0,
        voidwalkerUnitTypeIds = nil
    }
end
return ____exports
 end,
["src.Towers.TowerTypes"] = function(...) 
local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local ____exports = {}
local ____Abomination = require("src.Towers.Abomination.Abomination")
local Abomination = ____Abomination.Abomination
local ____Gargoyle = require("src.Towers.Gargoyle.Gargoyle")
local Gargoyle = ____Gargoyle.Gargoyle
local ____MeatWagon = require("src.Towers.MeatWagon.MeatWagon")
local MeatWagon = ____MeatWagon.MeatWagon
local ____ObsidianStatue = require("src.Towers.ObsidianStatue.ObsidianStatue")
local ObsidianStatue = ____ObsidianStatue.ObsidianStatue
local ____Sapper = require("src.Towers.Sapper.Sapper")
local Sapper = ____Sapper.Sapper
local ____SkeletalMage = require("src.Towers.SkeletalMage.SkeletalMage")
local SkeletalMage = ____SkeletalMage.SkeletalMage
local ____SkeletonArcher = require("src.Towers.SkeletonArcher.SkeletonArcher")
local SkeletonArcher = ____SkeletonArcher.SkeletonArcher
local ____Voidwalker = require("src.Towers.Voidwalker.Voidwalker")
local Voidwalker = ____Voidwalker.Voidwalker
local towers = __TS__New(Map)
__TS__ArrayForEach(
    {
        __TS__New(SkeletonArcher),
        __TS__New(Sapper),
        __TS__New(Abomination),
        __TS__New(ObsidianStatue),
        __TS__New(Gargoyle),
        __TS__New(MeatWagon),
        __TS__New(SkeletalMage),
        __TS__New(Voidwalker)
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
["src.Utility.RandomNumberGenerator"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.RandomNumberGenerator = __TS__Class()
local RandomNumberGenerator = ____exports.RandomNumberGenerator
RandomNumberGenerator.name = "RandomNumberGenerator"
function RandomNumberGenerator.prototype.____constructor(self)
    self.a = 1103515245
    self.c = 12345
    self.seed = 1
end
function RandomNumberGenerator.prototype.setSeed(self, seed)
    self.seed = seed & 2147483647
end
function RandomNumberGenerator.prototype.next(self)
    self.seed = self.seed * self.a + self.c & 2147483647
    return self.seed
end
function RandomNumberGenerator.prototype.random(self, min, max)
    if min > max then
        error("min can't be greater than max")
        return -1
    end
    return ModuloInteger(
        self:next(),
        max + 1 - min
    ) + min
end
return ____exports
 end,
["src.Towers.TowerController"] = function(...) 
local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
local ____Tower = require("src.Towers.Tower")
local Tower = ____Tower.Tower
local ____TowerTypes = require("src.Towers.TowerTypes")
local towerTypeMap = ____TowerTypes.default
local ____index = require("lua_modules.w3ts.index")
local Trigger = ____index.Trigger
local Unit = ____index.Unit
local ____DefenseTypes = require("src.Creeps.DefenseTypes")
local DefenseTypes = ____DefenseTypes.DefenseTypes
local ____Group = require("src.Utility.Group")
local Group = ____Group.Group
local ____TargetFlags = require("src.Creeps.TargetFlags")
local TargetFlags = ____TargetFlags.TargetFlags
local attackAbilityId = FourCC("Aatk")
local tickTowerAbilityId = FourCC("A008")
local fortifiedUnitTypeId = FourCC("u004")
local invisibilityUnitTypeId = FourCC("u003")
local zeppelinUnitTypeId = FourCC("u006")
local dummyUnitTypeId = FourCC("u007")
local embrittlementAbilityId = FourCC("A00D")
local superBrittleAbilityId = FourCC("A00E")
local abominationUnitTypeId = FourCC("h007")
local obsidianStatueUnitTypeId = FourCC("h008")
local voidwalkerUnitTypeId = FourCC("h00C")
local lesserVoidwalkerUnitTypeId = FourCC("o000")
local timedLifeBuffId = FourCC("BTLF")
____exports.TowerController = __TS__Class()
local TowerController = ____exports.TowerController
TowerController.name = "TowerController"
function TowerController.prototype.____constructor(self, towerAbilitySystem, timerUtils, stunUtils, randomNumberGenerator, towers)
    self.tickTowers = __TS__New(Map)
    self.towerAbilitySystem = towerAbilitySystem
    self.timerUtils = timerUtils
    self.stunUtils = stunUtils
    self.randomNumberGenerator = randomNumberGenerator
    self.towers = towers
    local constTrig = __TS__New(Trigger)
    constTrig:addAction(function()
        local trig = Unit:fromEvent()
        trig:disableAbility(attackAbilityId, false, true)
        local unitTypeId = trig.typeId
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
        local trigHandleId = trig.id
        local tower = __TS__New(Tower, trig, towerType)
        tower.towerType:applyInitialUnitValues(trig)
        self.towers:set(trigHandleId, tower)
        self:addTickTower(tower)
    end)
    constTrig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_START)
end
function TowerController.prototype.upgradeTower(self, tower, upgrade)
    local isTowerUnitReplaced = false
    local originalHandleId = tower.unit.id
    if upgrade.newUnitTypeId ~= nil then
        isTowerUnitReplaced = true
        local pathUpgrades = tower.pathUpgrades
        local unit = Unit:fromHandle(ReplaceUnitBJ(tower.unit.handle, upgrade.newUnitTypeId, bj_UNIT_STATE_METHOD_DEFAULTS))
        unit:disableAbility(attackAbilityId, false, true)
        tower.unit = unit
        self.towers:delete(originalHandleId)
        self.towers:set(unit.id, tower)
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
            unit.handle,
            GetTriggerPlayer()
        )
    else
        upgrade:applyUpgrade(tower)
    end
    if self.tickTowers:has(originalHandleId) then
        self.timerUtils:releaseTimer(self.tickTowers:get(originalHandleId))
        self.tickTowers:delete(originalHandleId)
    end
    if tower.unit:getAbilityLevel(tickTowerAbilityId) > 0 then
        self:addTickTower(tower)
    end
    if upgrade.ability ~= nil then
        self.towerAbilitySystem:addTowerAbility(
            GetPlayerId(GetOwningPlayer(tower.unit.handle)),
            tower,
            upgrade.ability
        )
    end
    return isTowerUnitReplaced
end
function TowerController.prototype.addTickTower(self, tower)
    if tower.unit:getAbilityLevel(tickTowerAbilityId) > 0 then
        local t = self.timerUtils:newTimer()
        local tickFunction = self:getTowerTickFunction(tower.towerType.unitTypeId)
        t:start(
            BlzGetAbilityRealLevelField(
                tower.unit:getAbility(tickTowerAbilityId),
                ABILITY_RLF_COOLDOWN,
                0
            ),
            true,
            function() return tickFunction(tower) end
        )
        self.tickTowers:set(tower.unit.id, t)
    end
end
function TowerController.prototype.getTowerTickFunction(self, unitTypeId)
    repeat
        local ____switch17 = unitTypeId
        local ____cond17 = ____switch17 == abominationUnitTypeId
        if ____cond17 then
            return function(tower)
                local ____temp_0 = tower.customData
                local range = ____temp_0.range
                local maxUnitCount = ____temp_0.maxUnitCount
                local damageAmount = ____temp_0.damageAmount
                local hasGreaterPermanentImmolation = ____temp_0.hasGreaterPermanentImmolation
                local greaterPermanentImmolationAdditionalUnitCount = ____temp_0.greaterPermanentImmolationAdditionalUnitCount
                local greaterPermanentImmolationAdditionalDamageAmount = ____temp_0.greaterPermanentImmolationAdditionalDamageAmount
                local nonGreaterPermanentImmolationAdditionalUnitCount = ____temp_0.nonGreaterPermanentImmolationAdditionalUnitCount
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
                local loc = tower.unit.point
                local group = Group:fromRange(range, loc)
                local unitCount = 0
                group["for"](
                    group,
                    function(u)
                        if unitCount >= realMaxUnitCount then
                            return
                        end
                        if not u:isAlive() then
                            return
                        end
                        if u.owner.id ~= 23 then
                            return
                        end
                        if BlzGetUnitIntegerField(u.handle, UNIT_IF_TARGETED_AS) == TargetFlags.WARD then
                            return
                        end
                        unitCount = unitCount + 1
                        tower.unit:damageTarget(
                            u.handle,
                            realDamageAmount,
                            true,
                            false,
                            ATTACK_TYPE_PIERCE,
                            DAMAGE_TYPE_NORMAL,
                            WEAPON_TYPE_WHOKNOWS
                        )
                    end
                )
                group:destroy()
                loc:destroy()
            end
        end
        ____cond17 = ____cond17 or ____switch17 == obsidianStatueUnitTypeId
        if ____cond17 then
            return function(tower)
                local ____temp_1 = tower.customData
                local range = ____temp_1.range
                local maxUnitCount = ____temp_1.maxUnitCount
                local damageAmount = ____temp_1.damageAmount
                local freezeDuration = ____temp_1.freezeDuration
                local hasPermafrost = ____temp_1.hasPermafrost
                local hasColdSnap = ____temp_1.hasColdSnap
                local hasReFreeze = ____temp_1.hasReFreeze
                local hasIceShards = ____temp_1.hasIceShards
                local hasDeepFreeze = ____temp_1.hasDeepFreeze
                local hasEmbrittlement = ____temp_1.hasEmbrittlement
                local hasSuperBrittle = ____temp_1.hasSuperBrittle
                local loc = tower.unit.point
                local group = Group:fromRange(range, loc)
                local unitCount = 0
                group["for"](
                    group,
                    function(u)
                        if unitCount >= maxUnitCount then
                            return
                        end
                        if not u:isAlive() then
                            return
                        end
                        if u.owner.id ~= 23 then
                            return
                        end
                        if self.stunUtils:getFrozenUnit(u.id) ~= nil and not hasReFreeze then
                            return
                        end
                        local unitTypeId = u.typeId
                        if not hasColdSnap and (unitTypeId == fortifiedUnitTypeId or unitTypeId == invisibilityUnitTypeId) then
                            return
                        end
                        if BlzGetUnitIntegerField(u.handle, UNIT_IF_DEFENSE_TYPE) == DefenseTypes.HEAVY then
                            return
                        end
                        unitCount = unitCount + 1
                        if hasEmbrittlement then
                            local dummy = __TS__New(
                                Unit,
                                tower.unit.owner,
                                dummyUnitTypeId,
                                u.x,
                                u.y,
                                bj_UNIT_FACING
                            )
                            dummy:addAbility(embrittlementAbilityId)
                            if hasSuperBrittle then
                                dummy:incAbilityLevel(embrittlementAbilityId)
                            end
                            dummy:issueTargetOrder("curse", u)
                        end
                        if unitTypeId == zeppelinUnitTypeId then
                            if hasSuperBrittle then
                                local dummy = __TS__New(
                                    Unit,
                                    tower.unit.owner,
                                    dummyUnitTypeId,
                                    u.x,
                                    u.y,
                                    bj_UNIT_FACING
                                )
                                dummy:addAbility(superBrittleAbilityId)
                                dummy:issueTargetOrder("slow", u)
                            end
                            return
                        end
                        tower.unit:damageTarget(
                            u.handle,
                            damageAmount,
                            true,
                            false,
                            ATTACK_TYPE_CHAOS,
                            DAMAGE_TYPE_NORMAL,
                            WEAPON_TYPE_WHOKNOWS
                        )
                        self.stunUtils:freezeUnit(
                            u,
                            freezeDuration,
                            hasPermafrost,
                            hasReFreeze,
                            hasIceShards,
                            hasDeepFreeze
                        )
                    end
                )
                group:destroy()
                loc:destroy()
            end
        end
        ____cond17 = ____cond17 or ____switch17 == voidwalkerUnitTypeId
        if ____cond17 then
            return function(tower)
                local ____temp_2 = tower.customData
                local duration = ____temp_2.duration
                local spread = ____temp_2.spread
                local cooldown = ____temp_2.cooldown
                local additionalRange = ____temp_2.additionalRange
                local voidwalkerUnitTypeIds = ____temp_2.voidwalkerUnitTypeIds
                local x = tower.unit.x + self.randomNumberGenerator:random(-spread, spread)
                local y = tower.unit.y + self.randomNumberGenerator:random(-spread, spread)
                local lesserVoidwalker
                if voidwalkerUnitTypeIds ~= nil then
                    local ____temp_3 = tower.customData
                    local voidwalkerUnitTypeIndex = ____temp_3.voidwalkerUnitTypeIndex
                    tower.customData.voidwalkerUnitTypeIndex = (voidwalkerUnitTypeIndex + 1) % #voidwalkerUnitTypeIds
                    lesserVoidwalker = __TS__New(
                        Unit,
                        tower.unit.owner,
                        voidwalkerUnitTypeIds[voidwalkerUnitTypeIndex + 1],
                        x,
                        y,
                        bj_UNIT_FACING
                    )
                else
                    lesserVoidwalker = __TS__New(
                        Unit,
                        tower.unit.owner,
                        lesserVoidwalkerUnitTypeId,
                        x,
                        y,
                        bj_UNIT_FACING
                    )
                    if cooldown > 0.95 then
                        lesserVoidwalker:setAttackCooldown(cooldown, 0)
                    end
                end
                lesserVoidwalker:applyTimedLife(timedLifeBuffId, duration)
                if additionalRange > 0 then
                    lesserVoidwalker.acquireRange = 450 + additionalRange
                    BlzSetUnitWeaponRealField(lesserVoidwalker.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, additionalRange)
                end
            end
        end
        do
            error(
                __TS__New(
                    Error,
                    "Invalid argument; no TickFunction exists for Tower of type " .. tostring(unitTypeId)
                ),
                0
            )
        end
    until true
end
return ____exports
 end,
["src.Game.TowerUpgradeSystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__StringReplace = ____lualib.__TS__StringReplace
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local Frame = ____index.Frame
local Trigger = ____index.Trigger
local MapPlayer = ____index.MapPlayer
____exports.TowerUpgradeSystem = __TS__Class()
local TowerUpgradeSystem = ____exports.TowerUpgradeSystem
TowerUpgradeSystem.name = "TowerUpgradeSystem"
function TowerUpgradeSystem.prototype.____constructor(self, towerController, towers)
    self.selectedTower = nil
    self.towerController = towerController
    self.towers = towers
    self.originFrameGameUi = Frame:fromOrigin(ORIGIN_FRAME_GAME_UI, 0)
    self.menu = __TS__New(
        Frame,
        "EscMenuPopupMenuTemplate",
        self.originFrameGameUi,
        -1,
        0
    )
    self.menu:setVisible(false)
    self.menu:setSize(0.14, 0.19)
    self.menu:setPoint(
        FRAMEPOINT_BOTTOMRIGHT,
        self.originFrameGameUi,
        FRAMEPOINT_BOTTOMRIGHT,
        -0.007,
        0.16
    )
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
                        self:createUpgradePathIconFrame(self.menu, x + i * 0.046875, y + j * 0.0375)
                    )
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    local menuBackdrop = __TS__New(
        Frame,
        "menuBackdrop",
        self.menu,
        -1,
        0,
        "BACKDROP",
        ""
    )
    menuBackdrop:setTexture("war3mapImported/TowerUpgradePanel.dds", 0, true)
    menuBackdrop:setAllPoints(self.menu)
    self.upgradePathEnabled = {{}, {}, {}}
    self.upgradePathTextFrames = {{}, {}, {}}
    do
        local i = 0
        while i < 3 do
            do
                local j = 0
                while j < 5 do
                    self.upgradePathEnabled[i + 1][j + 1] = false
                    local buttonFrame, textFrame = table.unpack(self:createUpgradePathButtonFrame(self.upgradePathIconFrames[i + 1][j + 1]))
                    self.upgradePathTextFrames[i + 1][j + 1] = textFrame
                    self:createUpgradePathButtonTrigger(buttonFrame, i, j)
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    local selectUnitTrig = __TS__New(Trigger)
    selectUnitTrig:addAction(function()
        local trig = GetTriggerUnit()
        local unitHandleId = GetHandleId(trig)
        local tower = self.towers:get(unitHandleId)
        if tower == nil then
            self.selectedTower = nil
            self.menu:setVisible(false)
            return
        end
        self.selectedTower = tower
        self:renderSelectedTowerUpgrades()
        self.menu:setVisible(true)
    end)
    selectUnitTrig:registerPlayerUnitEvent(
        MapPlayer:fromIndex(0),
        EVENT_PLAYER_UNIT_SELECTED,
        nil
    )
    self.menu:setFocus(false)
end
function TowerUpgradeSystem.prototype.renderSelectedTowerUpgrades(self)
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
                        local pathA = self.selectedTower.pathUpgrades[(i + 1) % 3 + 1]
                        local pathB = self.selectedTower.pathUpgrades[(i + 2) % 3 + 1]
                        local isPathAvailable = (pathA == 0 or pathB == 0) and (j < 2 or pathA < 3 and pathB < 3)
                        local isEnabled = j == self.selectedTower.pathUpgrades[i + 1] and isPathAvailable
                        local icon = self.selectedTower.towerType.upgrades[i + 1][j + 1].icon
                        if not isEnabled then
                            icon = __TS__StringReplace(icon, "CommandButtons/BTN", "CommandButtonsDisabled/DISBTN")
                        end
                        self.upgradePathIconFrames[i + 1][j + 1]:setTexture(icon, 0, true)
                        self.upgradePathTextFrames[i + 1][j + 1]:setText((((self.selectedTower.towerType.upgrades[i + 1][j + 1].name .. " |cFFFFCC00(") .. tostring(self.selectedTower.towerType.upgrades[i + 1][j + 1].cost)) .. ")|r|n|n") .. self.selectedTower.towerType.upgrades[i + 1][j + 1].description)
                        self.upgradePathEnabled[i + 1][j + 1] = isEnabled
                    else
                        self.upgradePathIconFrames[i + 1][j + 1]:setTexture("UI/Widgets/EscMenu/Human/Quest-Unknown.dds", 0, true)
                        self.upgradePathTextFrames[i + 1][j + 1]:setText("")
                    end
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
end
function TowerUpgradeSystem.prototype.createUpgradePathIconFrame(self, parent, offsetX, offsetY)
    local iconFrame = __TS__New(
        Frame,
        "iconFrame",
        parent,
        -1,
        0,
        "BACKDROP",
        ""
    )
    iconFrame:setSize(0.02625, 0.02625)
    iconFrame:setPoint(
        FRAMEPOINT_CENTER,
        parent,
        FRAMEPOINT_CENTER,
        offsetX,
        offsetY
    )
    iconFrame:setTexture("UI/Widgets/EscMenu/Human/Quest-Unknown.dds", 0, true)
    return iconFrame
end
function TowerUpgradeSystem.prototype.createUpgradePathButtonFrame(self, parent)
    local buttonFrame = __TS__New(
        Frame,
        "buttonFrame",
        parent,
        -1,
        0,
        "BUTTON",
        ""
    )
    buttonFrame:setAllPoints(parent)
    local tooltipFrame = __TS__New(
        Frame,
        "BoxedText",
        buttonFrame,
        0,
        0
    )
    local textFrame = __TS__New(
        Frame,
        "textFrame",
        tooltipFrame,
        -1,
        0,
        "TEXT",
        ""
    )
    textFrame:setSize(0.25, 0)
    tooltipFrame:setPoint(
        FRAMEPOINT_BOTTOMLEFT,
        textFrame,
        FRAMEPOINT_BOTTOMLEFT,
        -0.01,
        -0.01
    )
    tooltipFrame:setPoint(
        FRAMEPOINT_TOPRIGHT,
        textFrame,
        FRAMEPOINT_TOPRIGHT,
        0.01,
        0.01
    )
    buttonFrame:setTooltip(tooltipFrame)
    textFrame:setPoint(
        FRAMEPOINT_BOTTOM,
        buttonFrame,
        FRAMEPOINT_TOP,
        0,
        0.01
    )
    return {buttonFrame, textFrame}
end
function TowerUpgradeSystem.prototype.createUpgradePathButtonTrigger(self, buttonFrame, path, tier)
    local buttonTrig = __TS__New(Trigger)
    buttonTrig:addCondition(function() return self.upgradePathEnabled[path + 1][tier + 1] and self.selectedTower and self.selectedTower.pathUpgrades[path + 1] == tier end)
    buttonTrig:addAction(function()
        buttonFrame:setVisible(false)
        buttonFrame:setVisible(true)
        local tower = self.selectedTower
        local upgrade = tower.towerType.upgrades[path + 1][tier + 1]
        local playerCurrentGold = GetPlayerState(
            GetTriggerPlayer(),
            PLAYER_STATE_RESOURCE_GOLD
        )
        if playerCurrentGold < upgrade.cost then
            return
        end
        local pathA = tower.pathUpgrades[(path + 1) % 3 + 1]
        local pathB = tower.pathUpgrades[(path + 2) % 3 + 1]
        local isPathAvailable = (pathA == 0 or pathB == 0) and (tier < 2 or pathA < 3 and pathB < 3)
        if not isPathAvailable then
            return
        end
        SetPlayerState(
            GetTriggerPlayer(),
            PLAYER_STATE_RESOURCE_GOLD,
            playerCurrentGold - upgrade.cost
        )
        local ____tower_pathUpgrades_0, ____temp_1 = tower.pathUpgrades, path + 1
        ____tower_pathUpgrades_0[____temp_1] = ____tower_pathUpgrades_0[____temp_1] + 1
        if self.towerController:upgradeTower(tower, upgrade) then
            SelectUnitForPlayerSingle(
                tower.unit.handle,
                GetTriggerPlayer()
            )
        else
            self:renderSelectedTowerUpgrades()
        end
    end)
    buttonTrig:triggerRegisterFrameEvent(buttonFrame, FRAMEEVENT_CONTROL_CLICK)
end
return ____exports
 end,
["src.Utility.Rasterizer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local Effect = ____index.Effect
local drawings = {}
function ____exports.DrawRect(x1, y1, x2, y2)
    local imagePath = "Doodads\\Cinematic\\FireRockSmall\\FireRockSmall.mdx"
    local sfx = {}
    local size = 4
    do
        local x = x1
        while x < x2 do
            __TS__ArrayPush(
                sfx,
                __TS__New(Effect, imagePath, x, y1)
            )
            x = x + 16
        end
    end
    do
        local y = y1
        while y < y2 do
            __TS__ArrayPush(
                sfx,
                __TS__New(Effect, imagePath, x2, y)
            )
            y = y + 16
        end
    end
    do
        local x = x1
        while x < x2 do
            __TS__ArrayPush(
                sfx,
                __TS__New(Effect, imagePath, x, y2)
            )
            x = x + 16
        end
    end
    do
        local y = y1
        while y < y2 do
            __TS__ArrayPush(
                sfx,
                __TS__New(Effect, imagePath, x1, y)
            )
            y = y + 16
        end
    end
    __TS__ArrayPush(drawings, sfx)
end
function ____exports.DrawPoint(x, y, modelname)
    local imagePath = modelname or "war3mapImported\\PlasmaLeakMedium.mdx"
    local sfx = {}
    __TS__ArrayPush(
        sfx,
        __TS__New(Effect, imagePath, x, y)
    )
    __TS__ArrayPush(drawings, sfx)
end
return ____exports
 end,
["src.Utility.Commands"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ParseInt = ____lualib.__TS__ParseInt
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local MapPlayer = ____index.MapPlayer
local Trigger = ____index.Trigger
local Unit = ____index.Unit
local ____index = require("lua_modules.w3ts.globals.index")
local Players = ____index.Players
local ____Rasterizer = require("src.Utility.Rasterizer")
local DrawRect = ____Rasterizer.DrawRect
local COMMAND_PREFIX = "-"
____exports.Commands = __TS__Class()
local Commands = ____exports.Commands
Commands.name = "Commands"
function Commands.prototype.____constructor(self, game)
    self.utilityTriggers = {}
    self.game = game
    self.commandTrigger = __TS__New(Trigger)
    self.commandTrigger:addAction(function() return self:handleCommand() end)
    __TS__ArrayForEach(
        Players,
        function(____, player) return self.commandTrigger:registerPlayerChatEvent(player, "", false) end
    )
end
function Commands.prototype.handleCommand(self)
    local player = MapPlayer:fromEvent()
    if not player then
        return
    end
    local input = GetEventPlayerChatString()
    if not __TS__StringStartsWith(input, COMMAND_PREFIX) then
        return
    end
    local parts = __TS__StringSplit(
        __TS__StringSubstring(input, #COMMAND_PREFIX),
        " "
    )
    local command = string.lower(parts[1])
    local ____temp_0
    if #parts > 1 then
        ____temp_0 = __TS__ArraySlice(parts, 1)
    else
        ____temp_0 = {}
    end
    local args = ____temp_0
    repeat
        local ____switch8 = command
        local ____cond8 = ____switch8 == "draw"
        if ____cond8 then
            if #args == 4 then
                DrawRect(
                    __TS__ParseInt(args[1]),
                    __TS__ParseInt(args[2]),
                    __TS__ParseInt(args[3]),
                    __TS__ParseInt(args[4])
                )
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "coords"
        if ____cond8 then
            if self.selectedUnit then
                print((tostring(self.selectedUnit.x) .. ", ") .. tostring(self.selectedUnit.y))
                break
            end
            if not self.utilityTriggers[tostring(player.id) .. "-selectTrigger"] then
                local t = __TS__New(Trigger)
                t:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SELECTED)
                t:addAction(function()
                    self.selectedUnit = Unit:fromEvent()
                    t:destroy()
                    self.utilityTriggers[tostring(player.id) .. "-selectTrigger"] = nil
                end)
                self.utilityTriggers[tostring(player.id) .. "-selectTrigger"] = t
                break
            end
            print("Select a unit first")
            break
        end
        ____cond8 = ____cond8 or (____switch8 == "zoom" or ____switch8 == "cam")
        if ____cond8 then
            if GetLocalPlayer() == player.handle then
                local amount = __TS__ParseInt(args[1])
                if not amount then
                    return
                end
                SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, amount, 1)
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "tilt"
        if ____cond8 then
            if GetLocalPlayer() == player.handle then
                local amount = __TS__ParseInt(args[1])
                SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, amount, 1)
            end
            break
        end
        ____cond8 = ____cond8 or (____switch8 == "round" or ____switch8 == "wave" or ____switch8 == "next")
        if ____cond8 then
            if #args ~= 1 then
                break
            end
            self.game.roundIndex = __TS__ParseInt(args[1]) - 1
            break
        end
    until true
end
return ____exports
 end,
["src.Creeps.CreepRegion"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.CreepRegion = __TS__Class()
local CreepRegion = ____exports.CreepRegion
CreepRegion.name = "CreepRegion"
function CreepRegion.prototype.____constructor(self, regionId, target_cp_index, region)
    self.creeps = {}
    self.region = region
    self.regionId = regionId
    self.target_cp_indx = target_cp_index
end
return ____exports
 end,
["src.Game.GameOptions"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local MapPlayer = ____index.MapPlayer
____exports.GameOptions = __TS__Class()
local GameOptions = ____exports.GameOptions
GameOptions.name = "GameOptions"
function GameOptions.prototype.____constructor(self)
    self.isDebugModeEnabled = "Local Player" == MapPlayer:fromIndex(0).name
end
return ____exports
 end,
["src.Game.MapRegionController"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local ____exports = {}
local ____CreepRegion = require("src.Creeps.CreepRegion")
local CreepRegion = ____CreepRegion.CreepRegion
local ____index = require("lua_modules.w3ts.index")
local Trigger = ____index.Trigger
local Unit = ____index.Unit
local ____Checkpoint = require("src.Utility.Checkpoint")
local Direction = ____Checkpoint.Direction
local directionCP = ____Checkpoint.directionCP
local ____region = require("lua_modules.w3ts.handles.region")
local Region = ____region.Region
local ____rect = require("lua_modules.w3ts.handles.rect")
local Rectangle = ____rect.Rectangle
local ____Rasterizer = require("src.Utility.Rasterizer")
local DrawPoint = ____Rasterizer.DrawPoint
local ____GameMap = require("src.Game.GameMap")
local GameMap = ____GameMap.GameMap
____exports.MapRegionController = __TS__Class()
local MapRegionController = ____exports.MapRegionController
MapRegionController.name = "MapRegionController"
function MapRegionController.prototype.____constructor(self, gameOptions)
    self.regionIds = {}
    self.regions = {}
    local lastCP = GameMap.CHECKPOINTS[1]
    local rId = 0
    self.enterTrig = __TS__New(Trigger)
    do
        local cpIndx = 1
        while cpIndx < #GameMap.CHECKPOINTS do
            local direction = directionCP(lastCP, GameMap.CHECKPOINTS[cpIndx + 1])
            repeat
                local ____switch4 = direction
                local ____cond4 = ____switch4 == Direction.SOUTH
                if ____cond4 then
                    do
                        local i = lastCP.y
                        while i > GameMap.CHECKPOINTS[cpIndx + 1].y do
                            if gameOptions.isDebugModeEnabled then
                                DrawPoint(lastCP.x, i)
                            end
                            local reg = __TS__New(Region)
                            local rect = __TS__New(
                                Rectangle,
                                lastCP.x - 128,
                                i - 128,
                                lastCP.x + 128,
                                i
                            )
                            reg:addRect(rect)
                            rect:destroy()
                            self.regionIds[reg.id] = rId
                            self.regions[reg.id] = __TS__New(CreepRegion, rId, cpIndx, reg)
                            rId = rId + 1
                            self.enterTrig:registerEnterRegion(reg.handle, nil)
                            i = i - 128
                        end
                    end
                    break
                end
                ____cond4 = ____cond4 or ____switch4 == Direction.NORTH
                if ____cond4 then
                    do
                        local i = lastCP.y + 128
                        while i < GameMap.CHECKPOINTS[cpIndx + 1].y do
                            if gameOptions.isDebugModeEnabled then
                                DrawPoint(lastCP.x, i)
                            end
                            local reg = __TS__New(Region)
                            local rect = __TS__New(
                                Rectangle,
                                lastCP.x - 128,
                                i,
                                lastCP.x + 128,
                                i + 128
                            )
                            reg:addRect(rect)
                            rect:destroy()
                            self.regionIds[reg.id] = rId
                            self.regions[reg.id] = __TS__New(CreepRegion, rId, cpIndx, reg)
                            rId = rId + 1
                            self.enterTrig:registerEnterRegion(reg.handle, nil)
                            i = i + 128
                        end
                    end
                    break
                end
                ____cond4 = ____cond4 or ____switch4 == Direction.EAST
                if ____cond4 then
                    do
                        local i = lastCP.x + 128
                        while i < GameMap.CHECKPOINTS[cpIndx + 1].x do
                            if gameOptions.isDebugModeEnabled then
                                DrawPoint(i, lastCP.y)
                            end
                            local reg = __TS__New(Region)
                            local rect = __TS__New(
                                Rectangle,
                                i,
                                lastCP.y - 128,
                                i + 128,
                                lastCP.y + 128
                            )
                            reg:addRect(rect)
                            rect:destroy()
                            self.regionIds[reg.id] = rId
                            self.regions[reg.id] = __TS__New(CreepRegion, rId, cpIndx, reg)
                            rId = rId + 1
                            self.enterTrig:registerEnterRegion(reg.handle, nil)
                            i = i + 128
                        end
                    end
                    break
                end
                ____cond4 = ____cond4 or ____switch4 == Direction.WEST
                if ____cond4 then
                    do
                        local i = lastCP.x - 128
                        while i > GameMap.CHECKPOINTS[cpIndx + 1].x do
                            if gameOptions.isDebugModeEnabled then
                                DrawPoint(i, lastCP.y)
                            end
                            local reg = __TS__New(Region)
                            local rect = __TS__New(
                                Rectangle,
                                i - 128,
                                lastCP.y - 128,
                                i,
                                lastCP.y + 128
                            )
                            reg:addRect(rect)
                            rect:destroy()
                            self.regionIds[reg.id] = rId
                            self.regions[reg.id] = __TS__New(CreepRegion, rId, cpIndx, reg)
                            rId = rId + 1
                            self.enterTrig:registerEnterRegion(reg.handle, nil)
                            i = i - 128
                        end
                    end
                    break
                end
            until true
            lastCP = GameMap.CHECKPOINTS[cpIndx + 1]
            cpIndx = cpIndx + 1
        end
    end
    self.enterTrig:addAction(function()
        local currentRegionId = Region:fromHandle(GetTriggeringRegion()).id
        local r = self.regions[currentRegionId]
        local spawnedCreep = GameMap.SPAWNED_CREEP_MAP:get(Unit:fromEvent().id)
        if r.target_cp_indx ~= spawnedCreep.nextCheckpointIndex then
            return
        end
        if spawnedCreep.currentRegion ~= nil and self.regions[spawnedCreep.currentRegion] then
            __TS__Delete(self.regions[spawnedCreep.currentRegion].creeps, spawnedCreep.unitId)
        end
        r.creeps[spawnedCreep.unitId] = spawnedCreep
        spawnedCreep.currentRegion = currentRegionId
        print("entred region " .. tostring(r.regionId))
    end)
end
return ____exports
 end,
["src.Utility.Sounds"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local Sound = ____index.Sound
____exports.Sounds = __TS__Class()
local Sounds = ____exports.Sounds
Sounds.name = "Sounds"
function Sounds.prototype.____constructor(self)
end
Sounds.START_OF_GAME = __TS__New(
    Sound,
    "Sound/Dialogue/UndeadCampaign/Undead08/U08Archimonde19.wav",
    false,
    false,
    true,
    10,
    10,
    "DefaultEAXON"
)
Sounds.START_OF_GAME_2 = __TS__New(
    Sound,
    "Units/Human/Peasant/PeasantWarcry1.wav",
    false,
    false,
    true,
    10,
    10,
    "DefaultEAXON"
)
Sounds.LOSE_A_LIFE = __TS__New(
    Sound,
    "Abilities/Spells/Other/LoadUnload/Loading.wav",
    false,
    false,
    true,
    10,
    10,
    "DefaultEAXON"
)
return ____exports
 end,
["src.Game.Game"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local ____exports = {}
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
local ____TowerUpgradeSystem = require("src.Game.TowerUpgradeSystem")
local TowerUpgradeSystem = ____TowerUpgradeSystem.TowerUpgradeSystem
local ____CreepRegenSystem = require("src.Creeps.CreepRegenSystem")
local CreepRegenSystem = ____CreepRegenSystem.CreepRegenSystem
local ____StunUtils = require("src.Utility.StunUtils")
local StunUtils = ____StunUtils.StunUtils
local ____TowerController = require("src.Towers.TowerController")
local TowerController = ____TowerController.TowerController
local ____index = require("lua_modules.w3ts.index")
local Effect = ____index.Effect
local Trigger = ____index.Trigger
local ____RandomNumberGenerator = require("src.Utility.RandomNumberGenerator")
local RandomNumberGenerator = ____RandomNumberGenerator.RandomNumberGenerator
local ____Commands = require("src.Utility.Commands")
local Commands = ____Commands.Commands
local ____MapRegionController = require("src.Game.MapRegionController")
local MapRegionController = ____MapRegionController.MapRegionController
local ____TowerAbilitySystem = require("src.TowerAbilities.TowerAbilitySystem")
local TowerAbilitySystem = ____TowerAbilitySystem.TowerAbilitySystem
local ____Sounds = require("src.Utility.Sounds")
local Sounds = ____Sounds.Sounds
local ____GameMap = require("src.Game.GameMap")
local GameMap = ____GameMap.GameMap
local ____GameOptions = require("src.Game.GameOptions")
local GameOptions = ____GameOptions.GameOptions
local ____Creep = require("src.Creeps.Creep")
local Creep = ____Creep.Creep
____exports.Game = __TS__Class()
local Game = ____exports.Game
Game.name = "Game"
function Game.prototype.____constructor(self)
    self.roundIndex = 31
    self.towers = __TS__New(Map)
    self.builderUnitTypeId = FourCC("u001")
    self.castleLocation = {x = -2560, y = 2368}
    self.castleUnitTypeId = FourCC("h00H")
    self.timerUtils = __TS__New(TimerUtils)
    self.gameOptions = __TS__New(GameOptions)
    self.gameMap = __TS__New(GameMap)
    self.damageEngineGlobals = __TS__New(DamageEngineGlobals)
    self.damageEngine = __TS__New(DamageEngine, self.timerUtils, self.damageEngineGlobals)
    self.stunUtils = __TS__New(StunUtils, self.timerUtils)
    self.damageEventController = __TS__New(
        DamageEventController,
        self.damageEngine,
        self.timerUtils,
        self.stunUtils,
        self.towers
    )
    self.randomNumberGenerator = __TS__New(RandomNumberGenerator)
    self.towerAbilitySystem = __TS__New(TowerAbilitySystem, self.timerUtils, self.towers, self.stunUtils)
    self.towerController = __TS__New(
        TowerController,
        self.towerAbilitySystem,
        self.timerUtils,
        self.stunUtils,
        self.randomNumberGenerator,
        self.towers
    )
    self.towerUpgradeSystem = __TS__New(TowerUpgradeSystem, self.towerController, self.towers)
    self.creepRegenSystem = __TS__New(CreepRegenSystem, self.timerUtils)
    self.spells = __TS__New(Spells, self.towerAbilitySystem, self.towers)
    self.commandHandler = __TS__New(Commands, self)
    self.castleUnit = CreateUnit(
        Player(23),
        self.castleUnitTypeId,
        self.castleLocation.x,
        self.castleLocation.y,
        bj_UNIT_FACING
    )
    self.mapRegionController = __TS__New(MapRegionController, self.gameOptions)
    local deathTrig = __TS__New(Trigger)
    deathTrig:addAction(function()
        local trig = GetTriggerUnit()
        local trigHandleId = GetHandleId(trig)
        CreepRegenSystem.REGEN_UNIT_MAP:delete(trigHandleId)
        GameMap.SPAWNED_CREEP_MAP:delete(trigHandleId)
    end)
    deathTrig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH)
    local meatWagonAutoAttackGroundTrigger = __TS__New(Trigger)
    local meatWagonUnitTypeId = FourCC("h00A")
    local attackAbilityId = FourCC("Aatk")
    meatWagonAutoAttackGroundTrigger:addCondition(function() return GetUnitTypeId(GetAttacker()) == meatWagonUnitTypeId end)
    meatWagonAutoAttackGroundTrigger:addAction(function()
        local trig = GetTriggerUnit()
        local attacker = GetAttacker()
        local x = GetUnitX(trig)
        local y = GetUnitY(trig)
        BlzUnitDisableAbility(attacker, attackAbilityId, false, false)
        IssuePointOrderById(attacker, 851984, x, y)
        BlzUnitDisableAbility(attacker, attackAbilityId, false, true)
    end)
    meatWagonAutoAttackGroundTrigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED)
    do
        local i = 0
        while i < #GameMap.CHECKPOINTS do
            local trig = __TS__New(Trigger)
            trig:addCondition(function() return GetPlayerId(GetOwningPlayer(GetEnteringUnit())) == 23 end)
            local checkpoint = GameMap.CHECKPOINTS[i + 1]
            local nextCheckpointIndex = i + 1
            local isLastCheckpoint = i == #GameMap.CHECKPOINTS - 1
            trig:addAction(function()
                local enteringUnit = GetEnteringUnit()
                if isLastCheckpoint then
                    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, "|cffff0000A life has been lost!|r")
                    Sounds.LOSE_A_LIFE:start()
                    RemoveUnit(enteringUnit)
                    return
                end
                local spawnedCreep = GameMap.SPAWNED_CREEP_MAP:get(GetHandleId(enteringUnit))
                spawnedCreep.nextCheckpointIndex = nextCheckpointIndex
            end)
            TriggerRegisterEnterRectSimple(
                trig.handle,
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
            if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(Player(i)) == MAP_CONTROL_USER then
                SetPlayerState(
                    Player(i),
                    PLAYER_STATE_RESOURCE_GOLD,
                    9999999
                )
                FogModifierStart(CreateFogModifierRect(
                    Player(i),
                    FOG_OF_WAR_VISIBLE,
                    GetEntireMapRect(),
                    false,
                    false
                ))
                SetPlayerAlliance(
                    Player(23),
                    Player(i),
                    ALLIANCE_PASSIVE,
                    true
                )
                local builder = CreateUnit(
                    Player(i),
                    self.builderUnitTypeId,
                    self.gameMap.playableArea.centerX,
                    self.gameMap.playableArea.centerY,
                    bj_UNIT_FACING
                )
                SelectUnitForPlayerSingle(
                    builder,
                    Player(i)
                )
            end
            i = i + 1
        end
    end
    local t = self.timerUtils:newTimer()
    t:start(
        1,
        false,
        function()
            Sounds.START_OF_GAME:start()
            t:start(
                1,
                false,
                function()
                    local eff = __TS__New(Effect, "Units/Demon/Infernal/InfernalBirth.mdl", self.castleLocation.x, self.castleLocation.y)
                    eff:destroy()
                    t:start(
                        0.5,
                        false,
                        function()
                            SetWidgetLife(self.castleUnit, 1)
                            Sounds.START_OF_GAME_2:start()
                            self:spawnRounds()
                            self.timerUtils:releaseTimer(t)
                        end
                    )
                end
            )
        end
    )
end
function Game.prototype.spawnRounds(self)
    local t = self.timerUtils:newTimer()
    local bla = false
    local creepCount = 0
    local creepIndex = 0
    local tick = 0
    t:start(
        0.03,
        true,
        function()
            local round = getRoundCreeps(self.roundIndex)
            if creepIndex >= #round then
                creepIndex = 0
                self.roundIndex = self.roundIndex + 1
                return
            end
            tick = tick + 0.03
            local creepSpawnDetails = round[creepIndex + 1]
            if tick >= creepSpawnDetails.delay then
                tick = 0
                creepCount = creepCount + 1
                if not bla then
                    bla = true
                    Creep:spawn(creepSpawnDetails.creepType, creepSpawnDetails.modifiers)
                end
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
["src.main"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local createQuests, SendMessage
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
    Log.Init({__TS__New(StringSink, LogLevel.Error, SendMessage)})
    xpcall(
        function()
            BlzLoadTOCFile("war3mapImported/Templates.toc")
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
["src.Creeps.Modifier"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.Modifier = __TS__Class()
local Modifier = ____exports.Modifier
Modifier.name = "Modifier"
function Modifier.prototype.____constructor(self)
end
return ____exports
 end,
["src.Creeps.SpawnedCreep"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.SpawnedCreep = __TS__Class()
local SpawnedCreep = ____exports.SpawnedCreep
SpawnedCreep.name = "SpawnedCreep"
function SpawnedCreep.prototype.____constructor(self, creep, modifiers, currentCheckpoint, currentCheckpointIndex)
    self.creep = creep
    self.modifiers = modifiers
    self.currentCheckpoint = currentCheckpoint
    self.currentCheckpointIndex = currentCheckpointIndex
end
return ____exports
 end,
["src.Spells.Generic.Debug"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____index = require("lua_modules.w3ts.index")
local Trigger = ____index.Trigger
____exports.Debug = __TS__Class()
local Debug = ____exports.Debug
Debug.name = "Debug"
function Debug.prototype.____constructor(self)
    self.cast_trig = __TS__New(Trigger)
    self.channel_trig = __TS__New(Trigger)
    self.effect_trig = __TS__New(Trigger)
    self.endcast_trig = __TS__New(Trigger)
    self.finish_trig = __TS__New(Trigger)
    self.cast_trig:addAction(function() return self:castAction() end)
    self.cast_trig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_CAST)
    self.channel_trig:addAction(function() return self:channelAction() end)
    self.channel_trig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    self.effect_trig:addAction(function() return self:effectAction() end)
    self.effect_trig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT)
    self.endcast_trig:addAction(function() return self:endcastAction() end)
    self.endcast_trig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_ENDCAST)
    self.finish_trig:addAction(function() return self:finishAction() end)
    self.finish_trig:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_FINISH)
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
["src.TowerAbilities.AbsoluteZeroAbility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____TowerAbility = require("src.TowerAbilities.TowerAbility")
local TowerAbility = ____TowerAbility.TowerAbility
local ____TowerAbilityType = require("src.TowerAbilities.TowerAbilityType")
local TowerAbilityType = ____TowerAbilityType.TowerAbilityType
____exports.AbsoluteZeroAbility = __TS__Class()
local AbsoluteZeroAbility = ____exports.AbsoluteZeroAbility
AbsoluteZeroAbility.name = "AbsoluteZeroAbility"
__TS__ClassExtends(AbsoluteZeroAbility, TowerAbility)
function AbsoluteZeroAbility.prototype.____constructor(self, ...)
    TowerAbility.prototype.____constructor(self, ...)
    self.name = "Absolute Zero"
    self.description = "Damages and freezes all creeps for 10 seconds."
    self.icon = "ReplaceableTextures/CommandButtons/BTNBreathOfFrost.blp"
    self.cooldown = 20
    self.abilityType = TowerAbilityType.ABSOLUTE_ZERO
end
return ____exports
 end,
["src.Towers.ObsidianStatue.Upgrades.Path2.AbsoluteZero"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____AbsoluteZeroAbility = require("src.TowerAbilities.AbsoluteZeroAbility")
local AbsoluteZeroAbility = ____AbsoluteZeroAbility.AbsoluteZeroAbility
local ____TowerUpgrade = require("src.Towers.TowerUpgrade")
local TowerUpgrade = ____TowerUpgrade.TowerUpgrade
____exports.AbsoluteZero = __TS__Class()
local AbsoluteZero = ____exports.AbsoluteZero
AbsoluteZero.name = "AbsoluteZero"
__TS__ClassExtends(AbsoluteZero, TowerUpgrade)
function AbsoluteZero.prototype.____constructor(self, ...)
    TowerUpgrade.prototype.____constructor(self, ...)
    self.name = "Absolute Zero"
    self.icon = "ReplaceableTextures/CommandButtons/BTNBreathOfFrost.blp"
    self.cost = 21600
    self.description = "TODO: Write description"
    self.ability = __TS__New(AbsoluteZeroAbility)
end
function AbsoluteZero.prototype.applyUpgrade(self, tower)
    local ____tower_customData_0, ____range_1 = tower.customData, "range"
    ____tower_customData_0[____range_1] = ____tower_customData_0[____range_1] + 100
    local ____tower_customData_2, ____maxUnitCount_3 = tower.customData, "maxUnitCount"
    ____tower_customData_2[____maxUnitCount_3] = ____tower_customData_2[____maxUnitCount_3] + 200
end
return ____exports
 end,
["src.Utility.GroupInRange"] = function(...) 
local ____exports = {}
local ____Group = require("src.Utility.Group")
local Group = ____Group.Group
function ____exports.GroupInRange(radius, point)
    print("disabled function!")
    return Group:fromRange(radius, point)
end
return ____exports
 end,
["src.lib.Serilog.Sinks.PreloadSink"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
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
    json = json .. ("t:\"" .. logEvent.Text) .. "\""
    if logEvent.Value then
        local serializeRaw = ____exports.PreloadSink.SerializeRaw[type(logEvent.Value)]
        if serializeRaw then
            json = json .. ",v:" .. tostring(logEvent.Value)
        else
            json = json .. (",v:\"" .. tostring(logEvent.Value)) .. "\""
        end
    end
    json = json .. "}"
    return json
end
function PreloadSink.prototype.Log(self, level, events)
    local json = "{"
    json = json .. ("l:" .. tostring(level)) .. ","
    json = json .. "e:{"
    do
        local index = 0
        while index < #events do
            json = json .. self:LogEventToJson(events[index + 1])
            if index < #events - 1 then
                json = json .. ","
            end
            index = index + 1
        end
    end
    json = json .. "}"
    json = json .. "}"
    PreloadGenStart()
    Preload("l" .. json)
    PreloadGenEnd(self.FileName)
end
PreloadSink.SerializeRaw = {
    ["nil"] = false,
    boolean = true,
    number = true,
    string = false,
    table = false,
    ["function"] = false,
    userdata = false
}
return ____exports
 end,
["src.lib.Serilog.Sinks.StringSinkTest"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
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
                message = message .. event.Text
            elseif event.Type == LogEventType.Parameter then
                local whichType = type(event.Value)
                local color = ____exports.StringSinkTest.Colors[whichType]
                if color then
                    message = message .. "|cff" .. color
                end
                if ____exports.StringSinkTest.Brackets[whichType] then
                    message = message .. "{ "
                end
                message = message .. tostring(event.Value)
                if ____exports.StringSinkTest.Brackets[whichType] then
                    message = message .. " }"
                end
                if color then
                    message = message .. "|r"
                end
            end
            index = index + 1
        end
    end
    self.printer(string.format("[%s]: %s", ____exports.StringSinkTest.Prefix[level], message))
end
StringSinkTest.Prefix = {
    [LogLevel.None] = "NON",
    [LogLevel.Verbose] = "VRB",
    [LogLevel.Debug] = "DBG",
    [LogLevel.Information] = "INF",
    [LogLevel.Warning] = "WRN",
    [LogLevel.Error] = "ERR",
    [LogLevel.Fatal] = "FTL"
}
StringSinkTest.Colors = {
    ["nil"] = "9d9d9d",
    boolean = "1eff00",
    number = "00ccff",
    string = "ff8000",
    table = "ffcc00",
    ["function"] = "ffcc00",
    userdata = "ffcc00"
}
StringSinkTest.Brackets = {
    ["nil"] = false,
    boolean = false,
    number = false,
    string = false,
    table = true,
    ["function"] = true,
    userdata = true
}
return ____exports
 end,
}
return require("src.main", ...)
