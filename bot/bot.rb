class Bot < SlackRubyBot::Bot
  @id = 0
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
    welcome = 'Hé lô, tôi là robot, vui lòng gõ choose @number, trong đó @number là số thứ tự món bạn cần ăn !'
    client.say(channel: data.channel, text: welcome)
    puts data.user
    @foods = Food.all
    @foods.each do |food|
      client.say(channel: data.channel, text: "#{food.id} : #{food.name}" )
    end
  end

  command 'choose' do |client, data, match|
    # this function to save new user
    if !User.exists?(:id_slack => data.user)
      self.add_new_user data.user
    end

    choose = match['expression'].to_i
    valid = true
    if Food.exists?(:id => choose)
      food = Food.find_by(id: choose)
      response = "Bạn đã chọn #{food.name}"
    else
      valid = false
      response = 'Nhục vãi, chọn mà cũng chọn ko đc, chọn lại đi :v'
    end
    client.say(channel: data.channel, text: response)
    if valid
      if @foods_oders.empty? || !@foods_oders.has_key?(choose.to_s)
        @foods_oders[choose.to_s] = 1
      else
        @foods_oders[choose.to_s] = @foods_oders[choose.to_s] + 1
      end
      puts @foods_oders.to_json
      client.say(channel: data.channel, text: "Bạn muốn chọn thêm món gì nữa không ?, nếu không vui lòng gõ finish để kết thúc !")
    end
  end

  command 'finish' do |client, data, match|

    if @foods_oders.empty?
      client.say(channel: data.channel, text:'Vui lòng gõ menu, bạn chưa order món nào cả :D')
    else
      if User.exists?(:id_slack => data.user)
        if User.find_by(:id_slack => data.user).is_admin
          @foods_oders.each do |key, value|
            client.say(channel: data.channel, text: "#{Food.find_by(:id => key).name} : #{value} phần")
          end
          @foods_oders.clear
          client.say(channel: data.channel, text:'Cảm ơn, chúng tôi sẽ giao nhanh cho bạn !')
        else
          client.say(channel: data.channel, text:'Xin lỗi, bạn không thể tạo lệnh finish !')
        end
      else
        client.say(channel: data.channel, text:'Xin lỗi, bạn không thể tạo lệnh finish !')
      end
    end

  end

  def self.add_new_user(id_slack)
    user_temp = {:id_slack => id_slack, :is_admin => false}
    user = User.new(user_temp)
    user.save
  end
  match /^How is the weather in (?<location>\w*)\?$/ do |client, data, match|
    client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
  end
end
