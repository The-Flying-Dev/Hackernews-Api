class StoriesController < ApplicationController
    def top
        @start = (params[:start] || 0).to_i
        @per_page = (params[:per_page] || 10).to_i
        @per_page = [@per_page, 20].min #max 20 per page

        @stories = client.topstories(@start, @per_page) #passing 2 parameters to assit with pagination
    end

    def show
        #shows story and comment details
        @story = client.item(params[:id])
        @comments = (@story['kids'] || []).map do |comment| #incase there is no comments use [] to avoid an error
            client.item(comment)
        end
    end
end