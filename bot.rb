require 'telegram/bot'
require 'coupon_code'

token = '611625592:AAGuFBSmQnFzstpcTXJxo5myx8i1Fpk8FDE'

ANSWERS = [
  "Правильно"
]

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
        bot.api.send_message(
          chat_id: message.chat.id,
          text: "Приветствую тебя #{message.from.first_name}! Меня зовут Архивариус Audioskillz.
          Если вы хотите получить доступ к дополнительным учебным материалам,
          воспользуйтесь командой /ticket")
      when '/stop'
        bot.api.send_message(
          chat_id: message.chat.id,
          text: "Пока, #{message.from.first_name}")
      when '/ticket'
        bot.api.send_message(
          chat_id: update.message.chat.id,
          text: "Пожалуйста предъявите студенческий токен")
          #for user reply#
          ticket = update.message.text #get user reply#
          bot.send_message(
            chat_id=update.message.chat_id, text=ticket)
        end
      end
end
