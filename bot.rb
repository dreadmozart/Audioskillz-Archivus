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
      else
        bot.api.send_message(
          chat_id: message.chat.id,
          text: ANSWERS.sample
        )
      end
    end
  end
