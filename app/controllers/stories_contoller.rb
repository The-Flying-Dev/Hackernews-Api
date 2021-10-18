class StoriesController < ApplicationController
    def top
        @stories = client.topstories(0, 10) #passing 2 parameters to assit with pagination
    end
end