local cfg = {}

-- paycheck and bill for users
cfg.message_paycheck = "Вы получили зарплату : ~g~$" -- message that will show before payment of salary
cfg.message_bill = "Вы заплатили налоги : ~r~$" -- message that will show before payment of bill
cfg.post = "." -- message that will show after payment

cfg.bank = true -- if true money goes to bank, false goes to wallet/same with bills. All bills works as 'dry' means if you have 100$ and bill is  150$ it will take all of your money.

cfg.minutes_paycheck = 30 -- minutes between payment for paycheck
cfg.minutes_bill = 60 -- minutes between withdrawal for bill

cfg.paycheck_title_picture = "Maze Bank" -- define title for paycheck notification picture
cfg.paycheck_picture = "CHAR_BANK_MAZE" -- define paycheck notification picture want's to display
cfg.bill_title_picture = "Mors Mutual" -- define title for bill notification picture
cfg.bill_picture = "CHAR_MP_MORS_MUTUAL" -- define bill notification picture want's to display

-- check your vrp/cfg/groups.lua for permissions list. paychecks/bills works by permissions and not by groups
cfg.paycheck = { -- ["permission"] = paycheck
  --["police.paycheck"] = 3000,
  ["pay.cadet"] = 500,
  ["pay.officer"] = 1000,
  ["pay.sergant"] = 1500,
  ["pay.lieutenant"] = 2000,
  ["pay.captain"] = 3000,
}

cfg.bill = { -- ["permission"] = withdrawal
  --["police.paycheck"] = 100
}

return cfg