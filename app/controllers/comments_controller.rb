class CommentsController < ApplicationController
    def show 
        @comment = client.item(params[:id])
        @comments = (@comment['kids'] || []).map do |kid|
            client.item(kid)
        end
    end
end