class MessagesController < ApplicationController
    def index
        render json: Message.all
    end

    def create
        message = Message.new(body: params[:body], author: params[:author])
        if validate(message)
            message.save
            render json: {'status': 'Message sent successfully!'}
        else
            render json: {'status': "Failed to send: message body can't be empty!"}
        end
    end

    def show
        message = Message.find(params[:id])
        render json: message
    end

    def destroy
        #patch request deletes message by default
        message = Message.find(params[:id])
        message.destroy
    end


    def validate(message)
        #validates message by checking that it is not empty
        if message.body != ''
            return true
        else
            return false
        end
    end
end

