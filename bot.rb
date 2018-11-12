require 'telegram_bot'
token = '611625592:AAGuFBSmQnFzstpcTXJxo5myx8i1Fpk8FDE'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "Приветствую вас! Меня зовут Архивариус Audioskillz. Если вы хотите получить доступ к дополнительным учебным материалам, предъявите студенческий токен"
      client.send_message(chat_id: message.chat.id, text: msg, reply_markup: markup)
    when /get_me/i
      user = client.get_me
      msg = "ID: #{user.id}\n"
      msg << "Username: #{user.username}"
      client.send_message(chat_id: message.chat.id, text: reply.text)
    when /send_message/i
      client.send_message(chat_id: message.chat.id, text: "Hello, work or not?")
    when /greet/i
      greetings = ['Привет','Йо']
      reply.text = "#{greetings.sample.capitalize}, #{message.from.first_name}! 🤖"
    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
