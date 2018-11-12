require 'telegram/bot'

token = '611625592:AAGuFBSmQnFzstpcTXJxo5myx8i1Fpk8FDE'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Приветствую вас! Меня зовут Архивариус Audioskillz. Если вы хотите получить доступ к дополнительным учебным материалам, предъявите студенческий токен, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
