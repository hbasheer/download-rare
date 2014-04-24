every 1.day, :at => '1am'  do
	rake "shows:update", :output => { :standard => 'shows-update.log' }
	command "backup perform -t downloadrare_db", :output => { :standard => '/home/Jose/download-rare/log/db_backup.log' }
	rake "episodes:fetch_links", :output => { :standard => '/home/Jose/download-rare/log/episode_links.log' }
end

every 2.days do
  rake "fetch:all_broken", :output => { :standard => '/home/Jose/download-rare/log/broken_links.log' }
  rake  "sitemap:refresh", :output => { :standard => '/home/Jose/download-rare/log/sitemap_generator.log' }
end

every :friday, :at => '4am' do
	rake "movies:hunt", :output => { :standard => '/home/Jose/download-rare/log/movie_hunter.log' }
	rake "log:clear",  :output => { :standard => '/home/Jose/download-rare/log/log_sweeper.log' }  
end

every 15.minutes do 
	rake "movies:fetch_similar", :output => { :standard => '/home/Jose/download-rare/log/similar_movies.log' }
  	command "cd $HOME/scripts && ./process_checker.sh sidekiq", :output => { :standard => '/home/Jose/download-rare/log/sidekiq-restarter.log' }
end