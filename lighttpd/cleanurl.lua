-- little helper function
function file_exists(path, ftype)
  local attr = lighty.stat(path)
  return (attr and attr[ftype])
end

function check_path(path)
    local rv = path
    if (not file_exists(path, "is_file")) then
        rv = nil
        local html_file = path .. ".html"
        if (file_exists(html_file, "is_file")) then
            rv = html_file
        else
            -- handle directory indeces
            -- we first check if we have a dir and than look for an index.html
            local index_file = path .. "/index.html"
            if (file_exists(path,"is_dir") and file_exists(index_file, "is_file")) then
                rv = index_file
            end
        end
    end
    if rv then
        lighty.env["physical.path"] = rv
    end
    return rv
end

-- the magic ;)
if (not check_path(lighty.env["physical.path"])) then
    -- file still missing. pass it to the fastcgi backend
    lighty.env["physical.rel-path"] = "/dispatch.fcgi"
    lighty.env["uri.path"]          = lighty.env["physical.rel-path"]
    lighty.env["request.orig-uri"]  = lighty.env["request.uri"]
    lighty.env["physical.path"]     = lighty.env["physical.doc-root"] .. lighty.env["physical.rel-path"]
end
-- fallthrough will put it back into the lighty request loop
-- that means we get the 304 handling for free. ;)
-- debugging code
-- print ("final file is " ..  lighty.env["physical.path"])

