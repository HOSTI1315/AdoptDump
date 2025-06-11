--// ReplicatedStorage.ClientModules.Utilities.ThreeDFont (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = Instance.new("Part")
v_u_2.Name = "Part"
v_u_2.Anchored = true
v_u_2.CanCollide = true
local v_u_3 = newproxy(true)
local function v_u_9(...)
    local v4 = {}
    for v5 = 1, select("#", ...) do
        local v6 = select(v5, ...)
        for v7, v8 in pairs(v6) do
            if v8 == v_u_3 then
                v4[v7] = nil
            else
                v4[v7] = v8
            end
        end
    end
    return v4
end
function v_u_1.fromFolder(p10)
    local v11 = require(p10.cmap)
    local v12 = require(p10.kern)
    local v13 = require(p10.width)
    local v14 = require(p10.xOffsets)
    local v15 = require(p10.yOffsets)
    local v16 = require(p10.xSizes)
    local v17 = require(p10.ySizes)
    local v18 = require(p10.zSizes)
    local v19 = require(p10.metrics)
    local v20 = require(p10.meta)
    local v21 = {
        ["cmap"] = v11,
        ["kern"] = v12,
        ["width"] = v13,
        ["xOffsets"] = v14,
        ["yOffsets"] = v15,
        ["xSizes"] = v16,
        ["ySizes"] = v17,
        ["zSizes"] = v18,
        ["metrics"] = v19,
        ["glyphParts"] = p10.glyphParts,
        ["meta"] = v20
    }
    return v_u_1.new(v21)
end
function v_u_1.new(p22)
    local v23 = {}
    local v24 = v_u_1
    setmetatable(v23, v24)
    v23._cmap = p22.cmap
    v23._kern = p22.kern
    v23._width = p22.width
    v23._xOffsets = p22.xOffsets
    v23._yOffsets = p22.yOffsets
    v23._xSizes = p22.xSizes
    v23._ySizes = p22.ySizes
    v23._zSizes = p22.zSizes
    v23._metrics = p22.metrics
    v23._name = p22.meta.name
    local v25 = v23._metrics.yMin
    local v26 = v23._metrics.yMax - v25
    v23._fac = v26
    local v27 = v23._metrics.ascent
    local v28 = v23._metrics.descent
    v23._ascent = v27
    v23._descent = v28
    v23._bboxHeight = (v27 - v28) / v26
    v23._bboxCenter = (v27 + v28) / v26 / 2
    local v29 = v23._metrics.lineGap
    v23._lineSpacing = (v27 - v28 + v29 * 2) / v26
    local v30 = p22.glyphParts
    v23._glyphPartMap = {}
    for _, v31 in next, v23._cmap do
        local v32 = v30:FindFirstChild(v31)
        v23._glyphPartMap[v31] = v32
    end
    v23._glyphPartMap[".notdef"] = v30:FindFirstChild(".notdef")
    return v23
end
function v_u_1.GetName(p33)
    return p33._name
end
function v_u_1._GetKerningForGlyphs(p34, p35, p36)
    local v37 = p34._kern
    local v38
    if p35 then
        v38 = v37.idxmap[p35] or nil
    else
        v38 = nil
    end
    local v39 = v37.idxmap[p36]
    if v38 and (v39 and (v37.kerningmap[v38] and v37.kerningmap[v38][v39])) then
        return v37.kerningmap[v38][v39]
    else
        return nil
    end
end
function v_u_1._CalculateAbsoluteBBoxWidthForText(p40, p41, p42)
    local v43 = p42.tracking or 0
    local v44 = p40._cmap
    local v45 = p40._width
    local v46 = nil
    local v47 = 0
    for _, v48 in utf8.codes(p41) do
        local v49 = v44[v48]
        local v50 = v49 == nil and ".notdef" or v49
        local v51 = p40:_GetKerningForGlyphs(v46, v50)
        if v51 then
            v47 = v47 + v51
        end
        if v46 then
            v47 = v47 + v43 * p40._fac
        end
        v47 = v47 + v45[v50]
        v46 = v50
    end
    return v47
end
function v_u_1._GetBasePartForGlyph(p52, p53)
    return p52._glyphPartMap[p53]
