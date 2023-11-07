run:
    just lightning && just gateway

lightning:
    lightningd --lightning-dir=./.lightning --signet --disable-plugin=bcli --fm-gateway-listen "127.0.0.1:3300"

gateway:
    gatewayd --data-dir=./.gateway --network=signet --listen="127.0.0.1:3301" --api-addr="https://127.0.0.1:3302" --password "thereisnosecondbest" cln --cln-extension-addr "https://127.0.0.1:3300"

alias:
    alias cln-cli="lightning-cli --lightning-dir=./.lightning --signet && alias gw-cli='gateway-cli --data-dir ./.gateway --network signet --password "thereisnosecondbest"'

clean-dirs:
    rm -rf ./.gateway/* && rm -rf ./.lightning/signet && rm -rf ./.lightning/lightningd-signet.pid
