run:
    lightningd --lightning-dir=./.lightning --signet --disable-plugin=bcli --fm-gateway-listen "127.0.0.1:3301" && gatewayd --data-dir=./.gateway --network=signet --listen="127.0.0.1:3301" --api-addr="127.0.0.1:3300" --password "thereisnosecondbest"

lightning:
    lightningd --lightning-dir=./.lightning --signet --disable-plugin=bcli --fm-gateway-listen "127.0.0.1:3301"

gateway:
    gatewayd --data-dir=./.gateway --network=signet --listen="127.0.0.1:3301" --api-addr="127.0.0.1:3300" --password "thereisnosecondbest"

alias:
    alias cln-cli="lightning-cli --lightning-dir=./.lightning --signet && alias gw-cli='gateway-cli --data-dir ./.gateway --network signet --password "thereisnosecondbest"'