end
function v_u_1.RenderSingleLineText(p54, p55, p56, p57)
    assert(p55, "text may not be nil")
    local v58 = p56 or CFrame.new()
    local v59 = p57.scale or 1
    local v60 = p57.thickness or 1
    local v61 = p57.parent
    local v62 = p57.warningLevel or 1
    local v63 = p57.anchorX or 0
    local v64 = p57.anchorZ or 0.5
    local v65 = p57.tracking or 0
    local v66 = p57.partProperties or {}
    local v67 = p57.partMode or "MeshPart"
    local v68 = v_u_9(v66, {
        ["Material"] = v66.Material ~= nil and v66.Material or Enum.Material.Plastic,
        ["Color"] = v66.Color ~= nil and v66.Color or Color3.fromRGB(163, 162, 165),
        ["Anchored"] = v66.Anchored == nil and true or v66.Anchored,
        ["CanCollide"] = v66.CanCollide == nil and true or v66.CanCollide,
        ["CastShadow"] = v66.CastShadow == nil and true or v66.CastShadow,
        ["Transparency"] = v66.Transparency == nil and 0 or (v66.Transparency or 0)
    })
    local v69 = p54._fac
    local v70 = p54._kern
    local v71 = p54._cmap
    local v72 = p54._xOffsets
    local v73 = p54._yOffsets
    local v74 = p54._xSizes
    local v75 = p54._ySizes
    local v76 = p54._zSizes
    local v77 = p54._width
    local v78 = p54:_CalculateAbsoluteBBoxWidthForText(p55, p57) / v69
    local v79 = 0
    local v80 = {}
    local v81 = 0
    local v82 = nil
    local v83 = {}
    local v84 = {}
    local v85 = {}
    for _, v86 in utf8.codes(p55) do
        v79 = v79 + 1
        local v87 = v71[v86]
        if v87 == nil then
            v87 = ".notdef"
            if v62 >= 2 then
                warn(string.format("Glyph for \'%s\' in index %d is not in this font.", utf8.char(v86), v79))
            end
        end
        table.insert(v84, v87)
        if v82 and (v70[v82] and v70[v82][v87]) then
            v81 = v81 + v70[v82][v87]
        end
        if v82 then
            v81 = v81 + v65 * v69
        end
        local v88 = p54:_GetBasePartForGlyph(v87)
        local v89 = v81 / v69
        local v90 = v58 * CFrame.new(-v89 * v59 + v78 * v59 * v63, 0, v60 * (v64 - 0.5))
        v80[v79] = v90
        if v88 and v67 ~= "None" then
            local v91 = v73[v87]
            local v92 = v72[v87]
            local v93 = v74[v87]
            local v94 = v75[v87]
            local v95 = v76[v87]
            local v96 = v93 * v59
            local v97 = v94 * v59
            local v98 = Vector3.new(v96, v97, v60)
            local v99 = v90 * CFrame.new(-v92 * v59, v91 * v59, 0)
            if v67 == "MeshPart" then
                local v100 = v88:Clone()
                for v101, v102 in next, v68 do
                    v100[v101] = v102
                end
                v100.Size = v98
                v100.CFrame = v99
                v83[v79] = v100
                if (v98.X < v100.Size.X or (v98.Y < v100.Size.Y or v98.Z < v100.Size.Z)) and v62 >= 1 then
                    warn(string.format("Glyph for \'%s\' at index %d is too small for given scale or thickness. Results may not look right. Consider using partMode=\"SpecialMesh\".", utf8.char(v86), v79))
                end
                v100.Name = v87
            elseif v67 == "SpecialMesh" then
                local v103 = v_u_2:Clone()
                for v104, v105 in next, v68 do
                    v103[v104] = v105
                end
                v103.Size = v98
                v103.CFrame = v99
                local v106 = Instance.new("SpecialMesh")
                v106.MeshType = Enum.MeshType.FileMesh
                v106.MeshId = v88.MeshId
                local v107 = v60 / v95
                v106.Scale = Vector3.new(v59, v59, v107)
                v106.Parent = v103
                v83[v79] = v103
                v103.Name = v87
                v103.Parent = v61
            end
        end
        v81 = v81 + v77[v87]
        v85[v79] = v90 * CFrame.new(-v77[v87] / v69 * v59, 0, 0)
        v82 = v87
    end
    for _, v108 in next, v83 do
        v108.Parent = v61
    end
    return {
        ["lineOrigin"] = v58,
        ["beforeCfs"] = v80,
        ["afterCfs"] = v85,
        ["glyphs"] = v84,
        ["parts"] = v83
    }
end
function v_u_1.RenderMultiLineText(p109, p110, p111, p112)
    local v113 = p112.leading or 0
    local v114 = p112.scale or 1
    local v115 = p111 or CFrame.new()
    local v116 = {}
    for _, v117 in next, p110 do
        table.insert(v116, p109:RenderSingleLineText(v117, v115, p112))
        v115 = v115 * CFrame.new(0, -p109._lineSpacing * v114 + -v113 * v114, 0)
    end
    return v116
end
function v_u_1.CalculateAscent(p118, p119)
    return p118._ascent / p118._fac * (p119 or 1)
end
function v_u_1.CalculateDescent(p120, p121)
    return p120._descent / p120._fac * (p121 or 1)
end
return v_u_1