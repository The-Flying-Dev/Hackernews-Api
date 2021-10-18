class StoriesController < ApplicationController
    def top
        @start = (params[:start] || 0).to_i
        @per_page = (params[:per_page] || 10).to_i
        @per_page = [@per_page, 20].min #max 20 per page

        @stories = client.topstories(@start, @per_page) #passing 2 parameters to assit with pagination
    end
end