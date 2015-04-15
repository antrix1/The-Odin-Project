require 'jumpstart_auth'
require 'bitly'
require 'klout'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
    Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'
  end

  def tweet(message)
    if message.length > 140
      puts "The message is too long!"
    else
      @client.update(message)
    end
  end

  def run
    command = ""
    while command != "q"
      printf "Enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
        when 'q' then puts "Goodbye!"
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 't' then tweet(parts[1..-1].join(" "))
        when 'spam' then spam_my_followers(parts[1..-1])
        when 'elt' then everyones_last_tweet
        when 's' then shorten(parts[-1])
        when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
        else
          puts "Sorry, I don't know how to #{command}"
      end
    end
  end

  def dm(target, message)
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if screen_names.include?(target)
      tweet(message)
    else
      puts "No such follower found."
    end
  end

  def followers_list
    list = @client.followers.collect {|follower| @client.user(follower).screen_name }
    list
  end

  def spam_my_followers(message)
    followers_list.each{|follower| dm(follower, message)}
  end

  def everyones_last_tweet
    friends = @client.friends.collect{|f| f.screen_name}.sort_by { |friend| friend.screen_name.downcase}
    friends.each do |friend|
      timestamp = friend.status.created_at
      puts "#{friend.screen_name} said at #{timestamp.strftime("%A, %b %d %Y")}..."
      puts friend.status.text
      puts ""
    end
  end

  def shorten(original_url)
    Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')

    return bitly.shorten(original_url).short_url
  end

  def klout_score
    friends = @client.friends.collect{|f| f.screen_name}
    friends.each do |friend|
      puts friend
      identity = Klout::Identity.find_by_screen_name(friend)
      user = Klout::User.new(identity.id)
      puts user.score.score
      puts ""
    end
  end

end


blogger = MicroBlogger.new
blogger.run
