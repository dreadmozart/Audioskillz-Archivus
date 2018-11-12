require 'telegram/bot'
require 'coupon_code'

token = '611625592:AAGuFBSmQnFzstpcTXJxo5myx8i1Fpk8FDE'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Приветствую тебя #{message.from.first_name}! Меня зовут Архивариус Audioskillz. Если вы хотите получить доступ к дополнительным учебным материалам, предъявите студенческий токен, #{message.from.first_name}")
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      when '/ticket'
          bot.send_message(chat_id=update.message.chat_id, text="Пожалуйста предъявите студенческий токен")
          #for user reply#
          ticket = update.message.text #get user reply#
          bot.send_message(chat_id=update.message.chat_id, text=ticket)
            if ticket = 'UqX8I0ML5jK4VBUrWIDj'
              bot.send_message(chat_id=update.message.chat.id, text="Спасибо! Все верно!")
              else
                bot.send_message(chat_id=update.message.chat.id, text="хуевый токен!")
              end
            end
        end
      end
