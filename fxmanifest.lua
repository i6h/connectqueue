fx_version 'cerulean'
game 'gta5'

shared_script 'shared/sh_queue.lua'

server_scripts {
    'server/sv_queue_config.lua',
    'connectqueue.lua'
}

client_script 'shared/sh_queue.lua'
