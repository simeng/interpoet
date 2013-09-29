if not ngx.var.arg_text
    ngx.exit ngx.HTTP_BAD_REQUEST

ngx.header['Content-Type'] = 'audio/wav'
app = "/usr/bin/flite -t \"" .. tostring ngx.unescape_uri ngx.var.arg_text .. "\" -o /dev/stdout"
fp = io.popen app, "r"
if fp then
    ngx.say fp\read "*a"

