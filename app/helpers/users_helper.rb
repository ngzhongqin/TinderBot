module UsersHelper

  X_Auth_Token = '4c592d45-d966-44a2-833d-421338c6c335'

  def self.get_new_user
    response = RestClient.get 'https://api.gotinder.com/user/recs',
                              :X_Auth_Token => X_Auth_Token,
                              :user_agent => 'Tinder Android Version 3.3.2',
                              :content_type => 'application/json; charset=utf-8'



    puts response.headers
    puts response.body

    transaction = Yajl::Parser.parse(response.body)

    puts transaction["status"]
    @tinder_users = transaction["results"]

    @tinder_users.each do |u|
      name = u["name"]
      distance_mi = u["distance_mi"]
      _id = u["_id"]
      bio = u["bio"]
      birth_date = u["birth_date"]
      common_like_count = u["common_like_count"]
      common_likes = u["common_likes"]
      common_friend_count = u["common_friend_count"]
      common_friends = u["common_friends"]
      gender =u["gender"]
      ping_time =u["ping_time"]
      url = u["photos"][0]["url"]

      @photos = u["photos"]
      # @common_likes = u["common_likes"]
      # @common_friends = u["common_friends"]

      puts "name: #{name}"
      puts "bio: #{bio}"
      puts "_id: #{_id}"
      puts "distance_mi: #{distance_mi}"
      puts "birth_date: #{birth_date}"
      puts "common_like_count #{common_like_count}"
      puts "common_likes #{common_likes}"
      puts "common_friends #{common_friends}"
      puts "gender #{gender}"
      puts "ping_time #{ping_time}"

      match = like_user(_id)
      user = User.new(name: name, tinder_id: _id, bio: bio, url: url,
                      birthday: birth_date, match: match, distance_mi: distance_mi,
                      common_like_count: common_like_count, common_friend_count: common_friend_count,
                      ping_time: ping_time)
      user.save

      @photos.each do |p|
        url = p["url"]
        puts "url: #{url}"

        photo = Photo.new(url: url, user_id: user.id)
        photo.save
      end

      common_likes.each do |l|
        like = Like.new(like: l, user_id: user.id)
        like.save
      end

      common_friends.each do |f|
        friend = Friend.new(friend: f, user_id: user.id)
        friend.save
      end

      puts " "
    end


  end

  def self.like_user(tinder_id)
    response = RestClient.get "https://api.gotinder.com/like/#{tinder_id}",
                              :X_Auth_Token => X_Auth_Token
    transaction = Yajl::Parser.parse(response.body)
    match_bool = transaction["match"]
    # puts response.headers
    puts "match_bool #{match_bool}"
    return match_bool
  end


end
