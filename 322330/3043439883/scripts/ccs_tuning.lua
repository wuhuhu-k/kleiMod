local SERVER_SIDE
local CLIENT_SIDE
if GLOBAL.TheNet:GetIsServer() then
    SERVER_SIDE = true
    if not GLOBAL.TheNet:IsDedicated() then
        CLIENT_SIDE = true
    end
elseif GLOBAL.TheNet:GetIsClient() then
    SERVER_SIDE = false
    CLIENT_SIDE = true
end

TUNING.CCS_CARD24_ENBLE = GetModConfigData("ccs_card_24_enble")
TUNING.CCS_CARD_COLLECTION = GetModConfigData("ccs_card_collection_difficulty")
TUNING.CCS_SAN_DEL = GetModConfigData("ccs_san_del")
TUNING.CCS_PACK = GetModConfigData("ccs_pack_pz1")
TUNING.CCS_PACK2 = GetModConfigData("ccs_pack_pz2")
TUNING.CCS_CARD14_ENBLE = GetModConfigData("ccs_card_14_enble")
TUNING.CCS_LIGHT3_FW = GetModConfigData("ccs_light3_enble_fw")
TUNING.CCS_BUNNY_FLUORESCEN_ENABLE = GetModConfigData("ccs_bunny_fluorescen_enable")
TUNING.CCS_MONIBOATSG = GetModConfigData("ccs_miniboatsg")
