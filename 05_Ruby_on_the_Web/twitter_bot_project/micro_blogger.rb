require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing..."
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "Error: tweet is over 140 characters"
    end
  end

  def dm(target, message)
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if screen_names.include? target
      puts "Trying to send #{target} this direct message:"
      puts message
      message = "d @#{target} #{message}"
      tweet(message)
    else
      puts "Error - you can only DM people who follow you."
    end
  end

  def followers_list
    screen_names = []
    @client.followers.each {|follower| screen_names << @client.user(follower).screen_name}
    screen_names
  end

  def spam_my_followers(message)
    followers_list.each {|follower| dm(follower, message)}
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
        when 't' then tweet(parts[1..-1].join(" "))
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 'spam' then spam_my_followers(parts[1..-1].join(" "))
        else
          puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

blogger = MicroBlogger.new
blogger.run
