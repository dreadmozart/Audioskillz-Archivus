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
      question = 'Пожалуйста предъявите студенческий токен'
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup
        .new(keyboard: [%w(A B), %w(C D)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    end
  end
end
