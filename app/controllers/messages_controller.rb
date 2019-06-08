class MessagesController < ApplicationController

  before_action :checkloggedin , only: [:create]

  def new

  end

  def create

    @msg = Message.new(msg_params)
    @msg.user_id = session[:user_id]

    if @msg.save
      ActionCable.server.broadcast "chatroom_channel",mod_message: render_message(@msg)
    end


  end


  private
  def msg_params
    params.require(:message).permit(:body)
  end

  def checkloggedin
    if !is_loggedin?
      redirect_to root_path
    end
  end

  def render_message(message)
    render(partial: 'messages/message',locals: {message: message})
  end

end
