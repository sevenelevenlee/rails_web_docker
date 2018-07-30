require 'net/http'
class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat

  scope :by_chat, ->(chat) { where(chat_id: chat.id) }

  def send_msg_faye
    # data = {"a"=>"1", "b"=>"2"}
    data = {"id"=>self.chat.id.to_s,"message_id"=>self.id,"user_id"=>self.user.uuid,"user_name"=>self.user.name,"body"=>self.body,"speech_time"=>self.created_at.to_formatted_s(:db)}
    uri = URI.parse("#{FAYE_HOST}/faye")
    message = {:channel => "/chats/chat#{chat.id}-#{chat.uuid}", :data => data,:ext => {:auth_token => FAYE_TOKEN}}
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
