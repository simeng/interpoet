shell_escape = (s) ->
    s = tostring(s)
    s = s\gsub '"', '\\"'
    if s\find '[^A-Za-z0-9_ ÆØÅæøå."/-]' then
        s = '""'
    else
        s = '"' .. s .. '"'
    return s

if not ngx.var.arg_text
    ngx.exit ngx.HTTP_BAD_REQUEST

ngx.header['Content-Type'] = 'audio/wav'
app = "/usr/bin/espeak --stdout " .. shell_escape(ngx.unescape_uri ngx.var.arg_text)
fp = io.popen app, "r"
if fp then
    ngx.say fp\read "*a"

