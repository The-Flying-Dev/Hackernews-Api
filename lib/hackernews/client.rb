#The client makes it easier for controllers to interact with the API
module Hackernews  
    class Client
        def initialize
          @host = 'community-hacker-news-v1.p.rapidapi.com'
          @key = '0296bd362fmsh4030ee85ded394ep183f48jsn2a8bfd0299b2'
        end

        def item(id)
            get("item/#{id}") #interpolating the id into the URI
        end

        def topstories(start = 0, per_page = 10, expand = true)
            stories = get('topstories')[start...start + per_page]

            if expand
                stories.map! do |story|
                    item(story)
                end
            end
            stories
        end

        private

        #requesting path and coverts it to json

        def get(path)
            response = Excon.get(
                'https://' + @host + '/' + path + '.json?print=pretty',
                headers: {
                    'x-rapidapi-host' => @host,
                    'x-rapidapi-key' => @key,
                }
            )

            return false if response.status != 200

            JSON.parse(response.body)
        end
    end
end