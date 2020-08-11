local cfg = module("vrp_paycheck", "config")

local paycheck = class("paycheck", vRP.Extension)

function paycheck_giver()
    for k, v in pairs(cfg.paycheck) do
        for _, user in pairs(vRP.EXT.Group:getUsersByPermission(k)) do
            local paycheck = v
            if cfg.bank then
                user:giveBank(paycheck)
            else
                user:giveWallet(paycheck)
            end
            vRP.EXT.Base.remote._notifyPicture(
                user.source,
                cfg.paycheck_picture,
                9,
                cfg.paycheck_title_picture,
                false,
                cfg.message_paycheck .. paycheck .. cfg.post
            )
        end
    end
    SetTimeout(
      1000 * 60 * cfg.minutes_paycheck,
        function()
            paycheck_giver()
        end
    )
end

function paycheck_taker()
    for k, v in pairs(cfg.bill) do
        for _, user in pairs(vRP.EXT.Group:getUsersByPermission(k)) do
            local paycheck = v
            if cfg.bank then
                user:tryWithdraw(paycheck, true)
            else
                user:tryPayment(paycheck, true)
            end
            vRP.EXT.Base.remote._notifyPicture(
                user.source,
                cfg.bill_picture,
                9,
                cfg.bill_title_picture,
                false,
                cfg.message_bill .. paycheck .. cfg.post
            )
        end
    end
    SetTimeout(
        1000 * 60 * cfg.minutes_bill,
        function()
            paycheck_taker()
        end
    )
end

function paycheck:__construct()
    vRP.Extension.__construct(self)
    paycheck_giver()
    paycheck_taker()
end

vRP:registerExtension(paycheck)
