class Bot < SlackRubyBot::Bot
  @id = 0

  @foods = {
            "1" => 'Ram cuốn cải',
            "2" => 'Bánh Bao',
            "3" => 'Bánh Mỳ Chả',
            "4" => 'Bánh Mỳ Bà Lan'
  }
  @foods_oders = {}
  def self.next_id
    @id = @id % 10 + 1
  end

  command 'say' do |client, data, match|
    Rails.cache.write next_id, { text: match['expression'] }
    client.say(channel: data.channel, text: match['expression'])
  end

  command 'ok' do |client, data, match|
    Rails.cache.write next_id, { text: match['expression'] }
    client.say(channel: data.channel, text: match['expression'])
  end

  command 'menu' do |client, data, match|
    food_list = Food.all
    puts food_list.to_json
    welcome = 'Hé lô, tôi là robot, vui lòng gõ choose @number, trong đó @number là số thứ tự món bạn cần ăn !'
    client.say(channel: data.channel, text: welcome)
    puts data.user
    @foods.each do |key, value|
      client.say(channel: data.channel, text: key + '. ' + value )
    end
  end

  command 'choose' do |client, data, match|
    choose = match['expression']
    valid = true
    case choose
      when '1'
        response = 'Bạn đã chọn ram cuốn cải '
      when '2'
        response = 'Bạn đã chọn bánh bao '
      when '3'
        response = 'Bạn đã chọn bánh mỳ chả'
      when '4'
        response = 'Bạn đã chọn bánh mỳ bà lan'
      else
        valid = false
        response = 'Nhục vãi, chọn mà cũng chọn ko đc, chọn lại đi :v'
    end
    client.say(channel: data.channel, text: response)
    if valid
      if @foods_oders.empty? || !@foods_oders.has_key?(choose)
        @foods_oders[choose] = 1
      else
        @foods_oders[choose] = @foods_oders[choose] + 1
      end
      puts @foods_oders.to_json
      client.say(channel: data.channel, text: "Bạn muốn chọn thêm món gì nữa không ?, nếu không vui lòng gõ finish để kết thúc !")
    end
  end

  command 'finish' do |client, data, match|
    if @foods_oders.empty?
      client.say(channel: data.channel, text:'Vui lòng gõ menu, bạn chưa order món nào cả :D')
    else
      @foods_oders.each do |key, value|
        client.say(channel: data.channel, text: "#{@foods[key]} : #{value} phần")
      end
      @foods_oders.clear
      client.say(channel: data.channel, text:'Cảm ơn, chúng tôi sẽ giao nhanh cho bạn !')
    end
  end

  match /^How is the weather in (?<location>\w*)\?$/ do |client, data, match|
    client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
  end

end
