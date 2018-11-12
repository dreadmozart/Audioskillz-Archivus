require 'telegram/bot'

token = '611625592:AAGuFBSmQnFzstpcTXJxo5myx8i1Fpk8FDE'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Приветствую тебя #{message.from.first_name}! Меня зовут Архивариус Audioskillz. Если вы хотите получить доступ к дополнительным учебным материалам, предъявите студенческий токен, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/ticket'
      goodToken = ['sAEKRJv2DnYdBJv9hYbm', 'UqX8I0ML5jK4VBUrWIDj']
      question = 'Пожалуйста предъявите студенческий токен'
    if answers = goodToken
    when bot.api.send_message(chat_id: message.chat.id, text: "Спасибо! Все верно!")
    else bot.api.send_message(chat_id: message.chat.id, text: "Токен не найден!")
    end
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    end
  end
end
