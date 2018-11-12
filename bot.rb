require 'telegram_bot'
token = '611625592:AAGuFBSmQnFzstpcTXJxo5myx8i1Fpk8FDE'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "All I can do is say hello dick! Try the /greet command."
    when /greet/i
      greetings = ['Привет','Йо','Hi']
      reply.text = "#{greetings.sample.capitalize}, #{message.from.first_name}! 🤖"
    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
