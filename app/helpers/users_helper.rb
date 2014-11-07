module UsersHelper

  def self.get_new_user
    response = RestClient.get 'https://api.gotinder.com/user/recs',
                              :X_Auth_Token => '4c592d45-d966-44a2-833d-421338c6c335',
                              :user_agent => 'Tinder Android Version 3.3.2',
                              :content_type => 'application/json; charset=utf-8'



    puts response.headers
    puts response.body

    transaction = Yajl::Parser.parse(response.body)

    puts transaction["status"]
    puts transaction["results"][0]["name"]


  end

  def self.like_user(tinder_id)
    response = RestClient.get 'https://api.gotinder.com/like/543ce99100ae7a0e6c49047d', :X_Auth_Token => '4c592d45-d966-44a2-833d-421338c6c335'
    puts response.headers
    puts response
  end

end
