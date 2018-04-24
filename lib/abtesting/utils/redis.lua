local modulename = "abtestingRedis"
local _M = {}

_M._VERSION = '0.0.1'

_M.new = function(conf)
    local sentinels = {}
    if conf.sentinel then
        for i in string.gmatch(conf.sentinel, "%S+") do
            for host, port in string.gmatch(i, "(%S+):(%S+)") do
                table.insert(sentinels,{ host = host,port = port})
            end
        end
    end

    local rc = require("resty.redis.connector").new({
        connect_timeout    = conf.timeout,
        read_timeout       = conf.readtimeout,
        keepalive_timeout  = conf.idletime,
        keepalive_poolsize = conf.poolsize,
        db                 = conf.dbid,
        password           = conf.password,
        host               = conf.host,
        port               = conf.port,
        path               = conf.uds,
        master_name        = conf.mastername,
        role               = conf.role,
        sentinels          = sentinels,
    })

    return setmetatable({rc = rc}, { __index = _M } ), nil
end

_M.connectdb = function(self)
    local rc = self.rc
    local red, err = rc:connect()
    if err then
        return nil, err
    end
    return red, nil
end

_M.keepalivedb = function(self, redis)
    return self.rc:set_keepalive(redis)
end

return _M
