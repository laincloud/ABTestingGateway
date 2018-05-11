local modulename = "abtestingInit"
local _M = {}

_M._VERSION = '0.0.1'

_M.redisConf = {
    ["timeout"]         = ngx.var.redis_connect_timeout,
    ["readtimeout"]     = ngx.var.redis_read_timeout,
    ["idletime"]        = ngx.var.redis_keepalive_timeout,
    ["poolsize"]        = ngx.var.redis_pool_size,
    ["host"]            = ngx.var.redis_host,
    ["port"]            = ngx.var.redis_port,
    ["uds"]             = ngx.var.redis_uds,
    ["password"]        = ngx.var.redis_password,
    ["dbid"]            = ngx.var.redis_dbid,
    ["mastername"]      = ngx.var.redis_master_name,
    ["role"]            = ngx.var.redis_role,
    ["sentinel"]        = ngx.var.redis_sentinel,
}

_M.divtypes = {
    ["iprange"]     = 'ipParser',  
    ["uidrange"]    = 'uidParser',
    ["uidsuffix"]   = 'uidParser',
    ["uidappoint"]  = 'uidParser',
    ["arg_city"]    = 'cityParser',

    ["url"]         = 'urlParser'
}   

_M.prefixConf = {
    ["policyLibPrefix"]     = 'ab:policies',
    ["policyGroupPrefix"]   = 'ab:policygroups',
    ["runtimeInfoPrefix"]   = 'ab:runtimeInfo',
    ["domainname"]          = ngx.var.domain_name,
}

_M.divConf = {
    ["default_backend"]     = ngx.var.default_backend,
    ["shdict_expire"]       = 60,   -- in s
--    ["shdict_expire"]       = ngx.var.shdict_expire,
}

_M.cacheConf = {
    ['timeout']             = ngx.var.lock_expire,
    ['runtimeInfoLock']     = ngx.var.rt_cache_lock,
    ['upstreamLock']        = ngx.var.up_cache_lock,
}

_M.indices = {
    'first', 'second', 'third',
    'forth', 'fifth', 'sixth', 
    'seventh', 'eighth', 'ninth'
}

_M.fields = {
    ['divModulename']       = 'divModulename',           
    ['divDataKey']          = 'divDataKey',
    ['userInfoModulename']  = 'userInfoModulename',
    ['divtype']             = 'divtype',
    ['divdata']             = 'divdata',
    ['idCount']             = 'idCount',
    ['divsteps']            = 'divsteps'
}

_M.loglv = {

    ['err']					= ngx.ERR, 
	['info']				= ngx.INFO,           ['warn']				  = ngx.WARN,      
    ['debug']				= ngx.DEBUG,           
}

return _M
